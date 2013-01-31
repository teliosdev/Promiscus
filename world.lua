world = { save={}, game={}, fight={} }

require "save"
require "player"

currentPlayer = {}

function world.game.draw()
  love.graphics.printf(string.format([[
      Modifiers:
        STR - %i
        DEX - %i
        CON - %i
        INT - %i
        WIS - %i
        CHA - %i
    ]], currentPlayer:getModifier("str"), currentPlayer:getModifier("dex"), currentPlayer:getModifier("con"), currentPlayer:getModifier("int"), currentPlayer:getModifier("wis"), currentPlayer:getModifier("cha")), 0, 100, 0)
end

function world.game.keyDown(char)
  if char == 's' then
    Save.toFile("main.save", world.save)
  end
end