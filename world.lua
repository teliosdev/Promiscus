world = { save={}, game={}, fight={} }

require "save"
require "player"

currentPlayer = {}

state:addState(3, world.game)
state:addState(4, world.fight)

function world.game.draw()
  love.graphics.printf(
    string.format([[
      Modifiers:
        STR - %i
        DEX - %i
        CON - %i
        INT - %i
        WIS - %i
        CHA - %i

      Current/Maximum HP:
        %i/%i
      ]], currentPlayer:getModifier("str"), currentPlayer:getModifier("dex"), 
      currentPlayer:getModifier("con"), currentPlayer:getModifier("int"), 
      currentPlayer:getModifier("wis"), currentPlayer:getModifier("cha"),
      currentPlayer.currentHP, currentPlayer.maxHP
    ), 0, 100, 300)


end

function world.game.keyDown(char)
  if char == 's' then
    Save.toFile("main", world.save)
  end
end