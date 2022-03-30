-- add libraries
push = require 'libs.push'
Class = require 'libs.class'

-- add assets resources
background = love.graphics.newImage('res/background.png')
ground = love.graphics.newImage('res/ground.png')
birdPng = love.graphics.newImage('res/bird.png')
pipePng = love.graphics.newImage('res/pipe.png')

-- load settings
-- set all views settings
-- SET THE WINDOWS RESOLUTION AND SIZES
WINDOW_HEIGHT = 720
WINDOW_WIDTH = 1280

VIRTUAL_HEIGHT = 288
VIRTUAL_WIDTH = 512

-- add modules
require 'view.storyboard'
require 'controller.control'
require 'model.Pipe'
require 'model.PipeFactory'
require 'model.bird'
require 'libs.StateMachine'
require 'view.BaseState'
require 'view.TitleState'
require 'view.CountdownState'
require 'view.PlayState'
require 'view.ScoreState'


function love.load()
    -- loading game assets once
    love.graphics.setDefaultFilter('nearest', 'nearest')

    -- init retro text
    smallFont = love.graphics.newFont('res/font.ttf', 8)
    mediumFont = love.graphics.newFont('res/flappy.ttf', 14)
    flappyFont = love.graphics.newFont('res/flappy.ttf', 28)
    hugeFont = love.graphics.newFont('res/flappy.ttf', 56)
    love.graphics.setFont(flappyFont)

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT,{fullscreen=false, vsync=true, resizable= true})

    love.window.setTitle('Fifty Bird')

    -- init audio table
    sounds = {
        ['jump'] = love.audio.newSource('res/jump.wav', 'static'),
        ['explosion'] = love.audio.newSource('res/explosion.wav', 'static'),
        ['hurt'] = love.audio.newSource('res/hurt.wav', 'static'),
        ['score'] = love.audio.newSource('res/score.wav', 'static'),
        ['thick'] = love.audio.newSource('res/thick.wav', 'static'),
        ['music'] = love.audio.newSource('res/marios_way.mp3', 'static')
    }

    -- kick off play BGM
    -- BGM must loop all the way the app is running not just in play state.
    sounds['music']:setLooping(true)
    sounds['music']:play()

    -- initial locations for background and ground
    backgroundScroll = 0
    groundScroll = 0
    
    -- init statemachines
    gameState = StateMachine {
        ['title'] = function() return TitleState() end,
        ['countdown'] = function() return CountdownState() end,
        ['play'] = function() return PlayState() end,
        ['score'] = function() return ScoreState() end
    }
    -- start with title state
    gameState:change('title')

end

function love.resize(w,h)
    -- handle resizing on the app's windows
    push:resize(w,h)
end