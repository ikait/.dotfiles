#==========================================================================
# 環境変数（非インタラクティブシェルでも読み込まれる）
#==========================================================================

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# disable telemetry for et
export ET_NO_TELEMETRY=1


# Unlock Keychain on login (macOS only)
# https://github.com/anthropics/claude-code/issues/1222#issuecomment-3013457571
if [[ "$OSTYPE" == darwin* ]]; then
  if [ -n "$SSH_CONNECTION" ] && [ -z "$KEYCHAIN_UNLOCKED" ]; then
    security unlock-keychain ~/Library/Keychains/login.keychain-db
    export KEYCHAIN_UNLOCKED=true
  fi
fi

# Cargo (Rust)
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
