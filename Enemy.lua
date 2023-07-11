Enemy = Class{__includes = BaseState}

function Enemy:init()
	enemy = {
		x = love.math.random(1286),
		y = love.math.random(690),

		width = love.math.random(30, 100),
		height = love.math.random(30, 100)
	}
end


	
function Enemy:render()
	love.graphics.rectangle('fill', enemy.x, enemy.y, enemy.height, enemy.width)
end

