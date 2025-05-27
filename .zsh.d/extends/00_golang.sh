if type goenv > /dev/null 2>&1; then
  export GOENV_DISABLE_GOPATH=1
  export PATH=$PATH:/usr/local/opt/go/libexec/bin
  export GOPATH=$HOME/.go
  export PATH=$PATH:$GOPATH/bin
fi
