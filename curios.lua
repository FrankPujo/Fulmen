local composer = require ("composer")
local scene = composer.newScene( curios )

local sqlite3 = require ( "sqlite3")
local math = require ("math")

local rm = math.random( 13 )

local sentence = display.newText( "Trivia!", 100, 100, 40 )

local path = system.pathForFile( "sentences.sql", system.DocumentsDirectory )
local db = sqlite3.open( path ) 

local s1 = [[SELECT sentence FROM sentences WHERE id = 1]]
local s2 = [[SELECT sentence FROM sentences WHERE id = 2]]
local s3 = [[SELECT sentence FROM sentences WHERE id = 3]]
local s4 = [[SELECT sentence FROM sentences WHERE id = 4]]
local s5 = [[SELECT sentence FROM sentences WHERE id = 5]]
local s6 = [[SELECT sentence FROM sentences WHERE id = 6]]
local s7 = [[SELECT sentence FROM sentences WHERE id = 7]]
local s8 = [[SELECT sentence FROM sentences WHERE id = 8]]
local s9 = [[SELECT sentence FROM sentences WHERE id = 9]]
local s10 = [[SELECT sentence FROM sentences WHERE id = 10]]
local s11 = [[SELECT sentence FROM sentences WHERE id = 11]]
local s12 = [[SELECT sentence FROM sentences WHERE id = 12]]
local s13 = [[SELECT sentence FROM sentences WHERE id = 13]]

local function picking( listener )
    timer.performWithDelay( 500 )
    if rm = 1 then
        sentence.text = s1
    elseif rm = 2 then
        sentence.text = s2
    elseif rm = 3 then
        sentence.text = s3
    elseif rm = 4 then
        sentence.text = s4
    elseif rm = 5 then
        sentence.text = s5
    elseif rm = 6 then
        sentence.text = s6
    elseif rm = 7 then
        sentnce.text = s7
    elseif rm = 8 then
        sentence,text = s8
    elseif rm = 9 then
        sentence.text = s9
    elseif rm = 10 then
        sentence.text = s10
    elseif rm = 11 then
        sentence.text = s11
    elseif rm = 12 then
        sentence.text = s12
    elseif rm = 13 then
        sentence.text = s13
    end
end

local sentBtn = widget.newButton( 
    {
        x = 100,
        y = 100,
        onRelease = picking
    }
)