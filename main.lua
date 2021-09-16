-- add libraries
push = require 'libs.push'
Class = require 'libs.class'

-- add assets resources
background = love.graphics.newImage('res/background.png')
ground = love.graphics.newImage('res/ground.png')
birdPng = love.graphics.newImage('res/bird.png')

-- add modules
require 'view.storyboard'
require 'controller.control'
require 'model.bird'