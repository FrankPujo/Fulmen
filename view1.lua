local composer = require( "composer" )
local scene = composer.newScene()
local widget = require "widget"

function scene:create( event )
	local sceneGroup = self.view
	
	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

display.setDefault( "background", 0.1, 0.2, 0.8)


local numero
local result

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
numero:addEventListener( "userInput", textListener )
numero.inputType = "decimal"

result = display.newText( "How many seconds?", display.contentCenterX, 320, native.SystemFont)
result:setFillColor(180, 180, 0)
result.size = 32

local logo = display.newImageRect( "img/fulmenLogo1.png", 60, 60)
logo.x = 290
logo.y = -14

	
	-- all objects must be added to group (e.g. self.view)
    sceneGroup:insert( numero )
    sceneGroup:insert( result )
    sceneGroup:insert( logo )
    
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene