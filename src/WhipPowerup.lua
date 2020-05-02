WhipPowerup = Class{__includes = Collidable}

function WhipPowerup:init(x, y)
    self.x = x
    self.y = y
    self.width = 8
    self.height = 8
    self.type = 'whip'
    self.collected = false
end

function WhipPowerup:update(dt)

end

function WhipPowerup:render()
    love.graphics.draw(gImages['whip'], self.x, self.y)
end
