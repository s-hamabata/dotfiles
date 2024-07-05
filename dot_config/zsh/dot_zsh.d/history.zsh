# ----------------------------------------------------------
# History
# ----------------------------------------------------------
# ヒストリファイルをXDG Base Directory準拠のディレクトリに配置
export HISTFILE=${XDG_STATE_HOME}/zsh/history

# ヒストリに保存するコマンド数
HISTSIZE=10000

# ヒストリファイルに保存するコマンド数
SAVEHIST=10000

# 重複するコマンド業は古いほうを削除
setopt HIST_IGNORE_ALL_DUPS

# 直前と同じコマンドはヒストリに追加しない
setopt HIST_IGNORE_DUPS

# コマンド履歴ファイルを共有する
setopt SHARE_HISTORY

# 履歴を追加 (毎回 .zsh_history を作るのではなく)
setopt APPEND_HISTORY

# 履歴をインクリメンタルに追加
setopt INC_APPEND_HISTORY

# historyコマンド自体は履歴に登録しない
setopt HIST_NO_STORE

# 余分な空白は詰めてヒストリに記録
setopt HIST_REDUCE_BLANKS

