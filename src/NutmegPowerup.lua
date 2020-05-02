NutmegPowerup = Class{__includes = Collidable}

function NutmegPowerup:init(x, y)
    self.x = x
    self.y = y
    self.width = 8
    self.height = 8
    self.type = 'nutmeg'
    self.collected = false
end

function NutmegPowerup:update(dt)

end

function NutmegPowerup:render()
    love.graphics.draw(gImages['nutmeg'], self.x, self.y)
end
