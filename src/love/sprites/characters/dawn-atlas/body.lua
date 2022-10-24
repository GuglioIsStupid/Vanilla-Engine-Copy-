return graphics.newSprite(
	love.graphics.newImage(graphics.imagePath("character-dawn/dawn-body")),
    --{x = 20, y = 20, width = 427, height = 573, offsetX = -2, offsetY = -6, offsetWidth = 439, offsetHeight = 580},
    {
		{x = 0, y = 0, width = 262, height = 286, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0},-- body 2
		{x = 288, y = 0, width = 527-288, height = 286, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0},-- body 1
    },
	{
		["idle"] = {start = 2, stop = 2, speed = 24, offsetX = 0, offsetY = 0},
		["up"] = {start = 1, stop = 1, speed = 24, offsetX = 0, offsetY = 0},
		["right"] = {start = 1, stop = 1, speed = 24, offsetX = 0, offsetY = 0},
		["down"] = {start = 2, stop = 2, speed = 24, offsetX = 0, offsetY = 0},
		["left"] = {start = 2, stop = 2, speed = 24, offsetX = 0, offsetY = 0},
	},
	"idle",
	false
)
