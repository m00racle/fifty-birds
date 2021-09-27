-- control all interaction and changes to the displayed views

function love.keypressed(key)
    -- sent the key to bird for inspection:
    bird:control(key)
    if key == 'escape' then
        love.event.quit()
    end
end