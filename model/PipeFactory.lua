PipeFactory = Class{
    init = function(self, pipeImage, maxHeight, gapHeight, startPos)
        -- init variiables
        self.image = pipeImage
        self.pipeWidth = self.image:getWidth
        self.pipeHeight = self.image:getHeight
        self.x = startPos
        -- initiate the y random engine
        self.lastY = 0
        self.virtualHeight = maxHeight
        self.gapHeight = gapHeight
        self.pipeTable = {}
    end
}

function PipeFactory:spawn()
    -- spawn new pipe pairs in the table
    -- decide the self.y random start position
    self.y = math.max(-pipeHeight + 10, math.min(self.lastY + math.random(-20, 20), self.virtualHeight - self.gapHeight - self.pipeHeight))
    -- now we inititate the top and bottom pipe for the pipeTable.
end

function PipeFactory:update(dt)
    -- update the movement of the pipe pair
end

function PipeFactory:setGapHeight(gapHeight)
    -- change the initial gap height
    self.gapHeight = gapHeight
end

function PipeFactory:render()
    -- render the pipe pairs
end
