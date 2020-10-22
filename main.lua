display.setStatusBar( display.HiddenStatusBar )

-- include Corona's "widget" library
local widget = require "widget"
local composer = require "composer"

-- event listeners for tab buttons:
local function onFirstView( event )
	composer.gotoScene( "view1" )
end

local function onSecondView( event )
	composer.gotoScene( "view2" )
end


-- create a tabBar widget with two buttons at the bottom of the screen

-- table to setup buttons
local tabButtons = {
	{ label="Calculator", defaultFile="button1.png", overFile="button1-down.png", width = 32, height = 32, onPress=onFirstView, selected=true },
	{ label="Curiosities", defaultFile="button2.png", overFile="button2-down.png", width = 32, height = 32, onPress=onSecondView },
}

-- create the actual tabBar widget
local tabBar = widget.newTabBar{
	top = display.contentHeight - 7,	-- 50 is default height for tabBar widget
	buttons = tabButtons
}

onFirstView()	-- invoke first tab button's onPress event manually
