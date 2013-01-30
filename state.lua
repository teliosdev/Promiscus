state = {}
state.currentState = 0

require "title"

function state.change(newState)
  print(string.format("state changed to %i", newState))
  state.currentState = newState

  if state.currentState == 0 then
    state.update  = state.nothing
    state.draw    = title.main.draw
    state.keyDown = state.nothing
    state.keyUp   = state.nothing

    state.mouseDown = state.nothing
    state.mouseUp   = title.main.nextState
  elseif state.currentState == 1 then
    state.update  = state.nothing
    state.draw    = title.save.draw
    state.keyDown = state.nothing
    state.keyUp   = state.nothing

    state.mouseDown   = state.nothing
    state.mouseUp     = title.save.mouseUp
  elseif state.currentState == 2 then
    state.update  = state.nothing
    state.draw    = state.nothing
    state.keyDown = state.nothing
    state.keyUp   = state.nothing

    state.mouseDown = state.nothing
    state.mouseUp   = state.nothing
  elseif state.currentState == 3 then
    state.update  = state.nothing
    state.draw    = state.nothing
    state.keyDown = state.nothing
    state.keyUp   = state.nothing

    state.mouseDown = state.nothing
    state.mouseUp   = state.nothing
  end
end

function state.nothing(...)

end

state.change(0)

--function state.update()
--  if state.currentState == 0 then
--    title.mainUpdate()
--  elseif state.currentState == 1 then
--    title.saveUpdate()
--  elseif state.currentState == 2 then
--    -- do something
--  elseif state.currentState == 3 then
--    -- do something else
--  end
--end

--function state.draw()
--  if state.currentState == 0 then
--    title.mainDraw()
--  elseif state.currentState == 1 then
--    title.saveDraw()
--  elseif state.currentState == 2 then
--    -- do something
--  elseif state.currentState == 3 then
--    -- do something else
--  end
--end

state.titleScreen = 0
state.saveScreen = 1
state.inGame = 2
state.inFight = 3