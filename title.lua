title = { main={}, save={} }


function title.main.draw()
  love.graphics.setFont(font.large)
  love.graphics.print("Promiscus", 325, 100)
  love.graphics.setFont(font.default)
end

function title.main.nextState(...)
  state.change(1)
end

function title.save.draw()
  love.graphics.setFont(font.large)
  love.graphics.print("Promiscus", 325, 50)
  love.graphics.setColor(10, 10, 245)
  love.graphics.rectangle("fill", 240, 150, 300, 50)
  love.graphics.rectangle("fill", 240, 210, 300, 50)
  love.graphics.setColor(255, 255, 255)
  love.graphics.setFont(font.medium)
  love.graphics.print("play", 370, 165, 0)
  love.graphics.print("load", 370, 225, 0)
  love.graphics.setFont(font.default)
end

-- we use mouse up so we don't accidentally fire a "mouseDown" event in another
-- state.
function title.save.mouseUp(x, y, button)
  if button == 'l' and 240 < x and x < (240 + 300) then
    if 150 < y and y < (150 + 50) then
      world.save = Save:new({ player = Player:new() })
      currentPlayer = world.save.player
      state.change(2)
    elseif 210 < y and y < (210 + 50) then
      world.save = Save.fromFile("main.save")
      currentPlayer = world.save.player
      state.change(2)
    end
  end
end