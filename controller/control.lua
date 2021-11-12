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
        -- spawn new pipe pair 
        pipeFactory:spawn()
        -- reset spawnTimer
        spawnTimer = 0
    end

    -- bird drop due to gravity
    bird:drop(dt)

    -- update the swaned pipes scrolls
    
    pipeFactory:update(dt)
    
end

-- control all interaction and changes to the displayed views

function love.keypressed(key)
    -- sent the key to bird for inspection:
    bird:control(key)
    if key == 'escape' then
        love.event.quit()
    end
end