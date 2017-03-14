-- powerline.lua

local powerline = Class{}

local count = 0

function powerline:init(xin, yin, xout, yout)
  self.id = count + 1; count = self.id
  -- powerline vectors
  self.starting = Vector(xin or 0, yin or 0)
  self.ending   = Vector(xout or 0, yout or 0)
  self.distance = 0
  self.direction = nil
  -- powerline in and out
  self.input = nil
  self.output = nil
  -- electric orb list
  self.orbs = {}
  -- other
  self.status = 0
  self.fixed = false
  self.color = Color.BLACK
end

function powerline:update(dt)
  if not self.output then
    -- if powerline is not fixed then the ending can be displaced
    self.ending = Vector(love.mouse.getX(), love.mouse.getY())
  else
    -- if line is moved, remove orbs from it
    if self.input.dragged or self.output.dragged then self.orbs = {} end
    -- update line position
    if self.input then self.starting = Vector(self.input.centerx, self.input.centery) end
    if self.output then self.ending = Vector(self.output.centerx, self.output.centery) end
    self.distance = self.starting:dist(self.ending)
    self.direction = (self.ending - self.starting):normalized()
    -- power deperdition depending on input type
    local perdition = 0
    if self.input.type == 'plant' then perdition = 0.5 elseif self.input.type == 'pole' then perdition = 2 end
    -- update orbs position and value
    for i, orb in Helper.ripairs(self.orbs) do
      orb.vec = orb.vec + self.direction * dt * 100
      orb.power = Helper.clamp(orb.power - perdition * dt, 0, orb.power)
      if self.starting:dist(orb.vec) >= self.distance then
        self.output:receive(math.floor(orb.power))
        table.remove(self.orbs, i)
      elseif orb.power == 0 then table.remove(self.orbs, i) end
    end
  end
end

function powerline:mousepressed(x, y, button)
  if self.fixed then return end
  -- if right mouse is clicked, remove powerline
  if button == 2 then
    for i, powerline in Helper.ripairs(self.input.powerlines) do
      if powerline.id == self.id then table.remove(self.input.powerlines, i) return end
    end
  end
  -- if left mouse is clicked, connect to output
  if button == 1 then
    if self.input.type == 'plant' then
      self:connectto('pole', x, y)
    elseif self.input.type == 'pole' then
      self:connectto('house', x, y)
      self:connectto('pole', x, y)
      self:connectto('accumulator', x, y)
    elseif self.input.type == 'accumulator' then
      self:connectto('house', x, y)
    end
  end
end

function powerline:connectto(element, x, y)
  for _, elem in pairs(elements[element..'s']) do
    if elem.rect:contains(x, y) then
      -- avoid cross connecting two poles
      if element == 'pole' then
        for _, powerline in pairs(elem.powerlines) do
          if powerline.output == self.input then return end
        end
      end
      -- attach line to element
      self.ending = Vector(elem.centerx, elem.centery)
      self.output = elem
      self.fixed = true
      return
    end
  end
end

function powerline:send(pow)
  if math.floor(pow) > 0 then
    table.insert(self.orbs, { quads = quads.orb, vec = Vector(self.starting.x - 8, self.starting.y - 8), power = math.floor(pow) })
  end
end

function powerline:draw()
  love.graphics.setColor(self.color)
  love.graphics.line(self.starting.x, self.starting.y, self.ending.x, self.ending.y)
  love.graphics.setColor(Color.WHITE)
  for _, orb in pairs(self.orbs) do
    love.graphics.draw(images.elements, orb.quads[self.status], orb.vec.x, orb.vec.y)
    love.graphics.setColor(Color.BLACK)
    love.graphics.print(Helper.round(orb.power), orb.vec.x, orb.vec.y - 10)
    love.graphics.setColor(Color.WHITE)
  end
end

return powerline
