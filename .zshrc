# source ~/.clock.sh
# source ~/.controlbat.sh
# setopt PROMPT_SUBST
# PROMPT_SUBST='%B%F{red}%n@%m%f%F{yellow}[%D{%L:%M:%S}]%f:%F{blue}${${(%):-%~}}%f$ %b'

# echo 255 > /tmp/brightness; sudo cp /tmp/brightness /sys/class/leds/smc::kbd_backlight/brightness; rm /tmp/brightness
echo -e '\033[?6c'
source .profile
# xmodmap ~/.xmaptoazerty
TERM=xterm-256color
setfont /usr/share/consolefonts/Lat38-TerminusBold20x10.psf.gz
#tmux
#tmux source-file ~/.tmux.config 
# source ~/.zsh/zsh-dircolors-nord/zsh-dircolors-nord.zsh

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# export ZSH="$HOME/.oh-my-zsh"
export EDITOR=/snap/bin/nvim

export PATH="/usr/lib/w3m/:$PATH"
export PATH="$HOME/snap/:$PATH"
# export PATH="$HOME/.gord/:$PATH"
export PATH="/snap/bin/nvim:$PATH"
export PATH="/snap/bin/:$PATH"
export PATH="$HOME/.stubgen-2.07/:$PATH"
export PATH=$PATH:/usr/local/go/bin
export PATH="$HOME/go/bin/:$PATH"
mkpi=192.168.1.77 
ipi=192.168.1.25
cm4=192.168.1.71
hp=192.168.1.61
ilinux=192.168.1.17
# cw=wlx30de4b20e988
cwtp=wlx30de4b20e988
cw=wlp3s0
cwm=prism0
mkpiTmate=taQJkT5qyKqTJnef9k5RMfjuZ@lon1.tmate.io
function showdate(){
    printf '\033[;H'
    date
    # sleep 1
    # showdate
}

function testInject(){
    # sudo aireplay-ng --test $cwm
    sudo aireplay-ng --test $cwtp
}

function initMonitor(){
    sudo ifconfig $cw down
    sudo iwconfig $cw mode monitor
    sudo ifconfig $cw up
}

function startMonitor(){
    sudo airmon-ng check kill
    sudo airmon-ng start $1
}

function monitor(){
    # if [[ -z $1 ]] ; then
        # sudo airodump-ng $cwm
    # else
	sudo airodump-ng $1
    # fi

}


# sudo airodump-ng -c 11 --bssid A8:6A:BB:89:C0:9E -w /tmp/dictio wlx30de4b20e988
function attack(){
    sudo airodump-ng -c $1 --bssid $2 -w /tmp/attack $cwtp
}

# sudo aireplay-ng -0 10 -a A8:6A:BB:89:C0:9E wlx30de4b20e988
function inject (){
    sudo aireplay-ng -0 $1 -a $2 $cwtp
}


function gord() {
	if [ -d $DISPLAY ]; then
		TERM=linux
	fi
	
	~/.gord/gord 
	
	if [ -d $DISPLAY ]; then
		TERM=xterm-256color
	fi
	echo -e '\033[?6c'
}
ALL_CHARACTERS=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

function crack(){
    crunch 1 15 $ALL_CHARACTERS | aircrack-ng /tmp/attack*.cap -w h:- -b $1 
	# crunch $1 $2 $3 | aircrack-ng /tmp/attack-01.cap -w h:- -b $4
}

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

alias transfert="cd /home/mkovel/Documents/transfert"


alias cl="clear"
alias c="clear"

#Discord
alias cordless="/home/mkovel/cordless/cordless"
# alias gord="/home/mkovel/gord/gord"

alias python="python3"

alias work="cd ~/work"

alias gitpush="~/.scripts/gitpush"

alias clone="gh repo clone"

alias tma="tmux a"
alias tms="tmux source-file ~/.tmux.conf"

# function cleanVimSession() {
# 	rm ~/.local/share/nvim/sessions/%home%mkovel* > /dev/null 2>&1
# }

alias cleanVimSession="rm ~/.local/share/nvim/sessions/%home%mkovel* & "
# alias nv="(cleanVimSession) > /dev/null 2>&1; /snap/bin/nvim -p "
alias nv="/snap/bin/nvim -p"
alias nvdiff="/snap/bin/nvim -d"
alias nvd="nvdiff"
alias nvt="nv +term"

