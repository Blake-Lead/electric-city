-- element.lua

local element = Class{ __includes = Draggable }

function element:init(type, x, y) --[[>]] Draggable.init(self, x, y, 64, 64, true, true)
  self.type      = type
  self.img       = quads[type]
  self.status    = 0
  self.hovered   = false
  self.pressed   = false
  self.active    = true
  self.centerx   = x + self.width  / 2
  self.centery   = y + self.height / 2
  self.rand      = Helper.random()
end

function element:update(dt) --[[>]] Draggable.update(self, dt)
  -- check if element is hovered
  self.hovered = self.rect:contains(love.mouse.getX(), love.mouse.getY())
  -- set status of element in order to display the right icon
  if self.pressed then self.status = 3
  elseif self.hovered then self.status = 2
  elseif self.active then self.status = math.floor(os.clock() * 10) % 2
  else self.status = 0 end
  -- update center of element
  self.centerx   = self.x + self.width  / 2
  self.centery   = self.y + self.height / 2
end

function element:mousepressed(x, y, button) --[[>]] Draggable.mousepressed(self, x, y, button)
  -- as soon as the element is dropped (first time pressed) it cannot be dragged again
  self.draggable = false
end

function element:draw()
  love.graphics.setColor(Color.BLACK)
  love.graphics.print(self.id, self.x + self.width - 10 * #tostring(self.id), self.y)
  love.graphics.setColor(Color.WHITE)
  love.graphics.draw(images.icons, self.img[self.status], self.x, self.y)
end

return element
