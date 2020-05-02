TitleState = Class{__includes = BaseState}

function TitleState:init()
    -- nothing
    self.isInTransitionState = false
    self.transitionThreshold = 0.1
    self.transitionEnd = 2
    self.transitionTimer = 0
    self.showTitle = true
end

function TitleState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        self.isInTransitionState = true
    end

    if self.isInTransitionState then
        if self.transitionTimer == 0 then 
            love.audio.play(gSounds['playball'])
        end
        self.transitionTimer = self.transitionTimer + dt
        if self.transitionTimer >= self.transitionThreshold then
            self.transitionThreshold = self.transitionThreshold + 0.1
            self.showTitle = not self.showTitle
        end
        if self.transitionTimer >= self.transitionEnd then
            self.transitionTimer = 0
            self.transitionThreshold = 0.1
            self.showTitle = true
            self.isInTransitionState = false
            gStateMachine:change('play')
        end
    end
end

function TitleState:render()
    if self.showTitle then
        love.graphics.draw(gImages['title'], 16, 16)
    end
    love.graphics.printf('ESC to quit', 0, 180, VIRTUAL_WIDTH, "center")
    love.graphics.printf('W, A, S, D to move', 0, 200, VIRTUAL_WIDTH, "center")
    love.graphics.printf('Press enter to start', 0, 220, VIRTUAL_WIDTH, "center")
end