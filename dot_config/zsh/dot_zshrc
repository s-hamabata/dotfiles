# ----------------------------------------------------------
# 各種ツールの初期化
# ----------------------------------------------------------
# NOTE:
# これらもファイルを分割して管理していいが
# 読み込み順でエラーになるのが怖いのでいったんは直接記述している
eval "$(sheldon source)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(${CARGO_HOME}/bin/mise activate zsh)"

# ----------------------------------------------------------
# zshrcに設定する内容を分割するためのスクリプト
# ----------------------------------------------------------
# NOTE:
# ~/.config/zsh/.zsh.d/ 配下に存在する `*.zsh` ファイルを
# 読み込んで自動で反映する
ZSHHOME="${ZDOTDIR}/.zsh.d"

if [ -d $ZSHHOME -a -r $ZSHHOME -a \
    -x $ZSHHOME ]; then
    for i in $ZSHHOME/*; do
        [[ ${i##*/} = *.zsh ]] &&
            [ \( -f $i -o -h $i \) -a -r $i ] && . $i
    done
fi
