# bun completions
if [ -d "$HOME/.bun" ]; then
  export BUN_INSTALL="$HOME/.bun"
  export PATH="$PATH:$BUN_INSTALL/bin"
fi
