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
  print("Chaing state to", newState.name)
  State.currentState = newState
end

function State.nothing(...)
  -- do nothing :Cm
end

function State:new(name)
  local o = { ["name"]= (name or "anon") }
  return o
end

for i, file in ipairs(love.filesystem.enumerate("states")) do
  print("loading file " .. file)
  love.filesystem.load("states/" .. file)()
end

State:changeState(States.Title)

print(State.currentState.name)