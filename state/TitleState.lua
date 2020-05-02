TitleState = Class{__includes = BaseState}

function TitleState:init()
    -- nothing
end

function TitleState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('play')
    end
end

function TitleState:render()
    love.graphics.draw(gImages['title'], 16, 16)
end