funcion nv() {
	if [[ -z $1 ]]; then
		/snap/bin/nvim -p
	fi
	if [[ $1 == "-d" ]]; then
	    /snap/bin/nvim -d
	    # local args=$@
	    # /snap/bin/nvim $args
	fi

}


# funcion nv() {
#     if [[ -z $1 ]]; then
# 		/snap/bin/nvim -p
# 	else if [[ $1 == "-d" ]]; then
# 	    /snap/bin/nvim -d
# 	    # local args=$@
# 	    # /snap/bin/nvim $args
# 	fi
# }
# alias nv="nvim"

alias DirectBackup_="sudo dd if=/dev/mmcblk0 of=/dev/sda bs=4096 status=progress conv=notrunc,noerror"

# alias ddmount="sshfs -o allow_other mkovel@192.168.1.61:/home/mkovel/DD DD"
# alias ddmountext="sshfs -o allow_other mkovel@109.133.251.234:/home/mkovel/DD DD"
# alias ddmountext="sudo mount /dev/sda1 DD"
alias hpmount="sshfs -o allow_other mkovel@192.168.1.61:/home/mkovel /home/mkovel/HP"
# alias hpmountext="sshfs -o allow_other mkovel@109.133.251.234:/ /home/mkovel/remote_hp"
alias ipimount="sshfs -o allow_other mkovel@192.168.1.25:/home/mkovel ~/IPI" 
alias ddmount="sshfs -o allow_other mkovel@192.168.1.77:/home/mkovel/DD ~/DD" 

alias sshipi="ssh mkovel@192.168.1.77"
alias sshp="ssh mkovel@192.168.1.61"
alias sshpext="ssh mkove@109.133.251.234"
alias usbmount="sudo mount -o umask=0 /dev/sdb1 /home/mkovel/USB"
# alias ddmount="sudo mount -o umask=0 /dev/sda1 /home/mkovel/DD"
alias nvzsh="nv ~/.zshrc; reload"
alias nvinit="nv ~/.config/nvim/init.vim"
alias reload_torrent="scp /home/mkovel/Downloads/*.torrent mkovel@mkpi.local:/home/mkovel/.ratio_master/torrents"
alias reload="source ~/.zshrc"
alias dk="w3m https://duckduckgo.com"
alias gg="w3m https://google.com"
alias ygg="w3m yggtorrent.do"
alias cleanVim="rm ~/.local/state/nvim/swap/*"
# alias cleanVim="rm ~/.local/share/nvim/swap/*.swp* "
alias cloneGenie="git clone ssh://git@gitlab.ulb.be:30422/ulb-infof307/2023-groupe-3.git"
alias gs="git status"

# send all files after the second argument
# send 192.168.1.77 test.txt result.txt

alias ssh="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
alias  scp="scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
# function scp(){
#     if [[ $1 == "-r" ]]; then
# 		shift
# 		scp -ro UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no "$@"
# 	else
# 		# scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no "$@"
# 		# scp "$@" 
# 		echo "$@"
# 	fi
# }
function send() {
    ip_address="$1"
    shift
    files=("$@")  # utilise des tableaux pour stocker les noms de fichiers
	scp "${files[@]}" mkovel@$ip_address:/home/mkovel/transfert
    # scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no "${files[@]}" mkovel@$ip_address:/home/mkovel/transfert
}


function ga() {
	for i in "${@:1}"; do
		git add $i
	done
	gs
}
function gc() {
	txt=$1
	for i in "${@:2}"; do
		txt="$txt $i"
	done
	git commit -m "$txt"
	gs
}
alias gp="git push"

