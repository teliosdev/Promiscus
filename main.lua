require "state"

font = {}

function love.update()
  -- game data goes here
  state.update()
end

function love.draw()
  state.draw()
  love.graphics.print(string.format("frametime: %f, fps: %i", love.timer.getDelta(), love.timer.getFPS()), 0, 0)
end

function love.load()
  gameHasFocus = true
  font.default = love.graphics.newFont(12)
  font.medium = love.graphics.newFont(18)
  font.large = love.graphics.newFont(24)
end

-- he wouldn't ever leave us, would he? :(
function love.focus(f)
  gameHasFocus = f
end

function love.keypressed(char, unicode)
    state.keyDown(char, unicode)
end

function love.keyreleased(char, unicode)
  if key == "escape" then
    love.event.push("quit")   -- actually causes the app to quit
  else
    state.keyUp(char, unicode)
  end
end

function love.mousepressed(x, y, button)
  state.mouseDown(x, y, button)
end

function love.mousereleased(x, y, button)
  state.mouseUp(x, y, button)
end

function love.quit()
  print("He left me :(")
end