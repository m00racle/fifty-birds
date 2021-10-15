-- prepare the local variable 
local SCROLL_SPEED = -60

Pipe = Class{
    init = function(self, pipeImage, posX, posY, rot)
        -- init variables
        self.image = pipeImage
        self.width = self.image:getWidth()
        self.x = posX
        -- pos Y should be random between TO DO: find the optimum bottom limit!! the current makes the pipe lips sunk
        self.y = posY
        self.r = rot 
    end
}

function Pipe:render()
    -- render the pipe to the display
    love.graphics.draw(self.image, self.x, self.y, self.r)
end

function Pipe:update(dt)
    -- pipe movement during the frame
    self.x = self.x + SCROLL_SPEED * dt
end