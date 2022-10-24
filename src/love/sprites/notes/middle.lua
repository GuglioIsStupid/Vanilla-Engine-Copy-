return graphics.newSprite(
	images.notesMiddle,
	{
		{x = 5, y = 5, width = 98, height = 45, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 1: spacebar hold piece0000
		{x = 5, y = 5, width = 98, height = 45, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 2: spacebar hold piece0001
		{x = 5, y = 5, width = 98, height = 45, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 3: spacebar hold piece0002
		{x = 5, y = 5, width = 98, height = 45, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 4: spacebar hold piece0003
		{x = 5, y = 5, width = 98, height = 45, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 5: spacebar hold piece0004
		{x = 108, y = 5, width = 357, height = 83, offsetX = -75, offsetY = -26, offsetWidth = 497, offsetHeight = 115}, -- 6: spacebar0000
		{x = 470, y = 5, width = 361, height = 109, offsetX = -75, offsetY = 0, offsetWidth = 497, offsetHeight = 115}, -- 7: spacebar0001
		{x = 470, y = 5, width = 361, height = 109, offsetX = -75, offsetY = 0, offsetWidth = 497, offsetHeight = 115}, -- 8: spacebar0002
		{x = 5, y = 119, width = 360, height = 98, offsetX = -72, offsetY = -11, offsetWidth = 497, offsetHeight = 115}, -- 9: spacebar0003
		{x = 5, y = 119, width = 360, height = 98, offsetX = -72, offsetY = -11, offsetWidth = 497, offsetHeight = 115}, -- 10: spacebar0004
		{x = 370, y = 119, width = 497, height = 64, offsetX = 0, offsetY = -51, offsetWidth = 497, offsetHeight = 115}, -- 11: spacebar confirm0000
		{x = 5, y = 222, width = 476, height = 64, offsetX = -13, offsetY = -51, offsetWidth = 497, offsetHeight = 115}, -- 12: spacebar confirm0001
		{x = 486, y = 222, width = 417, height = 68, offsetX = -41, offsetY = -47, offsetWidth = 497, offsetHeight = 115}, -- 13: spacebar confirm0002
		{x = 5, y = 295, width = 391, height = 73, offsetX = -55, offsetY = -42, offsetWidth = 497, offsetHeight = 115}, -- 14: spacebar confirm0003
		{x = 401, y = 295, width = 353, height = 88, offsetX = -77, offsetY = -23, offsetWidth = 497, offsetHeight = 115}, -- 15: spacebar confirm0004
		{x = 5, y = 388, width = 398, height = 52, offsetX = -56, offsetY = -60, offsetWidth = 497, offsetHeight = 115}, -- 16: spacebar press0000
		{x = 5, y = 388, width = 398, height = 52, offsetX = -56, offsetY = -60, offsetWidth = 497, offsetHeight = 115}, -- 17: spacebar press0001
		{x = 408, y = 388, width = 380, height = 55, offsetX = -64, offsetY = -57, offsetWidth = 497, offsetHeight = 115}, -- 18: spacebar press0002
		{x = 5, y = 448, width = 345, height = 72, offsetX = -79, offsetY = -40, offsetWidth = 497, offsetHeight = 115}, -- 19: spacebar press0003
		{x = 355, y = 448, width = 354, height = 58, offsetX = -74, offsetY = -54, offsetWidth = 497, offsetHeight = 115}, -- 20: spacebar press0004
		{x = 355, y = 448, width = 354, height = 58, offsetX = -74, offsetY = -54, offsetWidth = 497, offsetHeight = 115}, -- 21: spacebar press0005
		{x = 355, y = 448, width = 354, height = 58, offsetX = -74, offsetY = -54, offsetWidth = 497, offsetHeight = 115}, -- 22: spacebar press0006
		{x = 355, y = 448, width = 354, height = 58, offsetX = -74, offsetY = -54, offsetWidth = 497, offsetHeight = 115}, -- 23: spacebar press0007
		{x = 714, y = 448, width = 98, height = 82, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 24: spacebar hold end0000
		{x = 714, y = 448, width = 98, height = 82, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 25: spacebar hold end0001
		{x = 714, y = 448, width = 98, height = 82, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 26: spacebar hold end0002
		{x = 714, y = 448, width = 98, height = 82, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 27: spacebar hold end0003
		{x = 714, y = 448, width = 98, height = 82, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0} -- 28: spacebar hold end0004
	},
	{
		["off"] = {start = 6, stop = 10, speed = 24, offsetX = 0, offsetY = 0},
		["on"] = {start = 6, stop = 10, speed = 24, offsetX = 0, offsetY = 0},
		["end"] = {start = 3, stop = 3, speed = 24, offsetX = 0, offsetY = 0},
		["hold"] = {start = 24, stop = 28, speed = 24, offsetX = 0, offsetY = 0},
		["confirm"] = {start = 11, stop = 15, speed = 24, offsetX = 0, offsetY = 0},
		["press"] = {start = 16, stop = 23, speed = 24, offsetX = 0, offsetY = 0}
	},
	"off", -- set to default animation
	false -- If the sprite repeats
)
