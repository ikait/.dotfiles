if type pandoc > /dev/null 2>&1; then
  function pandocpdf() {
    iconv -f UTF-8-MAC -t UTF-8 $1 | pandoc -f markdown -o $2 -V documentclass=ltjarticle --latex-engine=lualatex
  }
fi
