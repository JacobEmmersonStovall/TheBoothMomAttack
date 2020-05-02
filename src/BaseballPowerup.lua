BaseballPowerup = Class{}

function BaseballPowerup:init(x, y)
    self.x = x
    self.y = y
    self.width = 8
    self.height = 8
    self.type = 'baseball'
    self.collected = false
end

function BaseballPowerup:update(dt)

end

function BaseballPowerup:render()
    love.graphics.draw(gImages['baseball'], self.x, self.y)
end
