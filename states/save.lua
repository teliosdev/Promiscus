States.Save = State:new("Save") -- Save is already defined, so...
local saveMenu
require "menu"

saveMenu = Menu:new(function(menu)
  menu:addElement("title", Menu.Title:new{
    text = "Promiscus"
  })
end)

function States.Save.draw()
  saveMenu:draw(love, { topY = 10, topX = (800 - 400)/2, sizeX = 400 })
end

-- we use mouse up so we don't accidentally fire a "mouseDown" event in another
-- state.
function States.Save.mouseUp(x, y, button)
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

print("SAVE REQUIRED")