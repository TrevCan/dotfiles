# swap escape and caps lock keys
setxkbmap -option caps:swapescape

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

