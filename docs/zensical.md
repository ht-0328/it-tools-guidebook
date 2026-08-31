# Zensical

| 項目 | 内容 |
|---|---|
| 発信日 | 2026-09-01 |
| 作成者 | ht-0328（起草: Claude Opus 5） |
| 機密区分 | 社内限 |
| 保守責任者 | ht-0328 |
| 最終確認日 | 2026-09-01 |
| 対象の版 | Zensical 0.0.57（2026-08-21 公開） |
| 想定読者（宛先） | 文書サイトの生成道具を選ぶ開発者 |
| この文書を読んだあと読者ができること | Zensical を採用してよいか判断できる。手元でサイトを作り、ブラウザで表示できる |

## 何をするツールか

**Zensical は、Markdown から検索とナビゲーションを備えた文書サイトを作るツールである。**

Material for MkDocs を作った組織が、MkDocs の設計上の制約を外すために作り直したものである。生成器とテーマが別だった構成を、1つのツールにまとめている。

## 何が変わるか

| 場面 | 導入前（MkDocs と Material for MkDocs） | 導入後 |
|---|---|---|
| 道具の構成 | 生成器とテーマを別々に選び、版を合わせる | 1つのツールで完結する |
| 文書を直して見た目を確かめる | 全体を作り直す | 変えたファイルだけを作り直す。提供元は反復構築で4〜5倍速いとする |
| 保守の見通し | Material for MkDocs は 2026-11-05 に提供終了する | 新機能の開発が続く先へ移れる |

**速さの数値は提供元の主張である。** 同じ提供元が「初回構築は MkDocs より遅くなる場合がある」とも述べている。**14ページ規模の実測では、反復構築の利点は出なかった。** 差が出るのはページ数が多い場合である。

## 使いどころと、使わない場面

| 判断 | 場面 |
|---|---|
| 役に立つ | Material for MkDocs を使っており、2026-11-05 の提供終了までに移り先を決める必要がある |
| 役に立つ | ページ数が多く、プレビューの待ち時間が問題になっている |
| 役に立つ | 生成器とテーマの版合わせをやめたい |
| 向かない | 版が固定できず、Alpha の更新と不具合を引き受けられない |
| 向かない | MkDocs のプラグインに強く依存している。そのままでは動かない |
| 向かない | `gh-deploy` など MkDocs 固有の命令を組み込んだ配備の仕組みを直せない |

## なぜこのツールを使うのか

| 候補 | 採否 | 理由 |
|---|---|---|
| Zensical | 検討中 | Material for MkDocs の後継であり、移行先として提供元が案内している。ただし 0.0.57 は Alpha である |
| MkDocs と Material for MkDocs | 不採用 | **2026-11-05 に提供終了する。** それまでは重大な不具合と安全性の修正だけが行われる |
| 静的サイト生成器を自作する | 検討中 | 見た目と検索を自分で保守する負担が残る。判断の記録は [ドキュメント標準の ADR-002](../standards/engineering-docs-standard/docs/adr/ADR-002-site-generator.md) にある |

## 使う前に要るもの

| 要るもの | 用途 | 確認方法 |
|---|---|---|
| Python 3.10 以上 | Zensical の実行 | `python3 --version` が `3.10` 以上を表示する |
| pip または uv | Zensical の導入 | `pip --version` が版を表示する |
| Docker | このリポジトリで再現して確かめる場合 | `docker --version` が版を表示する |

**`Python >=3.10` は配布物の登録情報と原本の `pyproject.toml` の両方で確かめた値である。** 提供元の導入手順の頁には最低版の記載が無い。

## 使い始める手順

**開始条件**

- [ ] Python 3.10 以上が入っている
- [ ] 空のディレクトリを1つ用意している

**手順**

1. `python3 -m venv .venv` を実行する
2. `source .venv/bin/activate` を実行する
3. `pip install zensical` を実行する
4. `zensical new .` を実行する
5. `zensical serve` を実行する
6. ブラウザで `http://localhost:8000` を開く

**成功したとき**: 手順4で次の4つが作られる。手順6でトップページが表示され、ファイルを直すと表示が自動で入れ替わる。

```text
.github/workflows/docs.yml
docs/index.md
docs/markdown.md
zensical.toml
```

## よく使う操作

| したいこと | 命令 |
|---|---|
| 新しい企画を作る | `zensical new .` |
| 手元で表示を確かめる | `zensical serve` |
| 公開用のファイルを書き出す | `zensical build` |

`zensical build` は `site/` へ書き出す。**`zensical serve` の待ち受けはプレビュー専用であり、公開には使わない。**

## 落とし穴

- **公開されている分類は Alpha である。** 版を固定せずに使うと、更新で表示や設定が変わる。
- **プラグインは MkDocs のものをそのまま動かせない。** 提供元の互換性の一覧は「対応予定」であり、実装済みの印ではない。`blog`、`tags`、`git-authors`、`redirects` は当時まだ入っていない。
- **日本語の全文検索は、設定を書かないと語で区切られない。** `[project.theme]` の `language` を `ja` にする。0.0.57 で作った生成物を調べると、索引に `config.lang: ["ja"]` が入り、検索の実装が `Intl.Segmenter` を語単位で使う。**ロードマップの「Stemming and segmentation」は未完了のままだが、日本語の分かち書きは動く。**
- **日本語の見出しのアンカーは、既定では壊れる。** 0.0.57 で作った生成物では `id="_1"` `id="_2"` のような通し番号になり、本文中の参照も同じ番号を指す。`[project.markdown_extensions]` に次を書くと、見出しの語がそのまま ID になる。

```toml
toc.slugify = { object = "pymdownx.slugs.slugify", kwds = { case = "lower" } }
```
- **設定ファイルの `docs_dir` にカレントディレクトリを指定できない。** 別のディレクトリ名を与える。
- **`docs_dir` の外を指すリンクは書き換えが要る。** Zensical は `docs_dir` の中だけをサイトにする。

## 扱わないこと

| 扱わないこと | 理由 | 参照先 |
|---|---|---|
| 全設定項目の一覧 | 提供元の文書が正本であり、写すと古くなるため | [Zensical の文書](https://zensical.org/docs/) |
| MkDocs からの移行手順の詳細 | 企画ごとに使っているプラグインが違うため | [互換性の一覧](https://zensical.org/compatibility/) |
| 自作の生成器との比較の詳細 | 判断の記録が別にあるため | [ADR-002](../standards/engineering-docs-standard/docs/adr/ADR-002-site-generator.md) |

## 関連文書

| 文書名 | 役割 | 参照先 |
|---|---|---|
| ツール一覧 | 他のツールの文書を探す | [docs/index.md](index.md) |
| 調査の突き合わせ結果 | この文書の数値と判定の根拠をたどる | `research/2026-08-31-zensical/verdict.md` |
| Zensical の文書 | 設定項目と命令を確かめる | [Zensical の文書](https://zensical.org/docs/) |
