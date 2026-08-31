# Zensical の設定ファイル zensical.toml の書き方

| 項目 | 内容 |
|---|---|
| 発信日 | 2026-09-01 |
| 作成者 | ht-0328（起草: Claude Opus 5） |
| 機密区分 | 社内限 |
| 保守責任者 | ht-0328 |
| 最終確認日 | 2026-09-01 |
| 対象の版 | Zensical 0.0.57 |
| 想定読者（宛先） | Zensical でサイトを作り始めた人。[Zensical の説明文書](zensical.md) を読み終えている |
| この文書を読んだあと読者ができること | `zensical.toml` の各項目が何を変えるかを、実際の画面で確かめながら書ける |

## この文書の読み方

**このページ自体が、ここで説明する設定で作られている。** そのため「この設定を入れるとこうなる」を、別の画面を探さずにその場で確かめられる。

各節に **「このページでの見え方」** を置く。**いま見えているものが、その設定の結果である。**

設定ファイルの全文は、最後の節に載せてある。

## 設定ファイル全体の形

`zensical.toml` は3つの塊でできている。**どこに何を書くかを間違えると、値が無視される。**

```toml
[project]
# サイト全体のこと。名前、公開先、ページの並び、読み込む場所

[project.theme]
# 見た目と表示のこと。言語、配色、有効にする機能

[project.markdown_extensions]
# Markdown で使える書き方を増やす
```

!!! note "塊の外に書いた値は無視される"
    `[project.theme]` の下に書くべき `language` を `[project]` の下に書いても、誤りとして止まらない。表示が変わらないときは、まず塊の位置を疑う。

## サイトの名前と公開先を決める

```toml
[project]
site_name = "システム開発ツール ガイドブック"
site_description = "システム開発で使うツールを、1ツール1文書で説明する"
site_url = "https://ht-0328.github.io/it-tools-guidebook/"
repo_url = "https://github.com/ht-0328/it-tools-guidebook"
repo_name = "ht-0328/it-tools-guidebook"
```

| 項目 | どこに出るか |
|---|---|
| `site_name` | 画面左上の題。ブラウザのタブの題 |
| `site_description` | 検索結果や共有時に出る説明。画面には出ない |
| `site_url` | 生成する内部リンクの起点。`sitemap.xml` の中身 |
| `repo_url` と `repo_name` | 画面右上のリポジトリへのリンク |

**このページでの見え方**: 左上の「システム開発ツール ガイドブック」と、右上の `ht-0328/it-tools-guidebook` が、この5行の結果である。

!!! warning "site_url を仮のままにしない"
    `zensical new .` が作る初期状態は `https://www.example.com/` である。書き換えないまま公開すると、`sitemap.xml` に誤った URL が並ぶ。

## ページの並びを決める

```toml
nav = [
  { "ツール一覧" = ["index.md"] },
  { "ツール" = ["zensical.md", "zensical-settings.md"] },
]
```

**書いた順に並ぶ。** ファイル名の順ではない。左の `"ツール一覧"` と `"ツール"` は、画面に出る見出しである。

**このページでの見え方**: 左の目次に「ツール一覧」と「ツール」の2つの塊があり、後者の中にこのページが入っている。

**`nav` を書かないと、ファイル名の順に並ぶ。** ページが増えたら書く。

## 日本語で正しく動かす

**2つ書く。書かないと壊れる。**

```toml
[project.theme]
language = "ja"

[project.markdown_extensions]
toc.slugify = { object = "pymdownx.slugs.slugify", kwds = { case = "lower" } }
```

| 書く項目 | 書かないと起きること |
|---|---|
| `language = "ja"` | 全文検索が語で区切られず、日本語で探しても当たらない |
| `toc.slugify` | 見出しの ID が `_1` `_2` になり、`#見出し` へのリンクが切れる |

**このページでの見え方**: 右の見出し一覧のどれかを押すと、住所欄が `#日本語で正しく動かす` のように**見出しの語**へ変わる。`#_4` にはならない。

上の検索欄に「設定」と入れると、日本語のまま当たる。

## 表示の切り替えを付ける

```toml
[[project.theme.palette]]
media = "(prefers-color-scheme)"
toggle.icon = "lucide/sun-moon"
toggle.name = "明るい表示に切り替える"

[[project.theme.palette]]
media = "(prefers-color-scheme: light)"
scheme = "default"
toggle.icon = "lucide/sun"
toggle.name = "暗い表示に切り替える"

[[project.theme.palette]]
media = "(prefers-color-scheme: dark)"
scheme = "slate"
toggle.icon = "lucide/moon"
toggle.name = "閲覧環境の設定に戻す"
```

**二重の角かっこ `[[...]]` で書く。** 3つ並べると、押すたびに順に切り替わる。

| `media` の値 | 何を指すか |
|---|---|
| `(prefers-color-scheme)` | 閲覧環境の設定に従う |
| `(prefers-color-scheme: light)` | 明るい表示に固定する |
| `(prefers-color-scheme: dark)` | 暗い表示に固定する |

**このページでの見え方**: 画面右上の丸い印を押すと、明るい表示と暗い表示が切り替わる。

## 使う機能を選ぶ

