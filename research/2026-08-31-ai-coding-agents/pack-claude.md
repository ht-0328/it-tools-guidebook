# 調査パック AIコーディングエージェント3種の指示・スキル・非対話実行の差

調査した道具: Claude Code（Opus 5）

## 目次

| 節 | 何を書くか |
|---|---|
| 調査概要 | 問い、利用目的、範囲、仮定、調査日 |
| 要約 | 先に読むべき結論と、重要な留保 |
| 資料台帳 | 集めた資料1件ごとの出典と制約 |
| 分析結果 | 結論と、その根拠となる資料ID |
| 食い違いと不明点 | 資料間の相違、埋まらなかった穴 |
| 再利用素材 | 文書を書くときにそのまま使える材料 |

---

## 調査概要

| 項目 | 内容 |
|---|---|
| 調査日 | 2026-08-31 |
| 答える問い | Claude Code・Codex CLI・Antigravity は、指示書とスキルをどこから読み、どう非対話で呼べるか |
| 利用目的 | `.claude/skills/cross-agent-research/` の材料にする。将来 `docs/` に置く3ツールの説明文書の材料にもする |
| 対象期間 | 2026-08-31 時点で各提供元が公開している文書と、手元の実行結果 |
| 想定読者 | このリポジトリで3ツールに分担して調査させる人 |
| 置いた仮定 | 対象は手元の WSL2 環境に入っている版に限った。ChatGPT のウェブ版と Antigravity の IDE 版の挙動は調べていない |

## 要約

**3ツールは、スキルの形式（`SKILL.md` に `name` と `description` を持つフォルダ）では一致するが、置き場所と指示書の名前で分かれる。**

- 置き場所は、Claude Code が `.claude/skills/`、**Codex と Antigravity は同じ `.agents/skills/` を読む。**
- 常に読まれる指示書は、Claude Code が `CLAUDE.md`、Codex が `AGENTS.md`、Antigravity が `.agents/rules/` である。
- **3ツールとも非対話で呼べる。** 手元に `claude`、`codex`、`agy` の3つの実行ファイルが入っている。

留保: 提供元の文書だけを根拠にした項目が多い。ベンダー文書は数か月で変わる（`docs-ai/index.md` の「この別冊は古くなる」）。

## 資料台帳

| ID | 資料と日付 | 発行 | 種別 | 裏付ける内容 | 制約 |
|---|---|---|---|---|---|
| S-01 | Custom instructions with AGENTS.md（`learn.chatgpt.com/docs/agent-configuration/agents-md`）取得 2026-08-31 | OpenAI | 提供元の文書 | Codex が読む `AGENTS.md` の順序、`~/.codex/` の位置、`project_doc_max_bytes` の既定 32 KiB | 提供元自身の説明であり第三者の検証ではない |
| S-02 | Build skills（`learn.chatgpt.com/docs/build-skills`）取得 2026-08-31 | OpenAI | 提供元の文書 | Codex のスキル探索先4種、`SKILL.md` の必須項目、`$skill-name` での明示呼び出し | 同上 |
| S-03 | Rules（`antigravity.google/docs/rules-workflows/`）取得 2026-08-31 | Google | 提供元の文書 | Antigravity の規則と手順書の置き場、12,000文字の上限、`/workflow-name` での呼び出し | 同上。`AGENTS.md` への言及は無い |
| S-04 | Skills（`antigravity.google/docs/skills`）取得 2026-08-31 | Google | 提供元の文書 | Antigravity のスキル探索先2種、`description` だけが必須である点 | 同上 |
| S-05 | 手元での実行（`codex --version`、`codex exec --help`、`agy --help`、`claude --version`）2026-08-31 | このリポジトリ | 個人の記録 | 3ツールの導入済みの版と、非対話実行の命令と選択肢 | 1台の WSL2 環境1回の結果である |
| S-06 | `standards/engineering-docs-standard/docs-ai/04-skills-and-agents.md` | このリポジトリのサブモジュール | 内部標準 | スキルの3段階の読み込み、`AK-01` から `AK-12` の規則 | 標準自身が「この章の根拠は弱い」と断っている |
| S-07 | Build with Google Antigravity（`developers.googleblog.com`） | Google | 記事 | Agent Manager と成果物（タスクリスト、実装計画、ウォークスルー、ブラウザ検証の録画） | **未閲覧。** 検索結果の要約しか見ていない |

## 分析結果

問いの順に並べる。結論1件ごとに根拠のIDを付ける。

### スキルの置き場所と形式

