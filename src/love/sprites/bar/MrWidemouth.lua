return graphics.newSprite(
	love.graphics.newImage(graphics.imagePath("bar/MrWidemouth")), -- Do not add the .png extension
	{
		{x = 5, y = 5, width = 74, height = 61, offsetX = 0, offsetY = -3, offsetWidth = 74, offsetHeight = 64}, -- 1: MrWidemouth instance 10000
		{x = 5, y = 5, width = 74, height = 61, offsetX = 0, offsetY = -3, offsetWidth = 74, offsetHeight = 64}, -- 2: MrWidemouth instance 10001
		{x = 84, y = 5, width = 71, height = 61, offsetX = -3, offsetY = -1, offsetWidth = 74, offsetHeight = 64}, -- 3: MrWidemouth instance 10002
		{x = 160, y = 5, width = 71, height = 62, offsetX = -3, offsetY = 0, offsetWidth = 74, offsetHeight = 64}, -- 4: MrWidemouth instance 10003
		{x = 236, y = 5, width = 71, height = 61, offsetX = -3, offsetY = 0, offsetWidth = 74, offsetHeight = 64}, -- 5: MrWidemouth instance 10004
		{x = 312, y = 5, width = 71, height = 60, offsetX = -3, offsetY = -1, offsetWidth = 74, offsetHeight = 64}, -- 6: MrWidemouth instance 10005
		{x = 388, y = 5, width = 71, height = 60, offsetX = -3, offsetY = -1, offsetWidth = 74, offsetHeight = 64}, -- 7: MrWidemouth instance 10006
		{x = 5, y = 72, width = 71, height = 60, offsetX = -3, offsetY = -1, offsetWidth = 74, offsetHeight = 64}, -- 8: MrWidemouth instance 10007
		{x = 5, y = 72, width = 71, height = 60, offsetX = -3, offsetY = -1, offsetWidth = 74, offsetHeight = 64}, -- 9: MrWidemouth instance 10008
		{x = 81, y = 72, width = 71, height = 60, offsetX = -3, offsetY = -1, offsetWidth = 74, offsetHeight = 64}, -- 10: MrWidemouth instance 10009
		{x = 81, y = 72, width = 71, height = 60, offsetX = -3, offsetY = -1, offsetWidth = 74, offsetHeight = 64}, -- 11: MrWidemouth instance 10010
		{x = 157, y = 72, width = 71, height = 60, offsetX = -3, offsetY = -1, offsetWidth = 74, offsetHeight = 64}, -- 12: MrWidemouth instance 10011
		{x = 157, y = 72, width = 71, height = 60, offsetX = -3, offsetY = -1, offsetWidth = 74, offsetHeight = 64}, -- 13: MrWidemouth instance 10012
		{x = 388, y = 5, width = 71, height = 60, offsetX = -3, offsetY = -1, offsetWidth = 74, offsetHeight = 64}, -- 14: MrWidemouth instance 10013
		{x = 388, y = 5, width = 71, height = 60, offsetX = -3, offsetY = -1, offsetWidth = 74, offsetHeight = 64}, -- 15: MrWidemouth instance 10014
		{x = 5, y = 72, width = 71, height = 60, offsetX = -3, offsetY = -1, offsetWidth = 74, offsetHeight = 64}, -- 16: MrWidemouth instance 10015
		{x = 5, y = 72, width = 71, height = 60, offsetX = -3, offsetY = -1, offsetWidth = 74, offsetHeight = 64}, -- 17: MrWidemouth instance 10016
		{x = 233, y = 72, width = 71, height = 60, offsetX = -3, offsetY = -1, offsetWidth = 74, offsetHeight = 64}, -- 18: MrWidemouth instance 10017
		{x = 233, y = 72, width = 71, height = 60, offsetX = -3, offsetY = -1, offsetWidth = 74, offsetHeight = 64}, -- 19: MrWidemouth instance 10018
		{x = 309, y = 72, width = 71, height = 60, offsetX = -3, offsetY = -1, offsetWidth = 74, offsetHeight = 64}, -- 20: MrWidemouth instance 10019
		{x = 385, y = 72, width = 71, height = 60, offsetX = -3, offsetY = -1, offsetWidth = 74, offsetHeight = 64}, -- 21: MrWidemouth instance 10020
		{x = 5, y = 137, width = 71, height = 60, offsetX = -3, offsetY = -1, offsetWidth = 74, offsetHeight = 64} -- 22: MrWidemouth instance 10021
	},
	{
		["anim"] = {start = 1, stop = 22, speed = 24, offsetX = 0, offsetY = 0},
	},
	"anim", -- set to default animation
	false -- If the sprite repeats
)
