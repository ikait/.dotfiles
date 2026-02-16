# 既にインストール済みで quarantine が残っている場合:
#   xattr -dr com.apple.quarantine $(brew --caskroom)/<package>

function brew-upgrade () {
  if [ -z "$1" ] ; then
    echo "Usage: brew-upgrade <package> [<package> ...]" 1>&2
    return 1
  fi

  # --no-quarantine: 検疫属性を付けずにインストール
  # (SSH 経由だと Gatekeeper のダイアログに応答できず詰まるため)
  brew upgrade --cask --no-quarantine "$@"

  # インストール後にコード署名を検証
  for pkg in "$@" ; do
    local caskroom="$(brew --caskroom)/$pkg"
    if ! [ -d "$caskroom" ] ; then
      continue
    fi

    echo "--- $pkg: コード署名を検証 ---"
    find "$caskroom" -type f -perm +111 | while read -r bin ; do
      if codesign --verify --deep --strict "$bin" 2>/dev/null ; then
        echo "  OK: $bin"
      else
        echo "  WARN: 署名なし/無効: $bin" 1>&2
      fi
    done
  done
}
