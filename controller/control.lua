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

-- mouse control 
function love.mousepressed( x, y, button, istouch, presses )
    -- if the key is integer 1, 2, or 3 means this is input from mouse
    -- while keyboard uses strings to recognize keys such as '1' , 'space'. 'enter'
    gameState:control(button)
end