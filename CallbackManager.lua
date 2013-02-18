CallbackManager = class("CallbackManager")
local Callbacks = class("CallbackManager.Callbacks")

--[[ CallbackManager ]]

function CallbackManager:initialize()
  self._lines = {}
end

function CallbackManager:addCallback(line, name, callback, param)
  self._lines[line] = self._lines[line] or Callbacks:new(line)
  self._lines[line]:addCallback(name, callback, param)
end

function CallbackManager:call(line, ...)
  if self._lines[line] then
    self._lines[line]:call(...)
  end
end

--[[ Callbacks ]]

function Callbacks:initialize(line)
  self.line = line
  self._callbacks = { }
end

function Callbacks:addCallback(name, func, param)
  self._callbacks[name] = { _func=func, _param=param }
end

function Callbacks:removeCallback(name)
  table.remove(self._callbacks, name)
end

-- Calls all of the callbacks in the line.
function Callbacks:call(...)
  local retval = true
  for k,v in pairs(self._callbacks) do
    retval = v._func(v._param, ...)
  end
end