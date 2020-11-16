local composer = require ("composer")
local scene = composer.newScene( curios )

local math = require ("math")

local sentences = require ("sentences.sql")

local rm = math.random( 4 )

local sentence = display.newText( "Trivia!", 100, 100, 40 )

local function picking()
    if rm = 1 then
        sentence.text = ..
    end
    if rm = 2 then
        sentence.text = ..
    end
    if rm = 3 then
        sentence.text = ..
    end
    if rm = 4 then
        sentence.text = ..
    end
end

local sentBtn = widget.newButton( )

local function onSentRel( listener )
    if press = true then
        picking()
    elseif
        picking() = false
    end
end