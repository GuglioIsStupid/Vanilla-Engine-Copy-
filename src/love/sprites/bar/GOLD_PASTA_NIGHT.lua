return graphics.newSprite(
	love.graphics.newImage(graphics.imagePath("bar/GOLD_PASTA_NIGHT")), -- Do not add the .png extension
	{
		{x = 5, y = 5, width = 221, height = 458, offsetX = -1, offsetY = 0, offsetWidth = 222, offsetHeight = 459}, -- 1: GOLD PASTA NIGHT instance 10000
		{x = 5, y = 5, width = 221, height = 458, offsetX = -1, offsetY = 0, offsetWidth = 222, offsetHeight = 459}, -- 2: GOLD PASTA NIGHT instance 10001
		{x = 226, y = 5, width = 218, height = 456, offsetX = -1, offsetY = -2, offsetWidth = 222, offsetHeight = 459}, -- 3: GOLD PASTA NIGHT instance 10002
		{x = 226, y = 5, width = 218, height = 456, offsetX = -1, offsetY = -2, offsetWidth = 222, offsetHeight = 459}, -- 4: GOLD PASTA NIGHT instance 10003
		{x = 444, y = 5, width = 219, height = 456, offsetX = 0, offsetY = -2, offsetWidth = 222, offsetHeight = 459}, -- 5: GOLD PASTA NIGHT instance 10004
		{x = 444, y = 5, width = 219, height = 456, offsetX = 0, offsetY = -2, offsetWidth = 222, offsetHeight = 459}, -- 6: GOLD PASTA NIGHT instance 10005
		{x = 663, y = 5, width = 217, height = 458, offsetX = -1, offsetY = -1, offsetWidth = 222, offsetHeight = 459}, -- 7: GOLD PASTA NIGHT instance 10006
		{x = 663, y = 5, width = 217, height = 458, offsetX = -1, offsetY = -1, offsetWidth = 222, offsetHeight = 459} -- 8: GOLD PASTA NIGHT instance 10007
	},
	{
		["anim"] = {start = 1, stop = 8, speed = 24, offsetX = 0, offsetY = 0},
	},
	"anim", -- set to default animation
	false -- If the sprite repeats
)
