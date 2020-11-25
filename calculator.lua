local compoaer = require ("composer")

composer.newScene( calculator )

local inputBox = native.newTextField( )
field.inputType( "decimal" )

local number = inputBox.userInput

local function nerdsOn()
    if nerdsBtn.selected = true then
        c = 343.08
    end
end

local function milesOn()
    if mileBtn.selected = true then
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
        
    local value = tonumber( inputBox.input )
    
    local c = 343.
    
    local number = value * c
    
    local result = display.newTextBox( number, 30, 30 )
    
    local sideMenuBtn = widget.newButton( smbOpt )
    local smbOpt = {
        
    }
    
    local nerdsBtn = widget.newButton( nbOpt )
    local nbOpt = {
        
    }
    
    local milesBtn = widget.newButton ( mbOpt )
    local mbOpt = {
        
    }
    
    local function onSideRel
        transition.to( sideMenu, { sideMenu.x = sideMenu.x + 30, easing = "inOutCubic" } )
        transition.to( nerdsBtn, { nerdsBtn.x = nerdsBtn.x + 30, easing = "inOutCubic" }
        transition.to( milesBtn, { milesBtn.x = milesBtn.x + 30, easing = "inOutCubic" } )
    end

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