figlet -t -c S H U B | lolcat 
fastfetch

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
source ~/powerlevel10k/powerlevel10k.zsh-theme

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

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
alias cat="bat"
alias cd="z"
alias f="fzf -m -e"
alias code="cd ~/Storage/hdd1/Code/ && nvim ."
alias osu="./Downloads/osu.AppImage"
# alias run="/home/rajubiri/.config/rofi/launchers/type-2/launcher.sh"
# alias app="/home/rajubiri/.config/rofi/applets/bin/apps.sh"
# alias media="/home/rajubiri/.config/rofi/applets/bin/mpd.sh"
# alias links="/home/rajubiri/.config/rofi/applets/bin/quicklinks.sh"
# alias vol="/home/rajubiri/.config/rofi/applets/bin/volume.sh"
# alias pow="/home/rajubiri/.config/rofi/powermenu/type-2/powermenu.sh"
EDITOR='nvim'
export PATH=/home/rajubiri/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl
export PATH=/home/rajubiri/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl
