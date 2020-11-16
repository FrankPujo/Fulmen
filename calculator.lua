local compoaer = require ("composer")

composer.createNewScene( calculator )

local field = native.newTextField( )
field.inputType( "decimal" )

local number = field.userInput