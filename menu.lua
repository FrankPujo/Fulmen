local composer = require ("composer")
local scene = composer.newScene( menu )

function scene:create( event )
    local sceneGroup = self.view
    
    local calculatorBtn = widget.newButton( 
        {
            onRelease = gotoCalculator
        }
    )
    
    local curiosBtn = widget.newButton(
        {
            onRelease = gotoCurios
        }
    )
    
    local function gotoCalculator()
        composer.gotoScene( calculator )
    end
    
    local function gotoCurios()
        composer.gotoScene( curios )
    end
    
    sceneGroup:insert( calculatorBtn )
    sceneGroup:insert( curiosBtn )
end

return scene