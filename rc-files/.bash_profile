
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

if [ -d "$HOME/bin" ] ; then
	PATH="$PATH:$HOME/bin"
fi

# clipboard helper
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selectio clipboard -o'
alias pbselect='xclip -selection primary -o'
