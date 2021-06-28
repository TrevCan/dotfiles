
	# ********** Aliases ****************** #

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

alias dotrep="/usr/bin/git --git-dir=/home/trev/.files --work-tree=/home/trev"


# new autocomplete git: https://stackoverflow.com/a/24665529
# by DylanYoung Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)
	# Main git completions (prior to git 2.30, you an use _git instead of __git_main)
__git_complete dotrep __git_main
# https://creativecommons.org/licenses/by-sa/4.0/

# old autocomplete which did not work:
# complete -F _git dotrep

export -p PASSWORD_STORE_CLIP_TIME=10
export -p EDITOR="vim" #i use vim btw

# prints calendar months from last month, current month, and next month
alias calr="cal -3"

#PS1 stuff login stuff
# eg. trev@computer ~
# $ blablabla and colors
export PS1="\[\033[38;5;82m\]\u\[$(tput sgr0)\]@\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;13m\]\h\[$(tput sgr0)\] \W\n\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;122m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"

