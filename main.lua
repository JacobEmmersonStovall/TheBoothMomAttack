--"C:\Program Files\LOVE\love.exe" .

push = require 'lib/push'

-- physical screen dimensions
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

-- virtual resolution dimensions
VIRTUAL_WIDTH = 256
VIRTUAL_HEIGHT = 240

gImages = {
    ['baseball'] = love.graphics.newImage('img/Baseball.png'),
    ['nutmeg'] = love.graphics.newImage('img/Nutmeg.png'),
    ['whip'] = love.graphics.newImage('img/Whip.png')
}

function love.load()
    -- initialize our nearest-neighbor filter
    love.graphics.setDefaultFilter('nearest', 'nearest')
    
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

function love.resize(w, h)
    push:resize(w, h)
end

function love.draw()
    push:start()
    
    push:setBorderColor(.5, .5, .5, 1)
    love.graphics.draw(gImages['baseball'], VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 2)
    love.graphics.draw(gImages['nutmeg'], VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 1.5)
    love.graphics.draw(gImages['whip'], VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 3)
    push:finish()
end