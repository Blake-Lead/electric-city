-- main.lua

function love.load()
  require 'globals'
  require 'resources'
  Log.outfile = 'debug.log'
  Log.debug('Log file creation')
  Gamestate.registerEvents()
  Gamestate.switch(Game)
end
