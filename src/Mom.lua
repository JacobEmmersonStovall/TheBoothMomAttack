local momIdleAnimation = Animation {
    frames = {"mom1"},
    interval = 1
}
local momMovingAnimation = Animation {
    frames = {"mom1", "mom2", "mom3"},
    interval = 0.2
}

Mom = Class{__includes = Collidable}

function Mom:init(x, y)
    self.currentAnimation = momIdleAnimation
    self.y = y
    self.x = x
    self.width = 8
    self.height = 8
    self.speed = 40
    self.speedMultiplier = 1
    --Mom change movement timer
    self.momChangeMovementThreshold = math.random(1,10) * 0.1
    self.momChangeMovementTimer = 1
end


function Mom:update(dt)
    self.currentAnimation:update(dt)

    --Checking inputs
    self.momChangeMovementTimer = self.momChangeMovementTimer + dt
    if self.momChangeMovementTimer > self.momChangeMovementThreshold then
        self.momChangeMovementTimer = 0
        self.momChangeMovementThreshold = math.random(1,10) * 0.1
        self.direction = math.random(1,9)
    end
    --Move direction
    self.momDidSomething = true
    if self.direction == 1 then
        self.x = self.x - (self.speed * dt * self.speedMultiplier)
    elseif self.direction == 2 then
        self.x = self.x + (self.speed * dt * self.speedMultiplier)
    elseif self.direction == 3 then
        self.y = self.y - (self.speed * dt * self.speedMultiplier)
    elseif self.direction == 4 then
        self.y = self.y + (self.speed * dt * self.speedMultiplier)
    elseif self.direction == 5 then
        self.y = self.y + (self.speed * dt * self.speedMultiplier)
        self.x = self.x - (self.speed * dt * self.speedMultiplier)        
    elseif self.direction == 6 then
        self.y = self.y + (self.speed * dt * self.speedMultiplier)
        self.x = self.x + (self.speed * dt * self.speedMultiplier)
    elseif self.direction == 7 then
        self.y = self.y - (self.speed * dt * self.speedMultiplier)
        self.x = self.x - (self.speed * dt * self.speedMultiplier)
    elseif self.direction == 8 then
        self.y = self.y - (self.speed * dt * self.speedMultiplier)
        self.x = self.x + (self.speed * dt * self.speedMultiplier)
    elseif self.direction == 9 then
        self.momDidSomething = false
    end
    --Checking which animation to use
    if self.momDidSomething then
        self.currentAnimation = momMovingAnimation
    else
        self.currentAnimation = momIdleAnimation
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

function Mom:render()
    love.graphics.draw(gImages[self.currentAnimation:getCurrentFrame()], self.x, self.y)
end