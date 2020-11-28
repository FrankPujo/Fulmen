local composer = require ( "composer" )

local menu = composer.getScene( menu )
local calculator = composer.getScene( calculator )
local curios = composer.getScene( curios )
local premenu = composer.getScene( premenu )

local function startApp()
    if menu ~= nil and
        calculator ~= nil and
            curios ~= nil and
                premenu ~= nil then
        composer.gotoScene( premenu )
    end
end

local screen = display.newText( "Loading...", 50, 300, 20 )