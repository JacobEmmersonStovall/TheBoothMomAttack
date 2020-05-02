PlayState = Class{__includes = BaseState}

function PlayState:init()
    -- Character spawn
    self.bill = Bill(8,8)
    --Score Info
    self.score = 0
    self.scoreMultiplier = 1
    --Powerup Info
    self.powerupSpawnTimer = 0
    self.powerupSpawnThreshold = math.random(1,5)
    self.currentPowerups = {}
    --Floor Info
    self.floors = {}
    for i = 1,32 do
        for j = 1,30 do
            if i == 1 or i == 32 or j == 1 or j == 30 or 
                (i == 12 and j > 3 and j < 11) or (i == 24 and j > 3 and j < 11)
                or (i == 12 and j > 20 and j < 26) or (i == 24 and j > 20 and j < 26)
                or (j == 15 and i > 3 and i < 8) or (j == 15 and i > 20 and i < 26) then
                table.insert(self.floors, Hole((i-1) * 8, (j - 1) * 8))
            else
                table.insert(self.floors, Tile((i-1) * 8, (j - 1) * 8))
            end
        end
    end
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
        
        --Check spawn doesn't collide with holes or objects
        spawnIsOkay = true
        powerupToSpawn = BaseballPowerup(newPowerupX, newPowerupY)
        for k, powerup in pairs(self.currentPowerups) do
            if not powerup.collected and powerupToSpawn:isCollision(powerup) then
                spawnIsOkay = false
            end
        end

        for k, floor in pairs(self.floors) do
            if floor.type == 'hole' and powerupToSpawn:isCollision(floor) then
                spawnIsOkay = false
            end
        end

        if spawnIsOkay then
            table.insert(newPowerupTable, powerupToSpawn)
        end
    end
    for k, powerup in pairs(self.currentPowerups) do
        if not powerup.collected then
            table.insert(newPowerupTable, powerup)
        end
    end
    self.currentPowerups = newPowerupTable

    --Update characters
    previousBillx = self.bill.x
    previousBilly = self.bill.y
    self.bill:update(dt)
    --Make sure they are not colliding with a hole
    for k, floor in pairs(self.floors) do
        if floor.type == 'hole' and self.bill:isCollision(floor) then
            self.bill.x = previousBillx
            self.bill.y = previousBilly
        end
    end
end

function PlayState:render()
    
    for k, floor in pairs(self.floors) do
        floor:render()
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