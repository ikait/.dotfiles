ver=$(ls -1 $HOME/Library/Python/ | grep -E '^[0-9]+\.[0-9]+$' | sort -V | tail -n1)
if [ -n "$ver" ]; then
  export PATH="$HOME/Library/Python/$ver/bin:$PATH"
fi