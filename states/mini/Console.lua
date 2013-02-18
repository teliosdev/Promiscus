states.mini.Console = class("states.mini.Console")
--local Console = states.mini.Console

function states.mini.Console:draw()
  love.graphics.print("debug", 0, 0)
end

function states.mini.Console:update()

end

function states.mini.Console:initialize(mainState)
  self._mainState = mainState
end

function states.mini.Console:destroy() end