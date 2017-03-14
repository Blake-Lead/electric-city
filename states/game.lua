-- game.lua

local game = {}

elements = {}
elements.buttons = {}
elements.houses  = {}
elements.poles   = {}
elements.plants  = {}

function game:init()
  -- background rectangle
  self.background = Rectangle(0, 0, screen.width, screen.height, Color.peachd(-50))
  -- buttons
  elements.buttons = {}
  elements.buttons.house = Button('house', quads.housebtn,  10, screen.height - 74)
  elements.buttons.pole  = Button('pole',  quads.polebtn,   84, screen.height - 74)
  elements.buttons.plant = Button('plant', quads.plantbtn, 158, screen.height - 74)
  -- elements lists

  Signal.register('create-house', function(x, y) table.insert(elements.houses, House(x, y)) end)
  Signal.register('create-pole',  function(x, y) table.insert(elements.poles,  Pole(x, y))  end)
  Signal.register('create-plant', function(x, y) table.insert(elements.plants, Plant(x, y)) end)
end

function game:update(dt)
  for _, btn   in pairs(elements.buttons) do btn:update(dt)   end
  for _, house in pairs(elements.houses)  do house:update(dt) end
  for _, pole  in pairs(elements.poles)   do pole:update(dt)  end
  for _, plant in pairs(elements.plants)  do plant:update(dt) end
end

function game:mousepressed(x, y, button)
  for _, btn   in pairs(elements.buttons) do btn:mousepressed(x, y, button)   end
  for _, house in pairs(elements.houses)  do house:mousepressed(x, y, button) end
  for _, pole  in pairs(elements.poles)   do pole:mousepressed(x, y, button)  end
  for _, plant in pairs(elements.plants)  do plant:mousepressed(x, y, button) end
end

function game:mousereleased(x, y, button)
  -- create element if corresponding button was pressed
  for _, btn in pairs(elements.buttons) do
    local type = btn:mousereleased(x, y, button)
    if type then Signal.emit('create-'..type, x, y) end
  end
end

function game:draw()
  self.background:draw()
  for _, btn   in pairs(elements.buttons) do btn:draw()   end
  for _, plant in pairs(elements.plants)  do plant:draw() end
  for _, house in pairs(elements.houses)  do house:draw() end
  for _, pole  in pairs(elements.poles)   do pole:draw()  end
end

return game
