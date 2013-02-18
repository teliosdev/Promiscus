Tools.Scale = {}
local Scale = Tools.Scale

function Scale:setPrefs(width, height)
  self._prefWidth  = width or 800
  self._prefHeight = height or 600
  self._prefRatio  = self._prefWidth/self._prefHeight
  self:updateScreen()
end

--[[
  We're going to use this function to resolve some maths for us before hand, so
  that we don't have to do it later.
]]
function Scale:updateScreen()
  local screenWidth, screenHeight = love.graphics.getWidth(), 
    love.graphics.getHeight()
  local screenRatio = screenWidth/screenHeight

  local widthRatio, heightRatio = 0, 0

  -- this means we just need to scale
  if screenRatio == self._prefRatio then
    self._scaleBy = screenWidth / self._prefWidth
    self._translate = { 0, 0 }
    self._screenSize = { screenWidth, screenHeight }
  else
    widthRatio, heightRatio = screenWidth/self._prefWidth, 
      screenHeight/self._prefHeight

    if widthRatio > heightRatio then
      self._scaleBy = screenHeight/self._prefHeight
      self._translate = { (screenWidth - (self._prefWidth * self._scaleBy))/2, 0 }
      self._screenSize = { (self._prefWidth * self._scaleBy), screenHeight }
    else
      self._scaleBy = screenWidth/self._prefHeight
      self._translate = { 0, (screenHeight - (self._prefHeight * self._scaleBy))/2 }
      self._screenSize = { screenWidth, (self.prefHeight * self._scaleBy) }
    end
  end
end

--[[function Scale:setScreen(w, h)

end]]

function Scale:transform()
  love.graphics.translate(self._translate[1], self._translate[2])
  love.graphics.scale(self._scaleBy)
end

function Scale:letterbox()

end