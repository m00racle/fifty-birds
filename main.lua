-- add libraries
push = require 'push'
class = require 'class'

-- add assets resources
background = love.graphics.newImage('res/background.png')
ground = love.graphics.newImage('res/ground.png')

-- add modules
require 'view.storyboard'
require 'controller.control'
