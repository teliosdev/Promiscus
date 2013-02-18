states.Default = class("states.game.Default", State)
local Default = states.Default

function Default:update()
  if love.keyboard.isDown("lctrl") and love.keyboard.isDown("d") then
    self:setMiniState("Console")
  end
end

function Default:draw()
  love.graphics.print(love.timer.getDelta(), 0, 0)
  love.graphics.print(self.class.name, 0, 10)
  love.graphics.setColor(255, 0, 0)
  love.graphics.rectangle("fill", 50, 50, 100, 100)
  love.graphics.setColor(255, 255, 255)
end