PipeFactory = Class{
    init = function(self, pipeImage, maxHeight, gapHeight, startPos, pipeSpeed)
        -- init variiables
        self.image = pipeImage
        self.pipeWidth = self.image:getWidth()
        self.pipeHeight = self.image:getHeight()
        self.x = startPos
        self.pipeSpeed = pipeSpeed or 0
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
    self.pipes = {
        ["upper"] = Pipe(self.pipeImage, self.startPos, "top", self.y)
        ["lower"] = Pipe(self.pipeImagem, self.startPos, "bottom", self.y + self.pipeHeight + self.gapHeight)

        -- TODO CHANGE THE Pipe class to conform with the parameter on this initialization.
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
            table.remove(pipeTable, k)
        end
    end
end

function PipeFactory:setGapHeight(gapHeight)
    -- change the initial gap height
    self.gapHeight = gapHeight
end

function PipeFactory:render()
    -- render the pipe pairs
    -- TODO modify the render of the pipe to accomodate the scale y -1 for the upper pipe
    for k, pair in pairs(self.pipeTable) do
        pair["upper"]:render()
        pair["lower"]:render()
    end
end
