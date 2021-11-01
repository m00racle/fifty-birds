-- prepare the local variable 
local PIPE_SPEED = 60
local PIPE_WIDTH = 70
local PIPE_HEIGHT = 288

Pipe = Class{
    init = function(self, pipeImage, posX, maxY)
        -- init variables
        self.image = pipeImage
        self.width = PIPE_WIDTH
        self.x = posX
        -- pos Y should be random between TO DO: find the optimum bottom limit!! the current makes the pipe lips sunk
        self.y = math.random(maxY / 4, maxY - 20)
        -- set the remove property to false.
        self.remove = false
    end
}

function Pipe:render()
    -- render the pipe to the display
    love.graphics.draw(self.image, self.x, self.y)
end

function Pipe:update(dt)
    -- pipe movement during the frame
    self.x = self.x - PIPE_SPEED * dt
    if self.x < -PIPE_WIDTH then
        self.remove = true
    end
end