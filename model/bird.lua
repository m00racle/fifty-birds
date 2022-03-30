-- Class Bird 

-- constant value for gravity
local GRAVITY = 20
Bird = Class{
    init = function(self, birdImage, posX, posY, maxHeight)
        -- init variables
        self.image = birdImage
        self.width = self.image:getWidth()
        self.height = self.image:getHeight()
        self.posX = posX
        self.posY = posY
        self.maxHeight = maxHeight
        self.dy = 0
        self.hopKey = 'space'
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

function Bird:jump()
    -- hop decreasing the effect of gravity
    self.dy = -5
    sounds['jump']:play()
end

function Bird:control(key)
    -- inspect the key if it is verified in settings
    if key == self.hopKey then
        self:jump()
    end
end

function Bird:isCrashing()
    -- inspect whether the bird leaving the game screen
    -- both upper or hitting the ground will considered as crash
    if self.posY < 0 or (self.posY + self.height/2) > self.maxHeight then
        sounds['hurt']:play()
        sounds['explosion']:play()
        return true
    end
    return false
end