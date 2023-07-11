Class = require 'class'


require 'StateMachine'

require 'BaseState'
require 'StartState'
require 'PlayState'
require 'PauseState'
require 'SettingsState'
require 'EndGameState'
require 'WinGameState'


WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 512
VIRTUAL_HEIGHT = 288

function love.load()
	love.graphics.setDefaultFilter('nearest', 'nearest')
	love.window.setTitle('State Machine')
	
	love.window.setFullscreen(true, "desktop")
	
	stateMachine =  StateMachine {
		['start'] = function() return StartState() end,
		['play'] = function() return PlayState() end,
		['pause'] = function() return PauseState() end,
		['settings'] = function() return SettingsState() end,
		['end'] = function() return EndGameState() end,
		['win'] = function() return WinGameState() end
	}
	
	stateMachine:change('start')
	
	font = love.graphics.newFont('font.ttf', 23)

	love.graphics.setFont(font)
end


function love.keypressed(key)
	if key == 'escape' then
		love.event.quit()
	end
end


function love.update(dt)
	stateMachine:update(dt)
end


function love.draw()
	stateMachine:render()
end


