GameOverState = Class{__includes = BaseState}

function GameOverState:init()
    -- nothing
end

function GameOverState:enter(params)
    self.score = params['score']
end

function GameOverState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('title')
    end
end

function GameOverState:render()
    love.graphics.print('Game Over', 104, 112)
    love.graphics.print('Score: ' .. tostring(self.score), 104, 128)
end