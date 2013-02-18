Tools.Serializer = {}
local Serializer = Tools.Serializer
--[[
  This serializes a table.  The datatypes it supports are numbers, strings, 
  bools, and tables.  If it comes across a value it doesn't know, it'll by
  default drop it.

  The first parameter is the table to be serialized; the second one is the
  method of handling an unknown datatype.  If it's true, it'll ignore it;
  if it's false, it'll give an error; if it's a function, it'll call it with
  the data.
]]
function Serializer:dump(table, unknown, depth)

  if unknown == nil then
    unknown = true
  end
  depth = depth or 0

  if depth > 10 then
    return nil
  end

  if type(table) ~= "table" then
    self:_serialize(table, unknown, depth)
  end

  local result = "{\n"
  local part, serializedKey, serializedValue

  for k,v in pairs(table) do
    serializedKey = self:_serializeKey(k, unknown, depth)
    serializedValue  = self:_serialize(v, unknown, depth)

    if serializedKey and serializedValue then
      part = string.rep("  ", depth + 1) .. serializedKey .. "=" .. serializedValue .. ";\n"
      result = result .. part
    end
  end

  return result .. string.rep("\t", depth) .."}"
end

function Serializer:_serialize(data, unknown, depth)
  local serialized
  if type(data) == "boolean" then 
    serialized = (data and "true" or "false")
  elseif type(data) == "number" then
    serialized = tostring(data)
  elseif type(data) == "string" then
    serialized = string.format("%q", data)
  elseif type(data) == "table" then
    serialized = self:dump(data, unknown, depth + 1)
  else
    serialized = self:_handleUnknownDataType(data, unknown)
  end

  return serialized
end

function Serializer:_serializeKey(data, unknown, depth)
  local data = self:_serialize(data, unknown, depth)
  if data == nil then
    return nil
  end
  
  return "[" .. data .. "]"
end

function Serializer:_handleUnknownDataType(data, unknown)
  if type(unknown) == "function" then
    return unknown(self, data)
  elseif unknown then
    return nil
  else
    error("Unkown data type" .. tostring(data))
  end
end

--[[
  Deserializes a string that was serialized by Serializer:dump.
]]
function Serializer:load(raw)
  local de = "return " .. raw
  return loadstring(de)()
end