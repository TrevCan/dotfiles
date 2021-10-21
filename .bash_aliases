# Author: Hector Canizales (@TrevCan) <heror0484[at]@protonmail.com>


	# ********** Aliases ****************** #

# vim
export -p EDITOR="vim" #i use vim btw

# default program open
alias xopen=xdg-open
# search w/ aur. See aut-search(^AUR)
alias search=aur-search

# minecraft
alias minecraft="java -jar ~/Downloads/tlauncher/TLauncher-2.75.jar"

# files -> nautilus (GNOME)
alias files="nautilus"
# filess -> dolphin (KDE)
alias filess="dolphin"

# alias for color syntax batcat
alias kat="batcat"

#git alias for 'dotfiles' github repo
# github.com/trevcan/dotfiles

source /usr/share/bash-completion/completions/git

alias dotrep="/usr/bin/git --git-dir=$HOME/.files.git --work-tree=$HOME/"
alias dotfiles='dotrep'


#	******* git auto-complete when using dotrep alias*****

# new autocomplete git: https://stackoverflow.com/a/24665529
# by DylanYoung Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)
# Main git completions (prior to git 2.30, you an use _git instead of __git_main)
__git_complete dotrep __git_main
# https://creativecommons.org/licenses/by-sa/4.0/

# old autocomplete which did not work:
	# complete -F _git dotrep

# pass password manager stuff
export -p PASSWORD_STORE_CLIP_TIME=10


# prints 3 calendar months: from last month, current month, and next month
alias carl="cal -3"
# carl probably eats tacos


# PS1 stuff login stuff
# eg. trev@computer ~
# $ blablabla and colors
# make your own @: http://bashrcgenerator.com/
# source: https://news.ycombinator.com/item?id=27615516
# export PS1="\[\033[38;5;82m\]\u\[$(tput sgr0)\]@\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;13m\]\h\[$(tput sgr0)\] \W\n\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;122m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"

alias zoom="~/Documents/TEC5/newzoom/opt/zoom/ZoomLauncher"

alias bashtop="bpytop"
alias top="bpytop"
alias nosucc="cd ~/Downloads/suckless"

# https://github.com/raylee/tldr-sh-client
# tldr completion
complete -W "$(tldr 2>/dev/null --list)" tldr


# ./.xinitrc test
