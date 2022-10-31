return graphics.newSprite(
	love.graphics.newImage(graphics.imagePath("bar/Ben_Drowned_BG")), -- Do not add the .png extension
	{
		{x = 10, y = 10, width = 226, height = 522, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 1: ben drowned0000
		{x = 246, y = 10, width = 226, height = 522, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0} -- 2: ben drowned looking0000
	},
	{
		["anim"] = {start = 1, stop = 1, speed = 0, offsetX = 0, offsetY = 0},
		["anim2"] = {start = 2, stop = 2, speed = 0, offsetX = 0, offsetY = 0}
	},
	"anim", -- set to default animation
	false -- If the sprite repeats
)
