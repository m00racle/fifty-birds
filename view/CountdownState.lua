--[[ 
    CountDown State class

    This only give count down after title screen or score state if want to go to play state
 ]]
 
 local COUNTDOWN_TIME = 0.75 
 -- we set the countdown conversion to 0.75 second

 CountdownState = Class{__includes = BaseState}

 function CountdownState:init()
    self.timer = 0
    self.count = 3
 end

 function CountdownState:update(dt)
    self.timer = self.timer + dt
    if self.timer > COUNTDOWN_TIME then
        -- set self.timer back to 0
       self.timer = self.timer % COUNTDOWN_TIME
       self.count = self.count - 1
       
       if self.count == 0 then
            gameState:change('play') 
       end

    end
 end

 function CountdownState:render()
    love.graphics.setFont(hugeFont)
    love.graphics.printf(tostring(self.count), 0, 120, VIRTUAL_WIDTH, 'center')
 end