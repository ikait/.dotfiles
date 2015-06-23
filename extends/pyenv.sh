if type $HOME/.pyenv/libexec/pyenv > /dev/null 2>&1; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
fi

eval "$(pyenv init -)"

# pip インストール時に自動的に rehash 発動
# function pip(){
#   $HOME/.pyenv/shims/pip $*
#   if [ "$1" = "install" ] || [ "$1" = "i" ] || [ "$1" = "uninstall" ] || [ "$1" = "uni" ]
#   then
#     pyenv rehash
#     rehash
#   fi
# }

