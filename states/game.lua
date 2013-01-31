local Game = State:new()
States.Game = Game

function Game.draw()
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

function Game.keyDown(char)
  if char == 's' then
    Save.toFile("main", world.save)
  end
end