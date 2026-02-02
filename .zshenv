#==========================================================================
# 環境変数（非インタラクティブシェルでも読み込まれる）
#==========================================================================

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# disable telemetry for et
export ET_NO_TELEMETRY=1

# Cargo (Rust)
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
