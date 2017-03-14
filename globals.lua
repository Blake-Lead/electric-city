-- globals.lua

Class       = require 'libs.hump.class'
Signal      = require 'libs.hump.signal'
Vector      = require 'libs.hump.vector'
Timer       = require 'libs.hump.timer'
Gamestate   = require 'libs.hump.gamestate'
Rectangle   = require 'libs.rectangle'
Color       = require 'libs.color'
Helper      = require 'libs.lume'
Log         = require 'libs.log'

Menu        = require 'states.menu'
Game        = require 'states.game'
GameOver    = require 'states.gameover'

Draggable   = require 'modules.draggable'
Element     = require 'modules.element'
Button      = require 'modules.button'
Accumulator = require 'modules.accumulator'
House       = require 'modules.house'
Plant       = require 'modules.plant'
Pole        = require 'modules.pole'
Powerline        = require 'modules.powerline'

screen = {
  width  = love.graphics.getWidth(),
  height = love.graphics.getHeight(),
  ratio  = love.graphics.getWidth() / love.graphics.getHeight()
}
