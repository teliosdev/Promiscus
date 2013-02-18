states.mini.Normal = class("states.mini.Normal")

function states.mini.Normal:draw(...)
  self._mainState:draw(...)
end

function states.mini.Normal:update(...)
  self._mainState:update(...)
end

function states.mini.Normal:initialize(mainState)
  self._mainState = mainState
end

function states.mini.Normal:destroy() end