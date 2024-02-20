SRCPATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl"
DSTPATH="/usr/local/bin/subl"

if [ -e $SRCPATH ] && ! [ -e $DSTPATH ]; then
  ln -s $SRCPATH $DSTPATH
fi
