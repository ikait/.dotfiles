if type dstat > /dev/null 2>&1; then
  alias dstat-full='dstat -Tclmdrn'
  alias dstat-mem='dstat -Tclm'
  alias dstat-cpu='dstat -Tclr'
  alias dstat-net='dstat -Tclnd'
  alias dstat-disk='dstat -Tcldr'
fi
