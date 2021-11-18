local GAP_HEIGHT = 90
local PIPE_SPEED = 60

PipeFactory = Class{
    init = function(self, pipeImage, maxHeight, startPos, gapHeight, pipeSpeed)
        -- init variiables
        self.image = pipeImage
        self.pipeWidth = self.image:getWidth()
        self.pipeHeight = self.image:getHeight()
        self.x = startPos + self.pipeWidth
        self.pipeSpeed = pipeSpeed or PIPE_SPEED
        -- initiate the y random engine
        self.lastY = -self.pipeHeight + math.random(80) + 20
        self.virtualHeight = maxHeight
        self.gapHeight = gapHeight or GAP_HEIGHT
        self.pipeTable = {}
    end
}

function PipeFactory:spawn()
    -- spawn new pipe pairs in the table
    -- decide the self.y random start position
    self.y = math.max(-self.pipeHeight + 10, math.min(self.lastY + math.random(-20, 20), self.virtualHeight - self.gapHeight - self.pipeHeight))
    self.lastY = self.y 
    -- now we inititate the top and bottom pipe for the pipeTable.
    self.pipes = {
        ["upper"] = Pipe(self.image, self.x, "top", self.y, self.pipeSpeed),
        ["lower"] = Pipe(self.image, self.x, "bottom", self.y + self.pipeHeight + self.gapHeight, self.pipeSpeed)
    }
    table.insert(self.pipeTable, self.pipes)
end

function PipeFactory:update(dt)
    -- update the movement of the pipe pair
    -- update the pairs which has index 
    -- the pairs has the key value table on upper and lower to each pipe
    for k, pair in pairs(self.pipeTable) do
        -- updates required for each pairs
        -- remember the remove property is already available on each pipe
        pair["upper"]:update(dt)
        pair["lower"]:update(dt)
    end
    -- check if the pipes pair ready to removed
    for k, pair in pairs(self.pipeTable) do
        -- check if either pipe is readi to removed
        if pair["upper"].remove or pair["lower"].remove then
            table.remove(self.pipeTable, k)
        end
    end
end

function PipeFactory:setGapHeight(gapHeight)
    -- change the initial gap height
    self.gapHeight = gapHeight
end

function PipeFactory:render()
    -- render the pipe pairs
    for k, pair in pairs(self.pipeTable) do
        pair["upper"]:render()
        pair["lower"]:render()
    end
end

function PipeFactory:pipeIsHitBy(bird)
    -- detect if any of the pipe in the table is hit by the bird
    for k, pair in pairs(self.pipeTable) do
        -- check if the pipe is hit by the bird
        if ((bird.posX) > pair["upper"].x and bird.posX < (pair["upper"].x + pair["upper"].width)) then
            -- test collide
            if bird.posY < (pair["upper"].y + pair["upper"].height) then
                return true
            end
        end
        if ((bird.posX) > pair["lower"].x and bird.posX < (pair["lower"].x + pair["lower"].width)) then
            -- check for collision
            if (bird.posY) > pair["lower"].y then
                return true
            end
        end
    end
    -- otherwise 
    return false
end
