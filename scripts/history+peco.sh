#
# Search history using peco
# http://qiita.com/kp_ohnishi/items/3009e2083831af3a7c5c
#
if which peco > /dev/null; then
  function peco-select-history() {
      local tac
      if which tac > /dev/null; then
          tac="tac"
      else
          tac="tail -r"
      fi
      BUFFER=$(\history -n 1 | \
          eval $tac | \
          peco --query "$LBUFFER")
      CURSOR=$#BUFFER
      zle clear-screen
  }
#  zle -N peco-select-history
#  bindkey '^R' peco-select-history
else
  # if peco not found, use incremental-search zsh has
  bindkey '^R' history-incremental-search-backward
  bindkey '^S' history-incremental-search-forward
fi
