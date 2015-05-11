#==========================================================================
# パス
#==========================================================================
export PATH=/usr/local/bin:/sbin:$PATH

if echo $HOST | grep -q 'sakura.ne.jp'; then
  export PATH=$HOME/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:$HOME/bin
  export MAILCHECK=0
fi


#==========================================================================
# 言語
#==========================================================================
export LANG=ja_JP.UTF-8


#==========================================================================
# カラー
#==========================================================================
export TERM=xterm-256color


#==========================================================================
# スクリプト / 追加の設定
#==========================================================================
if [ -d $HOME/.zsh.d/ ]; then
  for file in $( ls $HOME/.zsh.d/{script,extend}/*.sh ); do
    source $file
  done
fi


#==========================================================================
# プロンプト
#==========================================================================
#   PROMPT  : 通常のプロンプト
#   PROMPT2 : forやwhile文使用時の複数行入力プロンプト
#   RPROMPT : 右側に表示されるプロンプト, 入力が被ると自動的に消える
#   SPROMPT : 入力ミス時のコマンド訂正プロンプト
#
# コマンド訂正プロンプト
#   y: 訂正コマンドを実行
#   n: 入力したコマンドが実行
#   a: 実行を中断 abort
#   e: コマンドライン編集 edit
#
# プロンプト文字列
#   %% : %文字
#   %# : #文字(一般ユーザなら %，スーパユーザなら #)
#   %l : tty名
#   %M : ホスト名（全部）
#   %m : ホスト名（最初のドットまで）
#   %n : ユーザ名
#   %? : 直前のコマンドの終了値($?)
#   %/ : カレントディレクトリ(フルパス)
#   %~ : 同上,ただし~記号などで可能な限り短縮する
#   %1~ or %1/ : カレントディレクトリ(ベースネーム)
#   %(1j,(%j),) : 実行中のジョブ数が1つ以上ある場合ジョブ数を表示
#
# プロンプト装飾
#   %B : ボールド (%b で終了)
#   %E : 終了でのクリア
#   %U : アンダーライン (%u で終了)
#   %S : 強調 (%s で終了)
#   %F : 文字の色 (%f で終了)
#   %K : 文字背景の色 (%k で終了)
#
# 基本色
#   0 : black
#   1 : red
#   2 : green
#   3 : yellow
#   4 : blue
#   5 : magenta
#   6 : cyan
#   7 : white
#

# 色の設定を$fg[red]のように人がわかるような書き方ができる
autoload -Uz colors
colors

# 色の定義
DEFAULT=$"%{\e[0;0m%}"
RESET="%{${reset_color}%}"
GREEN="%{${fg[green]}%}"
BLUE="%{${fg[blue]}%}"
RED="%{${fg[red]}%}"
CYAN="%{${fg[cyan]}%}"
YELLOW="%{${fg[yellow]}%}"
MAGENTA="%{${fg[magenta]}%}"
WHITE="%{${fg[white]}%}"

# ホスト名
if [ -n "${REMOTEHOST}${SSH_CONNECTION}" ]; then
	host="${RESET}${MAGENTA}%B[%m]%b${RESET}"
else
	host="${RESET}"
fi

case ${UID} in
0)  ## root のとき
	PROMPT=$'\n'"${host}: ${RED}%B%~%b${RESET}"$'\n'"${RED}%B%#%b${RESET} "
	PROMPT2="${RESET}${RED}%B%>%b${RESET} "
	SPROMPT="${RESET}${RED}%r is correct? [n,y,a,e]:${RESET} "
	;;
*)  ## root 以外のとき
	PROMPT=$'\n'"${host}: ${RED}%B%~%b${RESET}"$'\n'"%B%#%b "
	PROMPT2="${RESET}%B>%b "
	SPROMPT="${RESET}%r is correct? [n,y,a,e]: "
	;;
esac

RPROMPT="${RPROMPT}"

# コマンドの実行後に右プロンプトを非表示にする
setopt transient_rprompt


#==========================================================================
# エイリアス
#==========================================================================
# Linux では GNU ls 用のオプションを使う
case ${OSTYPE} in
freebsd*|darwin*)
	alias ls='ls -G'
	;;
linux*)
	alias ls='ls --color=auto'
	;;
esac
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias tig='tig --all'


#==========================================================================
# コマンド履歴
#==========================================================================
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# 直前と同じコマンドラインはヒストリに追加しない
setopt hist_ignore_dups

# ヒストリにhistoryコマンドを記録しない
setopt hist_no_store

# 余分なスペースを削除してヒストリに記録する
setopt hist_reduce_blanks

# 行頭がスペースで始まるコマンドラインはヒストリに記録しない
# setopt hist_ignore_spece

# 重複したヒストリは追加しない
# setopt hist_ignore_all_dups

# 複数の zsh を同時に使う時など history ファイルに上書きせず追加
setopt append_history

# 履歴ファイルに時刻を記録
setopt extended_history

# シェルのプロセスごとに履歴を共有
setopt sharehistory


#==========================================================================
# 補完
#==========================================================================
# 補完するかの質問は画面を超える時にのみに行う
LISTMAX=0
autoload -Uz compinit; compinit

# 補完時に大小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=1

# sudo でも補完の対象
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin

# 補完候補が複数ある時に、一覧表示
setopt auto_list

# 補完キー（Tab, Ctrl+I) を連打するだけで順に補完候補を自動で補完
setopt auto_menu

# カッコの対応などを自動的に補完
setopt auto_param_keys

# ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash

# auto_list の補完候補一覧で、ls -F のようにファイルの種別をマーク表示しない
setopt no_list_types

# コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt magic_equal_subst

# ファイル名の展開でディレクトリにマッチした場合末尾に / を付加する
setopt mark_dirs

# 重複パスを登録しない
typeset -U path cdpath fpath manpath

# 8 ビット目を通すようになり、日本語のファイル名を表示可能
setopt print_eight_bit

# ファイルリスト補完でもlsと同様に色をつける｡
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# cd をしたときにlsを実行する
function chpwd() {
  l
}

# コマンド後に現在位置を表示
function precmd() {
  print -Pn "\e]2; %n@%m %~\a"
}

# ディレクトリ名だけで､ディレクトリの移動をする
setopt auto_cd

# cd のタイミングで自動的に pushd
setopt auto_pushd
setopt pushd_ignore_dups

# ディレクトリを水色にする
export LS_COLORS='di=01;36'

# Ctrl+w で､直前の/までを削除する｡
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'