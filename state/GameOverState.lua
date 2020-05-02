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
    love.graphics.printf('Game Over', 0, 112, VIRTUAL_WIDTH, "center")
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 128, VIRTUAL_WIDTH, "center")
end