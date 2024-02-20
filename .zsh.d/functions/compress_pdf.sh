# Usage: compresspdf [input file] [output file] [screen*|ebook|printer|prepress]
compresspdf() {
    if which gs > /dev/null 2>&1; then
        gs -sDEVICE=pdfwrite -dNOPAUSE -dQUIET -dBATCH -dPDFSETTINGS=/${3:-"screen"} -dCompatibilityLevel=1.4 -sOutputFile="$2" "$1"
    else
        echo "Error: Install ghostscript."
    fi
}