# it-tools-guidebook

システム開発で使うツールの説明を集めた文書リポジトリ。**置くのは Markdown だけで、動くコードは無い。**

## 文書を作る前に必ず読むもの

**Markdown を新規作成または変更するときは、着手前に次を読む。読まずに書き始めない。**

| 作業 | 着手前に読むファイル |
|---|---|
| ツールの説明文書を書く | `templates/tool.md` と `standards/engineering-docs-standard/docs/index.md` |
| README など、上記以外の文書を書く | `standards/engineering-docs-standard/docs/index.md` と `standards/engineering-docs-standard/templates/` の該当する型 |
| AIに読ませる文書・指示書を書く | `standards/engineering-docs-standard/docs-ai/index.md` |
| 書き終えて自己点検する | `standards/engineering-docs-standard/docs/appendix-checklist.md` |

**`standards/engineering-docs-standard/` はサブモジュールである。編集しない。**
標準そのものへの修正は、標準側のリポジトリへ提案する。

## 検査

**文書を変更したら、作業の完了を報告する前に実行する。** `error: 0` を確かめる。`warning` は残してよい。

```bash
bash tools/doclint.sh
```

作業用イメージは、最初に1回だけ作る。

```bash
docker build -t edocs-tools -f standards/engineering-docs-standard/tools/Dockerfile standards/engineering-docs-standard/tools/
```

## 置き場所

| 種類 | 置き場所 |
|---|---|
| ツール1件の説明 | `docs/<ツール名>.md` |
| 収録しているツールの一覧 | `docs/index.md` |
| このリポジトリ用のテンプレート | `templates/` |
| 検査を実行するスクリプト | `tools/` |
| 調査で集めた出典と突き合わせ結果 | `research/<日付>-<テーマ>/` |
| Claude Code のスキル | `.claude/skills/` |
| Codex と Antigravity のスキル | `.agents/skills/` |
| Antigravity へ AGENTS.md を届ける規則 | `.agents/rules/` |
| Codex に許す命令 | `.codex/rules/` |
| Antigravity に許す操作 | `.agents/antigravity/settings.json` |
| サイトの設定と組み立て | `zensical.toml` と `tools/build_site.sh` |

## 文書の決まり

- 文体は常体（である調）にする。敬体と混ぜない。
- 冒頭にメタ情報の表を置く。項目は `templates/tool.md` と同じにする。
- 「適切に」「必要に応じて」などの曖昧語を使わない。数値・固有名詞・日時に置き換える。
- 「今後」「最新の」など時点に依存する語を使わない。日付か版数で書く。
- リンク文字列は行き先が分かる語にする。「こちら」「ここ」は使わない。
- コードブロックには言語名を付ける。出力例には `text` を使う。
- 「TBD」「TODO」などの未解決の印を残したまま作業を終えない。

## 落とし穴

- `docs/` にツールの文書を足したら、`docs/index.md` の2つの表も直す。片方だけ直すと一覧と実体がずれる。
- `tools/doclint.sh` は標準側の `.doclint.yml` を使う。検査ルールをこのリポジトリ側で書き換えない。
- サブモジュールが空のときは `git submodule update --init --recursive` を実行する。空のまま検査すると、スクリプトが標準の場所を見つけられずに失敗する。

## 変更提案の決まり

- コミットメッセージは日本語で書く。1行目に何をしたかを書く。
- サブモジュールの更新は、文書の変更と同じコミットに混ぜない。
