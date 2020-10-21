local widget = require "widget"
local composer = require "composer"

--

display.setStatusBar( display.HiddenStatusBar )

display.setDefault( "background", 0.1, 0.2, 0.8)

local background = display.newImageRect ("bg1.png", 700, 1120)

local numero
local result
local UIGroup = display.newGroup()

local function textListener( event )
    if ( event.phase == "ended" or event.phase == "submitted") then
        local num1 = tonumber(numero.text)
        if (num1) then
            result.text = num1 * 343.1
            result.size = 60
        end
    end
end

numero = native.newTextField( display.contentCenterX, 150, 170, 45)
UIGroup:insert( numero )
numero:addEventListener( "userInput", textListener )
numero.inputType = "decimal"

result = display.newText( "How many seconds?", display.contentCenterX, 320, native.SystemFont)
UIGroup:insert( result )
result:setFillColor(180, 180, 0)
result.size = 32

local logo = display.newImageRect( "img/fulmenLogo1.png", 60, 60)
logo.x = 290
logo.y = -14