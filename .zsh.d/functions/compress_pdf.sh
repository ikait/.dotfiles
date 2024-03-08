# Usage: compresspdf [input file] [output file] [screen*|ebook|printer|prepress]
compresspdf() {
    if which gs > /dev/null 2>&1; then
        gs -sDEVICE=pdfwrite -dNOPAUSE -dQUIET -dBATCH -dPDFSETTINGS=/${3:-"screen"} -dCompatibilityLevel=1.4 -sOutputFile="$2" "$1"
    else
        echo "Error: Install ghostscript."
    fi
}

compresspdfall() {
    if which gs > /dev/null 2>&1; then
        # 引数として指定されたすべてのファイルに対してループ処理
        for input in "$@"
        do
        # 出力ファイル名の生成（元のファイル名に "_min" を追加）
        output=${input%.*}_min.pdf

        # Ghostscriptを使用してPDFの変換を実行
        gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile="$output" "$input"

        # 変換後のファイル名を表示
        echo "$output"
        done
    else
        echo "Error: Install ghostscript."
    fi
}