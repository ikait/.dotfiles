if type go > /dev/null 2>&1; then
  export PATH=/usr/local/opt/go/libexec/bin:$PATH
  export GOPATH=$HOME/.go
  export PATH=$GOPATH/bin:$PATH
fi
