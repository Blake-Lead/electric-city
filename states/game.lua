-- game.lua

local game = {}

elements = {}
elements.buttons       = {}
elements.houses        = {}
elements.poles         = {}
elements.plants        = {}
elements.accumulators  = {}

function game:init()
  -- background rectangle
  self.background = Rectangle(0, 0, screen.width, screen.height, Color.peachd(-50))
  -- buttons
  elements.buttons = {}
  elements.buttons.house       = Button('house',       quads.housebtn,        10, screen.height - 74)
  elements.buttons.pole        = Button('pole',        quads.polebtn,         84, screen.height - 74)
  elements.buttons.plant       = Button('plant',       quads.plantbtn,       158, screen.height - 74)
  elements.buttons.accumulator = Button('accumulator', quads.accumulatorbtn, 232, screen.height - 74)
  -- elements lists

  Signal.register('create-house', function(x, y) table.insert(elements.houses, House(x, y)) end)
  Signal.register('create-pole',  function(x, y) table.insert(elements.poles,  Pole(x, y))  end)
  Signal.register('create-plant', function(x, y) table.insert(elements.plants, Plant(x, y)) end)
  Signal.register('create-accumulator', function(x, y) table.insert(elements.accumulators, Accumulator(x, y)) end)
end

function game:update(dt)
  for _, elem in pairs(elements) do for _, sub in pairs(elem) do sub:update(dt) end end
end

function game:mousepressed(x, y, button)
  for _, elem in pairs(elements) do for _, sub in pairs(elem) do sub:mousepressed(x, y, button) end end
end

function game:mousereleased(x, y, button)
  -- create element if corresponding button was pressed
  for _, btn in pairs(elements.buttons) do
    local type = btn:mousereleased(x, y, button)
    if type then Signal.emit('create-'..type, x, y) end
  end
end

function game:keypressed(key)
  if key == 'escape' then
    for _, elem in pairs(elements) do for _, sub in pairs(elem) do
      if sub.draggable then table.remove(elem, i) return end
    end end
  end
end

function game:draw()
  self.background:draw()
  for _, elem in pairs(elements) do for _, sub in pairs(elem) do sub:draw() end end
end

return game
