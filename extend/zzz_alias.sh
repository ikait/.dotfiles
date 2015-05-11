# alias gcc=gcc-4.9

if type bundle > /dev/null 2>&1; then
  alias be="bundle exec"
fi

if type lv > /dev/null 2>&1; then
else
  alias lv="less"
fi
