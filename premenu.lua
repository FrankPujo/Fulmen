local composer = require ("composer")
local scene = composer.newScene( premenu )

local startBtn = widget.newButton(
    {
        left = 100,
        top = 200,
        onRelease = onStartRel
    }
)

local circle1 = display.newCircle( 75, 75 )
circle1.stroke = 3
circle:setStrokeColor( 0.1, 0.2, 0.8 )
circle.radius = 1

transition.to( circle1, { time = 2500, radius = 200, easing = "linear" } )
    
return scene