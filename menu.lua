Menu = {}

-- The menu is more 

function Menu:new(func)
  local menu = { elements={}, selectedElement={} }
  setmetatable(menu, { __index=self })
  func(menu)
  return menu
end

function Menu:addElement(name, element)
  self.elements[name] = element
end

function Menu:draw(love, at)

  local bigBox = Menu.Box:new{
    topX = at.topX or 0,
    topY = at.topY or 0,
    sizeX = at.sizeX or 250
  }
  local lastBox = Menu.Box:new{
    topX = at.topX or 0,
    topY = at.topY or 0,
    sizeX = at.sizeX or 250
  }
  local currentBox = Menu.Box:new{
    topX = at.topX or 0,
    topY = at.topY or 0,
    sizeX = at.sizeX or 250
  }

  for i, drawable in pairs(self.elements) do
    currentBox:setSize(bigBox.topX, lastBox.bottomY, nil, lastBox.sizeY)
    drawable:draw(love, currentBox)
    bigBox:addSizeDifference(currentBox)
    lastBox = currentBox
    currentBox = Menu.Box:new()
    lastBox:draw(love)
  end

  bigBox:draw(love, 0, 255, 0)

  return bigBox
end

function Menu:keyUp(char)

end

function Menu:moveSelectionDown()
  local lastWasSelected = false

  for i, drawable in pairs(self.elements) do
    if drawable.selected and not lastWasSelected then
      drawable.selected = false
      lastWasSelected = true
    elseif not drawable.selected and lastWasSelected then
      drawable.selected = true
      lastWasSelected = false
    end
  end
end

function Menu:moveSelectionUp()

end

function Menu:mouseUp(x, y)

end

require "menu/box"
require "menu/title"
require "menu/button"