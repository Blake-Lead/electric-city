-- plant.lua

local plant = Class{ __includes = Element }

local count = 0

function plant:init(x, y) --[[>]] Element.init(self, 'plant', x, y)
  self.id = count + 1; count = self.id
  self.powerline = nil

  self.power = 50
  self.throughput = 2

  -- init timer for sending
  self.timer = Timer()
  self.timer:after(self.throughput, function(f) self:send() self.timer:after(self.throughput, f) end)
end

function plant:send()
  if self.powerline then self.powerline:send(self.power) end
end

function plant:update(dt) --[[>]] Element.update(self, dt)
  -- update powerline
  if self.powerline then self.powerline:update(dt) end
  -- color attached powerline when plant is hovered
  if self.hovered and self.powerline then self.powerline.color = Color.DARKPURPLE
  elseif not self.hovered and self.powerline then self.powerline.color = Color.BLACK end
  -- generate power every x seconds
  self.timer:update(dt)
end

function plant:mousepressed(x, y, button) --[[>]] Element.mousepressed(self, x, y, button)
  -- create new powerline
  if button == 2 and not self.powerline and self.rect:contains(x, y) then
    self.powerline = Powerline(self.centerx, self.centery)
    self.powerline.input = self
  -- remove powerline
  elseif button == 2 and self.powerline and self.rect:contains(x, y) then
    self.powerline = nil
  -- fix powerline
  elseif self.powerline then
    self.powerline:mousepressed(x, y, button)
  end
end

function plant:draw() --[[>]] Element.draw(self)
  if self.powerline then self.powerline:draw() end
end

return plant
