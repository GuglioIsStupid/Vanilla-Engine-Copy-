return graphics.newSprite(
	love.graphics.newImage(graphics.imagePath("bar/Jeff")), -- Do not add the .png extension
	{
		{x = 0, y = 0, width = 256, height = 241, offsetX = 0, offsetY = -6, offsetWidth = 259, offsetHeight = 248}, -- 1: mynamejeff instance 10000
		{x = 256, y = 0, width = 255, height = 243, offsetX = -3, offsetY = -4, offsetWidth = 259, offsetHeight = 248}, -- 2: mynamejeff instance 10001
		{x = 256, y = 0, width = 255, height = 243, offsetX = -3, offsetY = -4, offsetWidth = 259, offsetHeight = 248}, -- 3: mynamejeff instance 10002
		{x = 511, y = 0, width = 254, height = 246, offsetX = -5, offsetY = -1, offsetWidth = 259, offsetHeight = 248}, -- 4: mynamejeff instance 10003
		{x = 511, y = 0, width = 254, height = 246, offsetX = -5, offsetY = -1, offsetWidth = 259, offsetHeight = 248}, -- 5: mynamejeff instance 10004
		{x = 765, y = 0, width = 252, height = 246, offsetX = -4, offsetY = -1, offsetWidth = 259, offsetHeight = 248}, -- 6: mynamejeff instance 10005
		{x = 765, y = 0, width = 252, height = 246, offsetX = -4, offsetY = -1, offsetWidth = 259, offsetHeight = 248}, -- 7: mynamejeff instance 10006
		{x = 0, y = 246, width = 253, height = 248, offsetX = -5, offsetY = 0, offsetWidth = 259, offsetHeight = 248}, -- 8: mynamejeff instance 10007
		{x = 0, y = 246, width = 253, height = 248, offsetX = -5, offsetY = 0, offsetWidth = 259, offsetHeight = 248}, -- 9: mynamejeff instance 10008
		{x = 253, y = 246, width = 253, height = 247, offsetX = -5, offsetY = -1, offsetWidth = 259, offsetHeight = 248} -- 10: mynamejeff instance 10009
	},
	{
		["anim"] = {start = 1, stop = 10, speed = 24, offsetX = 0, offsetY = 0},
	},
	"anim", -- set to default animation
	false -- If the sprite repeats
)
