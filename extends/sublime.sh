SRCPATH="/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl"
DSTPATH="/usr/local/bin/subl"

if [ -e $SRCPATH ] && ! [ -e $DSTPATH ]; then
  ln -s $SRCPATH $DSTPATH
fi
