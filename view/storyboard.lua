-- set all views settings
-- SET THE WINDOWS RESOLUTION AND SIZES
WINDOW_HEIGHT = 720
WINDOW_WIDTH = 1280

VIRTUAL_HEIGHT = 288
VIRTUAL_WIDTH = 512

-- constant for the background and ground 
BACKGROUND_SCROLL_SPEED = 103
LOOP_BACKGROUND = 413
GROUND_SCROLL_SPEED = 150
LOOP_GROUND = 1100 - VIRTUAL_WIDTH

-- tables of objects
local pipes = {}

-- timer for pipe spawn
local spawnTimer = 0

function love.load()
    -- loading game assets once
    love.graphics.setDefaultFilter('nearest', 'nearest')

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT,{fullscreen=false, vsync=true, resizable= true})

    love.window.setTitle('Fifty Bird')

    -- initial locations for background and ground
    backgroundScroll = 0
    groundScroll = 0

    -- initialize bird
    bird = Bird(birdPng, VIRTUAL_WIDTH/2, VIRTUAL_HEIGHT/2)
end

function love.resize(w,h)
    -- handle resizing on the app's windows
    push:resize(w,h)
end

function love.draw()
    -- draw the screen
    push:start()
    
    -- background
    love.graphics.draw(background, -backgroundScroll, 0)
    -- render pipes before the ground to ensure the ground rendered above the pipe
    for j, pipe in pairs(pipes) do
        pipe:render()
    end
    
    love.graphics.draw(ground, -groundScroll, VIRTUAL_HEIGHT - 16)
    bird:render()

    push:finish()
end

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
        -- spawn new pipe and put it into the pipes table
        table.insert(pipes, Pipe(pipePng, VIRTUAL_WIDTH, VIRTUAL_HEIGHT))
        -- reset spawnTimer
        spawnTimer = 0
    end

    -- bird drop due to gravity
    bird:drop(dt)

    -- update the swaned pipes scrolls
    for i, pipe in pairs(pipes) do 
        pipe:update(dt)

        -- when pipe reach the left side of display delete it to save memory
        if pipe.x < -pipe.width then
            table.remove(pipes, i)
        end
    end
end

