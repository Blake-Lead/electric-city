-- draggable.lua
-- base class for all draggable objects

local draggable = Class{}

function draggable:init(x, y, width, height, draggable, dragged)
  self.x, self.y = x, y
  self.width, self.height = width, height
  self.offsety, self.offsetx = width / 2, height / 2
  self.rect = Rectangle(self.x, self.y, self.width, self.height)
  self.draggable = draggable
  self.dragged = dragged
end

function draggable:update(dt)
  if not self.draggable then return end
  -- center dragged object to the cursor
  if self.dragged == true then
		self.x = love.mouse.getX() - self.offsetx
		self.y = love.mouse.getY() - self.offsety
	end
  -- update rectangle position
  self.rect.x, self.rect.y = self.x, self.y
end

function draggable:mousepressed(x, y, button)
  if not self.draggable then return end
  if button == 1 and self.rect:contains(x, y) then
    self.dragged = not self.dragged
    self.offsetx = x - self.x
    self.offsety = y - self.y
  end
end

return draggable
