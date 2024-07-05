# dotfiles

この dotfiles は [chezmoi](https://github.com/twpayne/chezmoi) で管理することを前提として構成しています。

# Get started

## chezmoi のインストール

[公式のインストール手順](https://www.chezmoi.io/install/)に従います。

### Macの場合

```zsh
brew install chezmoi
```
### Ubuntu(WSL)の場合

```zsh
snap install chezmoi --classic
```

### [mise](https://github.com/jdx/mise)を使っている場合

```zsh
mise plugin add chezmoi
mise use chezmoi
```

### One-line binary install

前述の方法以外にも以下のコマンドでオペレーティングシステムとアーキテクチャに適したバイナリを1つのコマンドでインストールすることができます。

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin
```

## dotfilesのコピー

`chezmoi` を経由して、本リポジトリで扱うdotfilesをコピーします。

```zsh
chezmoi init https://github.com/s-hamabata/dotfiles.git
```

## dotfilesの適用

`chezmoi` 管理下のdotfilesを実際のユーザーの `$HOME` ディレクトリ配下に反映します。

```zsh
chezmoi apply
```

なお、`chezmoi`のインストールから適用までは以下のワンライナーで一括で行うこともできます。

```zsh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply https://github.com/s-hamabata/dotfiles.git
```

## chezmoiによる初期化について

まっさらな環境ではdotfilesを用意しただけではすぐに各種ツールを使い始めることはできません。
dotfilesは単なる設定ファイル群ですので、対応する各種ツールのインストールが必要になります。

`chezmoi`には `UserScripts` という機能があり、これらのインストールをサポートすることができます。
https://www.chezmoi.io/user-guide/use-scripts-to-perform-actions/

### 要約

`chezmoi apply` を実行する際、対象となるdotfilesのリポジトリに存在する任意のスクリプトを実行することができます。

|スクリプトファイル名の接頭辞|用途|
|-|-|
|`run_once_`|初回構築時一度だけ実行したいスクリプト|
|`run_onchange_`|変更があるたびに実行したいスクリプト|

例えば、`run_once_01_base_install.sh` というスクリプトは、`chezmoi` のインストール時に一度だけ実行されます。

### テンプレート
これらのスクリプトやコンフィグファイルはテンプレート機能を使用することができます。
ファイル拡張子を `.tmpl` とすることで、例えば

```bash
{{ if eq .chezmoi.os "linux" -}}
#!/bin/sh
sudo apt install ripgrep
{{ else if eq .chezmoi.os "darwin" -}}
#!/bin/sh
brew install ripgrep
{{ end -}}
```

のようにして、MacとLinux(Ubuntu)でそれぞれに適した方法で `ripgrep` をインストールする、といったことが実現できます。

### スクリプトの適用順序について

適用されるスクリプトは辞書順になるため、スクリプトの適用順を制御したい場合は`01_`, `02_`のようにスクリプト名に通し番号をつけます。

### 適用状況のリセット

`run_onchange_` の状況をリセットする場合

```bash
chezmoi state delete-bucket --bucket=entryState
```

`run_once_` の状況をリセットする場合

```bash
chezmoi state delete-bucket --bucket=scriptState
```
