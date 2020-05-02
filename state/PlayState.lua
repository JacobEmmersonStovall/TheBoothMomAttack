PlayState = Class{__includes = BaseState}

function PlayState:init()
    -- Character spawn
    self.bill = Bill{}
    --Score Info
    self.score = 0
    self.scoreMultiplier = 1
    --Powerup Info
    self.powerupSpawnTimer = 0
    self.powerupSpawnThreshold = math.random(1,5)
    self.currentPowerups = {}
end

function PlayState:update(dt)

    for k, powerup in pairs(self.currentPowerups) do
        powerup:update(dt)
        if not powerup.collected and self.bill:isCollision(powerup) then
            if powerup.type == 'baseball' then
                self.score = self.score + (self.scoreMultiplier * 100)
            end
            powerup.collected = true
        end
    end

    newPowerupTable = {}
    self.powerupSpawnTimer = self.powerupSpawnTimer + dt
    if self.powerupSpawnTimer >= self.powerupSpawnThreshold then
        self.powerupSpawnTimer = 0
        self.powerupSpawnThreshold = math.random(1,5)

        newPowerupX = math.random(0, 31) * 8
        newPowerupY = math.random(0, 29) * 8

        table.insert(newPowerupTable, BaseballPowerup(newPowerupX, newPowerupY))
    end
    for k, powerup in pairs(self.currentPowerups) do
        if not powerup.collected then
            table.insert(newPowerupTable, powerup)
        end
    end
    self.currentPowerups = newPowerupTable

    self.bill:update(dt)
end

function PlayState:render()
    
    for i = 1,32 do
        for j = 1, 30 do
            love.graphics.draw(gImages["woodfloor"], (i-1) * 8, (j-1) * 8)
        end
    end
    
    --self.baseballPowerup:render()
    --love.graphics.draw(gImages['nutmeg'], VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 1.5)
    --love.graphics.draw(gImages['whip'], VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 3)

    for k, powerup in pairs(self.currentPowerups) do
        if not powerup.collected then
            powerup:render()
        end
    end

    love.graphics.print('Score: ' .. tostring(self.score), 8, 8)

    self.bill:render()
end