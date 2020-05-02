--Requires
Class = require 'lib/class'
push = require 'lib/push'
require 'lib/Animation'

--Entities
require 'src/Collidable'
require 'src/Bill'
require 'src/Mom'
require 'src/BaseballPowerup'
require 'src/WhipPowerup'
require 'src/NutmegPowerup'
require 'src/Tile'
require 'src/Hole'

--State Machine
require 'src/StateMachine'
require 'state/BaseState'
require 'state/PlayState'
require 'state/TitleState'
require 'state/GameOverState'

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
    ['title'] = love.graphics.newImage('img/Title.png'),
    ['hole'] = love.graphics.newImage('img/Hole.png'),

    --Bill character images
    ['bill1'] = love.graphics.newImage('img/BillBlock1.png'),
    ['bill2'] = love.graphics.newImage('img/BillBlock2.png'),
    ['bill3'] = love.graphics.newImage('img/BillBlock3.png'),

    ['mom1'] = love.graphics.newImage('img/Mom1.png'),
    ['mom2'] = love.graphics.newImage('img/Mom2.png'),
    ['mom3'] = love.graphics.newImage('img/Mom3.png')
}