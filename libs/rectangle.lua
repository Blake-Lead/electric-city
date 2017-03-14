-- rectangle.lua
-- small wrapper for drawing a colored rectangle.

local rectangle = Class{}

function rectangle:init(x, y, width, height, color, xr, yr, mode)
    self.x = x or 0
    self.y  = y or 0
    self.width = width or 0
    self.height = height or 0
    self.color = color or {0, 0, 0, 255}
    self.mode = mode or 'fill'
    self.xr = xr or 0
    self.yr = yr or 0
    self.xcenter = x + width  / 2
    self.ycenter = y + height / 2
end

function rectangle:draw()
	love.graphics.setColor(self.color)
  love.graphics.rectangle(self.mode, self.x, self.y, self.width, self.height, self.xr, self.yr)
end

function rectangle:contains(x, y)
  return x > self.x and x < self.x + self.width and y > self.y and y < self.y + self.height
end

-- got this function from love2d forum: https://love2d.org/forums/viewtopic.php?f=5&t=77970
function rectangle:collidewith(other)
	local direction = false
	if  self.x  < other.x + other.width  and other.x < self.x  + self.width
  and self.y  < other.y + other.height and other.y < self.y  + self.height then

		local cx1, cy1 = self.x  + self.width  / 2, self.y  + self.height  / 2
		local cx2, cy2 = other.x + other.width / 2, other.y + other.height / 2

		local t1, b1, l1, r1 = self.y,  self.y  + self.height,  self.x,  self.x  + self.width
		local t2, b2, l2, r2 = other.y, other.y + other.height, other.x, other.x + other.width

    local q
		if cx1 <= cx2 and cy1 <= cy2 then q = 1 end
		if cx1 >= cx2 and cy1 <= cy2 then q = 2 end
		if cx1 >  cx2 and cy1 >  cy2 then q = 3 end
		if cx1 <  cx2 and cy1 >  cy2 then q = 4 end

		if     b1-t2 > r2-l1 and q == 2 or b2-t1 < r1-l2 and q == 3 then direction = 'right'
		elseif b1-t2 > r1-l2 and q == 1 or b2-t1 > r1-l2 and q == 4 then direction = 'left'
		elseif b1-t2 < r2-l1 and q == 2 or b1-t2 < r1-l2 and q == 1 then direction = 'top'
		elseif b2-t1 < r2-l1 and q == 3 or b2-t1 < r1-l2 and q == 4 then direction = 'bottom'
		else                                                             direction = 'none' end
	end
	return direction
end

return rectangle
