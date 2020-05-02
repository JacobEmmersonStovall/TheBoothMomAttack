--"C:\Program Files\LOVE\love.exe" .
Class = require 'lib/class'
push = require 'lib/push'
require 'lib/Animation'
require 'src/Bill'

-- physical screen dimensions
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

-- virtual resolution dimensions
VIRTUAL_WIDTH = 256
VIRTUAL_HEIGHT = 240

gImages = {
    ['baseball'] = love.graphics.newImage('img/Baseball.png'),
    ['nutmeg'] = love.graphics.newImage('img/Nutmeg.png'),
    ['whip'] = love.graphics.newImage('img/Whip.png'),
    ['woodfloor'] = love.graphics.newImage('img/WoodFloor.png'),

    --Bill character images
    ['bill1'] = love.graphics.newImage('img/BillBlock1.png'),
    ['bill2'] = love.graphics.newImage('img/BillBlock2.png'),
    ['bill3'] = love.graphics.newImage('img/BillBlock3.png')
}

function love.load()
    -- initialize our nearest-neighbor filter
    love.graphics.setDefaultFilter('nearest', 'nearest')

    love.keyboard.keysPressed = {}

    bill = Bill{}
    
    -- seed the RNG
    math.randomseed(os.time())
    
    -- app window title
    love.window.setTitle('Fifty Bird')

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = true,
        fullscreen = false,
        resizable = true
    })
end

function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end

function love.keypressed(key)
    -- add to our table of keys pressed this frame
    love.keyboard.keysPressed[key] = true

    if key == 'escape' then
        love.event.quit()
    end
end


function love.resize(w, h)
    push:resize(w, h)
end

function love.update(dt)

    bill:update(dt)

    love.keyboard.keysPressed = {}
end

function love.draw()
    push:start()
    
    for i = 1,32 do
        for j = 1, 30 do
            love.graphics.draw(gImages["woodfloor"], (i-1) * 8, (j-1) * 8)
        end
    end
    love.graphics.draw(gImages['baseball'], VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 2)
    love.graphics.draw(gImages['nutmeg'], VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 1.5)
    love.graphics.draw(gImages['whip'], VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 3)

    bill:render()

    push:finish()
end