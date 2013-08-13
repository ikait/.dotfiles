# パス追加
eval "$(rbenv init -)"

# rubygems インストール時に自動的に rehash 発動
function gem(){
  $HOME/.rbenv/shims/gem $*
  if [ "$1" = "install" ] || [ "$1" = "i" ] || [ "$1" = "uninstall" ] || [ "$1" = "uni" ]
  then
    rbenv rehash
    rehash
  fi
}
