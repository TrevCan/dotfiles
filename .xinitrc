#!/bin/bash
# exec plasma_session
#WM=i3

#if [ "$1" != "test" ]; then
#	exec $WM
#fi


# Caps Lock to Ctrl while held and Esc when released
# https://archive.is/Dd9H5#35%
# [archive.today link](https://archive.is/Dd9H5#35%)
# setxkbmap -option "ctrl:nocaps"
# xcape -e 'Control_L=Escape'
# moved to ~/.local/bin/remaps



# set trackpoint/mouse preferences, see: https://www.x.org/wiki/Development/Documentation/PointerAcceleration/# (Basic useage SECTION)
xset m 16/10 0

		# TouchPad sensitivity config
		# See http://archive.today/Z2LoK answer #3 (user Daniel M)
		#
		# synclient PalmDetect=1
		# synclient PalmMinWidth=05
		# synclient TapButton1=0
		# synclient TapButton2=0
		# synclient TapButton3=0
		# synclient TapAndDragGesture=0
		# synclient VertEdgeScroll=0
		# synclient VertTwoFingerScroll=1
		# synclient VertScrollDelta=250
		# synclient HorizScrollDelta=250
		#am i supposed to run this? idk dude
		# xinput --set-prop 11 "Synaptics Scrolling Distance" 350 350
		# synaptics props:

		# Basically what I'm doing here is settings up the touchpad to work when resting my palm, apparently on some computers the PalmDetect setting doesn't work, so essentially it's just making the mouse to move very slow, since I just want to use circular scrolling and vertical scrolling.

# since TouchPad ID is not persistent in `xinput` I decided to retrieve it every time because
# why not
TOUCHPAD_ID=$(xinput | grep 'TouchPad' | cut -c 55-56)


xinput set-prop $TOUCHPAD_ID "Synaptics Noise Cancellation" 20 20
xinput set-prop $TOUCHPAD_ID "Synaptics Finger" 50 50 255
xinput set-prop $TOUCHPAD_ID "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 100000

# Parameter settings:
synclient LeftEdge=1574
synclient RightEdge=5370
synclient TopEdge=1409
synclient BottomEdge=4447
synclient FingerLow=25
synclient FingerHigh=30
synclient MaxTapTime=180
synclient MaxTapMove=248
synclient MaxDoubleTapTime=180
synclient SingleTapTimeout=180
synclient ClickTime=100
synclient EmulateMidButtonTime=0
synclient EmulateTwoFingerMinZ=282
synclient EmulateTwoFingerMinW=7
synclient VertScrollDelta=250
synclient HorizScrollDelta=250
synclient VertEdgeScroll=0
synclient HorizEdgeScroll=0
synclient CornerCoasting=0
synclient VertTwoFingerScroll=0
synclient HorizTwoFingerScroll=0
synclient MinSpeed=1
synclient MaxSpeed=1.75
synclient AccelFactor=0.035392
synclient TouchpadOff=0
synclient LockedDrags=0
synclient LockedDragTimeout=5000
synclient RTCornerButton=2
synclient RBCornerButton=3
synclient LTCornerButton=0
synclient LBCornerButton=0
synclient TapButton1=0
synclient TapButton2=0
synclient TapButton3=0
synclient ClickFinger1=1
synclient ClickFinger2=3
synclient ClickFinger3=0
synclient CircularScrolling=1
synclient CircScrollDelta=0.1
synclient CircScrollTrigger=3
synclient CircularPad=1
synclient PalmDetect=1
synclient PalmMinWidth=5
synclient PalmMinZ=69
synclient CoastingSpeed=20
synclient CoastingFriction=50
synclient PressureMotionMinZ=30
synclient PressureMotionMaxZ=160
synclient PressureMotionMinFactor=1
synclient PressureMotionMaxFactor=1
# synclient ResolutionDetect=1
synclient GrabEventDevice=0
synclient TapAndDragGesture=0
synclient AreaLeftEdge=0
synclient AreaRightEdge=0
synclient AreaTopEdge=0
synclient AreaBottomEdge=0
synclient HorizHysteresis=28
synclient VertHysteresis=28
synclient ClickPad=1
synclient RightButtonAreaLeft=3472
synclient RightButtonAreaRight=0
synclient RightButtonAreaTop=4058
synclient RightButtonAreaBottom=0
synclient MiddleButtonAreaLeft=0
synclient MiddleButtonAreaRight=0
synclient MiddleButtonAreaTop=0
synclient MiddleButtonAreaBottom=0

# bluetoothctl power on


# dual monitor setup
xrandr --output HDMI2 --auto --right-of eDP1
