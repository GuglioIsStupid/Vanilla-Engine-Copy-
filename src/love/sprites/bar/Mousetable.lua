return graphics.newSprite(
	love.graphics.newImage(graphics.imagePath("bar/Mousetable")), -- Do not add the .png extension
	{
		{x = 3, y = 3, width = 737, height = 570, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 1: Mousetable0000
		{x = 743, y = 3, width = 737, height = 570, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 2: Mousetable0001
		{x = 1483, y = 3, width = 737, height = 570, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 3: Mousetable0002
		{x = 2223, y = 3, width = 737, height = 570, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 4: Mousetable0003
		{x = 2963, y = 3, width = 737, height = 570, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 5: Mousetable0004
		{x = 3, y = 576, width = 737, height = 570, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 6: Mousetable0005
		{x = 743, y = 576, width = 737, height = 570, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 7: Mousetable0006
		{x = 1483, y = 576, width = 737, height = 570, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 8: Mousetable0007
		{x = 2223, y = 576, width = 737, height = 570, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 9: Mousetable0008
		{x = 2963, y = 576, width = 737, height = 570, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0} -- 10: Mousetable0009
	},
	{
		["anim"] = {start = 1, stop = 10, speed = 24, offsetX = 0, offsetY = 0},
	},
	"anim", -- set to default animation
	false -- If the sprite repeats
)
