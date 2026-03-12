#==========================================================================
# 環境変数（非インタラクティブシェルでも読み込まれる）
#==========================================================================

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# disable telemetry for et
export ET_NO_TELEMETRY=1


# Unlock Keychain on login (macOS only)
# https://github.com/anthropics/claude-code/issues/1222#issuecomment-3013457571
# NOTE: インタラクティブシェルでのみ実行する。非対話的シェル（例: ET の初期 SSH ハンドシェイク
# "ssh host command" 形式）で実行するとプロンプトに応答できずハングするため。
# ET 接続確立後の対話的シェルで Keychain アンロックのプロンプトが表示される。
if [[ "$OSTYPE" == darwin* ]]; then
  if [ -n "$SSH_CONNECTION" ] && [[ $- == *i* ]]; then
    keychain_status=$(security show-keychain-info ~/Library/Keychains/login.keychain-db 2>&1)
    if echo "$keychain_status" | grep -q "User interaction is not allowed"; then
      security unlock-keychain ~/Library/Keychains/login.keychain-db
    fi
  fi
fi

# Cargo (Rust)
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