function gitall() {
    local msg=""
    for i in "${@:1}"; do
        if [[ $i == "-m" ]]; then
            msg=$(printf '%s ' "${@: $(( $i + 1 ))}") && msg=${msg#*-m }
            break
        fi
        git add $i
    done
    git commit -m "$msg"
}
function temp() {
	cpu=$(</sys/class/thermal/thermal_zone0/temp) 
	echo "$((cpu/1000))°C"
}

function isDefFunc(){
	
	comp1=(
	comp2=)
	for arg in "$@"; do
		if [[ $arg == *$comp1*$comp2* ]]; then    
		# if [[ "$arg" == *#* ]]; then
			return 0
		fi
	done
	return 1
}
function install(){
	sudo apt install $@
}
 # pdftoppm -png test.pdf test
function pdf2jpg(){
	filename=$(basename -- "$1")
	mkdir -p ${filename%.*}PdfJpg
	pdftoppm -jpeg -progress $1 ${filename%.*}PdfJpg/${filename%.*}
}
function pdf2png(){
	filename=$(basename -- "$1")
	mkdir -p ${filename%.*}PdfPng
	pdftoppm -png $1 ${filename%.*}PdfPng/${filename%.*}
}
function pdftojpg(){
	pdf2jpg $@
}
function pdftopng(){
	pdf2png $@
}
# function pdftopng(){
# 	filename=$(basename -- "$1")
# 	mkdir -p ${filename%.*}
# 	pdftoppm -png $1 ${filename%.*}/${filename%.*}
# }
# var=/file.torrent 
# transmission-edit  $var -d $(transmission-show $var |egrep -o 'https?://[^ ]+')

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
alias comandLine="sudo systemctl isolate multi-user.target"
alias graphics="sudo systemctl isolate graphical.target"
alias M="setfont /usr/share/consolefonts/Lat38-TerminusBold20x10.psf.gz"
# alias M="setfont /usr/share/consolefonts/Lat38-TerminusBold22x11.psf.gz"
# alias M="setfont /usr/share/consolefonts/Lat38-TerminusBold16.psf.gz"
alias m="setfont /usr/share/consolefonts/Lat38-Terminus12x6.psf.gz"
# alias b="acpi | cowsay -f stegosaurus"
# alias b="acpi | cowsay  -f bulbasaur"
alias d="date > /tmp/date; acpi >> /tmp/date; cat /tmp/date|cowsay -f bulbasaur; rm /tmp/date" 
# alias battery="acpi"
alias shutdown="sudo shutdown now"
alias reboot="sudo reboot now"
alias meteo="curl wttr.in/bruxelles|less"
alias weather="curl wttr.in/bruxelles|less"
alias loadKeyboard="sudo loadkeys ~/.keymap"
# alias d="date | cowsay -f www"
# alias d="date | cowsay -f charmander"
alias nvimLua="rm -rf .config/nvim; mkdir .config/nvim; cp -r .config/nvimLuaOnly/* .config/nvim/ " 
alias nvimclassic="rm -rf .config/nvim; mkdir .config/nvim; cp -r .config/oldNvim/* .config/nvim/ " 
alias torrentDowload="sudo rtorrent -n -d ~/Téléchargements/torrents/"
# alias hibernate="sudo echo suspend in 3 secs; sleep 3 ;sudo pm-suspend"

function hibernate(){
	sudo echo "suspend in 3 secs"
	sleep 1
	sudo echo "suspend in 2 secs"
	sleep 1
	sudo echo "suspend in 1 secs"
	sleep 1
	sudo pm-suspend
}



alias l="exa -lhagH --octal-permissions"

alias cal="khal --color interactive"
alias generateMavenProject="~/.generateMavenProject.sh"
alias upgrade="sudo apt update && sudo apt upgrade"
alias cat="bat"
alias dua="dua i"
alias rp="rip"
alias j="just"
alias jm="just make"
alias jr="just run"
alias jmr="just make run"
alias updateTmateiLinux="scp mkovel@192.168.1.17:~/airlinux.tmate ~/tmate/"
eval "$(zoxide init zsh)"
alias gdc="git difftool"
alias mc="make clean; make"
# PROMPT_SUBST='%B%F{red}%n@%m%f%F{yellow}[%D{%L:%M:%S}]%f:%F{blue}${${(%):-%~}}%f$ %b'
# PROMPT='%B%F{red}%n%f%F{yellow}@%F{blue}%m%f%F{yellow}[%D{%L:%M:%S}]%f:%F{blue}${${(%):-%~}}%f$ %b'
# setopt PROMPT_SUBST
# PROMPT='%B%F{red}%n@%m%f%F{yellow}[%D{%L:%M:%S}]%f:%F{blue}${${(%):-%~}}%f$ %b'
# function battery(){
    # output=$(acpi);
    # percentage=$(echo $output | awk '{print $4}' | tr -d ',%');
    # export colorBat=green
    # if [ $percentage -lt 94 ]; then
    # if [ $percentage -lt 11 ]; then
	# export colorBat=red
    # else
	# export colorBat=green
    # fi

    # PROMPT='%B%F{blue}%n%f%F{white} at %F{cyan}%m%f%F{yellow}[%D{%L:%M:%S}]%F{$colorBat}($(acpi | awk "{print \$4}" | tr -d ",")%)%f:%F{black}${${(%):-%~}}%f$ %b'
    # TMOUT=1
    # TMOUT=10

    # PROMPT='%B%F{blue}%n%f%F{white} at %F{cyan}%m%f%F{yellow}[%D{%L:%M:%S}]%F{$colorBat}($(acpi | awk "{print \$4}" | tr -d ",")%)%f:%F{black}${${(%):-%~}}%f$ %b'
# blinkFlag=false
# blinkFlag=true

# TRAPALRM() {
    # output=$(acpi)
    # percentage=$(echo $output | awk '{print $4}' | tr -d ',%')

    # if [ $percentage -lt 94 ]; then
    # # if [ $percentage -lt 11 ]; then
    #     if [ $blinkFlag = false ]; then
    #         colorBat=red
    #         blinkFlag=true
    #     else
    #         colorBat=white
    #         blinkFlag=false
    #     fi
    # else
    #     colorBat=green
    #     blinkFlag=false
    # fi

#     zle reset-prompt
# }

    setopt PROMPT_SUBST

LIGHTBAT=21
LOWBAT=16
CRTICALBAT=11
# LOWBAT=16
# CRTICALBAT=11
# LIGHTBAT=20
    output=$(acpi)
    percentage=$(echo $output | awk '{print $4}' | tr -d ',%')
    if [ $percentage -lt $LIGHTBAT ]; then
	export colorBat=red
	else
	export colorBat=green
	fi

    PROMPT='%B%F{blue}%n%f%F{white} at %F{cyan}%m%f%F{yellow}[%D{%L:%M}]%F{$colorBat}($(acpi | awk "{print \$4}" | tr -d ",")%)%f:%F{black}${${(%):-%~}}%f$ %b'

export TMOUT=5
# TRAPALRM() {
#     output=$(acpi)
#     percentage=$(echo $output | awk '{print $5}' | tr -d ',%')

#     if [ $percentage -lt $CRTICALBAT ]; then
# 	export TMOUT=2
#         if [ $colorBat = "red" ]; then
#             export colorBat=white
#         else
#             export colorBat=red
# 	fi
#     else
# 	if [ $percentage -lt $LOWBAT ]; then
# 	    if [ $colorBat = "red" ]; then
# 		export colorBat=white
# 	    else
# 		export colorBat=red
# 		if ! [ $percentage -lt $LOWBAT ]; then
# 		    export TMOUT=6
# 		fi
# 	    fi
# 	fi
#     else 
# 	if  [ $percentage -lt $LIGHTBAT ]; then
# 	    export colorBat=red 
# 	fi
#     else 
# 	export colorBat=green
#     fi

# 	zle reset-prompt
# }
funcion battery(){
# TRAPALRM() {
    output=$(acpi)
    percentage=$(echo $output | awk '{print $4}' | tr -d ',%')
    charging=$(echo $output | awk '{print $3}' | tr -d ',%')

    if [ $percentage -lt $CRTICALBAT ]; then
        export TMOUT=1
        if [ $colorBat = "red" ]; then
	    # echo "red"
            export colorBat=white
        else
            export colorBat=red
        fi
    elif [ $percentage -lt $LOWBAT ]; then
        if [ $colorBat = "red" ]; then
            export colorBat=white
	    export TMOUT=1
        else
            export colorBat=red
            if ! [ $percentage -lt $CRTICALBAT ]; then
                export TMOUT=5
            fi
        fi
    elif [ $percentage -lt $LIGHTBAT ]; then
        export colorBat=red 
    else 
        export colorBat=green
    fi
    if [ $charging = "Charging" ]; then
		export colorBat=green
	fi
}

battery
TRAPALRM() {
    battery
    zle reset-prompt
}
