title = { main={}, save={}, new={} }


state:addState(0, title.main)
state:addState(1, title.save)
state:addState(2, title.new )

require "menu"

function title.main.draw()
  love.graphics.setFont(font.large)
  love.graphics.print("Promiscus", 325, 100)
  love.graphics.setFont(font.default)
end


function title.main.nextState(...)
  state:change(1)
end

setmetatable(title.main, { 
  __index=function(t, key)
    print(t)
    print(key)
    if key == 'draw' then
      return t.draw
    elseif key == 'nextState' then
      return t.nextState
    elseif key == 'mouseUp' or key == 'keyUp' then
      return t.nextState
    end
  end })

function title.save.draw()
  love.graphics.setFont(font.large)
  love.graphics.print("Promiscus", 325, 50)
  love.graphics.setFont(font.default)
  --love.graphics.setColor(10, 10, 245)
  --love.graphics.rectangle("fill", 240, 150, 300, 50)
  --love.graphics.rectangle("fill", 240, 210, 300, 50)
  --love.graphics.setColor(255, 255, 255)
  --love.graphics.setFont(font.medium)
  --love.graphics.print("play", 370, 165, 0)
  --love.graphics.print("load", 370, 225, 0)
end

-- we use mouse up so we don't accidentally fire a "mouseDown" event in another
-- state.
function title.save.mouseUp(x, y, button)
  if button == 'l' and 240 < x and x < (240 + 300) then
    if 150 < y and y < (150 + 50) then
      world.save = Save:new({ player = Player:new() })
      currentPlayer = world.save.player
      state:change(3)
    elseif 210 < y and y < (210 + 50) then
      world.save = Save.fromFile("main")
      currentPlayer = world.save.player
      state:change(3)
    end
  end
end