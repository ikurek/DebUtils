#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enables fuck
eval "$(thefuck --alias kurwa)"

# Colors for ls
alias ls='ls --color=auto'

# Bold and color user
# Jesus fucking Christ what the fuck
export PS1="\[$(tput bold)\]\[\033[38;5;4m\]\u\[\033[38;5;15m\] @ \[\033[38;5;4m\]\h\[\033[38;5;15m\] \[\033[38;5;3m\]\w\[\033[38;5;15m\] \[\033[38;5;5m\]>\[\033[38;5;15m\] \[$(tput sgr0)\]"

# Aliases
alias update='sudo yaourt -Syyu --aur'
alias studia='cd /home/igor/Studia'

# >>> Added by cnchi installer
BROWSER=/usr/bin/chromium
EDITOR=/usr/bin/nano

# Alias to light locker
alias xflock4='light-locker-command -l'

# QT Theming
QT_STYLE_OVERRIDE='kvantum'

# Android?
export ANDROID_HOME=~/Android/SDK
export PATH=$PATH{}:/opt/android-sdk/platform-tools
