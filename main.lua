local composer = require ( "composer" )
composer.gotoScene( menu )

local function startApp()
    if {
        composer.getScene( menu ) ~= nil
        composer.getScene( calculator ) ~= nil
        composer.getScene( curios ) ~= nil
        composer.getScene( premenu ) ~= nil
    } then
        composer.gotoScene( premenu )
    end
end