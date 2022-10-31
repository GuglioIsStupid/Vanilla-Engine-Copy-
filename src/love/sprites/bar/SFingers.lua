return graphics.newSprite(
	love.graphics.newImage(graphics.imagePath("bar/SFingers")), -- Do not add the .png extension
	{
		{x = 5, y = 5, width = 71, height = 90, offsetX = 0, offsetY = -1, offsetWidth = 75, offsetHeight = 91}, -- 1: SFingers0000
		{x = 81, y = 5, width = 71, height = 90, offsetX = 0, offsetY = -1, offsetWidth = 75, offsetHeight = 91}, -- 2: SFingers0001
		{x = 157, y = 5, width = 71, height = 91, offsetX = 0, offsetY = 0, offsetWidth = 75, offsetHeight = 91}, -- 3: SFingers0002
		{x = 233, y = 5, width = 71, height = 91, offsetX = 0, offsetY = 0, offsetWidth = 75, offsetHeight = 91}, -- 4: SFingers0003
		{x = 309, y = 5, width = 71, height = 90, offsetX = 0, offsetY = -1, offsetWidth = 75, offsetHeight = 91}, -- 5: SFingers0004
		{x = 309, y = 5, width = 71, height = 90, offsetX = 0, offsetY = -1, offsetWidth = 75, offsetHeight = 91}, -- 6: SFingers0005
		{x = 385, y = 5, width = 72, height = 90, offsetX = 0, offsetY = -1, offsetWidth = 75, offsetHeight = 91}, -- 7: SFingers0006
		{x = 385, y = 5, width = 72, height = 90, offsetX = 0, offsetY = -1, offsetWidth = 75, offsetHeight = 91}, -- 8: SFingers0007
		{x = 5, y = 101, width = 74, height = 90, offsetX = 0, offsetY = -1, offsetWidth = 75, offsetHeight = 91}, -- 9: SFingers0008
		{x = 84, y = 101, width = 74, height = 90, offsetX = 0, offsetY = -1, offsetWidth = 75, offsetHeight = 91}, -- 10: SFingers0009
		{x = 163, y = 101, width = 74, height = 90, offsetX = 0, offsetY = -1, offsetWidth = 75, offsetHeight = 91}, -- 11: SFingers0010
		{x = 163, y = 101, width = 74, height = 90, offsetX = 0, offsetY = -1, offsetWidth = 75, offsetHeight = 91}, -- 12: SFingers0011
		{x = 242, y = 101, width = 75, height = 90, offsetX = 0, offsetY = -1, offsetWidth = 75, offsetHeight = 91}, -- 13: SFingers0012
		{x = 322, y = 101, width = 75, height = 90, offsetX = 0, offsetY = -1, offsetWidth = 75, offsetHeight = 91}, -- 14: SFingers0013
		{x = 402, y = 101, width = 75, height = 90, offsetX = 0, offsetY = -1, offsetWidth = 75, offsetHeight = 91}, -- 15: SFingers0014
		{x = 5, y = 196, width = 75, height = 90, offsetX = 0, offsetY = -1, offsetWidth = 75, offsetHeight = 91}, -- 16: SFingers0015
		{x = 85, y = 196, width = 75, height = 90, offsetX = 0, offsetY = -1, offsetWidth = 75, offsetHeight = 91}, -- 17: SFingers0016
		{x = 165, y = 196, width = 74, height = 90, offsetX = 0, offsetY = -1, offsetWidth = 75, offsetHeight = 91}, -- 18: SFingers0017
		{x = 244, y = 196, width = 74, height = 90, offsetX = 0, offsetY = -1, offsetWidth = 75, offsetHeight = 91}, -- 19: SFingers0018
		{x = 323, y = 196, width = 74, height = 90, offsetX = 0, offsetY = -1, offsetWidth = 75, offsetHeight = 91}, -- 20: SFingers0019
		{x = 402, y = 196, width = 72, height = 90, offsetX = 0, offsetY = -1, offsetWidth = 75, offsetHeight = 91}, -- 21: SFingers0020
		{x = 402, y = 196, width = 72, height = 90, offsetX = 0, offsetY = -1, offsetWidth = 75, offsetHeight = 91} -- 22: SFingers0021
	},
	{
		["anim"] = {start = 1, stop = 22, speed = 24, offsetX = 0, offsetY = 0},
	},
	"anim", -- set to default animation
	false -- If the sprite repeats
)
