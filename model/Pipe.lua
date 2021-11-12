-- prepare the local variable 

local PIPE_WIDTH = 70
local PIPE_HEIGHT = 288

Pipe = Class{
    init = function(self, pipeImage, posX, position, posY, pipeSpeed)
        -- init variables
        self.image = pipeImage
        self.width = pipeImage:getWidth()
        self.height = pipeImage:getHeight()
        self.x = posX
        self.position = position
        self.y = posY
        self.pipeSpeed = pipeSpeed 
        -- set the remove property to false.
        self.remove = false
    end
}

function Pipe:render()
    -- render the pipe to the display
    
    love.graphics.draw(self.image, self.x, (self.position == "top" and self.y + self.height or self.y), 0, 1, self.position == "top" and -1 or 1)
end

function Pipe:update(dt)
    -- pipe movement during the frame
    self.x = self.x - self.pipeSpeed * dt
    if self.x < -PIPE_WIDTH then
        self.remove = true
    end
end