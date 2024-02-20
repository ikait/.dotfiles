if echo $HOST | grep -q 'sakura.ne.jp'; then
  export PATH=$HOME/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:$HOME/bin
  export MAILCHECK=0
fi