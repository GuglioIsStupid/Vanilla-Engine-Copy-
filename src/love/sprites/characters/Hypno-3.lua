return graphics.newSprite(
	love.graphics.newImage(graphics.imagePath("characters/ABOMINATION_HYPNO")), -- Do not add the .png extension
	{
		{x = 0, y = 0, width = 767, height = 746, offsetX = 0, offsetY = -12, offsetWidth = 769, offsetHeight = 761}, -- 1: down0000
		{x = 817, y = 0, width = 767, height = 746, offsetX = 0, offsetY = -12, offsetWidth = 769, offsetHeight = 761}, -- 2: down0001
		{x = 1634, y = 0, width = 763, height = 753, offsetX = -5, offsetY = -8, offsetWidth = 769, offsetHeight = 761}, -- 3: down0002
		{x = 2447, y = 0, width = 763, height = 753, offsetX = -5, offsetY = -8, offsetWidth = 769, offsetHeight = 761}, -- 4: down0003
		{x = 3260, y = 0, width = 765, height = 758, offsetX = -4, offsetY = -3, offsetWidth = 769, offsetHeight = 761}, -- 5: down0004
		{x = 4075, y = 0, width = 765, height = 758, offsetX = -4, offsetY = -3, offsetWidth = 769, offsetHeight = 761}, -- 6: down0005
		{x = 4890, y = 0, width = 765, height = 761, offsetX = -3, offsetY = 0, offsetWidth = 769, offsetHeight = 761}, -- 7: down0006
		{x = 5705, y = 0, width = 765, height = 761, offsetX = -3, offsetY = 0, offsetWidth = 769, offsetHeight = 761}, -- 8: down0007
		{x = 5705, y = 0, width = 765, height = 761, offsetX = -3, offsetY = 0, offsetWidth = 769, offsetHeight = 761}, -- 9: down0008
		{x = 5705, y = 0, width = 765, height = 761, offsetX = -3, offsetY = 0, offsetWidth = 769, offsetHeight = 761}, -- 10: down0009
		{x = 5705, y = 0, width = 765, height = 761, offsetX = -3, offsetY = 0, offsetWidth = 769, offsetHeight = 761}, -- 11: down0010
		{x = 5705, y = 0, width = 765, height = 761, offsetX = -3, offsetY = 0, offsetWidth = 769, offsetHeight = 761}, -- 12: down0011
		{x = 5705, y = 0, width = 765, height = 761, offsetX = -3, offsetY = 0, offsetWidth = 769, offsetHeight = 761}, -- 13: down0012
		{x = 5705, y = 0, width = 765, height = 761, offsetX = -3, offsetY = 0, offsetWidth = 769, offsetHeight = 761}, -- 14: down0013
		{x = 6520, y = 0, width = 768, height = 794, offsetX = 0, offsetY = -175, offsetWidth = 769, offsetHeight = 972}, -- 15: idle0000
		{x = 7338, y = 0, width = 767, height = 761, offsetX = -1, offsetY = -208, offsetWidth = 769, offsetHeight = 972}, -- 16: idle0001
		{x = 0, y = 844, width = 766, height = 772, offsetX = -3, offsetY = -200, offsetWidth = 769, offsetHeight = 972}, -- 17: idle0002
		{x = 816, y = 844, width = 765, height = 815, offsetX = -4, offsetY = -157, offsetWidth = 769, offsetHeight = 972}, -- 18: idle0003
		{x = 1631, y = 844, width = 765, height = 806, offsetX = -4, offsetY = -166, offsetWidth = 769, offsetHeight = 972}, -- 19: idle0004
		{x = 2446, y = 844, width = 765, height = 853, offsetX = -4, offsetY = -119, offsetWidth = 769, offsetHeight = 972}, -- 20: idle0005
		{x = 3261, y = 844, width = 762, height = 819, offsetX = -6, offsetY = -153, offsetWidth = 769, offsetHeight = 972}, -- 21: idle0006
		{x = 4073, y = 844, width = 762, height = 883, offsetX = -6, offsetY = -89, offsetWidth = 769, offsetHeight = 972}, -- 22: idle0007
		{x = 4885, y = 844, width = 763, height = 822, offsetX = -5, offsetY = -148, offsetWidth = 769, offsetHeight = 972}, -- 23: idle0008
		{x = 5698, y = 844, width = 763, height = 970, offsetX = -5, offsetY = 0, offsetWidth = 769, offsetHeight = 972}, -- 24: idle0009
		{x = 6511, y = 844, width = 764, height = 824, offsetX = -5, offsetY = -148, offsetWidth = 769, offsetHeight = 972}, -- 25: idle0010
		{x = 7325, y = 844, width = 764, height = 821, offsetX = -5, offsetY = -151, offsetWidth = 769, offsetHeight = 972}, -- 26: idle0011
		{x = 0, y = 1864, width = 764, height = 844, offsetX = -5, offsetY = -128, offsetWidth = 769, offsetHeight = 972}, -- 27: idle0012
		{x = 814, y = 1864, width = 764, height = 796, offsetX = -5, offsetY = -176, offsetWidth = 769, offsetHeight = 972}, -- 28: idle0013
		{x = 1628, y = 1864, width = 757, height = 1153, offsetX = -3, offsetY = 0, offsetWidth = 763, offsetHeight = 1153}, -- 29: up0000
		{x = 2435, y = 1864, width = 757, height = 1120, offsetX = -3, offsetY = -33, offsetWidth = 763, offsetHeight = 1153}, -- 30: up0001
		{x = 3242, y = 1864, width = 761, height = 1043, offsetX = -2, offsetY = -110, offsetWidth = 763, offsetHeight = 1153}, -- 31: up0002
		{x = 4053, y = 1864, width = 761, height = 1030, offsetX = -2, offsetY = -123, offsetWidth = 763, offsetHeight = 1153}, -- 32: up0003
		{x = 4864, y = 1864, width = 762, height = 993, offsetX = -1, offsetY = -160, offsetWidth = 763, offsetHeight = 1153}, -- 33: up0004
		{x = 5676, y = 1864, width = 762, height = 990, offsetX = -1, offsetY = -163, offsetWidth = 763, offsetHeight = 1153}, -- 34: up0005
		{x = 6488, y = 1864, width = 762, height = 984, offsetX = 0, offsetY = -169, offsetWidth = 763, offsetHeight = 1153}, -- 35: up0006
		{x = 7300, y = 1864, width = 762, height = 986, offsetX = 0, offsetY = -167, offsetWidth = 763, offsetHeight = 1153}, -- 36: up0007
		{x = 0, y = 3067, width = 762, height = 986, offsetX = 0, offsetY = -167, offsetWidth = 763, offsetHeight = 1153}, -- 37: up0008
		{x = 812, y = 3067, width = 762, height = 987, offsetX = 0, offsetY = -166, offsetWidth = 763, offsetHeight = 1153}, -- 38: up0009
		{x = 812, y = 3067, width = 762, height = 987, offsetX = 0, offsetY = -166, offsetWidth = 763, offsetHeight = 1153}, -- 39: up0010
		{x = 812, y = 3067, width = 762, height = 987, offsetX = 0, offsetY = -166, offsetWidth = 763, offsetHeight = 1153}, -- 40: up0011
		{x = 812, y = 3067, width = 762, height = 987, offsetX = 0, offsetY = -166, offsetWidth = 763, offsetHeight = 1153}, -- 41: up0012
		{x = 812, y = 3067, width = 762, height = 987, offsetX = 0, offsetY = -166, offsetWidth = 763, offsetHeight = 1153}, -- 42: up0013
		{x = 1624, y = 3067, width = 885, height = 902, offsetX = 0, offsetY = 0, offsetWidth = 885, offsetHeight = 905}, -- 43: left instance 10000
		{x = 2559, y = 3067, width = 884, height = 887, offsetX = -1, offsetY = -15, offsetWidth = 885, offsetHeight = 905}, -- 44: left instance 10001
		{x = 3493, y = 3067, width = 819, height = 838, offsetX = -66, offsetY = -67, offsetWidth = 885, offsetHeight = 905}, -- 45: left instance 10002
		{x = 4362, y = 3067, width = 815, height = 835, offsetX = -70, offsetY = -70, offsetWidth = 885, offsetHeight = 905}, -- 46: left instance 10003
		{x = 5227, y = 3067, width = 788, height = 829, offsetX = -97, offsetY = -75, offsetWidth = 885, offsetHeight = 905}, -- 47: left instance 10004
		{x = 6065, y = 3067, width = 780, height = 827, offsetX = -105, offsetY = -77, offsetWidth = 885, offsetHeight = 905}, -- 48: left instance 10005
		{x = 6895, y = 3067, width = 766, height = 822, offsetX = -119, offsetY = -83, offsetWidth = 885, offsetHeight = 905}, -- 49: left instance 10006
		{x = 6895, y = 3067, width = 766, height = 822, offsetX = -119, offsetY = -83, offsetWidth = 885, offsetHeight = 905}, -- 50: left instance 10007
		{x = 0, y = 4104, width = 765, height = 828, offsetX = -120, offsetY = -77, offsetWidth = 885, offsetHeight = 905}, -- 51: left instance 10008
		{x = 0, y = 4104, width = 765, height = 828, offsetX = -120, offsetY = -77, offsetWidth = 885, offsetHeight = 905}, -- 52: left instance 10009
		{x = 0, y = 4104, width = 765, height = 828, offsetX = -120, offsetY = -77, offsetWidth = 885, offsetHeight = 905}, -- 53: left instance 10010
		{x = 0, y = 4104, width = 765, height = 828, offsetX = -120, offsetY = -77, offsetWidth = 885, offsetHeight = 905}, -- 54: left instance 10011
		{x = 0, y = 4104, width = 765, height = 828, offsetX = -120, offsetY = -77, offsetWidth = 885, offsetHeight = 905}, -- 55: left instance 10012
		{x = 0, y = 4104, width = 765, height = 828, offsetX = -120, offsetY = -77, offsetWidth = 885, offsetHeight = 905}, -- 56: left instance 10013
		{x = 815, y = 4104, width = 813, height = 944, offsetX = -12, offsetY = 0, offsetWidth = 825, offsetHeight = 947}, -- 57: right0000
		{x = 1678, y = 4104, width = 810, height = 941, offsetX = -12, offsetY = -3, offsetWidth = 825, offsetHeight = 947}, -- 58: right0001
		{x = 2538, y = 4104, width = 767, height = 932, offsetX = -13, offsetY = -14, offsetWidth = 825, offsetHeight = 947}, -- 59: right0002
		{x = 3355, y = 4104, width = 778, height = 913, offsetX = -13, offsetY = -33, offsetWidth = 825, offsetHeight = 947}, -- 60: right0003
		{x = 4183, y = 4104, width = 768, height = 912, offsetX = -4, offsetY = -34, offsetWidth = 825, offsetHeight = 947}, -- 61: right0004
		{x = 5001, y = 4104, width = 768, height = 904, offsetX = -4, offsetY = -42, offsetWidth = 825, offsetHeight = 947}, -- 62: right0005
		{x = 5819, y = 4104, width = 769, height = 913, offsetX = 0, offsetY = -34, offsetWidth = 825, offsetHeight = 947}, -- 63: right0006
		{x = 5819, y = 4104, width = 769, height = 913, offsetX = 0, offsetY = -34, offsetWidth = 825, offsetHeight = 947}, -- 64: right0007
		{x = 6638, y = 4104, width = 769, height = 910, offsetX = 0, offsetY = -37, offsetWidth = 825, offsetHeight = 947}, -- 65: right0008
		{x = 6638, y = 4104, width = 769, height = 910, offsetX = 0, offsetY = -37, offsetWidth = 825, offsetHeight = 947}, -- 66: right0009
		{x = 6638, y = 4104, width = 769, height = 910, offsetX = 0, offsetY = -37, offsetWidth = 825, offsetHeight = 947}, -- 67: right0010
		{x = 6638, y = 4104, width = 769, height = 910, offsetX = 0, offsetY = -37, offsetWidth = 825, offsetHeight = 947}, -- 68: right0011
		{x = 6638, y = 4104, width = 769, height = 910, offsetX = 0, offsetY = -37, offsetWidth = 825, offsetHeight = 947}, -- 69: right0012
		{x = 6638, y = 4104, width = 769, height = 910, offsetX = 0, offsetY = -37, offsetWidth = 825, offsetHeight = 947} -- 70: right0013
	},
	{
		["left"] = {start = 43, stop = 56, speed = 24, offsetX = 57, offsetY = 46},
        ["down"] = {start = 1, stop = 14, speed = 24, offsetX = -1, offsetY = -104},
        ["up"] = {start = 29, stop = 42, speed = 24, offsetX = -2, offsetY = 92},
        ["right"] = {start = 57, stop = 70, speed = 24, offsetX = -29, offsetY = -15},
        ["idle"] = {start = 15, stop = 28, speed = 24, offsetX = 0, offsetY = 0}
	},
	"idle", -- set to default animation
	false -- If the sprite repeats
)
