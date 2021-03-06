-- pole.lua

local pole = Class{ __includes = Element }

local count = 0

function pole:init(x, y) --[[>]] Element.init(self, 'pole', x, y)
  self.id = count + 1; count = self.id

  self.powerlines = {}
  self.storage = 0
  self.maxstorage = 200
  self.power = 0
  self.throughput = 0.5

  -- init timer for sending
  self.timer = Timer()
  self.timer:after(self.throughput, function(f) self:send() self.timer:after(self.throughput, f) end)
  -- init timer for storage depletion
  self.deplete = Timer()
  self.deplete:after(5, function(f) self.storage = Helper.clamp(self.storage - 1, 0, self.storage) self.deplete:after(5, f) end)
end

function pole:update(dt) --[[>]] Element.update(self, dt)
  for _, powerline in pairs(self.powerlines) do
    if powerline then powerline:update(dt) end
    -- color attached powerline when plant is hovered
    if self.hovered and powerline then powerline.color = Color.PINK
    elseif not self.hovered and powerline then powerline.color = Color.BLACK end
  end
  -- generate power every x seconds
  self.timer:update(dt)
  -- power depletion
  self.deplete:update(dt)
end

function pole:mousepressed(x, y, button) --[[>]] Element.mousepressed(self, x, y, button)
  -- create new powerline
  if button == 2 and not self.powerlines[#self.powerlines + 1] and self.rect:contains(x, y) then
    table.insert(self.powerlines, Powerline(self.centerx, self.centery))
    self.powerlines[#self.powerlines].input = self
  -- fix powerline
  elseif self.powerlines[#self.powerlines] then
    self.powerlines[#self.powerlines]:mousepressed(x, y, button)
  end
end

function pole:send()
  if self.storage == 0 then return end
  local pow = math.min(self.power, self.storage)
  for _, powerline in pairs(self.powerlines) do
    if powerline and powerline.output then
      powerline:send(pow / #self.powerlines)
      self.storage = Helper.clamp(self.storage - pow / #self.powerlines, 0, self.storage)
    end
  end
end

function pole:receive(pow)
  self.storage = Helper.clamp(self.storage + pow, 0, self.maxstorage)
  self.power   = pow
end

function pole:draw() --[[>]] Element.draw(self)
  for _, powerline in pairs(self.powerlines) do
    if powerline then powerline:draw() end
  end
  love.graphics.setColor(Color.BLACK)
  love.graphics.print(Helper.round(self.storage), self.x + self.width, self.y + self.height)
  love.graphics.setColor(Color.WHITE)
end

return pole
