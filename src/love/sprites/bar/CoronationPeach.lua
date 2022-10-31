return graphics.newSprite(
	love.graphics.newImage(graphics.imagePath("bar/CoronationPeach")), -- Do not add the .png extension
	{
		{x = 3, y = 3, width = 109, height = 212, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 1: CoronationPeach0000
		{x = 3, y = 3, width = 109, height = 212, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 2: CoronationPeach0001
		{x = 115, y = 3, width = 109, height = 212, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 3: CoronationPeach0002
		{x = 115, y = 3, width = 109, height = 212, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 4: CoronationPeach0003
		{x = 227, y = 3, width = 109, height = 212, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 5: CoronationPeach0004
		{x = 227, y = 3, width = 109, height = 212, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 6: CoronationPeach0005
		{x = 3, y = 218, width = 109, height = 212, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 7: CoronationPeach0006
		{x = 3, y = 218, width = 109, height = 212, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 8: CoronationPeach0007
		{x = 115, y = 218, width = 109, height = 212, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 9: CoronationPeach0008
		{x = 115, y = 218, width = 109, height = 212, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0} -- 10: CoronationPeach0009
	},
	{
		["anim"] = {start = 1, stop = 10, speed = 24, offsetX = 0, offsetY = 0},
	},
	"anim", -- set to default animation
	false -- If the sprite repeats
)
