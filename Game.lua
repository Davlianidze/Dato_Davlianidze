Game = Class{__includes = BaseState}

local boundaryLeft = 0
local boundaryRight = 1320
local boundaryTop = 0
local boundaryBottom = 720


function Game:init()
	player = {}
	player.x = 110
	player.y = 110

	player.image = love.graphics.newImage('1.png')
	player.width = player.image:getWidth()
	player.height = player.image:getHeight()

	player.speed = 500
	player.direction = 'right'

	finish = {}
	finish.x = 1230
	finish.y = 675
	finish.image = love.graphics.newImage('2.png')
	finish.width = finish.image:getWidth()
	finish.height = finish.image:getHeight()


	wall1 = {}
	wall1.x = 50
	wall1.y = 50
	wall1.width = 50
	wall1.height = 680

	wall2 = {}
	wall2.x = 100
	wall2.y = 50
	wall2.width = 1200
	wall2.height = 50 

	wall3 = {}
	wall3.x = 100
	wall3.y = 680
	wall3.width = 1130
	wall3.height = 50 

	wall4 = {}
	wall4.x = 1300
	wall4.y = 50
	wall4.width = 50
	wall4.height = 680 

	wall5 = {}
	wall5.x = 170
	wall5.y = 100
	wall5.width = 50
	wall5.height = 200 

	wall6 = {}
	wall6.x = 100
	wall6.y = 370
	wall6.width = 240
	wall6.height = 50 
	
	wall7 = {}
	wall7.x = 290
	wall7.y = 170
	wall7.width = 50
	wall7.height = 130

	wall8 = {}
	wall8.x = 340
	wall8.y = 170
	wall8.width = 100
	wall8.height = 50

	wall9 = {}
	wall9.x = 410
	wall9.y = 170
	wall9.width = 50
	wall9.height = 440

	wall10 = {}
	wall10.x = 170
	wall10.y = 490
	wall10.width = 250
	wall10.height = 50

	wall11 = {}
	wall11.x = 170
	wall11.y = 540
	wall11.width = 50
	wall11.height = 70

	wall12 = {}
	wall12.x = 290
	wall12.y = 600
	wall12.width = 50
	wall12.height = 80

	wall13 = {}
	wall13.x = 410
	wall13.y = 570
	wall13.width = 820
	wall13.height = 50

	wall14 = {}
	wall14.x = 1180
	wall14.y = 620
	wall14.width = 50
	wall14.height = 70

	wall15 = {}
	wall15.x = 530
	wall15.y = 170
	wall15.width = 700
	wall15.height = 50

	wall16 = {}
	wall16.x = 530
	wall16.y = 170
	wall16.width = 50
	wall16.height = 330

	wall17 = {}
	wall17.x = 650
	wall17.y = 290
	wall17.width = 50
	wall17.height = 330

	wall18 = {}
	wall18.x = 770
	wall18.y = 170
	wall18.width = 50
	wall18.height = 330

	wall19 = {}
	wall19.x = 890
	wall19.y = 290
	wall19.width = 50
	wall19.height = 330

	wall20 = {}
	wall20.x = 1010
	wall20.y = 170
	wall20.width = 50
	wall20.height = 330

	wall21 = {}
	wall21.x = 1060
	wall21.y = 170
	wall21.width = 170
	wall21.height = 330

	wall22 = {}
	wall22.x = 1230
	wall22.y = 450
	wall22.width = 70
	wall22.height = 50

end

function Game:update(dt)
	Move(dt)	
	boundary()
end
	
