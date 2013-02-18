gui.Menu = class("gui.Menu")

gui.Menu.elements = {}

function gui.Menu:draw(...)
  for i,v in ipairs(self.elements) do
    v:draw(...)
  end
end