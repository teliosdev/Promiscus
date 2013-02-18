GameState = class("states.GameState")
State = class("states.State")

--[[ GameState ]]

function GameState:currentState()
  if self._currentState then
    return self._currentState
  else
    return self:_setupDefaultState()
  end
end

function GameState:addState(name, state)
  if not subclassOf(State, state) then
    print("attempted to add a state not an instance of State")
    return
  end

  self._states[name] = state
end

function GameState:getState(name)
  return self._states[name]
end

function GameState:setState(name)
  local newState = self:getState(name)
  if newState then
    self._currentState:destroy(self._cm)
    self._currentState = newState:new(self, self._cm)
    return true
  else
    return false
  end
end

function GameState:addMiniState(name, miniState)
  self._states.mini[name] = miniState
end

function GameState:getMiniState(miniState)
  return self._states.mini[miniState]
end

function GameState:_setupDefaultState()
  if self._defaultState == nil and self:getState("Default") then
    self._defaultState = self:getState("Default"):new(self, self._cm)
  end

  return self._defaultState
end

function GameState:initialize(states, callbackManager)
  self._states = { mini = {} }
  self._defaultState = nil
  self._cm = callbackManager
  print("initialized gameState")
  setmetatable(self._states, { __index=states })
  setmetatable(self._states.mini, { __index=states.mini })
end

--[[ State ]]

function State:draw() end
function State:update() end

--[[
  This is called when the state is changed to this one.
]]
function State:initialize(gs, cm)
  self._gs = gs
  self:setMiniState("Normal")
  cm:addCallback("draw", self.class.name, self._draw, self)
  cm:addCallback("update", self.class.name, self._update, self)
end

function State:destroy(cm)
  cm:removeCallback("draw", self.class.name)
  cm:removeCallback("update", self.class.name)
end

function State:setMiniState(miniState)
  local ms = self._gs:getMiniState(miniState)
  if self.miniState then
    self.miniState:destroy()
  end
  self.miniState = ms:new(self)
end

function State:_draw(...)
  self.miniState:draw(...)
end

function State:_update(...)
  self.miniState:update(...)
end