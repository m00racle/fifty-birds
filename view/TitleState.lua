--[[ 
    TitleState is the class define the state machine for Title Screen

    In this part we will keep it simple just enter to start playing for now. 

    The main ogbjective is to separate updates in different states
 ]]

 -- implementing super class 
TitleState = Class{__includes = BaseState}

-- constant for the background and ground 
BACKGROUND_SCROLL_SPEED = 103
LOOP_BACKGROUND = 413
GROUND_SCROLL_SPEED = 150
LOOP_GROUND = 1100 - VIRTUAL_WIDTH

function TitleState:update(dt)
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

function TitleState:control(key)
    if key == 'enter' or key == 'return' then
        gameState:change('play')
    end
end

function TitleState:render()
    -- background
     love.graphics.draw(background, -backgroundScroll, 0)

     -- render ground
     love.graphics.draw(ground, -groundScroll, VIRTUAL_HEIGHT - 16)

     love.graphics.setFont(flappyFont)
    love.graphics.printf('Fifty Bird', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Press Enter', 0, 100, VIRTUAL_WIDTH, 'center')

end