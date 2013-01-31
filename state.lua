State, States = { currentState={} }, {}

setmetatable(State, {
  __index = function(t, key)
    if t.currentState[key] then
      return t.currentState[key]
    else
      return State.nothing
    end
  end
})

function State:changeState(newState)
  self.currentState = newState
end

function State.nothing(...)
  -- do nothing :(
end

function State:new()
  local o = { name="anon" }
  return o
end

for i, file in ipairs(love.filesystem.enumerate("states")) do
  pcall(love.filesystem.load("states/" .. file))
end

State:changeState(States.Title)

print(State.currentState.name)