return graphics.newSprite(
	love.graphics.newImage(graphics.imagePath("monochrome/Celebi_Assets")), -- Do not add the .png extension
	{
		{x = 0, y = 0, width = 222, height = 400, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 1: Celebi Idle0000
		{x = 0, y = 0, width = 222, height = 400, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 2: Celebi Idle0001
		{x = 232, y = 0, width = 222, height = 400, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 3: Celebi Idle0002
		{x = 232, y = 0, width = 222, height = 400, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 4: Celebi Idle0003
		{x = 464, y = 0, width = 238, height = 340, offsetX = 0, offsetY = -85, offsetWidth = 238, offsetHeight = 425}, -- 5: Celebi Spawn Full0000
		{x = 464, y = 0, width = 238, height = 340, offsetX = 0, offsetY = -85, offsetWidth = 238, offsetHeight = 425}, -- 6: Celebi Spawn Full0001
		{x = 712, y = 0, width = 229, height = 348, offsetX = -5, offsetY = -74, offsetWidth = 238, offsetHeight = 425}, -- 7: Celebi Spawn Full0002
		{x = 712, y = 0, width = 229, height = 348, offsetX = -5, offsetY = -74, offsetWidth = 238, offsetHeight = 425}, -- 8: Celebi Spawn Full0003
		{x = 712, y = 0, width = 229, height = 348, offsetX = -5, offsetY = -70, offsetWidth = 238, offsetHeight = 425}, -- 9: Celebi Spawn Full0004
		{x = 951, y = 0, width = 229, height = 348, offsetX = -5, offsetY = -70, offsetWidth = 238, offsetHeight = 425}, -- 10: Celebi Spawn Full0005
		{x = 1190, y = 0, width = 220, height = 359, offsetX = -10, offsetY = -61, offsetWidth = 238, offsetHeight = 425}, -- 11: Celebi Spawn Full0006
		{x = 1420, y = 0, width = 220, height = 359, offsetX = -10, offsetY = -61, offsetWidth = 238, offsetHeight = 425}, -- 12: Celebi Spawn Full0007
		{x = 1650, y = 0, width = 234, height = 369, offsetX = -2, offsetY = -50, offsetWidth = 238, offsetHeight = 425}, -- 13: Celebi Spawn Full0008
		{x = 0, y = 410, width = 234, height = 383, offsetX = -2, offsetY = -31, offsetWidth = 238, offsetHeight = 425}, -- 14: Celebi Spawn Full0009
		{x = 244, y = 410, width = 234, height = 393, offsetX = -2, offsetY = -16, offsetWidth = 238, offsetHeight = 425}, -- 15: Celebi Spawn Full0010
		{x = 488, y = 410, width = 225, height = 399, offsetX = -7, offsetY = -3, offsetWidth = 238, offsetHeight = 425}, -- 16: Celebi Spawn Full0011
		{x = 723, y = 410, width = 225, height = 399, offsetX = -7, offsetY = -3, offsetWidth = 238, offsetHeight = 425}, -- 17: Celebi Spawn Full0012
		{x = 958, y = 410, width = 225, height = 399, offsetX = -7, offsetY = -3, offsetWidth = 238, offsetHeight = 425}, -- 18: Celebi Spawn Full0013
		{x = 1193, y = 410, width = 222, height = 400, offsetX = -9, offsetY = 0, offsetWidth = 238, offsetHeight = 425} -- 19: Celebi Spawn Full0014
	},
	{
		["idle"] = {start = 1, stop = 4, speed = 24, offsetX = 0, offsetY = 0},
		["spawn"] = {start = 5, stop = 19, speed = 24, offsetX = 0, offsetY = 0}
	},
	"idle", -- set to default animation
	false -- If the sprite repeats
)
