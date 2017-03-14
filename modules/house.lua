-- house.lua

local house = Class{ __includes = Element }

local count = 0

function house:init(x, y) --[[>]] Element.init(self, 'house', x, y)
  self.healthimg = quads.health
  self.health = 9

  self.input = nil

  self.id = count + 1; count = self.id
end

function house:update(dt) --[[>]] Element.update(self, dt)
  -- if house is not draggable, activate health depletion
  if not self.draggable then self.health = Helper.lerp(self.health, 0, 0.1 * dt) end
  if Helper.round(self.health) == 0 then self.active = false else self.active = true end
end

function house:mousepressed(x, y, button) --[[>]] Element.mousepressed(self, x, y, button)
end

function house:receive(pow)
  self.health = Helper.clamp(self.health + pow / 10, 0, 9)
end

function house:draw() --[[>]] Element.draw(self)
  love.graphics.draw(images.elements, self.healthimg[Helper.round(self.health)], self.x - 16, self.y)
end

return house