| 結論 | 根拠ID | 解釈 | 確からしさ |
|---|---|---|---|
| Codex と Antigravity は、作業場の `.agents/skills/<名前>/SKILL.md` を共に読む | S-02 S-04 | 2社の文書が同じ経路を示している | 高い |
| Claude Code は `.agents/skills/` を読まない。`.claude/skills/` だけを読む | S-05 | 手元の構成がそうなっている。提供元文書は未確認 | 中くらい |
| `SKILL.md` の必須項目は3ツールで揃わない | S-02 S-04 S-06 | Antigravity は `description` だけを必須とし、`name` はフォルダ名で代える | 高い |
| `description` が選択を決める点は3ツールで一致する | S-02 S-04 S-06 | 段階的な開示という同じ仕組みを採っている | 高い |

**`.agents/skills/` を Codex と Antigravity が共有することの帰結**: そこへ置いたスキル1本が、2つの道具に同時に効く。**片方だけに向けた道具名を書くと、もう片方で外れる。**

### 常に読まれる指示書

| 道具 | 経路 | 上限 | 根拠ID |
|---|---|---|---|
| Claude Code | `CLAUDE.md`（`AGENTS.md` は読まない） | 200行未満が目安（`AN-04`） | S-06 |
| Codex CLI | `~/.codex/AGENTS.md` → Git の根 → 下位ディレクトリの順に連結 | 合計 32 KiB（`project_doc_max_bytes`） | S-01 |
| Antigravity | 作業場の `.agents/rules/`（`.agent/rules/` も後方互換）。全体は `~/.gemini/GEMINI.md` | 1ファイル 12,000文字 | S-03 |

Codex は `AGENTS.override.md` があればそちらを優先し、根から下へ連結する。**下位のファイルほど後に置かれ、先の記述を上書きする**（S-01）。

Antigravity の規則には有効化の方式が4種ある。手動（`@` で呼ぶ）、常時、モデルの判断、ファイル経路の一致である（S-03）。

### 非対話での呼び出し

| 道具 | 命令 | 出力の受け取り | 手元の版 |
|---|---|---|---|
| Claude Code | `claude -p "<依頼>"` | 標準出力 | 2.1.233 |
| Codex CLI | `codex exec "<依頼>" -o <出力ファイル>` | `-o` で最終応答をファイルへ。`--json` で経過を JSONL へ | codex-cli 0.149.1 |
| Antigravity | `agy -p "<依頼>"` | 標準出力。`--output-format json` を選べる | 1.1.22 |

根拠は S-05 である。**3ツールとも、作業場を指定する選択肢と、権限の扱いを変える選択肢を持つ。** Codex は `-C <DIR>` と `-s <サンドボックス方式>`、Antigravity は `--add-dir` と `--sandbox` である。

### 明示呼び出しの書き方

| 道具 | 書き方 | 根拠ID |
|---|---|---|
| Claude Code | `/<スキル名>` | S-05 |
| Codex CLI | `$<スキル名>`（CLI と IDE 拡張）。ChatGPT では `@<スキル名>` | S-02 |
| Antigravity | 依頼文の中でスキル名を挙げる。手順書は `/<手順書名>` | S-03 S-04 |

**記号が3ツールで違う。** 依頼文へ他の道具の記号を書くと、その道具では文字列として扱われる。

## 食い違いと不明点

| 事項 | 資料Aの主張 | 資料Bの主張 | 見立て |
|---|---|---|---|
| Antigravity が `AGENTS.md` を読むか | 提供元の規則の文書は `AGENTS.md` に触れていない（S-03） | 第三者の記事は「読む」と述べている | **未確認。** 提供元の文書を根拠にできないため、読まれない前提で書く |
| Codex の「カスタムプロンプト」 | 検索結果の要約が「非推奨。共有するならスキルを使う」と述べている | 本文を開いて確かめていない | **未確認。** スキルだけを使う方針にすれば影響しない |

**埋まらなかった問い**

- Antigravity の成果物（タスクリスト、実装計画、ウォークスルー）を `agy -p` から取り出せるかを確かめていない（S-07 が未閲覧）。
- 3ツールが同じ問いへどれだけ違う答えを返すかは測っていない。`AK-11`（測ってから書く）を満たしていない。
- 日本語の依頼文で3ツールの成績を比べた資料は見つかっていない。

## 再利用素材

| 項目 | 内容 |
|---|---|
| 想定読者 | 3ツールに分担して調査させる人。および3ツールを初めて使う人 |
| 中心の主張 | スキルの形式は揃うが、置き場所・指示書の名前・呼び出しの記号が3ツールで違う |
| 使える数値 | Codex の指示書上限 32 KiB。Antigravity の規則上限 12,000文字。手元の版 2.1.233 / 0.149.1 / 1.1.22 |
| 使える固有名詞 | `.claude/skills/`、`.agents/skills/`、`.agents/rules/`、`~/.gemini/GEMINI.md`、`~/.codex/AGENTS.md`、`claude -p`、`codex exec`、`agy -p` |
| 図表の候補 | 3ツールの経路・上限・呼び出し記号を並べた比較表 |
| 書くときの注意 | 提供元の文書だけを根拠にした項目が多い。Antigravity の `AGENTS.md` 対応は未確認と明記する |
