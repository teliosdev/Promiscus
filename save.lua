require "persistence"

Save = {}

function Save.toFile(fileDir, save)
  local file = love.filesystem.newFile(fileDir .. ".save")
  print("Saving to file " .. fileDir .. ".save...")
  file:open('w')
  persistence.store(file, save)
end

function Save.fromFile(fileDir)
  local result, r
  if love.filesystem.isFile(fileDir .. ".save") then
    result = love.filesystem.load(fileDir .. ".save")
    r = Save:new(result())
    return r
  else
    return false
  end
end

function Save.exists(fileDir)

end

function Save:new(o)
  if o ~= nil and o.player ~= nil then
    print("filling in player data")
    o.player = Player:new(o.player)
  elseif o == nil then
    o = {}
  end

  setmetatable(o, { __index=self })
  return o
end

Save.player = {}