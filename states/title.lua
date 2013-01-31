local Title = State:new()
States.Title = Title

function Title.draw()
  love.graphics.setFont(font.large)
  love.graphics.print("Promiscus", 325, 100)
  love.graphics.setFont(font.default)
  love.graphics.print("Note: use your keyboard keys.", 0, 586)
end

function Title.keyUp()
	State:changeState(States.Save)
end