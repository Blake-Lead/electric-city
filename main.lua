-- main.lua

function love.load()
  require 'globals'
  require 'resources'

  Log.outfile = 'debug.log'
  Log.debug('Starting game.')
  
  Gamestate.registerEvents()
  Gamestate.switch(Game)
end
