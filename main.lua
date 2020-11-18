local composer = require ( "composer" )

local menu = composer.getScene( menu )
local calculator = composer.getScene( calculator )
local curios = composer.getScen( curios )
local premenu = composer.getScene( premenu )

local function startApp()
    if {
        menu ~= nil
        calculator ~= nil
        curios ~= nil
        premenu ~= nil
        } then
        composer.gotoScene( premenu )
    end
end