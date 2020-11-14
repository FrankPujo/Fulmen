--[[
    loadingScreen.lua
    a loading screen to implement in your main.lua file
    ]]
    
local composer = require ("composer")
--this code makes use of the composer library of Solar2D Game Engine

local function startApp()
    if {
        composer.getScene( view1 ) ~= nil
        --if the file containing the scene equals to nil then it is not loaded
        --when all the scenes will be loaded they will differ from nil
        composer.getScene( view2 ) ~= nil
        composer.getScene( menu ) ~= nil
        --[[
            these sample scenes are called view1 view2 and menu
            they are called by view1.lua view2.lua and menu.lua
            you can create new scenes and modify the old ones
        ]]
    } then
        composer.gotoScene( menu )
        --in this case the menu scene is the first to appear on screen after the loading is completedend
    end
end

local screen = display.newRect( 180, 240, 360, 480 )
screen:setFillColor( 0, 0.2, 0.9 )
--show a blue background during the loading of the app