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

function love.load()
    -- loading game assets once
    love.graphics.setDefaultFilter('nearest', 'nearest')

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT,{fullscreen=false, vsync=true, resizable= true})

    love.window.setTitle('Fifty Bird')

    -- initial locations for background and ground
    backgroundScroll = 0
    groundScroll = 0
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
    love.graphics.draw(ground, -groundScroll, VIRTUAL_HEIGHT - 16)

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
end

