require "persistence"

Save = {}

function Save.toFile(fileDir, save)
  local file = love.filesystem.newFile(fileDir)
  print("Saving to file " .. fileDir .. "...")
  file:open('w')
  persistence.store(file, save)
end

function Save:fromFile(fileDir)
  return Save:new(persistence.load(fileDir))
end

function Save:new(o)
  if o ~= nil and o.player ~= nil then
    o.player = Player:new(o.player)
  elseif o == nil then
    o = {}
  end

  setmetatable(o, { __index=self })
  return o
end

Save.player = {}