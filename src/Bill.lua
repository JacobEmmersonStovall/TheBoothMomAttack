local billIdleAnimation = Animation {
    frames = {"bill1"},
    interval = 1
}
local billMovingAnimation = Animation {
    frames = {"bill1", "bill2", "bill3"},
    interval = 0.2
}

Bill = Class{}

function Bill:init()
    self.currentAnimation = billIdleAnimation
    self.y = VIRTUAL_HEIGHT - 16
    self.x = VIRTUAL_WIDTH / 2
    self.width = 8
    self.height = 8
    self.speed = 60
end

function Bill:update(dt)
    self.currentAnimation:update(dt)

    --Checking inputs
    billDidSomething = false
    if love.keyboard.isDown("w") then
        self.y = self.y - (self.speed * dt)
        billDidSomething = true
    end
    if love.keyboard.isDown("s") then
        self.y = self.y + (self.speed * dt)
        billDidSomething = true
    end
    if love.keyboard.isDown("a") then
        self.x = self.x - (self.speed * dt)
        billDidSomething = true
    end
    if love.keyboard.isDown("d") then
        self.x = self.x + (self.speed * dt)
        billDidSomething = true
    end
    --Checking which animation to use
    if billDidSomething then
        self.currentAnimation = billMovingAnimation
    else
        self.currentAnimation = billIdleAnimation
    end
    -- Boundary check
    if self.x < 0 then
        self.x = 0
    end
    if self.y < 0 then
        self.y = 0
    end
    if self.x + self.width > VIRTUAL_WIDTH then
        self.x = VIRTUAL_WIDTH - self.width
    end
    if self.y + self.height > VIRTUAL_HEIGHT then
        self.y = VIRTUAL_HEIGHT - self.height
    end
end

function Bill:isCollision(target)
    if(self.x > target.x + target.width or target.x > self.x + self.width) then
        return false
    end
    if(self.y > target.y + target.height or target.y > self.y + self.height) then
        return false
    end
    return true
end

function Bill:render()
    love.graphics.draw(gImages[self.currentAnimation:getCurrentFrame()], self.x, self.y)
end