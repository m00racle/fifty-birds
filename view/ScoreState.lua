--[[ 
    ScoreState Class

    A simple state used to display the player's score when the bird hit the pipe or hit the ground
 ]]

 ScoreState = Class{__includes = BaseState}

 function ScoreState:enter(params)
    -- get the score from the play state when the score state is called
    self.score = params.score
 end

 function ScoreState:render()
    -- render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oops! You Lost!', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')

    love.graphics.printf('Press Enter to Play Again!', 0, 160, VIRTUAL_WIDTH, 'center')
    love.graphics.printf('Press Esc to Exit!', 0, 180, VIRTUAL_WIDTH, 'center')
 end

 function ScoreState:control(key)
    if key == 'enter' or key == 'return' then
        gameState:change('countdown')
    end
 end
