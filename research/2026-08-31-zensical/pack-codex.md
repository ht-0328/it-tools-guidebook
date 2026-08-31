### 資料台帳

| ID | 資料名と公開日 | URL | 発行元 | 閲覧の可否 | 裏付ける内容 |
|---|---|---|---|---|---|
| S-01 | Zensical – A modern static site generator built by the Material for MkDocs team（2025-11-05） | [Material for MkDocs の発表](https://squidfunk.github.io/mkdocs-material/blog/2025/11/05/zensical/) | Material for MkDocs チーム | 閲覧 | 開発主体、目的、MkDocs・Material for MkDocs との関係、`mkdocs.yml` 互換、機能差、反復ビルドの速度 |
| S-02 | zensical 0.0.57（2026-08-21） | [PyPI の zensical 0.0.57](https://pypi.org/project/zensical/0.0.57/) | Zensical／PyPI | 閲覧 | 2026-08-31時点の版、公開日、Python要件、MIT、`Development Status :: 3 - Alpha` |
| S-03 | Get started（公開日記載なし、2026-09-01閲覧） | [Zensical導入手順](https://zensical.org/docs/get-started/) | Zensical LLC | 閲覧 | 仮想環境の推奨、`pip`・`uv`・condaによる導入 |
| S-04 | Create your site（公開日記載なし、2026-09-01閲覧） | [サイト作成手順](https://zensical.org/docs/create-your-site/) | Zensical LLC | 閲覧 | `new`、`serve`、`build`の流れ、`localhost:8000`で表示される画面 |
| S-05 | New project（公開日記載なし、2026-09-01閲覧） | [`zensical new`の説明](https://zensical.org/docs/usage/new/) | Zensical LLC | 閲覧 | 新規作成命令、生成されるファイル構成、既存ファイルを上書きしない仕様 |
| S-06 | Preview（公開日記載なし、2026-09-01閲覧） | [`zensical serve`の説明](https://zensical.org/docs/usage/preview/) | Zensical LLC | 閲覧 | プレビューサーバー、既定の`localhost:8000`、自動再読込、本番サーバーには使わないこと |
| S-07 | Build（公開日記載なし、2026-09-01閲覧） | [`zensical build`の説明](https://zensical.org/docs/usage/build/) | Zensical LLC | 閲覧 | 静的サイト生成命令、既定の出力先`site/`、`--strict`等の選択肢 |
| S-08 | Roadmap（公開日記載なし、2026-09-01閲覧） | [Zensicalロードマップ](https://zensical.org/about/roadmap/) | Zensical LLC | 閲覧 | Alphaであること、ZRX、差分構築、並列化、未完了の機能、検索の計画 |
| S-09 | Plugins（公開日記載なし、2026-09-01閲覧） | [MkDocsプラグイン対応方針](https://zensical.org/compatibility/plugins/) | Zensical LLC | 閲覧 | 上位1,000リポジトリの調査、Tier 1・2の対応予定、プラグインからモジュールへの移行方針 |
| S-10 | Search（公開日記載なし、2026-09-01閲覧） | [Zensical全文検索](https://zensical.org/docs/setup/search/) | Zensical LLC | 閲覧 | 組み込みの多言語クライアント側検索、オフライン動作、検索画面は英語のみ |
| S-11 | Language（公開日記載なし、2026-09-01閲覧） | [サイト言語設定](https://zensical.org/docs/setup/language/) | Zensical LLC | 閲覧 | 60超の言語、日本語コード`ja`、日本語テンプレート翻訳がCompleteであること |
| S-12 | Python Markdown（公開日記載なし、2026-09-01閲覧） | [`toc.slugify`の設定](https://zensical.org/docs/setup/extensions/python-markdown/) | Zensical LLC | 閲覧 | 見出しアンカーの生成関数を変更できること、既定値では言語によって読みにくいIDになるという注意 |
| S-13 | Zensical 0.0.52（2026-07-30） | [GitHub Release v0.0.52](https://github.com/zensical/zensical/releases/tag/v0.0.52) | Zensical | 閲覧 | 中国語・日本語・韓国語検索の追加、ロケール対応の分かち書き、`ja`等の言語指定が必要であること |
| S-14 | Zensical 0.0.54（2026-08-13） | [GitHub Release v0.0.54](https://github.com/zensical/zensical/releases/tag/v0.0.54) | Zensical | 閲覧 | 大規模サイトでピークメモリ使用量を8～10分の1にしたという提供元の記録 |
| S-15 | License（公開日記載なし、2026-09-01閲覧） | [Zensicalライセンス](https://zensical.org/about/license/) | Zensical LLC | 閲覧 | Zensical・ZRX・MonoはMIT、Zensical Studioは独自EULA |
| S-16 | End of life on November 5, 2026（2025-11-06） | [Material for MkDocs issue #8523](https://github.com/squidfunk/mkdocs-material/issues/8523) | Material for MkDocsチーム | 閲覧 | 重大な不具合・セキュリティ修正の終了日、新規案件ではZensicalを評価するという方針 |
| S-17 | MkDocs後継プロダクトのZensicalに移行する（2026-04-13、2026-04-18更新） | [Zennの移行事例](https://zenn.dev/analytics_eng/articles/migrate-from-mkdocs-to-zensical) | analytics_eng | 閲覧 | 最小構成で`mkdocs`から`zensical`へ命令を置換した事例。背景説明にのみ使用 |
| S-18 | `docs/usage/serve/`（公開日不明） | [旧URL候補](https://zensical.org/docs/usage/serve/) | Zensical LLC | 未閲覧 | 本文取得に失敗した。正式な説明はS-06の`docs/usage/preview/`で確認した |
| S-19 | Compatibility: command line（公開日不明） | [コマンドライン互換性ページ](https://zensical.org/compatibility/command-line/) | Zensical LLC | 未閲覧 | 本文取得に失敗したため、MkDocs固有命令の詳細な互換表には使用していない |
| S-20 | The Collapse of MkDocs（公開日不明） | [Zenn記事が参照する外部記事](https://fpgmaas.com/blog/collapse-of-mkdocs/) | fpgmaas.com | 未閲覧 | 許可ドメイン外であるため開いておらず、分析にも使用していない |

### 分析結果

| 結論 | 根拠ID | 事実か推論かの別 | 確からしさ |
|---|---|---|---|
| Zensicalは、Markdownから検索・ナビゲーション・テーマを備えた文書サイトを生成し、MkDocsとMaterial for MkDocsを別々に組み合わせる構成の性能・保守・拡張上の制約を解く静的サイト生成器である。 | S-01、S-03 | 事実（提供元の説明） | 高い |
| 開発主体はMaterial for MkDocsを作ったチームであり、公式サイトの発行主体はZensical LLCである。 | S-01、S-03、S-15 | 事実 | 高い |
| Zensical本体のライセンスはMITである。ZRXとMonoもMITだが、任意製品のZensical Studioには独自EULAが適用される。 | S-02、S-15 | 事実 | 高い |
| 2026-08-31時点の版は`0.0.57`、公開日は`2026-08-21`、分類は`Development Status :: 3 - Alpha`である。 | S-02、S-08 | 事実 | 高い |
| 実行にはPython 3.10以上とPythonパッケージ管理器が要る。公式が通常利用として案内する導入方法は、仮想環境内の`pip install zensical`、または`uv init`、`uv add --dev zensical`、`uv run zensical`である。 | S-02、S-03 | 事実 | 高い |
| conda-forgeからは`conda create -n zensical python=3.14`、`conda activate zensical`、`conda install -c conda-forge zensical`で導入できるが、Zensical側のサポート対象外の第三者配布である。 | S-03 | 事実 | 高い |
| 最小の開始手順は、`zensical new .`、`zensical serve`、ブラウザーで`http://localhost:8000`を開く、完成後に`zensical build`を実行する、の順である。 | S-04、S-05、S-06、S-07 | 事実 | 高い |
| `zensical new .`が成功すると、`.github/workflows/docs.yml`、`docs/index.md`、`docs/markdown.md`、`zensical.toml`ができる。`serve`が成功するとサンプル文書サイトを`localhost:8000`で閲覧でき、編集時に自動再読込される。`build`は既定で`site/`に静的ファイルを生成する。 | S-04、S-05、S-06、S-07 | 事実 | 高い |
| `zensical serve`の組み込みサーバーはプレビュー専用であり、本番公開にはnginx、Apache、CDN、GitHub Pages等を使う必要がある。 | S-04、S-06 | 事実 | 高い |
| MkDocsが生成器、Material for MkDocsがテーマと拡張であるのに対し、Zensicalは生成、テーマ、検索、カスタマイズを1つのスタックへ統合する。新規案件の標準設定は`zensical.toml`だが、移行用に既存の`mkdocs.yml`も読める。 | S-01、S-04、S-08 | 事実（提供元の説明） | 高い |
| 提供元の2025-11-05時点の測定では、初回構築はMkDocsより遅くなる場合がある一方、変更箇所だけを作り直す反復構築は4～5倍速い。独立した再測定値ではない。 | S-01 | 事実（提供元の測定結果） | 中程度 |
| 0.0.54は、大規模サイトにおけるピークメモリ使用量を従来のZensicalから8～10分の1にした。ただし、これはMkDocsとの比較値ではない。 | S-14 | 事実（提供元の測定結果） | 中程度 |
| MkDocsプラグインはそのまま実行する設計ではなく、Zensicalの組み込みモジュールへ段階的に置き換える方針である。プラグイン一覧は「対応を約束し、backlogへ登録した一覧」であり、一覧掲載だけでは実装済みと判断できない。 | S-01、S-09 | 事実 | 高い |
| Material for MkDocsは2026-11-05まで重大な不具合とセキュリティ問題を修正し、新機能開発はZensicalへ移している。提供元は既存サイトの即時移行は不要とする一方、新規案件と長期計画ではZensicalの評価を勧めている。 | S-16 | 事実 | 高い |
| 採用してよい条件は、①Alpha版の更新と不具合を受け入れて版を固定できる、②使用するMaterial機能・Markdown拡張・プラグインを実サイトで検証できる、③CIで`zensical build --strict`とリンク・検索・画面差分を検査できる、④初回構築と反復構築を自サイトで測定できる、の全条件を満たす場合である。 | S-02、S-07、S-08、S-09、S-01 | 推論 | 中程度 |
| 特に、ページ数が多く反復プレビューの待ち時間が問題になっている文書サイト、Material for MkDocsから長期的な移行先を求める案件、プラグイン依存が少ない新規案件では採用候補になる。 | S-01、S-08、S-09、S-16 | 推論 | 中程度 |
| 破壊的変更を受け入れられない本番サイト、未検証のMkDocsプラグインに依存するサイト、公開済みの第三者モジュールAPIを必要とする案件、Material for MkDocsとの完全な機能一致が必須の案件には、2026-08-31時点では向かない。 | S-02、S-08、S-09 | 推論 | 高い |
| 日本語サイトでは`[project.theme] language = "ja"`、または`mkdocs.yml`の`theme.language: ja`を設定する。0.0.52以降は、この指定によって日本語検索のロケール対応分かち書きが有効になる。 | S-11、S-13 | 事実 | 高い |
| 全文検索は多言語の本文を検索できるが、2026-08-31時点の検索画面の固定文言は英語のみである。日本語テンプレート全体がCompleteであることと、検索画面の日本語化は別である。 | S-10、S-11 | 事実 | 高い |
| 日本語検索を採用判定に含める場合は、`language = "ja"`を設定したうえで、空白を含まない複合語、漢字とかなの混在、表記揺れ、部分一致を受入試験にする必要がある。 | S-10、S-13 | 推論 | 中程度 |
| 見出しアンカーは`toc.slugify`で生成関数を変更でき、公式文書も言語によって既定値が読みにくいIDを作る場合があると警告している。ただし、日本語だけの見出しが0.0.57で具体的にどのIDになるかは外部資料から確定できない。 | S-12 | 事実 | 中程度 |
| 日本語見出しを使うサイトでは、既定のアンカーを前提に手書きリンクを固定せず、明示IDまたはプロジェクト用の`toc.slugify`を決め、重複見出しと日本語だけの見出しをCIで検査する条件で採用すべきである。 | S-12 | 推論 | 中程度 |
| 2026-08-31時点の総合判定は「条件付き採用」である。新規案件または移行検証環境には採用できるが、Alpha追従、機能互換、日本語検索、アンカー、実サイト性能の5項目を検証せずに既存の本番サイトを一括移行してはならない。 | S-01、S-02、S-08、S-09、S-12、S-13、S-16 | 推論 | 高い |

### 食い違いと不明点

| 事項 | 一方の主張 | 他方の主張 | 見立て |
|---|---|---|---|
| 構築速度 | 反復構築はMkDocsより4～5倍速い（S-01） | 初回構築はMkDocsより遅くなる場合がある（S-01） | 測っている処理が異なる。初回・全量構築と、`serve`中の差分構築を分けて測る必要がある。 |
| `mkdocs.yml`の互換性 | 既存案件を最小限の変更で構築でき、Markdown、CSS、JavaScript、テンプレート上書きを維持できる（S-01） | 完全な機能一致には達しておらず、プラグインは別設計のモジュールへ段階的に移す（S-01、S-09） | 設定ファイルを読めることと、全機能が同じ結果になることは別である。プラグイン単位の検証が必要である。 |
| 日本語検索 | 0.0.52は日本語を含むCJK検索へロケール対応の分かち書きを追加した（S-13） | ロードマップは「Stemming and segmentation」を検索エンジンの提供予定機能として掲げている（S-08） | 0.0.52はCJK向けの具体的な分かち書き、ロードマップは検索エンジン全体の拡張可能なstemming・segmentationを指す可能性がある。範囲が同じとは断定できない。 |
| 日本語表示と検索画面 | 日本語`ja`のテンプレート翻訳はCompleteである（S-11） | 新しい検索画面は英語のみである（S-10） | サイトのナビゲーション翻訳と検索画面のローカライズを分ければ両立する。本文の多言語検索には影響しないとS-10は説明している。 |
| 日本語見出しアンカー | 公式文書は、既定のslug生成が言語によって読みにくいIDになる場合があるとする（S-12） | 日本語だけの見出しに対する実際の生成結果は記載されていない | 日本語アンカーが「必ず壊れる」とは断定できない。0.0.57を固定した受入試験が必要である。 |
| ライセンス | Zensical本体、ZRX、MonoはMITである（S-02、S-15） | Zensical Studioは独自EULAである（S-15） | 静的サイト生成器と任意の商用編集環境の違いであり、主張は矛盾しない。導入台帳では別製品として管理すべきである。 |
| 資料の対象期間 | リリース、発表、issueには2025-11-01以後の公開日が明記されている（S-01、S-02、S-13、S-14、S-16、S-17） | 多くの公式説明ページには個別の公開日が記載されていない（S-03～S-12、S-15） | 日付を推測して対象期間内と扱うことはできない。日付のない提供元文書は、2026-09-01時点の現行仕様を確認する補助資料として使用した。 |

### 埋まらなかった問い

- `zensical new`、`zensical serve`、`zensical build`が端末へ出す標準出力の完全な実例は、閲覧できた公式文書に掲載されていなかった。
- 0.0.57で日本語だけの見出し、重複する日本語見出し、句読点を含む見出しから生成されるアンカーIDの具体値は、許可された外部資料から確認できなかった。
- 日本語検索が使用する分かち書きの内部実装、辞書、形態素解析器、未知語処理、表記揺れへの対応は公開資料から確認できなかった。
- 0.0.57と同時点のMkDocs・Material for MkDocsを同一の大規模サイトで比較した独立ベンチマークは得られなかった。
- プラグイン対応ページは対応予定と優先順位を示すが、各プラグインについて0.0.57で実装済みか、部分対応か、未対応かを判定できる完結した表は確認できなかった。
- 公開日を記載していないZensical公式説明ページが、対象期間の2025-11-01以後に公開されたことを個別には確認できなかった。
- Material for MkDocsが2026-11-05に保守終了した後、リポジトリをアーカイブするか、コミュニティ保守を受け入れるかは確認できなかった。