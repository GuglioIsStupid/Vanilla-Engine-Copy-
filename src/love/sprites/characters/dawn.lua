--[[----------------------------------------------------------------------------
This file is part of Friday Night Funkin' Rewritten

Copyright (C) 2021  HTV04

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
------------------------------------------------------------------------------]]

return graphics.newSprite(
	love.graphics.newImage(graphics.imagePath("characters//dawn")),
	-- Automatically generated from dawn.xml
	{
		{x = 0, y = 0, width = 383, height = 392, offsetX = 0, offsetY = 0, offsetWidth = 200, offsetHeight = 200}, -- 1: dawn_dodge 0000
		{x = 384, y = 0, width = 386, height = 390, offsetX = 2, offsetY = -2, offsetWidth = 200, offsetHeight = 200}, -- 2: dawn_dodge 0001
		{x = 771, y = 0, width = 387, height = 388, offsetX = 4, offsetY = -4, offsetWidth = 200, offsetHeight = 200}, -- 3: dawn_dodge 0002
		{x = 1159, y = 0, width = 386, height = 386, offsetX = 4, offsetY = -6, offsetWidth = 200, offsetHeight = 200}, -- 4: dawn_dodge 0003
		{x = 1546, y = 0, width = 386, height = 384, offsetX = 4, offsetY = -8, offsetWidth = 200, offsetHeight = 200}, -- 5: dawn_dodge 0004
		{x = 1932, y = 0, width = 383, height = 382, offsetX = 6, offsetY = -10, offsetWidth = 200, offsetHeight = 200}, -- 6: dawn_dodge 0005
		{x = 2316, y = 0, width = 382, height = 380, offsetX = 6, offsetY = -12, offsetWidth = 200, offsetHeight = 200}, -- 7: dawn_dodge 0006
		{x = 0, y = 392, width = 377, height = 360, offsetX = 0, offsetY = 0, offsetWidth = 200, offsetHeight = 200}, -- 8: dawn_down_sing 0000
		{x = 0, y = 392, width = 377, height = 360, offsetX = 0, offsetY = 0, offsetWidth = 200, offsetHeight = 200}, -- 9: dawn_down_sing 0001
		{x = 378, y = 392, width = 379, height = 357, offsetX = 3, offsetY = -3, offsetWidth = 200, offsetHeight = 200}, -- 10: dawn_down_sing 0002
		{x = 378, y = 392, width = 379, height = 357, offsetX = 3, offsetY = -3, offsetWidth = 200, offsetHeight = 200}, -- 11: dawn_down_sing 0003
		{x = 758, y = 392, width = 381, height = 355, offsetX = 6, offsetY = -5, offsetWidth = 200, offsetHeight = 200}, -- 12: dawn_down_sing 0004
		{x = 758, y = 392, width = 381, height = 355, offsetX = 6, offsetY = -5, offsetWidth = 200, offsetHeight = 200}, -- 13: dawn_down_sing 0005
		{x = 758, y = 392, width = 381, height = 355, offsetX = 6, offsetY = -5, offsetWidth = 200, offsetHeight = 200}, -- 14: dawn_down_sing 0006
		{x = 758, y = 392, width = 381, height = 355, offsetX = 6, offsetY = -5, offsetWidth = 200, offsetHeight = 200}, -- 15: dawn_down_sing 0007
		{x = 758, y = 392, width = 381, height = 355, offsetX = 6, offsetY = -5, offsetWidth = 200, offsetHeight = 200}, -- 16: dawn_down_sing 0008
		{x = 758, y = 392, width = 381, height = 355, offsetX = 6, offsetY = -5, offsetWidth = 200, offsetHeight = 200}, -- 17: dawn_down_sing 0009
		{x = 1140, y = 392, width = 382, height = 407, offsetX = 0, offsetY = 0, offsetWidth = 200, offsetHeight = 200}, -- 18: dawn_up_sing 0000
		{x = 1140, y = 392, width = 382, height = 407, offsetX = 0, offsetY = 0, offsetWidth = 200, offsetHeight = 200}, -- 19: dawn_up_sing 0001
		{x = 1523, y = 391, width = 376, height = 413, offsetX = -4, offsetY = 6, offsetWidth = 200, offsetHeight = 200}, -- 20: dawn_up_sing 0002
		{x = 1523, y = 391, width = 376, height = 413, offsetX = -4, offsetY = 6, offsetWidth = 200, offsetHeight = 200}, -- 21: dawn_up_sing 0003
		{x = 1900, y = 392, width = 372, height = 419, offsetX = -9, offsetY = 12, offsetWidth = 200, offsetHeight = 200}, -- 22: dawn_up_sing 0004
		{x = 1900, y = 392, width = 372, height = 419, offsetX = -9, offsetY = 12, offsetWidth = 200, offsetHeight = 200}, -- 23: dawn_up_sing 0005
		{x = 1900, y = 392, width = 372, height = 419, offsetX = -9, offsetY = 12, offsetWidth = 200, offsetHeight = 200}, -- 24: dawn_up_sing 0006
		{x = 1900, y = 392, width = 372, height = 419, offsetX = -9, offsetY = 12, offsetWidth = 200, offsetHeight = 200}, -- 25: dawn_up_sing 0007
		{x = 1900, y = 392, width = 372, height = 419, offsetX = -9, offsetY = 12, offsetWidth = 200, offsetHeight = 200}, -- 26: dawn_up_sing 0008
		{x = 1900, y = 392, width = 372, height = 419, offsetX = -9, offsetY = 12, offsetWidth = 200, offsetHeight = 200}, -- 27: dawn_up_sing 0009
		{x = 2268, y = 393, width = 390, height = 392, offsetX = 0, offsetY = 0, offsetWidth = 200, offsetHeight = 200}, -- 28: dawn_right_sing 0000
		{x = 2268, y = 393, width = 390, height = 392, offsetX = 0, offsetY = 0, offsetWidth = 200, offsetHeight = 200}, -- 29: dawn_right_sing 0001
		{x = 0, y = 813, width = 387, height = 387, offsetX = -5, offsetY = -5, offsetWidth = 200, offsetHeight = 200}, -- 30: dawn_right_sing 0002
		{x = 0, y = 813, width = 387, height = 387, offsetX = -5, offsetY = -5, offsetWidth = 200, offsetHeight = 200}, -- 31: dawn_right_sing 0003
		{x = 389, y = 813, width = 390, height = 386, offsetX = -5, offsetY = -6, offsetWidth = 200, offsetHeight = 200}, -- 32: dawn_right_sing 0004
		{x = 389, y = 813, width = 390, height = 386, offsetX = -5, offsetY = -6, offsetWidth = 200, offsetHeight = 200}, -- 33: dawn_right_sing 0005
		{x = 780, y = 813, width = 392, height = 385, offsetX = -5, offsetY = -7, offsetWidth = 200, offsetHeight = 200}, -- 34: dawn_right_sing 0006
		{x = 780, y = 813, width = 392, height = 385, offsetX = -5, offsetY = -7, offsetWidth = 200, offsetHeight = 200}, -- 35: dawn_right_sing 0007
		{x = 780, y = 813, width = 392, height = 385, offsetX = -5, offsetY = -7, offsetWidth = 200, offsetHeight = 200}, -- 36: dawn_right_sing 0008
		{x = 780, y = 813, width = 392, height = 385, offsetX = -5, offsetY = -7, offsetWidth = 200, offsetHeight = 200}, -- 37: dawn_right_sing 0009
		{x = 1173, y = 813, width = 351, height = 385, offsetX = 0, offsetY = 0, offsetWidth = 200, offsetHeight = 200}, -- 38: dawn_left_sing 0000
		{x = 1173, y = 813, width = 351, height = 385, offsetX = 0, offsetY = 0, offsetWidth = 200, offsetHeight = 200}, -- 39: dawn_left_sing 0001
		{x = 1525, y = 813, width = 352, height = 384, offsetX = 3, offsetY = -1, offsetWidth = 200, offsetHeight = 200}, -- 40: dawn_left_sing 0002
		{x = 1525, y = 813, width = 352, height = 384, offsetX = 3, offsetY = -1, offsetWidth = 200, offsetHeight = 200}, -- 41: dawn_left_sing 0003
		{x = 1878, y = 813, width = 352, height = 383, offsetX = 6, offsetY = -2, offsetWidth = 200, offsetHeight = 200}, -- 42: dawn_left_sing 0004
		{x = 1878, y = 813, width = 352, height = 383, offsetX = 6, offsetY = -2, offsetWidth = 200, offsetHeight = 200}, -- 43: dawn_left_sing 0005
		{x = 2231, y = 813, width = 352, height = 381, offsetX = 9, offsetY = -3, offsetWidth = 200, offsetHeight = 200}, -- 44: dawn_left_sing 0006
		{x = 2231, y = 813, width = 352, height = 381, offsetX = 9, offsetY = -3, offsetWidth = 200, offsetHeight = 200}, -- 45: dawn_left_sing 0007
		{x = 2231, y = 813, width = 352, height = 381, offsetX = 9, offsetY = -3, offsetWidth = 200, offsetHeight = 200}, -- 46: dawn_left_sing 0008
		{x = 2231, y = 813, width = 352, height = 381, offsetX = 9, offsetY = -3, offsetWidth = 200, offsetHeight = 200}, -- 47: dawn_left_sing 0009
		{x = 0, y = 1202, width = 340, height = 388, offsetX = 0, offsetY = 0, offsetWidth = 200, offsetHeight = 200}, -- 48: dawn_idle 0000
		{x = 341, y = 1202, width = 338, height = 386, offsetX = 0, offsetY = -2, offsetWidth = 200, offsetHeight = 200}, -- 49: dawn_idle 0001
		{x = 341, y = 1202, width = 338, height = 386, offsetX = 0, offsetY = -2, offsetWidth = 200, offsetHeight = 200}, -- 50: dawn_idle 0002
		{x = 680, y = 1202, width = 336, height = 384, offsetX = 0, offsetY = -4, offsetWidth = 200, offsetHeight = 200}, -- 51: dawn_idle 0003
		{x = 680, y = 1202, width = 336, height = 384, offsetX = 0, offsetY = -4, offsetWidth = 200, offsetHeight = 200}, -- 52: dawn_idle 0004
		{x = 1017, y = 1202, width = 335, height = 387, offsetX = 0, offsetY = -1, offsetWidth = 200, offsetHeight = 200}, -- 53: dawn_idle 0005
		{x = 1017, y = 1202, width = 335, height = 387, offsetX = 0, offsetY = -1, offsetWidth = 200, offsetHeight = 200}, -- 54: dawn_idle 0006
		{x = 1353, y = 1202, width = 337, height = 388, offsetX = 0, offsetY = 0, offsetWidth = 200, offsetHeight = 200}, -- 55: dawn_idle 0007
		{x = 1353, y = 1202, width = 337, height = 388, offsetX = 0, offsetY = 0, offsetWidth = 200, offsetHeight = 200}, -- 56: dawn_idle 0008
		{x = 0, y = 1202, width = 340, height = 388, offsetX = 0, offsetY = 0, offsetWidth = 200, offsetHeight = 200}, -- 57: dawn_idle 0009
		{x = 1173, y = 813, width = 351, height = 385, offsetX = -2, offsetY = 12, offsetWidth = 200, offsetHeight = 200}, -- 58: dawn_left_miss 0000
		{x = 1691, y = 1202, width = 357, height = 369, offsetX = 0, offsetY = 0, offsetWidth = 200, offsetHeight = 200}, -- 59: dawn_left_miss 0001
		{x = 1691, y = 1202, width = 357, height = 369, offsetX = 0, offsetY = 0, offsetWidth = 200, offsetHeight = 200}, -- 60: dawn_left_miss 0002
		{x = 2049, y = 1202, width = 342, height = 377, offsetX = -5, offsetY = 9, offsetWidth = 200, offsetHeight = 200}, -- 61: dawn_left_miss 0003
		{x = 2049, y = 1202, width = 342, height = 377, offsetX = -5, offsetY = 9, offsetWidth = 200, offsetHeight = 200}, -- 62: dawn_left_miss 0004
		{x = 2049, y = 1202, width = 342, height = 377, offsetX = -5, offsetY = 9, offsetWidth = 200, offsetHeight = 200}, -- 63: dawn_left_miss 0005
		{x = 2049, y = 1202, width = 342, height = 377, offsetX = -5, offsetY = 9, offsetWidth = 200, offsetHeight = 200}, -- 64: dawn_left_miss 0006
		{x = 2049, y = 1202, width = 342, height = 377, offsetX = -5, offsetY = 9, offsetWidth = 200, offsetHeight = 200}, -- 65: dawn_left_miss 0007
		{x = 2049, y = 1202, width = 342, height = 377, offsetX = -5, offsetY = 9, offsetWidth = 200, offsetHeight = 200}, -- 66: dawn_left_miss 0008
		{x = 2049, y = 1202, width = 342, height = 377, offsetX = -5, offsetY = 9, offsetWidth = 200, offsetHeight = 200}, -- 67: dawn_left_miss 0009
		{x = 0, y = 392, width = 377, height = 360, offsetX = -4, offsetY = 14, offsetWidth = 200, offsetHeight = 200}, -- 68: dawn_down_miss 0000
		{x = 0, y = 1591, width = 349, height = 339, offsetX = 0, offsetY = 0, offsetWidth = 200, offsetHeight = 200}, -- 69: dawn_down_miss 0001
		{x = 0, y = 1591, width = 349, height = 339, offsetX = 0, offsetY = 0, offsetWidth = 200, offsetHeight = 200}, -- 70: dawn_down_miss 0002
		{x = 350, y = 1589, width = 343, height = 343, offsetX = -3, offsetY = 4, offsetWidth = 200, offsetHeight = 200}, -- 71: dawn_down_miss 0003
		{x = 350, y = 1589, width = 343, height = 343, offsetX = -3, offsetY = 4, offsetWidth = 200, offsetHeight = 200}, -- 72: dawn_down_miss 0004
		{x = 350, y = 1589, width = 343, height = 343, offsetX = -3, offsetY = 4, offsetWidth = 200, offsetHeight = 200}, -- 73: dawn_down_miss 0005
		{x = 350, y = 1589, width = 343, height = 343, offsetX = -3, offsetY = 4, offsetWidth = 200, offsetHeight = 200}, -- 74: dawn_down_miss 0006
		{x = 350, y = 1589, width = 343, height = 343, offsetX = -3, offsetY = 4, offsetWidth = 200, offsetHeight = 200}, -- 75: dawn_down_miss 0007
		{x = 350, y = 1589, width = 343, height = 343, offsetX = -3, offsetY = 4, offsetWidth = 200, offsetHeight = 200}, -- 76: dawn_down_miss 0008
		{x = 350, y = 1589, width = 343, height = 343, offsetX = -3, offsetY = 4, offsetWidth = 200, offsetHeight = 200}, -- 77: dawn_down_miss 0009
		{x = 1140, y = 392, width = 382, height = 407, offsetX = 5, offsetY = 16, offsetWidth = 200, offsetHeight = 200}, -- 78: dawn_up_miss 0000
		{x = 694, y = 1589, width = 331, height = 488, offsetX = 0, offsetY = 0, offsetWidth = 200, offsetHeight = 200}, -- 79: dawn_up_miss 0001
		{x = 694, y = 1589, width = 331, height = 488, offsetX = 0, offsetY = 0, offsetWidth = 200, offsetHeight = 200}, -- 80: dawn_up_miss 0002
		{x = 1026, y = 1589, width = 320, height = 392, offsetX = -3, offsetY = 5, offsetWidth = 200, offsetHeight = 200}, -- 81: dawn_up_miss 0003
		{x = 1026, y = 1589, width = 320, height = 392, offsetX = -3, offsetY = 5, offsetWidth = 200, offsetHeight = 200}, -- 82: dawn_up_miss 0004
		{x = 1026, y = 1589, width = 320, height = 392, offsetX = -3, offsetY = 5, offsetWidth = 200, offsetHeight = 200}, -- 83: dawn_up_miss 0005
		{x = 1026, y = 1589, width = 320, height = 392, offsetX = -3, offsetY = 5, offsetWidth = 200, offsetHeight = 200}, -- 84: dawn_up_miss 0006
		{x = 1026, y = 1589, width = 320, height = 392, offsetX = -3, offsetY = 5, offsetWidth = 200, offsetHeight = 200}, -- 85: dawn_up_miss 0007
		{x = 1026, y = 1589, width = 320, height = 392, offsetX = -3, offsetY = 5, offsetWidth = 200, offsetHeight = 200}, -- 86: dawn_up_miss 0008
		{x = 1026, y = 1589, width = 320, height = 392, offsetX = -3, offsetY = 5, offsetWidth = 200, offsetHeight = 200}, -- 87: dawn_up_miss 0009
		{x = 2268, y = 393, width = 390, height = 392, offsetX = 4, offsetY = 20, offsetWidth = 200, offsetHeight = 200}, -- 88: dawn_right_miss 0000
		{x = 1347, y = 1589, width = 339, height = 368, offsetX = 0, offsetY = 0, offsetWidth = 200, offsetHeight = 200}, -- 89: dawn_right_miss 0001
		{x = 1347, y = 1589, width = 339, height = 368, offsetX = 0, offsetY = 0, offsetWidth = 200, offsetHeight = 200}, -- 90: dawn_right_miss 0002
		{x = 1687, y = 1589, width = 330, height = 373, offsetX = -2, offsetY = 6, offsetWidth = 200, offsetHeight = 200}, -- 91: dawn_right_miss 0003
		{x = 1687, y = 1589, width = 330, height = 373, offsetX = -2, offsetY = 6, offsetWidth = 200, offsetHeight = 200}, -- 92: dawn_right_miss 0004
		{x = 1687, y = 1589, width = 330, height = 373, offsetX = -2, offsetY = 6, offsetWidth = 200, offsetHeight = 200}, -- 93: dawn_right_miss 0005
		{x = 1687, y = 1589, width = 330, height = 373, offsetX = -2, offsetY = 6, offsetWidth = 200, offsetHeight = 200}, -- 94: dawn_right_miss 0006
		{x = 1687, y = 1589, width = 330, height = 373, offsetX = -2, offsetY = 6, offsetWidth = 200, offsetHeight = 200}, -- 95: dawn_right_miss 0007
		{x = 1687, y = 1589, width = 330, height = 373, offsetX = -2, offsetY = 6, offsetWidth = 200, offsetHeight = 200}, -- 96: dawn_right_miss 0008
		{x = 1687, y = 1589, width = 330, height = 373, offsetX = -2, offsetY = 6, offsetWidth = 200, offsetHeight = 200} -- 97: dawn_right_miss 0009
	},
	{
		["down miss"] = {start = 68, stop = 77, speed = 32, offsetX = 3, offsetY = -44},
		["left miss"] = {start = 58, stop = 67, speed = 32, offsetX = 3, offsetY = -20},
		["right miss"] = {start = 88, stop = 97, speed = 32, offsetX = -3, offsetY = -20},
		["up miss"] = {start = 68, stop = 87, speed = 32, offsetX = -7, offsetY = -4}
		,
		["down"] = {start = 8, stop = 17, speed = 32, offsetX = -2, offsetY = -27},
		["left"] = {start = 38, stop = 47, speed = 32, offsetX = -5, offsetY = -5},
		["right"] = {start = 28, stop = 37, speed = 32, offsetX = 8, offsetY = 5},
		["up"] = {start = 18, stop = 27, speed = 32, offsetX = 3, offsetY = 16},

		["idle"] = {start = 48, stop = 57, speed = 32, offsetX = 0, offsetY = 0},
		["dodge"] = {start = 1, stop = 7, speed = 24, offsetX = -3, offsetY = 5}
	},
	"idle",
	false
)
