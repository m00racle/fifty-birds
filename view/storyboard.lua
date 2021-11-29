

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


