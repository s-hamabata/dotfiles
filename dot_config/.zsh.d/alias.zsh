# ----------------------------------------------------------
# alias
# ----------------------------------------------------------
# NOTE: 既存コマンドの置き換え系のエイリアスはコマンドの存在確認後にエイリアスを設定する

# vim
if type "nvim" > /dev/null 2>&1; then
  alias vim='nvim'
fi

# eza
if type "eza" > /dev/null 2>&1; then
  alias ei="eza --icons --git"
  alias ea="eza -a --icons --git"
  alias ee="eza -aahl --icons --git"
  alias et="eza -T -L 3 -a -I 'node_modules|.git|.cache' --icons"
  alias eta="eza -T -a -I 'node_modules|.git|.cache' --color=always --icons | less -r"
  alias ls=ei
  alias la=ea
  alias ll=ee
  alias lt=et
 alias lta=eta
fi
