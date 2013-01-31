require "state"
require "player"
require "save"

font = {}

function love.update()
  -- game data goes here
  State.update()
end

function love.draw()
  State.draw()
  love.graphics.print(string.format("frametime: %f, fps: %i", love.timer.getDelta(), love.timer.getFPS()), 0, 0)
end

function love.load()
  gameHasFocus = true
  font.default = love.graphics.newFont(12)
  font.medium  = love.graphics.newFont(18)
  font.large   = love.graphics.newFont(24)
  --love.mouse.setVisible(false)
end

-- he wouldn't ever leave us, would he? :(
function love.focus(f)
  gameHasFocus = f
end

function love.keypressed(char, unicode)
    State.keyDown(char, unicode)
end

function love.keyreleased(char, unicode)
  State.keyUp(char, unicode)
  
  if key == "escape" then
    love.event.push("q")   -- actually causes the app to quit
  end
end

function love.mousepressed(x, y, button)
  State.mouseDown(x, y, button)
end

function love.mousereleased(x, y, button)
  State.mouseUp(x, y, button)
end

function love.quit()
  print("He left me :(")
end