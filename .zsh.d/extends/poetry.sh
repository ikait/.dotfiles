# if pyenv installed at home dir
if type $HOME/.poetry/bin/poetry > /dev/null 2>&1; then
  export PATH=$HOME/.poetry/bin:$PATH
fi
