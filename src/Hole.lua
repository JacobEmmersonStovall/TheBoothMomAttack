Hole = Class{}

function Hole:init(x, y)
    self.x = x
    self.y = y
    self.width = 8
    self.height = 8
    self.type="hole"
end

function Hole:update(dt)

end

function Hole:render()
    love.graphics.draw(gImages['hole'], self.x, self.y)
end
