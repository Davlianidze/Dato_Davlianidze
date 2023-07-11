PlayState = Class{__includes = BaseState}
require 'Game'
require 'Enemy'

function PlayState:init()
	Game:init()
end

function PlayState:update(dt)
	Game:update(dt)
end
	
function PlayState:render()
	love.graphics.print('Pause', 1230, 10)

	if love.keyboard.isDown('p') then
		stateMachine:change('pause')
	end

	Game:render()
	
end


