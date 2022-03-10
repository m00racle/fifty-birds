--[[ 
    TitleState is the class define the state machine for Title Screen

    In this part we will keep it simple just enter to start playing for now. 

    The main ogbjective is to separate updates in different states
 ]]

 -- implementing super class 
TitleState = Class{__includes = BaseState}

function TitleState:control(key)
    if key == 'enter' or key == 'return' then
        gameState:change('play')
    end
end

function TitleState:render()
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Fifty Bird', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Press Enter', 0, 100, VIRTUAL_WIDTH, 'center')
end
