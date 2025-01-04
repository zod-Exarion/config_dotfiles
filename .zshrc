#!bin/zsh

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

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
source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export FZF_DEFAULT_COMMAND="fd . $HOME -tf -s --hidden"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"

#plugins 
eval "$(zoxide init zsh)"
source <(fzf --zsh)
eval $(thefuck --alias)

alias ls="eza --long --icons=always --no-time --no-user --no-permissions --tree --level=1"
alias lsa="ls -a"
alias ls2="ls --level=2"
alias cd="z"
alias f="fzf -m -e"

export EDITOR='nvim'
# export PATH=/home/rajubiri/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl
