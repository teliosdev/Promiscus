state = { states={} }
state.currentState = 0

-- the requires are down below, so that state:addState could be called

function state:change(newState)
  print(string.format("state changed to %i", newState))
  state.currentState = newState

  stateCallback = self.states[newState]

  if stateCallback then
    state.update  = stateCallback.update  or state.nothing
    state.draw    = stateCallback.draw    or state.nothing
    state.keyDown = stateCallback.keyDown or state.nothing
    state.keyUp   = stateCallback.keyUp   or state.nothing

    state.mouseDown = stateCallback.mouseDown or state.nothing
    state.mouseUp   = stateCallback.mouseUp   or state.nothing
  end
end

function state:addState(number, callbacks)
  self.states[number] = callbacks
end

function state.nothing(...)

end

require "title"
require "world"

state:change(0)