--[[ 
    Play state 

    All game parameters mostly will be drag here.
 ]]

 PlayState = Class{__includes = BaseState}

 -- constant for the background and ground 
BACKGROUND_SCROLL_SPEED = 103
LOOP_BACKGROUND = 413
GROUND_SCROLL_SPEED = 150
LOOP_GROUND = 1100 - VIRTUAL_WIDTH

-- timer for pipe spawn
-- local self.spawnTimer = 0

 function PlayState:init()
    -- initialize bird
    self.bird = Bird(birdPng, VIRTUAL_WIDTH/2, VIRTUAL_HEIGHT/2, VIRTUAL_HEIGHT)

    -- initialize PipeFactory
    self.pipeFactory = PipeFactory(pipePng, VIRTUAL_HEIGHT, VIRTUAL_WIDTH)

    -- initialize score
    self.score = 0

    -- init spawn timer
    self.spawnTimer = 0
    -- TODO add the ability to add score each time the bird pass a pair of pipes.
 end

 function PlayState:update(dt)
    if (not self.bird:isCrashing() and not self.pipeFactory:pipeIsHitBy(self.bird)) then
        -- scroll background
        if (backgroundScroll < LOOP_BACKGROUND) then
            backgroundScroll = (backgroundScroll + BACKGROUND_SCROLL_SPEED * dt)
        else
            backgroundScroll = 0
        end
        -- scroll ground
        if (groundScroll < LOOP_GROUND) then
            groundScroll = (groundScroll + GROUND_SCROLL_SPEED * dt)
        else
            groundScroll = 0
        end
        -- spawn pipes in interval time
        self.spawnTimer = self.spawnTimer + dt
        if self.spawnTimer > 2 then
            -- spawn new pipe pair 
            self.pipeFactory:spawn()
            -- reset self.spawnTimer
            self.spawnTimer = 0
        end

        -- bird drop due to gravity
        self.bird:drop(dt)

        -- update the swaned pipes scrolls
        
        self.pipeFactory:update(dt)
    else
        -- this is where transition to score 
        gameState:change('score', {
            score = self.score
        })
    end
 end

 function PlayState:control(key)
    self.bird:control(key)
 end

 function PlayState:render()
    -- background
    love.graphics.draw(background, -backgroundScroll, 0)
    -- render pipes before the ground to ensure the ground rendered above the pipe
    self.pipeFactory:render()
    
    love.graphics.draw(ground, -groundScroll, VIRTUAL_HEIGHT - 16)
    self.bird:render()
 end
