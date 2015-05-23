if ! type go > /dev/null 2>&1; then
else
  export PATH=$PATH:/usr/local/opt/go/libexec/bin
  export GOPATH=$HOME/.go
  export PATH=$PATH:$GOPATH/bin
fi
