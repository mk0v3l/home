#tmux
#tmux source-file ~/.tmux.config 
# source ~/.zsh/zsh-dircolors-nord/zsh-dircolors-nord.zsh

#
source ~/.zshfixe || true

# if [  $DISPLAY ]; then 
    # xterm -bg black -fg white -fa 'Monospace' -fs 14 -fullscreen &
# fi
source ~/.aliases
source ~/.sensible
# source ~/.cursorStyle
# echo -e '\033[?6c'
# source ~/.profile
TERM=tmux-256color
# TERM=xterm-256color
setfont /usr/share/consolefonts/Lat38-TerminusBold20x10.psf.gz 2> /dev/null
SHELL=tmux
export FAST=1
PROMPT='%F{green}󰞦 %{%}%f%B'
# If you come from bash you might have to change your $PATH.
# TERM=xterm-256color
SHELL=tmux
# export PATH=$HOME/bin:/usr/local/bin:$PATH
PATH=$HOME/.cargo/bin:$PATH
export PATH=/home/mkovel/work/reseauLab/info-f-303/netkit/bin:$PATH
source ~/.cargo/bin
# Path to your oh-my-zsh installation.
TERM=xterm-256color
source ~/.sensible
export ZSH="$HOME/.oh-my-zsh"
# export PATH=/home/mkovel/work/Netkit/info-f-303/netkit/bin:$PATH
# export NETKIT_HOME=/home/mkovel/work/Netkit/info-f-303/netkit
export NETKIT_HOME=/home/mkovel/netkit-jh
export MANPATH=:$NETKIT_HOME/man
export PATH=$NETKIT_HOME/bin:$PATH
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
 ZSH_THEME="mlh"
# ZSH_THEME="nord-extended/nord"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
#ZSH_THEME_RANDOM_CANDIDATES=( "gozilla" "mlh" )
export EDITOR=/home/mkovel/nvim.appimage
export PATH="$HOME/.cargo/bin:$PATH"

export PATH="/usr/lib/w3m/:$PATH"
export PATH="$HOME/snap/:$PATH"
# export PATH="$HOME/.gord/:$PATH"
# export PATH="/snap/bin/nvim:$PATH"
export PATH="/snap/bin/:$PATH"
export PATH="$HOME/.stubgen-2.07/:$PATH"
export PATH=$PATH:/usr/local/go/bin
export PATH="$HOME/go/bin/:$PATH"
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"
# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions web-search zsh-dircolors-nord)
source $ZSH/oh-my-zsh.sh

plugins=(git zsh-autosuggestions web-search zsh-dircolors-nord)
source ~/.oh-my-zsh/oh-my-zsh.sh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions

# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

PROMPT="%F{green}󰞦 %{$reset_color%}%f%B"
#exec .zshrc
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# setopt PROMPT_SUBST
# # PROMPT='%B%F{red}%n@%m%f%F{yellow}[%D{%L:%M:%S}]%f:%F{blue}${${(%):-%~}}%f$ %b'
#
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bindkey '^[[Z' forward-word
bindkey '^p' autosuggest-accept
# bindkey '\e' autosuggest-accept
# bindkey '\e' complete-word
# bindkey '^a' forward-word
bindkey '^o' forward-word
# bindkey '^^i' forward-word
# bindkey "^k" arrow-up
# bindkey "^k" up-line-or-beginning-search
# bindkey "^j" down-line-or-beginning-commande
bindkey "^t" clear-screen
bindkey "^l" forward-char
bindkey "^h" backward-char
# bindkey "^J" up-line-or-history
# bindkey "^J" history-search-forward
# bindkey "^K" down-line-or-history
# bindkey "^K" history-search-backward
bindkey "^K" up-line-or-history
bindkey "^J" down-line-or-history
bindkey "^U" backward-delete-char
# bindkey "^Y" kill-whole-line
bindkey "^Y" backward-kill-word
# bindkey "^j": next-history
 # PROMPT='%B%F{red}%n%f%F{yellow}@%F{blue}%m%f%F{yellow}[%D{%L:%M:%S}]%f:%F{blue}${${(%):-%~}}%f$ %b'
eval "$(zoxide init zsh)"
source ~/.aliases
source ~/.functions
# T
export PATH=$PATH:/home/mkovel/.local/bin/poetry
export PATH="/home/mkovel/.local/bin:$PATH"
export hugo='yooo'

TERM=tmux-256color
# TRAPALRM() {
#     zle reset-prompt
# }
