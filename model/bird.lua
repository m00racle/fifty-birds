-- Class Bird 

-- constant value for gravity
GRAVITY = 20
Bird = Class{
    init = function(self, birdImage, posX, posY)
        -- init variables
        self.image = birdImage
        self.width = self.image:getWidth()
        self.height = self.image:getHeight()
        self.posX = posX
        self.posY = posY
        self.dy = 0
    end
}

function Bird:render()
    -- render the bird
    love.graphics.draw(self.image, self.posX - self.width/2, self.posY - self.height/2)
end

function Bird:drop(dt)
    -- model the effect of gravity on bird
    self.dy = self.dy + GRAVITY * dt

    -- apply current gravity accel to y position
    self.posY = self.posY + self.dy
end
