-- woo, the player!

Player = {
  stats = {
    STR=13,
    DEX=13,
    CON=13,
    INT=13,
    WIS=13,
    CHA=13
  },
  maxHP = 10,
  currentHP = 10
}

function Player:new(o)
  o = o or {}

  setmetatable(o, { __index=self })
  return o
end


function Player:getStat(stat)
  return self.stats[stat:upper()]
end

function Player:getModifier(modifier)
  local stat = self:getStat(modifier)
  return math.floor(stat / 2) - 5
end

function Player:getInitiative()
  return 10 + self:getModifier("Dex")
end

function Player:getArmorResistance()
  return 10 + self:getModifier("Dex") -- TODO: equipped armor gives bonus
end