function Game:render()
	love.graphics.rectangle('fill', wall1.x, wall1.y, wall1.width, wall1.height)
	love.graphics.rectangle('fill', wall2.x, wall2.y, wall2.width, wall2.height)
	love.graphics.rectangle('fill', wall3.x, wall3.y, wall3.width, wall3.height)
	love.graphics.rectangle('fill', wall4.x, wall4.y, wall4.width, wall4.height)
	love.graphics.rectangle('fill', wall5.x, wall5.y, wall5.width, wall5.height)
	love.graphics.rectangle('fill', wall6.x, wall6.y, wall6.width, wall6.height)
	love.graphics.rectangle('fill', wall7.x, wall7.y, wall7.width, wall7.height)
	love.graphics.rectangle('fill', wall8.x, wall8.y, wall8.width, wall8.height)
	love.graphics.rectangle('fill', wall9.x, wall9.y, wall9.width, wall9.height)
	love.graphics.rectangle('fill', wall10.x, wall10.y, wall10.width, wall10.height)
	love.graphics.rectangle('fill', wall11.x, wall11.y, wall11.width, wall11.height)
	love.graphics.rectangle('fill', wall12.x, wall12.y, wall12.width, wall12.height)
	love.graphics.rectangle('fill', wall13.x, wall13.y, wall13.width, wall13.height)
	love.graphics.rectangle('fill', wall14.x, wall14.y, wall14.width, wall14.height)
	love.graphics.rectangle('fill', wall15.x, wall15.y, wall15.width, wall15.height)
	love.graphics.rectangle('fill', wall16.x, wall16.y, wall16.width, wall16.height)
	love.graphics.rectangle('fill', wall17.x, wall17.y, wall17.width, wall17.height)
	love.graphics.rectangle('fill', wall18.x, wall18.y, wall18.width, wall18.height)
	love.graphics.rectangle('fill', wall19.x, wall19.y, wall19.width, wall19.height)
	love.graphics.rectangle('fill', wall20.x, wall20.y, wall20.width, wall20.height)
	love.graphics.rectangle('fill', wall21.x, wall21.y, wall21.width, wall21.height)
	love.graphics.rectangle('fill', wall22.x, wall22.y, wall22.width, wall22.height)

	love.graphics.draw(finish.image, finish.x, finish.y)
	love.graphics.draw(player.image, player.x, player.y)



end

function Move(dt)
	if love.keyboard.isDown('w') then
		player.direction = 'up'
		blocks(player.x, player.y - player.speed * dt)
	elseif love.keyboard.isDown('s') then
		player.direction = 'down'
		blocks(player.x, player.y + player.speed * dt)
	end
	
	if love.keyboard.isDown('a') then
		player.direction = 'left'
		blocks(player.x - player.speed * dt, player.y)
	elseif love.keyboard.isDown('d') then
		player.direction = 'right'
		blocks(player.x + player.speed * dt, player.y)
	end
end

function boundary()
	if player.x < boundaryLeft then
        player.x = boundaryLeft
    elseif player.x > boundaryRight then
        player.x = boundaryRight
    end

    if player.y < boundaryTop then
        player.y = boundaryTop
    elseif player.y > boundaryBottom then
        player.y = boundaryBottom
    end
end

