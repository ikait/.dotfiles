"行番号, ルーラーを表示
set ruler
set number

"現在行をハイライト
set cursorline

"タイトルをバッファ名にする
set title

"ターミナル接続を高速に
set ttyfast

"256色表示
set t_Co=256

"vim 互換にしない
set nocompatible

"Unicode で行末が変になる問題を解決
set ambiwidth=double

"バックスペースキーで行頭を削除する
set backspace=indent,eol,start

"C-v の矩形選択で行末より後ろもカーソルを置ける
set virtualedit=block

"コマンド、検索パターンを保存
set history=50

"
"検索
"

"インクリメンタルサーチを有効にする
set incsearch

"大文字小文字を区別しない
set ignorecase

"大文字で検索されたら対象を大文字検定にする
set smartcase

"行末まで検索したら行頭に戻る検索
set wrapscan

"
"フォーマット
"
"自動インデントを有効にする
set smartindent
set autoindent

"フォーマット揃えをコメント以外有効に
set formatoptions-=c

"括弧の対応をハイライト
set showmatch

"行頭の余白内で Tab を打ち込むと、"shiftwidth" の数だけインデントする
set smarttab

"
set tabstop=2
set shiftwidth=2
set softtabstop=0
set expandtab

"検索結果をハイライトする
set hlsearch

"ステータスラインにコマンドを表示
set showcmd

"ステータスラインを常に表示
set laststatus=2

"ファイルナンバー表示
set statusline=[%n]

"ファイル名表示
set statusline+=%<%F

"変更のチェック表示
set statusline+=%m

"読込専用かどうか表示
set statusline+=%r

"ヘルプページなら[HELP]と表示
set statusline+=%h

"プレビューウインドウなら[Prevew]と表示
set statusline+=%w

"ファイルタイプ表示
set statusline+=%y

"ここからツールバー右側
set statusline+=%=

"現在文字行/全体行表示
set statusline+=[L=%l/%L]

"現在行が全体行の何%目か表示
set statusline+=[%p%%]

"ファイルタイプに応じて挙動,色を変える
syntax on
filetype plugin on
filetype indent on

"
"キー設定
"
"矢印キーでは表示行単位で行移動する
nmap <UP> gk
nmap <DOWN> gj
vmap <UP> gk
vmap <DOWN> gj
