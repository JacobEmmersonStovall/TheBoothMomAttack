--Requires
Class = require 'lib/class'
push = require 'lib/push'
require 'lib/Animation'

--Entities
require 'src/Bill'

--State Machine
require 'src/StateMachine'
require 'state/BaseState'
require 'state/PlayState'
require 'state/TitleState'

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

    --Bill character images
    ['bill1'] = love.graphics.newImage('img/BillBlock1.png'),
    ['bill2'] = love.graphics.newImage('img/BillBlock2.png'),
    ['bill3'] = love.graphics.newImage('img/BillBlock3.png')
}