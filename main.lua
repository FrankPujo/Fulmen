-----------------------------
----------FrankPujo----------
---------MIT License---------
-----------v1.0.0------------
-----------------------------

local widget = require "widget"
local display = require "display"
local composer = require "composer"

-- some useful numbers
local screenOffset = 320
local visualizedPage = 1

-- hide status bar and set background color
display.setStatusBar( display.HiddenStatusBar )
display.setDefault( "background", 0.1, 0.2, 0.8 )

-- create the line below title and input box
local numero
local result
local titleBase = display.newLine( 10, 35, 310, 35 )
titleBase:setStrokeColor( 0.7, 0.8, 1 )

-- calculate result
local function textListener( event )
    if ( event.phase == "ended" or event.phase == "submitted") then
        local num1 = tonumber( numero.text )
        if (num1) then
            result.text = num1 * 343.1 .. " m"
            result.size = 50
        end
    end
end

-- input box options
numero = native.newTextField( display.contentCenterX, 150, 170, 45 )
numero:addEventListener( "userInput", textListener )
numero.inputType = "decimal"

-- result text options
result = display.newText( "How many seconds?", display.contentCenterX, 320, native.SystemFont )
result:setFillColor( 180, 180, 0) 
result.size = 32

-- title options
local title = display.newText( "Fulmen", display.contentCenterX, 0, native.SystemFontBold )
title.size = 46

-- create a group uniting all the first page elements
local firstPageGroup = display.newGroup()
firstPageGroup:insert( result )
firstPageGroup:insert( numero )

-- trivia button on the second page
local triviaBtn = display.newRect( 480, display.contentCenterY, 60, 40 )

-- create a group for all the second page elements
local secondPageGroup = display.newGroup()
secondPageGroup:insert( triviaBtn )

-- function to move right between the pages
function moveRight( listener )
    if visualizedPage  == 3 then
        print( "trying to go too right!" )
    else
        transition.to( firstPageGroup, { time = 2500, x = firstPageGroup.x - screenOffset, transition = easing.outQuint } )
        transition.to( secondPageGroup, { time = 2500, x = secondPageGroup.x - screenOffset, transition = easing.outQuint } )
        visualizedPage = visualizedPage + 1
        print( "trying to go too right!" )
    end
end

-- function to move left between the pages
function moveLeft( listener )
    if visualizedPage == 1 then
        print( "trying to go too left!" )
    else
        transition.to( firstPageGroup, { time = 2500, x = firstPageGroup.x + screenOffset, transition = easing.outQuint } )
        transition.to( secondPageGroup, { time = 3000, x = secondPageGroup.x + screenOffset, transition = easing.outQuint } )
        visualizedPage = visualizedPage - 1
        print( visualizedPage )
    end
end

-- button to move right
local goRBtnOpt = {
    x = display.contentCenterX + 30,
    y = 400,
    width = 40,
    height = 40,
    onRelease = moveRight,
    shape = "rectangle"
}
local goRBtn = widget.newButton( goRBtnOpt )

-- button to move left 
local goLBtnOpt = {
    x = display.contentCenterX - 30,
    y = 400,
    width = 40,
    height = 40,
    onRelease = moveLeft,
    shape = "rectangle"
}
local goRBtn = widget.newButton( goLBtnOpt )

-- create menu
local menuOpen = false

local menuBlur = display.newRect( -70, display.contentCenterY, 140, 580 )
menuBlur:setFillColor( 0.1, 0.1, 0.1, 0.2 )
local menuBG = display.newRect( -101, display.contentCenterY, 200, 580 )
menuBG.strokeWidth = 1
menuBG:setStrokeColor( 0.7, 0.8, 1 )
menuBG:setFillColor( 0.1, 0.2, 0.8 )

-- function to toggle nerd option
local function toggleNerd()
    print( "hey NERD" )
end

-- nerd button options and menu item
local nerdBtnOpt = {
    x = -20,
    y = 40,
    width = 20,
    height = 20,
    onRelease = toggleNerd,
    shape = "rectangle"
}
local nerdBtn = widget.newButton( nerdBtnOpt )

local nerdText = display.newText( "Nerd?", -60, 40, native.SystemFont )

local menuGroup = display.newGroup()
menuGroup:insert( menuBG )
menuGroup:insert( nerdBtn )
menuGroup:insert( nerdText )
menuGroup.x = 10

-- hide or show the input box separately
local function hideNum( listener )
    numero.isVisible = false
end

local function showNum( listener )
    numero.isVisible = true
end

-- open and close menu functions
local function openMenu()
    transition.to( menuGroup, { time = 1200, x = menuBG.x + 300 } )
    -- transition.to( menuBlur, { time = 1000, alpha = 0.2 } ) alpha transition not working...
    transition.to( menuBlur, { time = 1, x = menuBlur.x + 340 } )

    timer.performWithDelay( 700, hideNum )
end

local function closeMenu()
    transition.to( menuGroup, { time = 1200, x = menuBG.x - 300 } )
    -- transition.to( menuBlur, { time = 1000, alpha = 0 } ) alpha transition not working...
    transition.to( menuBlur, { time = 1, x = menuBlur.x - 340 } )
    timer.performWithDelay( 500, showNum )
end

-- toggle menu and check wether to open or close menu
local function toggleMenu()
    if menuOpen == true then
        closeMenu()
        menuOpen = false
    elseif menuOpen == false then
        openMenu()
        menuOpen = true
    end
end

-- menu hamburger button options
local hambBtnOpt = {
    x = 30,
    y = 0,
    width = 40,
    height = 30,
    onRelease = toggleMenu,
    shape = "rectangle"
}
local hamburgerBtn = widget.newButton( hambBtnOpt )