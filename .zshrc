# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source "/home/$USER/.zsh-plugin/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
source "/home/$USER/.zsh-plugin/powerlevel10k/powerlevel10k.zsh-theme"
source "/home/$USER/.zsh-plugin/fzf-tab/fzf-tab.plugin.zsh"
    # disable sort when completing `git checkout`
    zstyle ':completion:*:git-checkout:*' sort false
    # set descriptions format to enable group support
    zstyle ':completion:*:descriptions' format '[%d]'
    # set list-colors to enable filename colorizing
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
    # preview directory's content with exa when completing cd
    zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls  --color=auto $realpath'
    # switch group using `,` and `.`
    zstyle ':fzf-tab:*' switch-group ',' '.'
zstyle ':completion:*:processes' command "ps -A  -o pid,user,command"
zstyle ':completion:*' menu select

#####
#FZF#
#####
#####################################################
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias fd="fdfind"
export FZF_DEFAULT_COMMAND='fdfind --hidden --follow -E ".git" -E "node_modules" . /etc /home'
export FZF_DEFAULT_OPTS='--height 90% --layout=reverse --bind=alt-j:down,alt-k:up,alt-i:toggle+down --border --preview "echo {} | ~/Tool/fzf_preview.py"'

# use fzf in bash and zsh
# Use ~~ as the trigger sequence instead of the default **
#export FZF_COMPLETION_TRIGGER='~~'

# Options to fzf command
#export FZF_COMPLETION_OPTS=''

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fdfind --hidden --follow -E ".git" -E "node_modules" . /etc /home
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fdfind --type d --hidden --follow -E ".git" -E "node_modules" . /etc /home
}
# Use ~~ as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER='\'

# Options to fzf command
export FZF_COMPLETION_OPTS='--border --info=inline'

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# (EXPERIMENTAL) Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf "$@" --preview 'tree -C {} | head -200' ;;
    export|unset) fzf "$@" --preview "eval 'echo \$'{}" ;;
    ssh)          fzf "$@" --preview 'dig {}' ;;
    *)            fzf "$@" ;;
  esac
}
#####################################################

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/pillvic/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/pillvic/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/pillvic/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/pillvic/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
##################################################################################3

if [ -x /usr/bin/dircolors ]; then
        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
        alias ls='ls --color=auto'
fi

alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias bat='batcat'
alias du='ncdu --color dark -rr -x --exclude .git --exclude node_modules'
