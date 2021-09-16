-- Class Bird 

Bird = Class{
    init = function(self, birdImage, posX, posY)
        -- init variables
        self.image = birdImage
        self.width = self.image:getWidth()
        self.height = self.image:getHeight()
        self.posX = posX
        self.posY = posY
    end
}

function Bird:render()
    -- render the bird
    love.graphics.draw(self.image, self.posX - self.width/2, self.posY - self.height/2)
end
