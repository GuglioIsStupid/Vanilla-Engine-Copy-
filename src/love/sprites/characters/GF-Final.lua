return graphics.newSprite(
	love.graphics.newImage(graphics.imagePath("characters/last_stand")), -- Do not add the .png extension
	{
		{x = 5, y = 5, width = 230, height = 391, offsetX = -1, offsetY = -6, offsetWidth = 231, offsetHeight = 397}, -- 1: Lullaby_GF_Idle_20000
		{x = 5, y = 5, width = 230, height = 391, offsetX = -1, offsetY = -6, offsetWidth = 231, offsetHeight = 397}, -- 2: Lullaby_GF_Idle_20001
		{x = 240, y = 5, width = 225, height = 393, offsetX = -2, offsetY = -4, offsetWidth = 231, offsetHeight = 397}, -- 3: Lullaby_GF_Idle_20002
		{x = 240, y = 5, width = 225, height = 393, offsetX = -2, offsetY = -4, offsetWidth = 231, offsetHeight = 397}, -- 4: Lullaby_GF_Idle_20003
		{x = 470, y = 5, width = 223, height = 395, offsetX = -1, offsetY = -2, offsetWidth = 231, offsetHeight = 397}, -- 5: Lullaby_GF_Idle_20004
		{x = 470, y = 5, width = 223, height = 395, offsetX = -1, offsetY = -2, offsetWidth = 231, offsetHeight = 397}, -- 6: Lullaby_GF_Idle_20005
		{x = 698, y = 5, width = 222, height = 396, offsetX = -1, offsetY = -1, offsetWidth = 231, offsetHeight = 397}, -- 7: Lullaby_GF_Idle_20006
		{x = 698, y = 5, width = 222, height = 396, offsetX = -1, offsetY = -1, offsetWidth = 231, offsetHeight = 397}, -- 8: Lullaby_GF_Idle_20007
		{x = 925, y = 5, width = 222, height = 396, offsetX = 0, offsetY = -1, offsetWidth = 231, offsetHeight = 397}, -- 9: Lullaby_GF_Idle_20008
		{x = 925, y = 5, width = 222, height = 396, offsetX = 0, offsetY = -1, offsetWidth = 231, offsetHeight = 397}, -- 10: Lullaby_GF_Idle_20009
		{x = 925, y = 5, width = 222, height = 396, offsetX = 0, offsetY = 0, offsetWidth = 231, offsetHeight = 397}, -- 11: Lullaby_GF_Idle_20010
		{x = 925, y = 5, width = 222, height = 396, offsetX = 0, offsetY = 0, offsetWidth = 231, offsetHeight = 397}, -- 12: Lullaby_GF_Idle_20011
		{x = 1152, y = 5, width = 222, height = 397, offsetX = 0, offsetY = 0, offsetWidth = 231, offsetHeight = 397}, -- 13: Lullaby_GF_Idle_20012
		{x = 1152, y = 5, width = 222, height = 397, offsetX = 0, offsetY = 0, offsetWidth = 231, offsetHeight = 397}, -- 14: Lullaby_GF_Idle_20013
		{x = 1379, y = 5, width = 237, height = 377, offsetX = 0, offsetY = -3, offsetWidth = 238, offsetHeight = 380}, -- 15: Lullaby_GF_down0000
		{x = 1379, y = 5, width = 237, height = 377, offsetX = 0, offsetY = -3, offsetWidth = 238, offsetHeight = 380}, -- 16: Lullaby_GF_down0001
		{x = 1621, y = 5, width = 236, height = 380, offsetX = -2, offsetY = 0, offsetWidth = 238, offsetHeight = 380}, -- 17: Lullaby_GF_down0002
		{x = 1621, y = 5, width = 236, height = 380, offsetX = -2, offsetY = 0, offsetWidth = 238, offsetHeight = 380}, -- 18: Lullaby_GF_down0003
		{x = 5, y = 407, width = 237, height = 377, offsetX = 0, offsetY = -3, offsetWidth = 238, offsetHeight = 380}, -- 19: Lullaby_GF_down_miss0000
		{x = 5, y = 407, width = 237, height = 377, offsetX = 0, offsetY = -3, offsetWidth = 238, offsetHeight = 380}, -- 20: Lullaby_GF_down_miss0001
		{x = 247, y = 407, width = 236, height = 380, offsetX = -2, offsetY = 0, offsetWidth = 238, offsetHeight = 380}, -- 21: Lullaby_GF_down_miss0002
		{x = 247, y = 407, width = 236, height = 380, offsetX = -2, offsetY = 0, offsetWidth = 238, offsetHeight = 380}, -- 22: Lullaby_GF_down_miss0003
		{x = 488, y = 407, width = 285, height = 391, offsetX = 0, offsetY = -1, offsetWidth = 290, offsetHeight = 392}, -- 23: Lullaby_GF_left0000
		{x = 488, y = 407, width = 285, height = 391, offsetX = 0, offsetY = -1, offsetWidth = 290, offsetHeight = 392}, -- 24: Lullaby_GF_left0001
		{x = 778, y = 407, width = 288, height = 392, offsetX = -2, offsetY = 0, offsetWidth = 290, offsetHeight = 392}, -- 25: Lullaby_GF_left0002
		{x = 778, y = 407, width = 288, height = 392, offsetX = -2, offsetY = 0, offsetWidth = 290, offsetHeight = 392}, -- 26: Lullaby_GF_left0003
		{x = 1071, y = 407, width = 285, height = 391, offsetX = 0, offsetY = -1, offsetWidth = 290, offsetHeight = 392}, -- 27: Lullaby_GF_left_miss0000
		{x = 1071, y = 407, width = 285, height = 391, offsetX = 0, offsetY = -1, offsetWidth = 290, offsetHeight = 392}, -- 28: Lullaby_GF_left_miss0001
		{x = 1361, y = 407, width = 288, height = 392, offsetX = -2, offsetY = 0, offsetWidth = 290, offsetHeight = 392}, -- 29: Lullaby_GF_left_miss0002
		{x = 1361, y = 407, width = 288, height = 392, offsetX = -2, offsetY = 0, offsetWidth = 290, offsetHeight = 392}, -- 30: Lullaby_GF_left_miss0003
		{x = 1654, y = 407, width = 243, height = 397, offsetX = 0, offsetY = -1, offsetWidth = 244, offsetHeight = 398}, -- 31: Lullaby_GF_right0000
		{x = 1654, y = 407, width = 243, height = 397, offsetX = 0, offsetY = -1, offsetWidth = 244, offsetHeight = 398}, -- 32: Lullaby_GF_right0001
		{x = 5, y = 809, width = 220, height = 398, offsetX = -24, offsetY = 0, offsetWidth = 244, offsetHeight = 398}, -- 33: Lullaby_GF_right0002
		{x = 5, y = 809, width = 220, height = 398, offsetX = -24, offsetY = 0, offsetWidth = 244, offsetHeight = 398}, -- 34: Lullaby_GF_right0003
		{x = 230, y = 809, width = 243, height = 397, offsetX = 0, offsetY = -1, offsetWidth = 244, offsetHeight = 398}, -- 35: Lullaby_GF_right_miss0000
		{x = 230, y = 809, width = 243, height = 397, offsetX = 0, offsetY = -1, offsetWidth = 244, offsetHeight = 398}, -- 36: Lullaby_GF_right_miss0001
		{x = 478, y = 809, width = 220, height = 398, offsetX = -24, offsetY = 0, offsetWidth = 244, offsetHeight = 398}, -- 37: Lullaby_GF_right_miss0002
		{x = 478, y = 809, width = 220, height = 398, offsetX = -24, offsetY = 0, offsetWidth = 244, offsetHeight = 398}, -- 38: Lullaby_GF_right_miss0003
		{x = 703, y = 809, width = 334, height = 411, offsetX = -4, offsetY = 0, offsetWidth = 338, offsetHeight = 411}, -- 39: Lullaby_GF_up0000
		{x = 703, y = 809, width = 334, height = 411, offsetX = -4, offsetY = 0, offsetWidth = 338, offsetHeight = 411}, -- 40: Lullaby_GF_up0001
		{x = 1042, y = 809, width = 335, height = 407, offsetX = 0, offsetY = -3, offsetWidth = 338, offsetHeight = 411}, -- 41: Lullaby_GF_up0002
		{x = 1042, y = 809, width = 335, height = 407, offsetX = 0, offsetY = -3, offsetWidth = 338, offsetHeight = 411}, -- 42: Lullaby_GF_up0003
		{x = 1382, y = 809, width = 334, height = 411, offsetX = -4, offsetY = 0, offsetWidth = 338, offsetHeight = 411}, -- 43: Lullaby_GF_up_miss0000
		{x = 1382, y = 809, width = 334, height = 411, offsetX = -4, offsetY = 0, offsetWidth = 338, offsetHeight = 411}, -- 44: Lullaby_GF_up_miss0001
		{x = 5, y = 1225, width = 335, height = 407, offsetX = 0, offsetY = -3, offsetWidth = 338, offsetHeight = 411}, -- 45: Lullaby_GF_up_miss0002
		{x = 5, y = 1225, width = 335, height = 407, offsetX = 0, offsetY = -3, offsetWidth = 338, offsetHeight = 411} -- 46: Lullaby_GF_up_miss0003
	},
	{
		["down"] = {start = 15, stop = 18, speed = 24, offsetX = -11, offsetY = -9},
		["miss down"] = {start = 19, stop = 22, speed = 24, offsetX = -11, offsetY = -9},
		["left"] = {start = 23, stop = 26, speed = 24, offsetX = -26, offsetY = -3},
		["miss left"] = {start = 27, stop = 30, speed = 24, offsetX = -26, offsetY = -3},
		["right"] = {start = 31, stop = 34, speed = 24, offsetX = -5, offsetY = 0},
		["miss right"] = {start = 35, stop = 38, speed = 24, offsetX = -5, offsetY = 0},
		["up"] = {start = 39, stop = 42, speed = 24, offsetX = -57, offsetY = 6},
		["miss up"] = {start = 43, stop = 46, speed = 24, offsetX = -57, offsetY = 6},
		["idle"] = {start = 1, stop = 14, speed = 24, offsetX = 0, offsetY = 0},
		["i love cock"] = {start = 1, stop = 14, speed = 24, offsetX = 0, offsetY = 0}
	},
	"idle", -- set to default animation
	false -- If the sprite repeats
)
