#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Colors for ls
alias ls='ls --color=auto'

# Bold and color user
# Jesus fucking Christ what the fuck
PS1="\[\e[1;34m\][\u@\h \[\e[1;33m\]\w\[\e[1;32m\]\$(parse_git_branch)\[\e[1;34m\]]\$\[\e[0m\] "

# Aliases
alias update='sudo pacman -Syyu && sudo yaourt -Syyu'
alias studia='cd /home/igor/Studia'

# >>> Added by cnchi installer
BROWSER=/usr/bin/chromium
EDITOR=/usr/bin/nano

# Alias to light locker
alias xflock4='light-locker-command -l'

# QT Theming
QT_STYLE_OVERRIDE='kvantum'
