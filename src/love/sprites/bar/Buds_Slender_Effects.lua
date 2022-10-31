return graphics.newSprite(
	love.graphics.newImage(graphics.imagePath("bar/Buds_Slender_Effects")), -- Do not add the .png extension
	{
		{x = 0, y = 0, width = 661, height = 672, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 1: Slenderman Full0000
		{x = 685, y = 0, width = 661, height = 672, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 2: Slenderman Full0001
		{x = 1370, y = 0, width = 661, height = 672, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 3: Slenderman Full0002
		{x = 0, y = 696, width = 661, height = 672, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 4: Slenderman Full0003
		{x = 685, y = 696, width = 661, height = 672, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 5: Slenderman Full0004
		{x = 1370, y = 696, width = 661, height = 672, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 6: Slenderman Full0005
		{x = 0, y = 1392, width = 661, height = 672, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 7: Slenderman Full0006
		{x = 685, y = 1392, width = 661, height = 672, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0} -- 8: Slenderman Full0007
	},
	{
		["anim"] = {start = 1, stop = 8, speed = 24, offsetX = 0, offsetY = 0},
	},
	"anim", -- set to default animation
	false -- If the sprite repeats
)
