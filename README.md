# システム開発ツール ガイドブック

| 項目 | 内容 |
|---|---|
| 発信日 | 2026-08-31 |
| 作成者 | ht-0328（起草: Claude Opus 5） |
| 機密区分 | 社内限 |
| 保守責任者 | ht-0328 |
| 最終確認日 | 2026-08-31 |
| 想定読者（宛先） | システム開発でツールを選ぶ人。選ばれたツールを初めて使う人 |
| この文書を読んだあと読者ができること | 目的のツールの説明文書を見つけられる。新しいツールの説明文書を、決められた型で書ける |

## 何をするものか

**システム開発で使うツールを、1ツール1文書で説明するリポジトリである。**

各文書には、そのツールを選んだ理由と、使い始めるまでの手順を書く。

置くのは Markdown だけである。ツール本体も、その設定ファイルの正本も、ここには置かない。

## 誰向けか

| 項目 | 内容 |
|---|---|
| 主たる読者 | システム開発でツールを選ぶ人。および、選ばれたツールを初めて使う人 |
| 前提知識 | Git と Markdown の基本操作を理解している |
| 読む場面 | ツールを選ぶとき。導入されたツールを初めて触るとき |

## 使い始める手順

**開始条件**

- [ ] Git 2.43 以上が入っている
- [ ] Docker が起動している。文書の検査に使う

**手順**

1. `git clone --recurse-submodules <このリポジトリのURL>` を実行する
2. `git submodule status` を実行する
3. `standards/engineering-docs-standard` の行頭に `-` が付いていないことを確認する
4. [ツール一覧](docs/index.md) を開き、読みたいツールの文書へ進む

クローン済みでサブモジュールが空の場合は、次を実行する。

```bash
git submodule update --init --recursive
```

## 文書を書くときの決まり

**文書を書き始める前に、[エンジニアのためのドキュメント標準](standards/engineering-docs-standard/docs/index.md) を読む。**

標準はサブモジュールとして `standards/engineering-docs-standard/` に置いている。写しではなく参照であるため、標準が変わってもこのリポジトリへ書き写す作業は起きない。**サブモジュールの中身は編集しない。**

| 目的 | 読むファイル |
|---|---|
| 標準の全体を知る | [標準の本文](standards/engineering-docs-standard/docs/index.md) |
| ツールの説明文書を書く | [ツール説明のテンプレート](templates/tool.md) |
| 書き終えたあと自己点検する | [1枚のチェックリスト](standards/engineering-docs-standard/docs/appendix-checklist.md) |
| AIに読ませる文書を書く | [AI向けの別冊](standards/engineering-docs-standard/docs-ai/index.md) |

### 標準の版を上げる

サブモジュールは、取り込んだ時点の commit に固定される。標準の新しい版を取り込むときだけ、次を実行する。

```bash
git submodule update --remote standards/engineering-docs-standard
git add standards/engineering-docs-standard
```

**取り込んだあとは、文書の検査を実行する。** 標準の副版が上がると、既存の文書が違反になることがある。判定の基準は標準の [変更履歴](standards/engineering-docs-standard/CHANGELOG.md) にある。

### 文書を検査する

作業用のイメージを、最初に1回だけ作る。

```bash
docker build -t edocs-tools -f standards/engineering-docs-standard/tools/Dockerfile standards/engineering-docs-standard/tools/
```

そのうえで検査する。

```bash
bash tools/doclint.sh
```

**期待される出力**（末尾の2行）

```text
検査したファイル: 3
error: 0  warning: 0  info: 0
```

**終了コード**: `error` が0件なら `0`、1件以上あれば `1` を返す。`warning` では失敗しない。

**検査を通ったことは品質の証明ではない。** 読者に合っているか、事実が正しいかは機械では判定できない。

## サイトを作って見る

**公開先**: [システム開発ツール ガイドブック](https://ht-0328.github.io/it-tools-guidebook/)

`docs/` の Markdown から [Zensical](docs/zensical.md) でサイトを作る。ホストには何も入れない。作業用のイメージを、最初に1回だけ作る。

```bash
docker build -t edocs-zensical -f tools/Dockerfile.zensical tools/
```

そのうえで作る。

```bash
bash tools/build_site.sh
```

**期待される出力**（末尾の3行）

```text
No issues found
Build finished in 0.18s
作った: /home/th/workspace/it-tools-guidebook/site
```

生成物は `site/` に出る。`site/` と `build/` は版管理の対象外である。

**`main` へ入ると [GitHub Actions](.github/workflows/pages.yml) が同じ手順で作り、公開する。** 公開の前に文書の検査も走る。**リポジトリの Settings > Pages で Source を「GitHub Actions」にしておく。** 設定しないと配信で失敗する。

## フォルダ構成

```text
docs/                 ツール1件ごとの説明文書
docs/index.md         収録しているツールの一覧
templates/            このリポジトリ用のテンプレート
zensical.toml         サイトの設定（Zensical）
research/             調査で集めた出典と突き合わせ結果（検査の対象外）
standards/            ドキュメント標準（サブモジュール。編集しない）
tools/                検査を実行するスクリプト
.codex/rules/         Codex に許す命令（リポジトリ側に置ける）
.agents/antigravity/  Antigravity に許す操作。tools/agy.sh 経由でのみ効く
.github/workflows/    サイトを作って公開する仕組み
.claude/skills/       Claude Code のスキル
.agents/skills/       Codex と Antigravity のスキル
.agents/rules/        Antigravity へ AGENTS.md を届ける規則
AGENTS.md             AIエージェント向けの指示書（指示の正本）
CLAUDE.md             AGENTS.md を取り込むだけのファイル
```

## 扱わないこと

| 扱わないこと | 理由 | 参照先 |
|---|---|---|
| ツールの設定ファイルの正本 | 各プロジェクトのリポジトリで管理するため | 各プロジェクトのリポジトリ |
| ツールの全機能の網羅 | 提供元の文書が正本であり、写すと古くなるため | 各ツールの公式文書 |
| 文書の書き方そのもの | ドキュメント標準が正本であるため | [標準の本文](standards/engineering-docs-standard/docs/index.md) |

## 関連文書

| 文書名 | 役割 | 参照先 |
|---|---|---|
| ツール一覧 | 収録しているツールを探す | [docs/index.md](docs/index.md) |
| ツール説明のテンプレート | 新しいツールの文書を書き始める | [templates/tool.md](templates/tool.md) |
| エンジニアのためのドキュメント標準 | 文書の書き方を確認する | [標準の本文](standards/engineering-docs-standard/docs/index.md) |
| AIエージェント向けの指示書 | AIに作業させるときの決まりを確認する | [AGENTS.md](AGENTS.md) |
