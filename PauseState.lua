PauseState = Class{__includes = BaseState}


function PauseState:render()
	love.graphics.print('Pause', 600, 70, nil, 1.5)
	love.graphics.rectangle('line', 440, 180, VIRTUAL_WIDTH, 100)
	love.graphics.printf(
		'Press "R" Restart Game',
		450,
		205,
		VIRTUAL_WIDTH,
		'center')

	love.graphics.rectangle('line', 440, 380, VIRTUAL_WIDTH, 100)
	love.graphics.printf(
		'Press "M" Menu',
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
	elseif love.keyboard.isDown('m') then
		stateMachine:change('start')
	elseif love.keyboard.isDown('e') then
		love.event.quit()
	end
end

