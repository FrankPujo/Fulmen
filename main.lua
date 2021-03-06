-----------------------------
----------FrankPujo----------
---------MIT License---------
-----------v0.1.0------------
-----------------------------

local widget = require "widget"
local display = require "display"
local composer = require "composer"

--

local screenOffset = 320
local visualizedPage = 1

display.setStatusBar( display.HiddenStatusBar )

display.setDefault( "background", 0.1, 0.2, 0.8 )

local numero
local result
local titleBase = display.newLine( 10, 25, 310, 25 )
titleBase:setStrokeColor( 0.7, 0.8, 1 )

local function textListener( event )
    if ( event.phase == "ended" or event.phase == "submitted") then
        local num1 = tonumber( numero.text )
        if (num1) then
            result.text = num1 * 343.1 .. " m"
            result.size = 50
        end
    end
end

numero = native.newTextField( display.contentCenterX, 150, 170, 45 )
numero:addEventListener( "userInput", textListener )
numero.inputType = "decimal"

result = display.newText( "How many seconds?", display.contentCenterX, 320, native.SystemFont )
result:setFillColor( 180, 180, 0) 
result.size = 32

local title = display.newText( "Fulmen", display.contentCenterX, 0, native.SystemFontBold )
title.size = 40

local firstPageGroup = display.newGroup()
firstPageGroup:insert( result )
firstPageGroup:insert( numero )

local triviaBtn = display.newRect( 480, display.contentCenterY, 60, 40 )

local secondPageGroup = display.newGroup()
secondPageGroup:insert( triviaBtn )

function moveLeft( listener )
    transition.to( firstPageGroup, { time = 3000, x = firstPageGroup.x - screenOffset, transition = easing.outQuint } )
    transition.to( secondPageGroup, { time = 3000, x = secondPageGroup.x - screenOffset, transition = easing.outQuint } )
end

local goBtnOpt = {
    x = display.contentCenterX,
    y = 400,
    width = 40,
    height = 40,
    onRelease = moveLeft,
    shape = "rectangle"
}
local goBtn = widget.newButton( goBtnOpt )

-- menu functions, menu and stuff ----------------------------------------------------------------------------------------------------
local menuOpen = false

local menuBlur = display.newRect( -70, display.contentCenterY, 140, 580 )
menuBlur:setFillColor( 0.1, 0.1, 0.1, 0.2 )
local menuBG = display.newRect( -101, display.contentCenterY, 200, 580 )
menuBG.strokeWidth = 1
menuBG:setStrokeColor( 0.7, 0.8, 1 )
menuBG:setFillColor( 0.1, 0.2, 0.8 )

local menuGroup = display.newGroup()
menuGroup:insert( menuBG )
menuGroup:insert( menuBlur )

local function openMenu()
    transition.to( menuBG, { time = 1000, x = menuBG.x + 200 } )
    transition.to( menuBlur, { time = 1, x = menuBlur.x + 340 } )
end

local function closeMenu()
    transition.to( menuBG, { time = 1000, x = menuBG.x - 200 } )
    transition.to( menuBlur, { time = 1, x = menuBlur.x - 340 } )
end

local function toggleMenu()
    if menuOpen == true then
        closeMenu()
        menuOpen = false
    elseif menuOpen == false then
        openMenu()
        menuOpen = true
    end
end

local hambBtnOpt = {
    x = 20,
    y = 0,
    width = 40,
    height = 30,
    onRelease = toggleMenu,
    shape = "rectangle"
}
local hamburgerBtn = widget.newButton( hambBtnOpt )