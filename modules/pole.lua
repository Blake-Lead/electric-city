-- pole.lua

local pole = Class{ __includes = Element }

local count = 0

function pole:init(x, y) --[[>]] Element.init(self, 'pole', x, y)
  self.id = count + 1; count = self.id

  self.lines = { nil, nil, nil }
end

function pole:update(dt) --[[>]] Element.update(self, dt)
  for _, line in pairs(self.lines) do
    if line then line:update(dt) end
    -- color attached line when plant is hovered
    if self.hovered and line then line.color = Color.PINK
    elseif not self.hovered and line then line.color = Color.BLACK end
  end
end

function pole:mousepressed(x, y, button) --[[>]] Element.mousepressed(self, x, y, button)
  -- create new line
  if button == 2 and not self.lines[#self.lines + 1] and self.rect:contains(x, y) then
    table.insert(self.lines, Line(self.centerx, self.centery))
    self.lines[#self.lines].input = self
    return
  -- fix line
  elseif button == 1 and self.lines[#self.lines] then
    self.lines[#self.lines]:mousepressed(x, y, button)
  end
end

function pole:receive(pow)
  for _, line in pairs(self.lines) do
    if line then line:send(pow / #self.lines) end
  end
end

function pole:draw() --[[>]] Element.draw(self)
  for _, line in pairs(self.lines) do
    if line then line:draw() end
  end
end

return pole
