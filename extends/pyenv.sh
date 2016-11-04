# if pyenv installed at home dir
if type $HOME/.pyenv/libexec/pyenv > /dev/null 2>&1; then
  export PYENV_ROOT="$HOME/.pyenv"
fi
# if pyenv installed by homebrew
if type /usr/local/bin/pyenv > /dev/null 2>&1; then
  export PYENV_ROOT="/usr/local/var/pyenv"
fi

if [ ${PYENV_ROOT} ]; then
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

# pip インストール時に自動的に rehash 発動
# function pip(){
#   $HOME/.pyenv/shims/pip $*
#   if [ "$1" = "install" ] || [ "$1" = "i" ] || [ "$1" = "uninstall" ] || [ "$1" = "uni" ]
#   then
#     pyenv rehash
#     rehash
#   fi
# }
