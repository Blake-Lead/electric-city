-- plant.lua

local plant = Class{ __includes = Element }

local count = 0

function plant:init(x, y) --[[>]] Element.init(self, 'plant', x, y)
  self.id = count + 1; count = self.id

  self.line = nil
  self.time = os.clock()

  self.power = 50
  self.throughput = 20
end

function plant:update(dt) --[[>]] Element.update(self, dt)
  if self.line then self.line:update(dt) end
  -- color attached line when plant is hovered
  if self.hovered and self.line then self.line.color = Color.DARKPURPLE
  elseif not self.hovered and self.line then self.line.color = Color.BLACK end
  -- generate power
  if self.line and os.clock() - self.time > 1 / self.throughput then
    self.time = os.clock()
    self.line:send(self.power)
  end
end

function plant:mousepressed(x, y, button) --[[>]] Element.mousepressed(self, x, y, button)
  -- create new line
  if button == 2 and not self.line and self.rect:contains(x, y) then
    self.line = Line(self.centerx, self.centery)
    self.line.input = self
  -- fix line
  elseif button == 1 and self.line then
    self.line:mousepressed(x, y, button)
  end
end

function plant:draw() --[[>]] Element.draw(self)
  if self.line then self.line:draw() end
end

return plant
