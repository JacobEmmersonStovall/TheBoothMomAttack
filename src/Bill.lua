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
    self.speed = 30
end

function Bill:update(dt)
    self.currentAnimation:update(dt)

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
    if billDidSomething then
        self.currentAnimation = billMovingAnimation
    else
        self.currentAnimation = billIdleAnimation
    end
end

function Bill:render()
    love.graphics.draw(gImages[self.currentAnimation:getCurrentFrame()], self.x, self.y)
end