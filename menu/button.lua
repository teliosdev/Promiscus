--[[Menu.Button  = {}

function Menu.Button:new(xPos, yPos, xSize, ySize, color)
  if type(xPos) == 'table' then
    o = xPos
    xPos = nil
  else
    o = { 
      ["xPos"] = xPos;
      ["yPos"] = yPos;
      ["text"] = "";
      ["xSize"] = xSize;
      ["ySize"] = ySize;
      ["color"] = color;
      ["origColor"] = color;
    }
  end

  setmetatable(o, { __index=self })
  return o
end

function Menu.Button:draw(love)
  love.graphics.setColor(self.color[1], self.color[2], self.color[3], 
                         self.color[4] or 255)
  love.graphics.rectangle("fill", self.xPos, self.yPos, self.xSize, 
                           self.ySize)
  love.graphics.reset()

  if self.text and #self.text > 0 then
    love.graphics.setFont(font.default)
    love.graphics.print()
  end
end

function Menu.Button:setHover(hover, newColor)
  if hover then
    self.color = newColor
  else
    self.color = self.origColor
  end
end

function Menu.Button:setDraw(drawFunc)
  self.draw = drawFunc
end

function Menu.Button:isWithin(x, y)
  return (self.xPos > x and x < self.xPos + self.xSize) and
         (self.yPos > y and y < self.yPos + self.ySize)
end

]]--

local Button = {
  selected = false,
  color    = {r=0, g=0, b=255, a=1},
  text     = nil,
  selectedColor = {r=0, g=255, b=0, a=1}
}
Menu.Button = Button

function Button:new(o)
  o = o or {}
  setmetatable(o, { __index=self })
  return o
end

function Button:draw(love)

end