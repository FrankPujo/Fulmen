local compoaer = require ("composer")

composer.createNewScene( calculator )

local field = native.newTextField( )
field.inputType( "decimal" )

local number = field.userInput

function scene:create( event )
	local sceneGroup = self.view

	local background = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
	background:setFillColor( 0.05, 0.15, 0.8 )	-- numbers form 0 to 1 ( 0 red, 0.2 green, 1 blue)
	
	local title = display.newText( "Fulmen Calculator", display.contentCenterX, 50 )
	title:setFillColor( 0.9, 0.8, 0 )
    title.size = 34
    
    local inputBox = display.newTexField ( 100, 100, 80, 50 )
    inputBox:addEventListener( "userInput", textListener )
    inputBox.align = center
    inputBox.inputType = "decimal"

	sceneGroup:insert( background )
	sceneGroup:insert( title )
end

function scene:show( event )
    local sceneGroup = self.view
    
    inputBox.isVisible = true
    
end

function scene:hide( event )
    local sceneGroup = self.view
    
    inputBox.isVisible = false
    
end

return scene