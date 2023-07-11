StartState = Class{__includes = BaseState}



function StartState:render()
	love.graphics.rectangle('line', 440, 180, VIRTUAL_WIDTH, 100)
	love.graphics.printf(
		'Press "UP" Play Game',
		450,
		205,
		VIRTUAL_WIDTH,
		'center')

	love.graphics.rectangle('line', 440, 380, VIRTUAL_WIDTH, 100)
	love.graphics.printf(
		'Press "DOWN" Settings',
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

		
		
	
	if love.keyboard.isDown('up') then
		stateMachine:change('play')
	elseif love.keyboard.isDown('down') then
		stateMachine:change('settings')
	elseif love.keyboard.isDown('e') then
		love.event.quit()
	end

end





