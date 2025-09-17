if [ -n "${commands[fzf]}" ]; then
  [ -r /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
  [ -r /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh
  export FZF_CTRL_R_OPTS='--layout=reverse --height=40%'
fi
