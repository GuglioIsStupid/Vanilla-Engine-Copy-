return graphics.newSprite(
	love.graphics.newImage(graphics.imagePath("bar/brian_idle")), -- Do not add the .png extension
	{
		{x = 5, y = 5, width = 101, height = 161, offsetX = 0, offsetY = -1, offsetWidth = 101, offsetHeight = 162}, -- 1: brian idle 0000
		{x = 116, y = 5, width = 101, height = 161, offsetX = 0, offsetY = -1, offsetWidth = 101, offsetHeight = 162}, -- 2: brian idle 0001
		{x = 227, y = 5, width = 99, height = 162, offsetX = -1, offsetY = 0, offsetWidth = 101, offsetHeight = 162}, -- 3: brian idle 0002
		{x = 336, y = 5, width = 99, height = 162, offsetX = -1, offsetY = 0, offsetWidth = 101, offsetHeight = 162}, -- 4: brian idle 0003
		{x = 445, y = 5, width = 98, height = 162, offsetX = -2, offsetY = 0, offsetWidth = 101, offsetHeight = 162}, -- 5: brian idle 0004
		{x = 553, y = 5, width = 98, height = 162, offsetX = -2, offsetY = 0, offsetWidth = 101, offsetHeight = 162}, -- 6: brian idle 0005
		{x = 661, y = 5, width = 95, height = 162, offsetX = -4, offsetY = 0, offsetWidth = 101, offsetHeight = 162}, -- 7: brian idle 0006
		{x = 766, y = 5, width = 95, height = 162, offsetX = -4, offsetY = 0, offsetWidth = 101, offsetHeight = 162}, -- 8: brian idle 0007
		{x = 871, y = 5, width = 95, height = 162, offsetX = -4, offsetY = 0, offsetWidth = 101, offsetHeight = 162}, -- 9: brian idle 0008
		{x = 5, y = 177, width = 95, height = 162, offsetX = -4, offsetY = 0, offsetWidth = 101, offsetHeight = 162}, -- 10: brian idle 0009
		{x = 110, y = 177, width = 95, height = 162, offsetX = -4, offsetY = 0, offsetWidth = 101, offsetHeight = 162}, -- 11: brian idle 0010
		{x = 215, y = 177, width = 95, height = 162, offsetX = -4, offsetY = 0, offsetWidth = 101, offsetHeight = 162}, -- 12: brian idle 0011
		{x = 320, y = 177, width = 95, height = 162, offsetX = -4, offsetY = 0, offsetWidth = 101, offsetHeight = 162}, -- 13: brian idle 0012
		{x = 425, y = 177, width = 95, height = 162, offsetX = -4, offsetY = 0, offsetWidth = 101, offsetHeight = 162} -- 14: brian idle 0013
	},
	{
		["anim"] = {start = 1, stop = 14, speed = 24, offsetX = 0, offsetY = 0},
	},
	"anim", -- set to default animation
	false -- If the sprite repeats
)
