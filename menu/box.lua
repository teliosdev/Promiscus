--[[
  This is ideally used for menu internally, for structuring where each element
  is located on the screen.

  It keeps track of a part of the screen by keeping track of the top left
  corner and the bottom right corner.  This is so that elements on the menu
  don't overlap.
]]

local Box = {
  topX = 0,
  topY = 0,
  sizeX = 0,
  sizeY = 0,
  bottomX = 0,
  bottomY = 0
}
Menu.Box = Box

function Box:new(o)
  o = o or {}
  setmetatable(o, { __index=self })
  return o:refreshStats()
end

-- Sets the size of the box from the top left corner and a given size.
function Box:setSize(x, y, sx, sy)
  self.topX  = x
  self.topY  = y
  self.sizeX = sx or self.sizeX or 0
  self.sizeY = sy or self.sizeY or 0

  return self:refreshStats()
end

function Box:addSize(sy, sx)
  self.sizeX = self.sizeX + (sx or 0)
  self.sizeY = self.sizeY + sy

  return self:refreshStats()
end

function Box:addSizeDifference(otherBox)
  local addX, addY
  if otherBox.sizeX < self.sizeX then
    addX = 0
  else
    addX = otherBox.sizeX - self.sizeX
  end

  if otherBox.sizeY < self.sizeY then
    addY = 0
  else
    addY = otherBox.sizeY - self.sizeY
  end

  return self:addSize(addY, addX)
end

function Box:subSize(sy, sx)
  self.sizeX = self.sizeX - (sx or 0)
  self.sizeY = self.sizeY - sy

  return self:refreshStats()
end

function Box:refreshStats()
  self.bottomX = self.topX + self.sizeX
  self.bottomY = self.topY + self.sizeY
  return self
end

-- er, sure...
function Box:draw(love, cr, cg, cb)
  local r, g, b, a = love.graphics.getColor()
  love.graphics.setColor(cr or 255, cg or 0, cb or 0)
  love.graphics.rectangle("line", self.topX, self.topY, self.sizeX, self.sizeY)
  love.graphics.print(self:toString(), self.topX, self.bottomY + 13)
  love.graphics.setColor(r, g, b, a)
end


function Box:toString()
  return string.format([[
    Top: (%i, %i)
    Size: (%i, %i)
    Bottom: (%i, %i)
  ]], self.topX, self.topY, self.sizeX, self.sizeY, self.bottomX, self.bottomY)
end