# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

#设置oh-my-zsh地址 
  export ZSH="/home/pillvic/.oh-my-zsh"

#外观设置
ZSH_THEME="agnoster"
#color
autoload colors
colors
 
 for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
 eval _$color='%{$terminfo[bold]$fg[${(L)color}]%}'
 eval $color='%{$fg[${(L)color}]%}'
 (( count = $count + 1 ))
 done
 FINISH="%{$terminfo[sgr0]%}"
 #}}}
  #命令提示符
      RPROMPT=$(echo "$RED%D %T$FINISH")
      PROMPT=$(echo "$CYAN%n@$YELLOW%M:$GREEN%/$_YELLOW>$FINISH ")
       PROMPT=$(echo "$BLUE%M$GREEN%/
       $CYAN%n@$BLUE%M:$GREEN%/$_YELLOW>>>$FINISH ")
   #标题栏、任务栏样式{{{
       case $TERM in (*xterm*|*rxvt*|(dt|k|E)term)
       precmd () { print -Pn "\e]0;%n@%M//%/\a" }
       preexec () { print -Pn "\e]0;%n@%M//%/\ $1\a" }
       ;;
   esac
   #}}}
#漂亮又实用的命令高亮界面
setopt extended_glob
 TOKENS_FOLLOWED_BY_COMMANDS=('|' '||' ';' '&' '&&' 'sudo' 'do' 'time' 'strace')
 
 recolor-cmd() {
     region_highlight=()
     colorize=true
     start_pos=0
     for arg in ${(z)BUFFER}; do
         ((start_pos+=${#BUFFER[$start_pos+1,-1]}-${#${BUFFER[$start_pos+1,-1]## #}}))
         ((end_pos=$start_pos+${#arg}))
         if $colorize; then
             colorize=false
             res=$(LC_ALL=C builtin type $arg 2>/dev/null)
             case $res in
                 *'reserved word'*)   style="fg=magenta,bold";;
                 *'alias for'*)       style="fg=cyan,bold";;
                 *'shell builtin'*)   style="fg=yellow,bold";;
                 *'shell function'*)  style='fg=green,bold';;
                 *"$arg is"*)
                     [[ $arg = 'sudo' ]] && style="fg=red,bold" || style="fg=blue,bold";;
                 *)                   style='none,bold';;
             esac
             region_highlight+=("$start_pos $end_pos $style")
         fi
         [[ ${${TOKENS_FOLLOWED_BY_COMMANDS[(r)${arg//|/\|}]}:+yes} = 'yes' ]] && colorize=true
         start_pos=$end_pos
     done
 }
check-cmd-self-insert() { zle .self-insert && recolor-cmd }
 check-cmd-backward-delete-char() { zle .backward-delete-char && recolor-cmd }
 
 zle -N self-insert check-cmd-self-insert
 zle -N backward-delete-char check-cmd-backward-delete-char
        
#编辑设置
export EDITOR=vim             #编辑器设置为VIM
bindkey "\e[3~" delete-char  #delete键为向后删除
    #补全配置
#    source  ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    source ~/.oh-my-zsh/custom/plugins/incr*.zsh
        #开启自动补全
	setopt AUTO_LIST
	setopt AUTO_MENU
	setopt MENU_COMPLETE     #补全时可自动选中菜单项
	autoload -U compinit
	compinit
	#自动补全缓存
	zstyle ':completion::complete:*' use-cache on
	zstyle ':completion::complete:*' cache-path .zcache
	zstyle ':completion:*:cd:*' ignore-parents parent pwd
	#自动补全选项
	zstyle ':completion:*' verbose yes
	zstyle ':completion:*' menu select
	zstyle ':completion:*:*:default' force-list always
	zstyle ':completion:*' select-prompt '%SSelect:  lines: %L  matches: %M  [%p]'

	zstyle ':completion:*:match:*' original only
	zstyle ':completion::prefix-1:*' completer _complete
	zstyle ':completion:predict:*' completer _complete
	zstyle ':completion:incremental:*' completer _complete _correct
	zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate
	#路径补全
	zstyle ':completion:*' expand 'yes'
	zstyle ':completion:*' squeeze-shlashes 'yes'
	zstyle ':completion::complete:*' '\\'
	#彩色补全菜单
	eval $(dircolors -b)
	export ZLSCOLORS="${LS_COLORS}"
	zmodload zsh/complist
	zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
	zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
	#修正大小写
	zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
	#错误校正
	zstyle ':completion:*' completer _complete _match _approximate
	zstyle ':completion:*:match:*' original only
	zstyle ':completion:*:approximate:*' max-errors 1 numeric
	#kill 命令补全
	compdef pkill=kill
	compdef pkill=killall
	zstyle ':completion:*:*:kill:*' menu yes select
	zstyle ':completion:*:*:*:*:processes' force-list always
	zstyle ':completion:*:processes' command 'ps -au$USER'
	#补全类型提示分组
	zstyle ':completion:*:matches' group 'yes'
	zstyle ':completion:*' group-name ''
	zstyle ':completion:*:options' description 'yes'
	zstyle ':completion:*:options' auto-description '%d'
	zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
	zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
	zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'
	zstyle ':completion:*:corrections' format $'\e[01;32m -- %d (errors: %e) --\e[0m'
	# cd ~ 补全顺序
 	zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'

# 历史记录的配置

export HISTSIZE=100000       #设置历史记录存储条数
export SAVEHIST=100000       #注销后保存的历史记录条数
export HISTFILE=~/.zhistory  #历史记录保存文件
setopt INC_APPEND_HISTORY    #以附加的方式写入历史记录
setopt HIST_IGNORE_DUPS      #相同历史命令只保留一个
setopt AUTO_PUSHD            #启用cd命令的历史记录
    #关于目录的历史记录配置
    setopt PUSHD_IGNORE_DUPS     #相同历史路径只保留一个
    #每个目录使用独立的历史纪录{{{
    cd() {
	builtin cd "$@"                             # do actual cd
	fc -W                                       # write current history  file
	local HISTDIR="$HOME/.zsh_history$PWD"      # use nested folders for history
	if  [ ! -d "$HISTDIR" ] ; then              # create folder if needed
	mkdir -p "$HISTDIR"
	fi
	export HISTFILE="$HISTDIR/zhistory"         # set new history file
	touch $HISTFILE
	local ohistsize=$HISTSIZE
	HISTSIZE=0                                  # Discard previous dir's history
	HISTSIZE=$ohistsize                         # Prepare for new dir's history
	fc -R                                       #read from current histfile
    }
    mkdir -p $HOME/.zsh_history$PWD
    export HISTFILE="$HOME/.zsh_history$PWD/zhistory"

    function allhistory { cat $(find $HOME/.zsh_history -name zhistory) }
    function convhistory {
	sort $1 | uniq |
	sed 's/^:\([ 0-9]*\):[0-9]*;\(.*\)/\1::::::\2/' |
	awk -F"::::::" '{ $1=strftime("%Y-%m-%d %T",$1) "|"; print }'
    }
    #使用 histall 命令查看全部历史纪录
    function histall { convhistory =(allhistory) |
    sed '/^.\{20\} *cd/i\\' }
    #使用 hist 查看当前目录历史纪录
    function hist { convhistory $HISTFILE }
    #全部历史纪录 top50
    function top50 { allhistory | awk -F':[ 0-9]*:[0-9]*;' '{ $1="" ; print }' | sed 's/ /\n/g' | sed '/^$/d' | sort | uniq -c | sort -nr | head -n 50 }
    #}}}
    


source $ZSH/oh-my-zsh.sh
source .oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 

# 插件配置
plugins=(
  git
  zsh-autosuggestions
)


export PATH="~/anaconda2/bin:$PATH"
export PATH=/usr/bin/:$PATH
