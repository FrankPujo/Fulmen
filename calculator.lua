local compoaer = require ("composer")

composer.newScene( calculator )

local field = native.newTextField( )
field.inputType( "decimal" )

local number = field.userInput

local function nerdsOn()
    if nerdsOnRel  = true then
        c = 343.08
    end
end

local function milsOn()
    if mileOnRel = true then
        c = 214
    end
end

function scene:create( event )
	local sceneGroup = self.view

	local background = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
	background:setFillColor( 0.05, 0.15, 0.8 )
	
	local title = display.newText( "Fulmen Calculator", display.contentCenterX, 50 )
	title:setFillColor( 0.9, 0.8, 0 )
    title.size = 34
    
    local inputBox = display.newTextField ( 100, 100, 80, 50 )
    inputBox:addEventListener( "userInput", textListener )
    inputBox.align = center
    inputBox.inputType = "decimal"
    
    local value = tonumber inputBox.input
    
    local c = 343.
    
    local number = value * c
    
    local result = display.newTextBox( number, 30, 30 )

	sceneGroup:insert( background )
	sceneGroup:insert( title )
    sceneGroup:insert( result )
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