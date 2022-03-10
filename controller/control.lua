-- updates and controls to update the game state


function love.update(dt)
    gameState:update(dt)
end

-- control all interaction and changes to the displayed views

function love.keypressed(key)
    
    if key == 'escape' then
        love.event.quit()
    end
    gameState:control(key)
end