-----------------------------
----------FrankPujo----------
---------MIT License---------
-----------v1.0.0------------
-----------------------------

local widget = require "widget"
local display = require "display"
local composer = require "composer"

local sentences = {
    "Don't cover under trees!",
    "Zeus is the thunder's god for Ancient Greeks.",
    "Lighing are... strong!"
}

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
local sentence

local function runTrivia( listener )
    local sentencesNum = 3
    local randNumber = math.random( sentencesNum )
    sentence.text = sentences[randNumber]
end

local triviaBtnOpt = {
    x = display.contentCenterX + screenOffset,
    y = display.contentCenterY,
    width = 60,
    height = 40,
    onRelease = runTrivia,
    shape = "rectangle"
}

local triviaBtn = widget.newButton( triviaBtnOpt )
sentence = display.newText( "Trivia!", 480, 200, native.SystemFont )
sentence.size = 30

-- create a group for all the second page elements
local secondPageGroup = display.newGroup()
secondPageGroup:insert( triviaBtn )
secondPageGroup:insert( sentence )

-- page indicator circles
local c1 = display.newCircle( display.contentCenterX - 20, 480, 8 )
local c2 = display.newCircle( display.contentCenterX, 480, 5 )
local c3 = display.newCircle( display.contentCenterX + 20, 480, 5 )

local function f1t2()
    -- circle 1 to 2
end

local function f2t3()
    -- circle 2 to 3
end

local function f3t2()
    -- circle 3 to 2
end

local function f2t1()
    -- circle 2 to 1
end

-- function to move right between the pages
function moveRight( listener )
    if visualizedPage == 1 then
        transition.to( c1, { time = 200, radius = 5 } )
        transition.to( c2, { time = 200, radius = 8 } )
    end

    if visualizedPage  == 3 then
        print( "trying to go too right!" )
    else
        transition.to( firstPageGroup, { time = 1600, x = firstPageGroup.x - screenOffset, transition = easing.outQuart } )
        transition.to( secondPageGroup, { time = 1600, x = secondPageGroup.x - screenOffset, transition = easing.outQuart } )
        visualizedPage = visualizedPage + 1
        print( visualizedPage )
    end
end

-- function to move left between the pages
function moveLeft( listener )
    if visualizedPage == 1 then
        print( "trying to go too left!" )
    else
        transition.to( firstPageGroup, { time = 1600, x = firstPageGroup.x + screenOffset, transition = easing.outQuart } )
        transition.to( secondPageGroup, { time = 1600, x = secondPageGroup.x + screenOffset, transition = easing.outQuart } )
        visualizedPage = visualizedPage - 1
        print( visualizedPage )
    end
end

-- button to move right
local goRBtnOpt = {
    x = display.contentCenterX + 80,
    y = 480,
    width = 150,
    height = 80,
    onRelease = moveRight,
    shape = "rectangle",
}
local goRBtn = widget.newButton( goRBtnOpt )
goRBtn:setFillColor( 1, 1, 1, 0.2 )

-- button to move left 
local goLBtnOpt = {
    x = display.contentCenterX - 80,
    y = 480,
    width = 150,
    height = 80,
    onRelease = moveLeft,
    shape = "rectangle"
}
local goLBtn = widget.newButton( goLBtnOpt )
goLBtn:setFillColor( 1, 1, 1, 0.2 )

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

local function blurOn( listener )
    transition.to( menuBlur, { time = 10, x = menuBlur.x + 340 } )
end

-- open and close menu functions
local function openMenu()
    transition.to( menuGroup, { time = 800, x = menuBG.x + 300, transition = easing.outQuart } )
    -- transition.to( menuBlur, { time = 1000, alpha = 0.2 } ) alpha transition not working...
    timer.performWithDelay( 400, blurOn )
    timer.performWithDelay( 150, hideNum )
end

local function closeMenu()
    transition.to( menuGroup, { time = 800, x = menuBG.x - 300, transition = easing.outCubic } )
    -- transition.to( menuBlur, { time = 1000, alpha = 0 } ) alpha transition not working...
    transition.to( menuBlur, { time = 100, x = menuBlur.x - 340 } )
    timer.performWithDelay( 200, showNum )
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