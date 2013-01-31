Menu.Button  = {}

function Menu.Button:new(xPos, yPos, xSize, ySize, color)
	if type(xPos) == 'table' then
		o = xPos
		xPos = nil
	else
		o = {
			["xPos"] = xPos;
			["yPos"] = yPos;
			["text"] = "";
			["xSize"] = xSize;
			["ySize"] = ySize;
			["color"] = color;
			["origColor"] = color;
		}
	end

	setmetatable(o, { __index=self })
	return o
end

function Menu.Button:draw(love)
	love.graphics.rectangle("fill", self.xPos, self.yPos, self.xSize, 
	                   self.ySize, self.color)

	if #self.text > 0 then
		love.graphics.setFont(font.default)
		love.graphics.printf(self.text, (self.xPos + self.xSize)/2, 
		                     (self.yPos + self.ySize)/2, self.xSize, "center")
	end
end

function Menu.Button:setHover(hover, newColor)
	if hover then
		self.color = newColor
	else
		self.color = self.origColor
	end
end