~/scripts/startup.sh

if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ] && [ -z "${TMUX}" ]; then
    exec tmux new-session -A -s ${USER} >/dev/null 2>&1
fi
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias ls="eza --long --icons=always --no-time --no-user --no-permissions --tree --level=2"
alias lsa="ls -a"
alias cat="bat"
alias cd="z"
alias f="fzf -m -e"
alias bonsai="cbonsai -l -L 50"
alias run="/home/rajubiri/.config/rofi/launchers/type-2/launcher.sh"
alias app="/home/rajubiri/.config/rofi/applets/bin/apps.sh"
alias media="/home/rajubiri/.config/rofi/applets/bin/mpd.sh"
alias links="/home/rajubiri/.config/rofi/applets/bin/quicklinks.sh"
alias vol="/home/rajubiri/.config/rofi/applets/bin/volume.sh"
alias pow="/home/rajubiri/.config/rofi/powermenu/type-2/powermenu.sh"

#plugins 
eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"
eval $(thefuck --alias)

EDITOR='nvim'

