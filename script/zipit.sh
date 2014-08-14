function zipit() {
  string_dirpath=$(cd `dirname $1` > /dev/null && pwd)
  string_filepath=${string_dirpath}/`basename $1`

  echo "Attempt to zip \"${string_filepath}\""

  if [ -e $string_filepath ] ; then
    echo "It exists!"
    string_filename=`basename $1`
    date=`date +"%Y%m%d%H%M%S"`
    ext=".zip"

    $(cd $string_dirpath > /dev/null && zip -9 -r -q "${string_filename}_${date}${ext}" $string_filename)

    if [ $? -eq 0 ] ; then
      echo "Successfully zipped!"
    fi
  else
    echo "Not found \"$1\". Failed to zip."
  fi
}
