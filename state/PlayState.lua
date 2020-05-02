PlayState = Class{__includes = BaseState}

function PlayState:init()
    -- nothing
    self.bill = Bill{}
end

function PlayState:update(dt)
    self.bill:update(dt)
end

function PlayState:render()
    
    for i = 1,32 do
        for j = 1, 30 do
            love.graphics.draw(gImages["woodfloor"], (i-1) * 8, (j-1) * 8)
        end
    end
    
    love.graphics.draw(gImages['baseball'], VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 2)
    love.graphics.draw(gImages['nutmeg'], VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 1.5)
    love.graphics.draw(gImages['whip'], VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 3)

    self.bill:render()
end