function blocks(xx,yy) 
	if  CheckCollision(xx, yy, player.width, player.height, wall1.x, wall1.y, wall1.width, wall1.height) then
		while CheckCollision(xx, yy, player.width, player.height, wall1.x, wall1.y, wall1.width, wall1.height) do
			if player.direction == 'left' then
					xx = xx - 1
					stateMachine:change('end')
				elseif player.direction == 'right' then
					xx = xx + 1
					stateMachine:change('end')
				elseif player.direction == 'up' then
					yy = yy - 1
					stateMachine:change('end')
				elseif player.direction == 'down' then
					yy = yy + 1
					stateMachine:change('end')
				end			
			end
	end
	if  CheckCollision(xx, yy, player.width, player.height, wall2.x, wall2.y, wall2.width, wall2.height) then
		while CheckCollision(xx, yy, player.width, player.height, wall2.x, wall2.y, wall2.width, wall2.height) do
			if player.direction == 'left' then
					xx = xx - 1
					stateMachine:change('end')
				elseif player.direction == 'right' then
					xx = xx + 1
					stateMachine:change('end')
				elseif player.direction == 'up' then
					yy = yy - 1
					stateMachine:change('end')
				elseif player.direction == 'down' then
					yy = yy + 1
					stateMachine:change('end')
				end			
			end
	else
		player.x = xx
		player.y = yy
	end
	if  CheckCollision(xx, yy, player.width, player.height, wall3.x, wall3.y, wall3.width, wall3.height) then
		while CheckCollision(xx, yy, player.width, player.height, wall3.x, wall3.y, wall3.width, wall3.height) do
			if player.direction == 'left' then
					xx = xx - 1
					stateMachine:change('end')
				elseif player.direction == 'right' then
					xx = xx + 1
					stateMachine:change('end')
				elseif player.direction == 'up' then
					yy = yy - 1
					stateMachine:change('end')
				elseif player.direction == 'down' then
					yy = yy + 1
					stateMachine:change('end')
				end			
			end
	else
		player.x = xx
		player.y = yy
	end
	if  CheckCollision(xx, yy, player.width, player.height, wall4.x, wall4.y, wall4.width, wall4.height) then
		while CheckCollision(xx, yy, player.width, player.height, wall4.x, wall4.y, wall4.width, wall4.height) do
			if player.direction == 'left' then
					xx = xx - 1
					stateMachine:change('end')
				elseif player.direction == 'right' then
					xx = xx + 1
					stateMachine:change('end')
				elseif player.direction == 'up' then
					yy = yy - 1
					stateMachine:change('end')
				elseif player.direction == 'down' then
					yy = yy + 1
					stateMachine:change('end')
				end			
			end
	else
		player.x = xx
		player.y = yy
	end
	if  CheckCollision(xx, yy, player.width, player.height, wall5.x, wall5.y, wall5.width, wall5.height) then
		while CheckCollision(xx, yy, player.width, player.height, wall5.x, wall5.y, wall5.width, wall5.height) do
			if player.direction == 'left' then
					xx = xx - 1
					stateMachine:change('end')
				elseif player.direction == 'right' then
					xx = xx + 1
					stateMachine:change('end')
				elseif player.direction == 'up' then
					yy = yy - 1
					stateMachine:change('end')
				elseif player.direction == 'down' then
					yy = yy + 1
					stateMachine:change('end')
				end			
			end
	else
		player.x = xx
		player.y = yy
	end
	if  CheckCollision(xx, yy, player.width, player.height, wall6.x, wall6.y, wall6.width, wall6.height) then
		while CheckCollision(xx, yy, player.width, player.height, wall6.x, wall6.y, wall6.width, wall6.height) do
			if player.direction == 'left' then
					xx = xx - 1
					stateMachine:change('end')
				elseif player.direction == 'right' then
					xx = xx + 1
					stateMachine:change('end')
				elseif player.direction == 'up' then
					yy = yy - 1
					stateMachine:change('end')
				elseif player.direction == 'down' then
					yy = yy + 1
					stateMachine:change('end')
				end			
			end
	else
		player.x = xx
		player.y = yy
	end
	if  CheckCollision(xx, yy, player.width, player.height, wall7.x, wall7.y, wall7.width, wall7.height) then
		while CheckCollision(xx, yy, player.width, player.height, wall7.x, wall7.y, wall7.width, wall7.height) do
			if player.direction == 'left' then
					xx = xx - 1
					stateMachine:change('end')
				elseif player.direction == 'right' then
					xx = xx + 1
					stateMachine:change('end')
				elseif player.direction == 'up' then
					yy = yy - 1
					stateMachine:change('end')
				elseif player.direction == 'down' then
					yy = yy + 1
					stateMachine:change('end')
				end			
			end
	else
		player.x = xx
		player.y = yy
	end

	if  CheckCollision(xx, yy, player.width, player.height, wall8.x, wall8.y, wall8.width, wall8.height) then
		while CheckCollision(xx, yy, player.width, player.height, wall8.x, wall8.y, wall8.width, wall8.height) do
			if player.direction == 'left' then
					xx = xx - 1
					stateMachine:change('end')
				elseif player.direction == 'right' then
					xx = xx + 1
					stateMachine:change('end')
				elseif player.direction == 'up' then
					yy = yy - 1
					stateMachine:change('end')
				elseif player.direction == 'down' then
					yy = yy + 1
					stateMachine:change('end')
				end			
			end
	else
		player.x = xx
		player.y = yy
	end

	if  CheckCollision(xx, yy, player.width, player.height, wall9.x, wall9.y, wall9.width, wall9.height) then
		while CheckCollision(xx, yy, player.width, player.height, wall9.x, wall9.y, wall9.width, wall9.height) do
			if player.direction == 'left' then
					xx = xx - 1
					stateMachine:change('end')
				elseif player.direction == 'right' then
					xx = xx + 1
					stateMachine:change('end')
				elseif player.direction == 'up' then
					yy = yy - 1
					stateMachine:change('end')
				elseif player.direction == 'down' then
					yy = yy + 1
					stateMachine:change('end')
				end			
			end
	else
		player.x = xx
		player.y = yy
	end

	if  CheckCollision(xx, yy, player.width, player.height, wall10.x, wall10.y, wall10.width, wall10.height) then
		while CheckCollision(xx, yy, player.width, player.height, wall10.x, wall10.y, wall10.width, wall10.height) do
			if player.direction == 'left' then
					xx = xx - 1
					stateMachine:change('end')
				elseif player.direction == 'right' then
					xx = xx + 1
					stateMachine:change('end')
				elseif player.direction == 'up' then
					yy = yy - 1
					stateMachine:change('end')
				elseif player.direction == 'down' then
					yy = yy + 1
					stateMachine:change('end')
				end			
			end
	else
		player.x = xx
		player.y = yy
	end

	if  CheckCollision(xx, yy, player.width, player.height, wall11.x, wall11.y, wall11.width, wall11.height) then
		while CheckCollision(xx, yy, player.width, player.height, wall11.x, wall11.y, wall11.width, wall11.height) do
			if player.direction == 'left' then
					xx = xx - 1
					stateMachine:change('end')
				elseif player.direction == 'right' then
					xx = xx + 1
					stateMachine:change('end')
				elseif player.direction == 'up' then
					yy = yy - 1
					stateMachine:change('end')
				elseif player.direction == 'down' then
					yy = yy + 1
					stateMachine:change('end')
				end			
			end
	else
		player.x = xx
		player.y = yy
	end

	if  CheckCollision(xx, yy, player.width, player.height, wall12.x, wall12.y, wall12.width, wall12.height) then
		while CheckCollision(xx, yy, player.width, player.height, wall12.x, wall12.y, wall12.width, wall12.height) do
			if player.direction == 'left' then
					xx = xx - 1
					stateMachine:change('end')
				elseif player.direction == 'right' then
					xx = xx + 1
					stateMachine:change('end')
				elseif player.direction == 'up' then
					yy = yy - 1
					stateMachine:change('end')
				elseif player.direction == 'down' then
					yy = yy + 1
					stateMachine:change('end')
				end			
			end
	else
		player.x = xx
		player.y = yy
	end

	if  CheckCollision(xx, yy, player.width, player.height, wall13.x, wall13.y, wall13.width, wall13.height) then
		while CheckCollision(xx, yy, player.width, player.height, wall13.x, wall13.y, wall13.width, wall13.height) do
			if player.direction == 'left' then
					xx = xx - 1
					stateMachine:change('end')
				elseif player.direction == 'right' then
					xx = xx + 1
					stateMachine:change('end')
				elseif player.direction == 'up' then
					yy = yy - 1
					stateMachine:change('end')
				elseif player.direction == 'down' then
					yy = yy + 1
					stateMachine:change('end')
				end			
			end
	else
		player.x = xx
		player.y = yy
	end

	if  CheckCollision(xx, yy, player.width, player.height, wall14.x, wall14.y, wall14.width, wall14.height) then
		while CheckCollision(xx, yy, player.width, player.height, wall14.x, wall14.y, wall14.width, wall14.height) do
			if player.direction == 'left' then
					xx = xx - 1
					stateMachine:change('end')
				elseif player.direction == 'right' then
					xx = xx + 1
					stateMachine:change('end')
				elseif player.direction == 'up' then
					yy = yy - 1
					stateMachine:change('end')
				elseif player.direction == 'down' then
					yy = yy + 1
					stateMachine:change('end')
				end			
			end
	else
		player.x = xx
		player.y = yy
	end

	if  CheckCollision(xx, yy, player.width, player.height, wall15.x, wall15.y, wall15.width, wall15.height) then
		while CheckCollision(xx, yy, player.width, player.height, wall15.x, wall15.y, wall15.width, wall15.height) do
			if player.direction == 'left' then
					xx = xx - 1
					stateMachine:change('end')
				elseif player.direction == 'right' then
					xx = xx + 1
					stateMachine:change('end')
				elseif player.direction == 'up' then
					yy = yy - 1
					stateMachine:change('end')
				elseif player.direction == 'down' then
					yy = yy + 1
					stateMachine:change('end')
				end			
			end
	else
		player.x = xx
		player.y = yy
	end

	if  CheckCollision(xx, yy, player.width, player.height, wall16.x, wall16.y, wall16.width, wall16.height) then
		while CheckCollision(xx, yy, player.width, player.height, wall16.x, wall16.y, wall16.width, wall16.height) do
			if player.direction == 'left' then
					xx = xx - 1
					stateMachine:change('end')
				elseif player.direction == 'right' then
					xx = xx + 1
					stateMachine:change('end')
				elseif player.direction == 'up' then
					yy = yy - 1
					stateMachine:change('end')
				elseif player.direction == 'down' then
					yy = yy + 1
					stateMachine:change('end')
				end			
			end
	else
		player.x = xx
		player.y = yy
	end

	if  CheckCollision(xx, yy, player.width, player.height, wall17.x, wall17.y, wall17.width, wall17.height) then
		while CheckCollision(xx, yy, player.width, player.height, wall17.x, wall17.y, wall17.width, wall17.height) do
			if player.direction == 'left' then
					xx = xx - 1
					stateMachine:change('end')
				elseif player.direction == 'right' then
					xx = xx + 1
					stateMachine:change('end')
				elseif player.direction == 'up' then
					yy = yy - 1
					stateMachine:change('end')
				elseif player.direction == 'down' then
					yy = yy + 1
					stateMachine:change('end')
				end			
			end
	else
		player.x = xx
		player.y = yy
	end

	if  CheckCollision(xx, yy, player.width, player.height, wall18.x, wall18.y, wall18.width, wall18.height) then
		while CheckCollision(xx, yy, player.width, player.height, wall18.x, wall18.y, wall18.width, wall18.height) do
			if player.direction == 'left' then
					xx = xx - 1
					stateMachine:change('end')
				elseif player.direction == 'right' then
					xx = xx + 1
					stateMachine:change('end')
				elseif player.direction == 'up' then
					yy = yy - 1
					stateMachine:change('end')
				elseif player.direction == 'down' then
					yy = yy + 1
					stateMachine:change('end')
				end			
			end
	else
		player.x = xx
		player.y = yy
	end

	if  CheckCollision(xx, yy, player.width, player.height, wall19.x, wall19.y, wall19.width, wall19.height) then
		while CheckCollision(xx, yy, player.width, player.height, wall19.x, wall19.y, wall19.width, wall19.height) do
			if player.direction == 'left' then
					xx = xx - 1
					stateMachine:change('end')
				elseif player.direction == 'right' then
					xx = xx + 1
					stateMachine:change('end')
				elseif player.direction == 'up' then
					yy = yy - 1
					stateMachine:change('end')
				elseif player.direction == 'down' then
					yy = yy + 1
					stateMachine:change('end')
				end			
			end
	else
		player.x = xx
		player.y = yy
	end

	if  CheckCollision(xx, yy, player.width, player.height, wall20.x, wall20.y, wall20.width, wall20.height) then
		while CheckCollision(xx, yy, player.width, player.height, wall20.x, wall20.y, wall20.width, wall20.height) do
			if player.direction == 'left' then
					xx = xx - 1
					stateMachine:change('end')
				elseif player.direction == 'right' then
					xx = xx + 1
					stateMachine:change('end')
				elseif player.direction == 'up' then
					yy = yy - 1
					stateMachine:change('end')
				elseif player.direction == 'down' then
					yy = yy + 1
					stateMachine:change('end')
				end			
			end
	else
		player.x = xx
		player.y = yy
	end

	if  CheckCollision(xx, yy, player.width, player.height, wall21.x, wall21.y, wall21.width, wall21.height) then
		while CheckCollision(xx, yy, player.width, player.height, wall21.x, wall21.y, wall21.width, wall21.height) do
			if player.direction == 'left' then
					xx = xx - 1
					stateMachine:change('end')
				elseif player.direction == 'right' then
					xx = xx + 1
					stateMachine:change('end')
				elseif player.direction == 'up' then
					yy = yy - 1
					stateMachine:change('end')
				elseif player.direction == 'down' then
					yy = yy + 1
					stateMachine:change('end')
				end			
			end
	else
		player.x = xx
		player.y = yy
	end

	if  CheckCollision(xx, yy, player.width, player.height, wall22.x, wall22.y, wall22.width, wall22.height) then
		while CheckCollision(xx, yy, player.width, player.height, wall22.x, wall22.y, wall22.width, wall22.height) do
			if player.direction == 'left' then
					xx = xx - 1
					stateMachine:change('end')
				elseif player.direction == 'right' then
					xx = xx + 1
					stateMachine:change('end')
				elseif player.direction == 'up' then
					yy = yy - 1
					stateMachine:change('end')
				elseif player.direction == 'down' then
					yy = yy + 1
					stateMachine:change('end')
				end			
			end
	else
		player.x = xx
		player.y = yy
	end

	if  CheckCollision(xx, yy, player.width, player.height, finish.x, finish.y, finish.width, finish.height) then
		while CheckCollision(xx, yy, player.width, player.height, finish.x, finish.y, finish.width, finish.height) do
			if player.direction == 'left' then
					xx = xx - 1
					stateMachine:change('win')
				elseif player.direction == 'right' then
					xx = xx + 1
					stateMachine:change('win')
				elseif player.direction == 'up' then
					yy = yy - 1
					stateMachine:change('win')
				elseif player.direction == 'down' then
					yy = yy + 1
					stateMachine:change('win')
				end			
			end
	else
		player.x = xx
		player.y = yy
	end

end

function CheckCollision(ax1,ay1,aw,ah, bx1,by1,bw,bh)
  local ax2,ay2,bx2,by2 = ax1 + aw, ay1 + ah, bx1 + bw, by1 + bh
  return ax1 < bx2 and ax2 > bx1 and ay1 < by2 and ay2 > by1
end


