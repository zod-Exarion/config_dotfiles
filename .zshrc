#!bin/zsh

export PATH="$HOME/bin:$HOME/apps/.tmuxifier/bin:$PATH"

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#config history 
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history 
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

export FZF_DEFAULT_COMMAND="fd . $HOME -tf -s --hidden"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"

alias ls="eza --long --icons=always --no-time --no-user --no-permissions --tree --level=1"
alias lsa="ls -a"
alias cd="z"
alias f="fzf -m -e"

alias ff="fastfetch"

export EDITOR='nvim'
export LESSHISTFILE=-
PS1='% ~ $ '

#plugins 
eval "$(zoxide init zsh)"
source <(fzf --zsh)
eval $(thefuck --alias)
eval "$(starship init zsh)"
eval "$(tmuxifier init -)"

