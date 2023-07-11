SettingsState = Class{__includes = BaseState}

function SettingsState:render()
    color = {love.math.random(), love.math.random(), love.math.random()}

    love.graphics.print("Change Color", 450, 50, 0, 2)
    love.graphics.print("Press The Keys If You Want:", 450, 150, 0, 0.7)
    love.graphics.print("R - Red", 450, 200, 0, 0.5)
    love.graphics.print("Y - Yellow", 450, 250, 0, 0.5)
    love.graphics.print("W - White", 450, 300, 0, 0.5)

    love.graphics.rectangle('line', 400, 30, 620, 420)

    love.graphics.printf(
        'If You Want Back Menu Press - "Backspace"',
        450,
        470,
        VIRTUAL_WIDTH,
        'center')	

    if love.keyboard.isDown('backspace') then
		stateMachine:change('start')
    elseif love.keyboard.isDown('r') then
        love.graphics.setColor(200, 0, 0)
    elseif love.keyboard.isDown('y') then
        love.graphics.setColor(255, 255, 0)
    elseif love.keyboard.isDown('w') then
        love.graphics.setColor(255, 255, 255)
	end

end