-- updates and controls to update the game state
-- constants
-- constant for the background and ground 
BACKGROUND_SCROLL_SPEED = 103
LOOP_BACKGROUND = 413
GROUND_SCROLL_SPEED = 150
LOOP_GROUND = 1100 - VIRTUAL_WIDTH

-- timer for pipe spawn
local spawnTimer = 0

function love.update(dt)
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
    spawnTimer = spawnTimer + dt
    if spawnTimer > 2 then
        -- spawn new pipe pair and put it into the pipes table
        -- table.insert(pipes, Pipe(pipePng, VIRTUAL_WIDTH, VIRTUAL_HEIGHT))
        pipeFactory:spawn()
        -- reset spawnTimer
        spawnTimer = 0
    end

    -- bird drop due to gravity
    bird:drop(dt)

    -- update the swaned pipes scrolls
    
    -- for i, pipe in pairs(pipes) do 
    --     pipe:update(dt)
        
    -- end
    pipeFactory:update(dt)
    
    -- now for test removing pipes in safer way
    -- this is because update loop and removing loop done in different loop
    -- this should prevent suttering when pipes are removed
    -- for i, pipe in pairs(pipes) do
    --     -- when pipe reach the left side of display delete it to save memory
    --     if pipe.remove then
    --         table.remove(pipes, i)
    --     end
    -- end
end

-- control all interaction and changes to the displayed views

function love.keypressed(key)
    -- sent the key to bird for inspection:
    bird:control(key)
    if key == 'escape' then
        love.event.quit()
    end
end