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
end

function love.resize(w,h)
    -- handle resizing on the app's windows
    push:resize(w,h)
end

function love.draw()
    -- draw the screen
    push:start()
    
    -- background
    love.graphics.draw(background, 0, 0)
    love.graphics.draw(ground, 0, VIRTUAL_HEIGHT - 16)

    push:finish()
end
