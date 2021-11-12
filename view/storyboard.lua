-- set all views settings
-- SET THE WINDOWS RESOLUTION AND SIZES
WINDOW_HEIGHT = 720
WINDOW_WIDTH = 1280

VIRTUAL_HEIGHT = 288
VIRTUAL_WIDTH = 512


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

    -- initialize PipeFactory
    pipeFactory = PipeFactory(pipePng, VIRTUAL_HEIGHT, VIRTUAL_WIDTH)
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
    pipeFactory:render()
    
    love.graphics.draw(ground, -groundScroll, VIRTUAL_HEIGHT - 16)
    bird:render()

    push:finish()
end


