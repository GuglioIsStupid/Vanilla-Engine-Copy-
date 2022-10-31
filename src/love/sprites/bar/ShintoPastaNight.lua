return graphics.newSprite(
	love.graphics.newImage(graphics.imagePath("bar/ShintoPastaNight")), -- Do not add the .png extension
	{
		{x = 3, y = 3, width = 148, height = 128, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 1: Shitno0000
		{x = 3, y = 3, width = 148, height = 128, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 2: Shitno0001
		{x = 154, y = 3, width = 148, height = 128, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 3: Shitno0002
		{x = 154, y = 3, width = 148, height = 128, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 4: Shitno0003
		{x = 305, y = 3, width = 148, height = 128, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 5: Shitno0004
		{x = 305, y = 3, width = 148, height = 128, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 6: Shitno0005
		{x = 3, y = 134, width = 148, height = 128, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 7: Shitno0006
		{x = 3, y = 134, width = 148, height = 128, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 8: Shitno0007
		{x = 154, y = 134, width = 148, height = 128, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 9: Shitno0008
		{x = 154, y = 134, width = 148, height = 128, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0} -- 10: Shitno0009
	},
	{
		["anim"] = {start = 1, stop = 10, speed = 24, offsetX = 0, offsetY = 0},
	},
	"anim", -- set to default animation
	false -- If the sprite repeats
)
