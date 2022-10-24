return graphics.newSprite(
	love.graphics.newImage(graphics.imagePath("character-dawn/dawn-arm-left")),
    --{x = 20, y = 20, width = 427, height = 573, offsetX = -2, offsetY = -6, offsetWidth = 439, offsetHeight = 580},
    {
        {x = 0, y = 0, width = 90, height = 229, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- arm idle/left/down
        {x = 108, y = 0, width = 227-108, height = 191, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- arm right & up
        {x = 471, y = 3, width = 600-471, height = 147, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- ducking - 1
        {x = 471, y = 3, width = 600-471, height = 147, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- ducking - 2
        {x = 471, y = 3, width = 600-471, height = 147, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- ducking - 3
        {x = 471, y = 3, width = 600-471, height = 147, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- ducking - 4
        {x = 471, y = 3, width = 600-471, height = 147, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- ducking - 5
        {x = 471, y = 3, width = 600-471, height = 147, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- ducking - 6
        {x = 471, y = 3, width = 600-471, height = 147, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- ducking - 7
        {x = 365, y = 0, width = 467-365, height = 451, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- ducking - 2
    },
	{
        ["idle"] = {start = 1, stop = 1, speed = 24, offsetX = 0, offsetY = 0},
        ["up"] = {start = 2, stop = 2, speed = 24, offsetX = 0, offsetY = 0},
        ["right"] = {start = 2, stop = 2, speed = 24, offsetX = 0, offsetY = 0},
        ["down"] = {start = 1, stop = 1, speed = 24, offsetX = 0, offsetY = 0},
        ["left"] = {start = 1, stop = 1, speed = 24, offsetX = 0, offsetY = 0},
        ["ducking"] = {start = 3, stop = 10, speed = 24, offsetX = 0, offsetY = 0},
	},
	"idle",
	false
)
