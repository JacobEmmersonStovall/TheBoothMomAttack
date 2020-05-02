Collidable = Class{__includes = Collidable}

function Collidable:isCollision(target)
    if(self.x > target.x + target.width - 1 or target.x > self.x + self.width - 1) then
        return false
    end
    if(self.y > target.y + target.height - 1 or target.y > self.y + self.height - 1) then
        return false
    end
    return true
end
