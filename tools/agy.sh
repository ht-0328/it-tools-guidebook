#!/usr/bin/env bash
# このリポジトリの設定で Antigravity を動かす。
#
# Antigravity は許可の一覧を $HOME/.gemini/antigravity-cli/settings.json からしか読まない。
# 作業場ごとに設定を置く仕組みが無いため、HOME を差し替えて読ませる。
# これにより ~/.gemini の大域設定には触れない。許可の正本は
# .agents/antigravity/settings.json である。
#
#   bash tools/agy.sh --sandbox --print-timeout 20m -p "$(cat research/<日付>-<テーマ>/brief.md)"
#   bash tools/agy.sh --why-denied     直近の実行で拒否された対象を調べる
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SETTINGS="$REPO_ROOT/.agents/antigravity/settings.json"
TOKEN="$HOME/.gemini/antigravity-cli/antigravity-oauth-token"
# 使うモデル。指定しないと gemini-3.7-flash-high になる。
# 突き合わせは3つの道具の推論の深さを揃えて初めて成り立つため、Pro を既定にする。
# Codex 側は effort を high にしており、pro-high がその対になる。
# Antigravity 経由で Claude を選ぶと Claude Code と独立でなくなるため選ばない。
#
# 注意: 推論向けのモデルにしても数値の誤りは消えない。2026-09-01 の調査で
# requires-python を >=3.12 と答えた（正しくは >=3.10）。
# 版数は配布物の登録情報で裏を取る。モデルの選択は代わりにならない。
#
# 呼び出し側が --model を渡したときはそちらを優先する。
DEFAULT_MODEL="gemini-3.1-pro-high"

AGY_HOME="${XDG_STATE_HOME:-$HOME/.local/state}/it-tools-guidebook/agy-home"
CLI_DIR="$AGY_HOME/.gemini/antigravity-cli"

# 直近の実行で何の許可が足りなかったかを、会話の記録から取り出す。
# print モードは標準エラーに種別しか出さないため、対象はここでしか分からない。
if [ "${1:-}" = "--why-denied" ]; then
  log="$(readlink -f "$CLI_DIR/cli.log" 2>/dev/null || true)"
  [ -f "$log" ] || { echo "実行の記録が無い: $CLI_DIR/cli.log" >&2; exit 1; }
  cid="$(grep -oE 'conversation [0-9a-f-]{36}' "$log" | tail -1 | awk '{print $2}')"
  [ -n "$cid" ] || { echo "会話IDを取り出せない: $log" >&2; exit 1; }
  exec python3 - "$CLI_DIR/conversations/$cid.db" <<'PY'
import re, sqlite3, sys
con = sqlite3.connect(f'file:{sys.argv[1]}?mode=ro', uri=True)
rows = list(con.execute(
    'select idx, step_payload, error_details, permissions from steps order by idx'))
cmds, hosts, denied = [], {}, []
for idx, *blobs in rows:
    for v in blobs:
        if not isinstance(v, (bytes, bytearray)):
            continue
        t = bytes(v).decode('utf-8', 'replace')
        denied += [idx for _ in re.findall(r'permission check failed for [a-z_]+', t)]
        cmds += [(idx, c) for c in re.findall(r'"CommandLine"\s*:\s*"([^"]{0,160})', t)]
        for u in re.findall(r'"Url"\s*:\s*"(https?://[^"]+)"', t):
            hosts.setdefault(re.match(r'https?://[^/]+', u).group(0), []).append(idx)
print(f'手数: {len(rows)}  拒否のあった手: {sorted(set(denied)) or "なし"}')
seen = set()
print('--- 要求された命令 ---')
for idx, c in cmds:
    if c not in seen:
        seen.add(c)
        print(f'  [{idx}] {c}')
print('--- 要求された URL のホスト ---')
for h, i in sorted(hosts.items(), key=lambda kv: kv[1][0]):
    print(f'  [{i[0]}] {h}  ({len(i)}回)')
print('\n許可を足す前に、依頼文の側で避けられないかを先に考える。')
print('任意コード実行を開ける行（command(python3 -c) など）は足さない。')
PY
fi

[ -f "$SETTINGS" ] || { echo "許可の一覧が無い: $SETTINGS" >&2; exit 1; }
[ -e "$TOKEN" ] || { echo "認証情報が無い: $TOKEN。先に agy を対話で起動してログインする" >&2; exit 1; }

mkdir -p "$CLI_DIR"
# 認証情報は複製しない。実体への符号連結だけを張る。
ln -sfn "$TOKEN" "$CLI_DIR/antigravity-oauth-token"
# 許可はリポジトリ側が正本である。毎回上書きして写す。
sed "s|{{REPO_ROOT}}|$REPO_ROOT|g" "$SETTINGS" > "$CLI_DIR/settings.json"

# 呼び出し側が --model を指定していなければ、既定を足す。
model_given=""
for a in "$@"; do
  case "$a" in --model|--model=*) model_given=1 ;; esac
done
if [ -z "$model_given" ]; then
  set -- --model "$DEFAULT_MODEL" "$@"
fi

exec env HOME="$AGY_HOME" agy "$@"
