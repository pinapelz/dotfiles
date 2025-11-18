# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"
export GAMEDIR=/home/pinapelz/Games
ZSH_THEME="agnoster"

plugins=( 
    git
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Check archlinux plugin commands here
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/archlinux


# Display Pokemon-colorscripts
# Project page: https://gitlab.com/phoneybadger/pokemon-colorscripts#on-other-distros-and-macos
#pokemon-colorscripts --no-title -s -r

# Set-up FZF key bindings (CTRL R for fuzzy history finder)
source <(fzf --zsh)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
# Created by `pipx` on 2024-08-16 04:36:25
export PATH="$PATH:/home/pinapelz/.local/bin"
alias xterm-kitty="kitty"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
rm -rf "$HOME/.minecraft/webcache2"
alias stirling-pdf="java -jar /usr/share/java/stirling-pdf.jar"
alias update="eos-update && yay && flatpak run update"
export MOZ_DISABLE_WAYLAND_PROXY=1
. "/home/pinapelz/.deno/env"
alias jfetch="jfetch erina"
