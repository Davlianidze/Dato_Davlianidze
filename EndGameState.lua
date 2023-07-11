EndGameState = Class{__includes = BaseState}

function EndGameState:render()
    love.graphics.print('You Lost The Battle!', 400, 100, nil, 1.5)
    love.graphics.print('But You Did Not Lose The War!', 300, 200, nil, 1.5)

	love.graphics.rectangle('line', 440, 380, VIRTUAL_WIDTH, 100)
	love.graphics.printf(
		'Press "R" Restart Game',
		450,
		405,
		VIRTUAL_WIDTH,
		'center')


	love.graphics.rectangle('line', 440, 580, VIRTUAL_WIDTH, 100)
	love.graphics.printf(
		'Press "E" Exit',
		450,
		605,
		VIRTUAL_WIDTH,
		'center')


    if love.keyboard.isDown('r') then
        stateMachine:change('play')
    elseif love.keyboard.isDown('e') then
        love.event.quit()
    end   
end
