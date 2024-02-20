# if pyenv installed at home dir
if type $HOME/.nodebrew/nodebrew > /dev/null 2>&1; then
  export PATH=$HOME/.nodebrew/current/bin:$PATH
fi
# if pyenv installed by homebrew
if type /usr/local/bin/nodebrew > /dev/null 2>&1; then
  export PATH=/usr/local/var/nodebrew/current/bin:$PATH
fi
