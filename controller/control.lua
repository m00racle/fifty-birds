-- control all interaction and changes to the displayed views

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end