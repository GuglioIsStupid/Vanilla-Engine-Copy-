return graphics.newSprite(
	love.graphics.newImage(graphics.imagePath("bar/JeffArm")), -- Do not add the .png extension
	{
		{x = 0, y = 0, width = 225, height = 114, offsetX = 0, offsetY = -2, offsetWidth = 226, offsetHeight = 117}, -- 1: Only the arm shit instance 10000
		{x = 225, y = 0, width = 226, height = 116, offsetX = 0, offsetY = -1, offsetWidth = 226, offsetHeight = 117}, -- 2: Only the arm shit instance 10001
		{x = 225, y = 0, width = 226, height = 116, offsetX = 0, offsetY = -1, offsetWidth = 226, offsetHeight = 117}, -- 3: Only the arm shit instance 10002
		{x = 0, y = 116, width = 225, height = 117, offsetX = -1, offsetY = 0, offsetWidth = 226, offsetHeight = 117}, -- 4: Only the arm shit instance 10003
		{x = 0, y = 116, width = 225, height = 117, offsetX = -1, offsetY = 0, offsetWidth = 226, offsetHeight = 117}, -- 5: Only the arm shit instance 10004
		{x = 225, y = 116, width = 224, height = 117, offsetX = -1, offsetY = 0, offsetWidth = 226, offsetHeight = 117}, -- 6: Only the arm shit instance 10005
		{x = 225, y = 116, width = 224, height = 117, offsetX = -1, offsetY = 0, offsetWidth = 226, offsetHeight = 117}, -- 7: Only the arm shit instance 10006
		{x = 0, y = 233, width = 225, height = 117, offsetX = -1, offsetY = 0, offsetWidth = 226, offsetHeight = 117}, -- 8: Only the arm shit instance 10007
		{x = 0, y = 233, width = 225, height = 117, offsetX = -1, offsetY = 0, offsetWidth = 226, offsetHeight = 117}, -- 9: Only the arm shit instance 10008
		{x = 225, y = 233, width = 225, height = 117, offsetX = -1, offsetY = 0, offsetWidth = 226, offsetHeight = 117} -- 10: Only the arm shit instance 10009
	},
	{
		["anim"] = {start = 1, stop = 10, speed = 24, offsetX = 0, offsetY = 0},
	},
	"anim", -- set to default animation
	false -- If the sprite repeats
)
