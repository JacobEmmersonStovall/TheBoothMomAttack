Tile = Class{}

function Tile:init(x, y)
    self.x = x
    self.y = y
    self.width = 8
    self.height = 8
    self.type="tile"
end

function Tile:update(dt)

end

function Tile:render()
    love.graphics.draw(gImages["woodfloor"], self.x, self.y)
end
