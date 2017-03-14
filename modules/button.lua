-- button.lua

local button = Class{}

function button:init(label, quads, x, y)
  self.label = label
  self.quads = quads
  self.status = 0
  self.x = x or 0
  self.y = y or 0
  self.hovered = false
  self.pressed = false
  self.rect = Rectangle(self.x, self.y, 64, 64)
end

function button:update(dt)
  self.hovered = self.rect:contains(love.mouse.getX(), love.mouse.getY())
  if self.pressed then self.status = 2
  elseif self.hovered then self.status = 1
  else self.status = 0 end
end

function button:mousepressed(x, y, button)
  self.pressed = button == 1 and self.rect:contains(x, y)
end

function button:mousereleased(x, y, button)
  if button == 1 and self.rect:contains(x, y) then return self.label end
end

function button:draw()
  love.graphics.draw(images.icons, self.quads[self.status], self.x, self.y)
end

return button
