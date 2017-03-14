-- line.lua

local line = Class{}

function line:init(xin, yin, xout, yout)
  -- line vectors
  self.starting = Vector(xin or 0, yin or 0)
  self.ending   = Vector(xout or 0, yout or 0)
  self.distance = 0
  self.direction = nil
  -- line in and out
  self.input = nil
  self.output = nil
  -- electric orb list
  self.orbs = {}
  -- other
  self.status = 0
  self.fixed = false
  self.color = Color.BLACK
end

function line:update(dt)
  if not self.fixed then
    -- if line is not fixed then the ending can be displaced
    self.ending.x, self.ending.y = love.mouse.getX(), love.mouse.getY()
  else
    for i, orb in Helper.ripairs(self.orbs) do
      orb.vec = orb.vec + self.direction * dt * 100
      local perdition = 0
      if self.input.type == 'plant' then perdition = 0.5 elseif self.input.type == 'pole' then perdition = 2 end
      orb.power = Helper.clamp(orb.power - perdition * dt, 0, orb.power)
      if self.starting:dist(orb.vec) >= self.distance then
        self.output:receive(math.floor(orb.power))
        table.remove(self.orbs, i)
      elseif orb.power == 0 then table.remove(self.orbs, i) end
    end
  end
end

function line:mousepressed(x, y, button)
  if self.fixed then return end
  -- fix the line if it isn't already
  if self.input.type == 'plant' then
    for _, pole in pairs(elements.poles) do
      if pole.rect:contains(x, y) then
        self.ending.x, self.ending.y = pole.centerx, pole.centery
        self.output = pole
        self.fixed = true
        self.distance = self.starting:dist(self.ending)
        self.direction = (self.ending - self.starting):normalized()
        return
      end
    end
  end
  if self.input.type == 'pole' then
    for _, house in pairs(elements.houses)  do
      if house.rect:contains(x, y) then
        self.ending.x, self.ending.y = house.centerx, house.centery
        self.output = house
        self.fixed = true
        self.distance = self.starting:dist(self.ending)
        self.direction = (self.ending - self.starting):normalized()
        return
      end
    end
    for _, pole in pairs(elements.poles)  do
      if pole.rect:contains(x, y) then
        self.ending.x, self.ending.y = pole.centerx, pole.centery
        self.output = pole
        self.fixed = true
        self.distance = self.starting:dist(self.ending)
        self.direction = (self.ending - self.starting):normalized()
        return
      end
    end
  end
end

function line:send(pow)
  if math.floor(pow) == 0 then return end
  table.insert(self.orbs, { quads = quads.orb, vec = Vector(self.starting.x - 8, self.starting.y - 8), power = math.floor(pow) })
end

function line:draw()
  love.graphics.setColor(self.color)
  love.graphics.line(self.starting.x, self.starting.y, self.ending.x, self.ending.y)
  love.graphics.setColor(Color.WHITE)
  if self.fixed then
    for _, orb in pairs(self.orbs) do
      love.graphics.draw(images.elements, orb.quads[self.status], orb.vec.x, orb.vec.y)
      love.graphics.setColor(Color.BLACK)
      love.graphics.print(Helper.round(orb.power), orb.vec.x, orb.vec.y - 10)
      love.graphics.setColor(Color.WHITE)
    end
  end
end

return line
