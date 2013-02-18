require 'middleclass'
require 'CallbackManager'
require 'states'
require 'tools'

local mainCallbackManager

function love.update(...)
  mainCallbackManager:call("update", unpack(arg))
end

function love.draw(...)
  Tools.Scale:transform()
  mainCallbackManager:call("draw", unpack(arg))
  Tools.Scale:letterbox()
end

function love.load()
  mainCallbackManager = CallbackManager:new()
  currentGameState = GameState:new(states, mainCallbackManager)
  currentGameState:currentState()
  Tools.Scale:setPrefs()
end

function love.keypressed(key)
  if key == "escape" then
    love.event.quit()
  end

  print("key pressed: " .. key)
end