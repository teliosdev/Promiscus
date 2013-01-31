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

function Menu:draw(love)
  for i, drawable in pairs(self.elements) do
    drawable:draw(love)
  end
end

function Menu:keyDown(char)

end

require "menu/button"