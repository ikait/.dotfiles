# パス追加
if [ -e $HOME/.anyenv/bin/anyenv ]; then
  export PATH="$PATH:$HOME/.anyenv/bin"
  eval "$(anyenv init -)"
fi
