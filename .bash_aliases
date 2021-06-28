
	# ********** Aliases ****************** #

# minecraft
alias minecraft="java -jar ~/Downloads/tlauncher/TLauncher-2.75.jar"

# files -> nautilus (GNOME)
alias files="nautilus"
# filess -> dolphin (KDE)
alias filess="dolphin"

# alias for color syntax batcat
alias kat="batcat"

# set trackpoint/mouse preferences, see: https://www.x.org/wiki/Development/Documentation/PointerAcceleration/# (Basic useage SECTION)
xset m 16/10 0

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


# ************************************************
#copy of xinit rc begins here:

# swap escape and caps lock keys
# setxkbmap -option caps:swapescape

# TouchPad sensitivity config
# See http://archive.today/Z2LoK answer #3 (user Daniel M)
xinput set-prop 12 "Synaptics Noise Cancellation" 20 20
xinput set-prop 12 "Synaptics Finger" 50 50 255
synclient PalmDetect=1
synclient PalmMinWidth=05
synclient TapButton1=0
synclient TapButton2=0
synclient TapButton3=0
synclient TapAndDragGesture=0
synclient VertEdgeScroll=0
synclient VertTwoFingerScroll=1
synclient VertScrollDelta=250
synclient HorizScrollDelta=250
xinput set-prop 12 "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 100000

#am i supposed to run this? idk dude
# xinput --set-prop 11 "Synaptics Scrolling Distance" 350 350

#copy of xinitrc ends here
# *************************88



#PS1 stuff login stuff
# eg. trev@computer ~
# $ blablabla and colors
export PS1="\[\033[38;5;82m\]\u\[$(tput sgr0)\]@\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;13m\]\h\[$(tput sgr0)\] \W\n\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;122m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"

