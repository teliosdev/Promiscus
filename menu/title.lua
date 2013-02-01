local Title = {}
Menu.Title = Title

function Title:new(o)
  o = o or {}
  setmetatable(o, { __index=self })
  return o
end

function Title:draw(love, givenBox)
  givenBox:addSize(25)
  love.graphics.setFont(font.large)
  love.graphics.printf(self.text, givenBox.topX, givenBox.topY, givenBox.sizeX, "center")
  love.graphics.setFont(font.default)
  givenBox:addSize(10)
end