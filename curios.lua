local composer = require ("composer")
local scene = composer.newScene( curios )

local sqlite3 = require ( "sqlite3")

local math = require ("math")

local sentences = require ("sentences.sql")

local rm = math.random( 4 )

local sentence = display.newText( "Trivia!", 100, 100, 40 )

local path = system.pathForFile( "sentences.sql", system.DocumentsDirectory )
local db = sqlite3.open( path ) 

local s1 = [[SELECT sentence FROM sentences
    WHERE id = 1]]

local s2 = [[SELECT sentence FROM sentences
    WHERE id = 2]]

local s3 = [[SELECT sentence FROM sentences
    WHERE id = 3]]

local function picking()
    if rm = 1 then
        sentence.text = s1
    end
    if rm = 2 then
        sentence.text = s2
    end
    if rm = 3 then
        sentence.text = s3
    end
    if rm = 4 then
        sentence.text = s4
    end
end

local sentBtn = widget.newButton( )

local function onSentRel( listener )
    if press = true then
        picking()
    else
        print8 "something went wrong... dang it!"
    end
end