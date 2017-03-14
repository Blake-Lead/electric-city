-- resources.lua

images = {}
quads  = {}

-- spritesheets
images.icons      = love.graphics.newImage('assets/ec-icons.png')
images.elements   = love.graphics.newImage('assets/ec-elements.png')

-- house button
quads.housebtn    = {}
quads.housebtn[0] = love.graphics.newQuad(64 * 0, 64 * 0, 64, 64, images.icons:getDimensions())
quads.housebtn[1] = love.graphics.newQuad(64 * 0, 64 * 1, 64, 64, images.icons:getDimensions())
quads.housebtn[2] = love.graphics.newQuad(64 * 0, 64 * 2, 64, 64, images.icons:getDimensions())

-- house icon
quads.house       = {}
quads.house[0]    = love.graphics.newQuad(64 * 0, 64 * 3, 64, 64, images.icons:getDimensions())
quads.house[1]    = love.graphics.newQuad(64 * 0, 64 * 4, 64, 64, images.icons:getDimensions())
quads.house[2]    = love.graphics.newQuad(64 * 0, 64 * 5, 64, 64, images.icons:getDimensions())
quads.house[3]    = love.graphics.newQuad(64 * 0, 64 * 6, 64, 64, images.icons:getDimensions())

-- pole button
quads.polebtn     = {}
quads.polebtn[0]  = love.graphics.newQuad(64 * 1, 64 * 0, 64, 64, images.icons:getDimensions())
quads.polebtn[1]  = love.graphics.newQuad(64 * 1, 64 * 1, 64, 64, images.icons:getDimensions())
quads.polebtn[2]  = love.graphics.newQuad(64 * 1, 64 * 2, 64, 64, images.icons:getDimensions())

-- pole icon
quads.pole        = {}
quads.pole[0]     = love.graphics.newQuad(64 * 1, 64 * 3, 64, 64, images.icons:getDimensions())
quads.pole[1]     = love.graphics.newQuad(64 * 1, 64 * 4, 64, 64, images.icons:getDimensions())
quads.pole[2]     = love.graphics.newQuad(64 * 1, 64 * 5, 64, 64, images.icons:getDimensions())
quads.pole[3]     = love.graphics.newQuad(64 * 1, 64 * 6, 64, 64, images.icons:getDimensions())

-- plant button
quads.plantbtn    = {}
quads.plantbtn[0] = love.graphics.newQuad(64 * 2, 64 * 0, 64, 64, images.icons:getDimensions())
quads.plantbtn[1] = love.graphics.newQuad(64 * 2, 64 * 1, 64, 64, images.icons:getDimensions())
quads.plantbtn[2] = love.graphics.newQuad(64 * 2, 64 * 2, 64, 64, images.icons:getDimensions())

-- plant icon
quads.plant       = {}
quads.plant[0]    = love.graphics.newQuad(64 * 2, 64 * 3, 64, 64, images.icons:getDimensions())
quads.plant[1]    = love.graphics.newQuad(64 * 2, 64 * 4, 64, 64, images.icons:getDimensions())
quads.plant[2]    = love.graphics.newQuad(64 * 2, 64 * 5, 64, 64, images.icons:getDimensions())
quads.plant[3]    = love.graphics.newQuad(64 * 2, 64 * 6, 64, 64, images.icons:getDimensions())

-- health icon
quads.health      = {}
quads.health[0]   = love.graphics.newQuad(16 * 9, 0, 16, 64, images.elements:getDimensions())
quads.health[1]   = love.graphics.newQuad(16 * 8, 0, 16, 64, images.elements:getDimensions())
quads.health[2]   = love.graphics.newQuad(16 * 7, 0, 16, 64, images.elements:getDimensions())
quads.health[3]   = love.graphics.newQuad(16 * 6, 0, 16, 64, images.elements:getDimensions())
quads.health[4]   = love.graphics.newQuad(16 * 5, 0, 16, 64, images.elements:getDimensions())
quads.health[5]   = love.graphics.newQuad(16 * 4, 0, 16, 64, images.elements:getDimensions())
quads.health[6]   = love.graphics.newQuad(16 * 3, 0, 16, 64, images.elements:getDimensions())
quads.health[7]   = love.graphics.newQuad(16 * 2, 0, 16, 64, images.elements:getDimensions())
quads.health[8]   = love.graphics.newQuad(16 * 1, 0, 16, 64, images.elements:getDimensions())
quads.health[9]   = love.graphics.newQuad(16 * 0, 0, 16, 64, images.elements:getDimensions())

-- electric orb icon
quads.orb         = {}
quads.orb[0]      = love.graphics.newQuad( 0, 64, 16, 16, images.elements:getDimensions())
quads.orb[1]      = love.graphics.newQuad(16, 64, 16, 16, images.elements:getDimensions())