```toml
[project.theme]
features = [
  "content.code.copy",
  "navigation.sections",
  "navigation.top",
  "navigation.tracking",
  "search.highlight",
  "search.suggest",
  "toc.follow",
]
```

| 名前 | 何が起きるか |
|---|---|
| `content.code.copy` | コードの塊の右上に写す印が出る |
| `navigation.sections` | 左の目次で、上位の項目が見出しとして開いたまま並ぶ |
| `navigation.top` | 下へ送ると、先頭へ戻る印が出る |
| `navigation.tracking` | 読んでいる位置に合わせて住所欄が変わる |
| `search.highlight` | 検索から開いたページで、探した語が目立つ |
| `search.suggest` | 検索欄に入れている途中で候補が出る |
| `toc.follow` | 右の見出し一覧が、読んでいる位置を追う |

**このページでの見え方**: 上の `toml` の塊の右上に、写す印が出ている。これが `content.code.copy` の結果である。

## Markdown の書き方を増やす

```toml
[project.markdown_extensions]
admonition = {}
pymdownx.details = {}
attr_list = {}
tables = {}
toc.permalink = true
```

**`admonition` を入れると、注意書きを出せる。** `!!!` に続けて種類と題を書く。

```text
!!! warning "この題が出る"
    ここが本文になる。行の頭を字下げする。
```

!!! warning "この題が出る"
    ここが本文になる。行の頭を字下げする。

**`pymdownx.details` を足すと、たたんだ状態にできる。** 先頭の記号を3つの疑問符に変えるだけで、押すまで中身が隠れる。

```text
??? tip "押すと開く"
    たたんでおきたい補足を、ここへ入れる。
```

!!! note "このページでは、たたんだ実例を出していない"
    このリポジトリの文書検査が、行頭の3つの疑問符を「未解決の印」として扱うためである。囲みの中に入れると検査を通る。**検査を持つリポジトリでこの書き方を使うときは、同じことが起きないか確かめる。**

`toc.permalink = true` は、見出しの右に出る `¶` の印である。押すとその見出しへの住所が取れる。

## 図を描けるようにする

**Zensical は `mermaid` の塊に印を付けるだけで、描画する部品を同梱しない。** 2つ書き、部品を自分で置く。

```toml
[project]
extra_javascript = ["assets/mermaid.min.js", "assets/mermaid-init.js"]

[project.markdown_extensions]
pymdownx.superfences.custom_fences = [
  { name = "mermaid", class = "mermaid", format = "pymdownx.superfences.fence_code_format" },
]
```

部品は `docs_dir` の中の `assets/` へ置く。取得は [tools/build_site.sh](https://github.com/ht-0328/it-tools-guidebook/blob/main/tools/build_site.sh) が行う。

**このページでの見え方**: 次が図として描かれていれば、設定が効いている。文字のまま出ていれば、2つのうちどちらかが足りていない。

```mermaid
flowchart LR
    A["```mermaid の塊"] --> B["pymdownx.superfences<br>で印を付ける"]
    B --> C["mermaid.min.js<br>が図にする"]
```

## 読み込む場所と書き出す場所を決める

```toml
[project]
docs_dir = "build/zensical"
site_dir = "site"
```

| 項目 | 意味 |
|---|---|
| `docs_dir` | Markdown を読む場所。**既定は `docs`** |
| `site_dir` | HTML を書き出す場所。**既定は `site`** |

**このリポジトリは `docs_dir` を `docs` にしていない。** `docs/` の中に `../templates/` のような外を指すリンクがあり、Zensical は `docs_dir` の外を解決できないためである。リンクを書き換えた写しを `build/zensical/` に作ってから読ませている。

!!! note "docs_dir にカレントディレクトリは指定できない"
    `docs_dir = "."` は使えない。別の名前を与える。

## 外部への通信を止める

```toml
[project.theme]
font = false
```

**既定では、書体を外部から取りに行く。** `false` にすると取りに行かず、閲覧環境の書体を使う。

社内向けの文書や、通信できない場所で開く文書では、これを止める。**このページも止めてある。**

## このサイトの設定ファイル全文

上で説明した項目が、実際に1つのファイルへどう並ぶかは、[zensical.toml](https://github.com/ht-0328/it-tools-guidebook/blob/main/zensical.toml) で見られる。**このページを含むサイト全体が、そのファイルから作られている。**

## この文書が扱わないこと

| 扱わないこと | 理由 | 参照先 |
|---|---|---|
| 全設定項目の一覧 | 提供元の文書が正本であり、写すと古くなるため | [Zensical の文書](https://zensical.org/docs/) |
| Zensical そのものの紹介と導入 | 別の文書が担うため | [Zensical の説明文書](zensical.md) |
| `mkdocs.yml` からの書き換え | 企画ごとに使っている部品が違うため | [互換性の一覧](https://zensical.org/compatibility/) |

## 関連文書

| 文書名 | 役割 | 参照先 |
|---|---|---|
| Zensical の説明文書 | ツールの紹介と導入の手順を読む | [Zensical](zensical.md) |
| ツール一覧 | 他のツールの文書を探す | [ツール一覧](index.md) |
| Zensical の文書 | 全設定項目を確かめる | [Zensical の文書](https://zensical.org/docs/) |
