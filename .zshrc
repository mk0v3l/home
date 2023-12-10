# source ~/.clock.sh
# source ~/.controlbat.sh
# setopt PROMPT_SUBST
# PROMPT_SUBST='%B%F{red}%n@%m%f%F{yellow}[%D{%L:%M:%S}]%f:%F{blue}${${(%):-%~}}%f$ %b'

# echo 255 > /tmp/brightness; sudo cp /tmp/brightness /sys/class/leds/smc::kbd_backlight/brightness; rm /tmp/brightness

# if [  $DISPLAY ]; then 
    # xterm -bg black -fg white -fa 'Monospace' -fs 14 -fullscreen &
# fi
source ~/.aliases
source ~/.sensible
source ~/.cursorStyle
# echo -e '\033[?6c'
source ~/.profile
TERM=xterm-256color
setfont /usr/share/consolefonts/Lat38-TerminusBold20x10.psf.gz 2> /dev/null
SHELL=tmux
export FAST=1
PROMPT='%F{green}󰞦 %{%}%f%B'
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# export ZSH="$HOME/.oh-my-zsh"
# export EDITOR=/snap/bin/nvim
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
# export PATH=/home/mkovel/work/Unif/reseauLab/info-f-303/netkit/bin:/home/mkovel/go/bin/:/home/mkovel/.stubgen-2.07/:/snap/bin/:/home/mkovel/snap/:/usr/lib/w3m/:/home/mkovel/.cargo/bin:/home/mkovel/.local/bin:/home/mkovel/go/bin/:/home/mkovel/.stubgen-2.07/:/snap/bin/:/home/mkovel/snap/:/usr/lib/w3m/:/home/mkovel/.cargo/bin:/home/mkovel/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin:/home/mkovel/.local/share/JetBrains/Toolbox/scripts:/usr/local/go/bin:/home/mkovel/.local/share/JetBrains/Toolbox/scripts:/usr/local/go/bin
# export NETKIT_HOME=/home/mkovel/Téléchargements/info-f-303/netkit

export BATCOL="red"

# 
# cw=wlx30de4b20e988
cwtp=wlx30de4b20e988
cw=wlp3s0
cwm=prism0

# Netkit
export NETKIT_HOME=/home/mkovel/netkit-jh
export MANPATH=:$NETKIT_HOME/man
export PATH=$NETKIT_HOME/bin:$PATH
# export NETKIT_HOME=/home/mkovel/work/Unif/reseauLab/info-f-303/netkit
# export MANPATH=:$NETKIT_HOME/man
# export PATH=$NETKIT_HOME/bin:$PATH
# sudo airodump-ng -c 11 --bssid A8:6A:BB:89:C0:9E -w /tmp/dictio wlx30de4b20e988

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
 # ZSH_THEME="mlh"
 # ZSH_THEME="gozilla"
# ZSH_THEME="nord-extended/nord"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
#ZSH_THEME_RANDOM_CANDIDATES=( "gozilla" "mlh" )

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
# date behavior
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
source ~/.oh-my-zsh/oh-my-zsh.sh
# ZSH_AUTOSUGGEST_STRATEGY=(completion)
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

#exec .zshrc




#Discord0000




# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

bindkey '^[[Z' forward-word
# bindkey '^ ' autosuggest-accept
# bindkey '\e' autosuggest-accept
# bindkey '\e' complete-word
bindkey '^a' forward-word
bindkey '^o' forward-word
bindkey '^^i' forward-word

eval "$(zoxide init zsh)"

source ~/.aliases
source ~/.functions
if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
    startx /usr/bin/openbox-session > /dev/null 2>/dev/null
fi
