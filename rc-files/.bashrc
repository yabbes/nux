#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# prefer Vim to Vi, i dont even want to bother with it
alias vi='vim'

# switch shell to english for the current session
alias basheng='LC_ALL=C bash'

xrdb ~/.Xresources
alias pass='PASSWORD_STORE_ENABLE_EXTENSIONS=true pass'
alias mc='mate-volume-control'
alias r='ranger'

# keyboard
setxkbmap -layout 'de,pt,ru'
s
