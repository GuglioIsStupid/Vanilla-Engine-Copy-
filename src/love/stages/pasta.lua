return {
    enter = function()
        stageImages = {
            graphics.newImage(love.graphics.newImage(graphics.imagePath("bar/sky"))), -- sky 1 
            graphics.newImage(love.graphics.newImage(graphics.imagePath("bar/bar"))), -- BG 2
            graphics.newImage(love.graphics.newImage(graphics.imagePath("bar/machine"))), -- slot machine 3
            graphics.newImage(love.graphics.newImage(graphics.imagePath("bar/table"))), -- table 4
            graphics.newImage(love.graphics.newImage(graphics.imagePath("bar/shine"))), -- shine 5
            love.filesystem.load("sprites/bar/Mousetable.lua")(), -- mouse table 6
            love.filesystem.load("sprites/bar/jeff.lua")(), -- jeff 7
            love.filesystem.load("sprites/bar/jeffArm.lua")(), -- jeff2 8
            love.filesystem.load("sprites/bar/brian_idle.lua")(), -- brian_idle 9
            love.filesystem.load("sprites/bar/Ben_Drowned_BG.lua")(), -- Ben? Yes. No. Hohoho! 10
            love.filesystem.load("sprites/bar/CoronationPeach.lua")(), -- CoronationPeach 11
            love.filesystem.load("sprites/bar/Buds_Slender_Effects.lua")(), -- tall man 12
            love.filesystem.load("sprites/bar/SFingers.lua")(), -- SFingers 13
            love.filesystem.load("sprites/bar/Squirtward.lua")(), -- Squirtward 14
            love.filesystem.load("sprites/bar/ShintoPastaNight.lua")(), -- ShintoPastaNight 15
            love.filesystem.load("sprites/bar/MrWidemouth.lua")(), -- MrWidemouth 16
            love.filesystem.load("sprites/bar/Jack.lua")(), -- Jack 17
            love.filesystem.load("sprites/bar/SquirtwardHead.lua")(), -- SquirtwardHead 18
        }

        enemy = love.filesystem.load("sprites/characters/apparitiongf_assets.lua")()

        stageImages[1].x, stageImages[1].y = 144, -220

        stageImages[3].x, stageImages[3].y = -155, -171
        stageImages[3].sizeX, stageImages[3].sizeY = 0.4, 0.4

        stageImages[4].y = 426
        stageImages[4].sizeX, stageImages[4].sizeY = 0.7, 0.7

        stageImages[5].x, stageImages[5].y = 132, -231
        stageImages[5].sizeX, stageImages[5].sizeY = 1.6, 1.6

        stageImages[6].x, stageImages[6].y = -245, -3
        stageImages[6].sizeX, stageImages[6].sizeY = 0.75, 0.75

        stageImages[7].x, stageImages[7].y = -90, -136

        stageImages[8].x, stageImages[8].y = -73, -64

        stageImages[9].x, stageImages[9].y = -205, -142
        stageImages[9].sizeX, stageImages[9].sizeY = 1.2, 1.2

        stageImages[10].x, stageImages[10].y = 551, -105
        stageImages[10].sizeX, stageImages[10].sizeY = 0.6, 0.6

        stageImages[11].x, stageImages[11].y = -9, -166
        stageImages[11].sizeX, stageImages[11].sizeY = 0.6, 0.6

        stageImages[12].x, stageImages[12].y = 388, -153
        stageImages[12].sizeX, stageImages[12].sizeY = 0.55, 0.55

        stageImages[13].x, stageImages[13].y = 17, 0

        stageImages[14].x, stageImages[14].y = 236, -79
        stageImages[14].sizeX, stageImages[14].sizeY = 0.8, 0.8

        stageImages[15].x, stageImages[15].y = 88, -165
        stageImages[15].sizeX, stageImages[15].sizeY = 0.65, 0.65

        stageImages[16].x, stageImages[16].y = 206, -175

        stageImages[17].x, stageImages[17].y = -315, -137
        stageImages[17].sizeX, stageImages[17].sizeY = 0.7, 0.7

        stageImages[18].x, stageImages[18].y = 233, -168
        stageImages[18].sizeX, stageImages[18].sizeY = 0.8, 0.8

        girlfriend.x, girlfriend.y = 30, -90
        enemy.x, enemy.y = -380, -110
        boyfriend.x, boyfriend.y = 260, 100

        stageImages[6]:animate("anim", true)
		stageImages[7]:animate("anim", true)
		stageImages[8]:animate("anim", true)
		stageImages[9]:animate("anim", true)
		stageImages[11]:animate("anim", true)
		stageImages[12]:animate("anim", true)
		stageImages[13]:animate("anim", true)
		stageImages[14]:animate("anim", true)
		stageImages[15]:animate("anim", true)
		stageImages[16]:animate("anim", true)
		stageImages[17]:animate("anim", true)
        stageImages[18]:animate("anim", true)
    end,

    load = function()
    end,

    update = function(self, dt)
        stageImages[6]:update(dt)
        stageImages[7]:update(dt)
        stageImages[8]:update(dt)
        stageImages[9]:update(dt)
        stageImages[10]:update(dt)
        stageImages[11]:update(dt)
        stageImages[12]:update(dt)
        stageImages[13]:update(dt)
        stageImages[14]:update(dt)
        stageImages[15]:update(dt)
        stageImages[16]:update(dt)
        stageImages[17]:update(dt)
        stageImages[18]:update(dt)
    end,

    draw = function()
        love.graphics.push()
			love.graphics.translate(cam.x * 0.9, cam.y * 0.9)
            stageImages[1]:draw()
            stageImages[5]:draw()
            stageImages[2]:draw()

            stageImages[3]:draw()
            stageImages[9]:draw()
            stageImages[11]:draw()
            stageImages[13]:draw()
            stageImages[15]:draw()
            stageImages[16]:draw()

            stageImages[12]:draw()
            stageImages[14]:draw()
            stageImages[18]:draw()
            stageImages[10]:draw()

            stageImages[17]:draw()

            stageImages[7]:draw()
            stageImages[6]:draw()
            stageImages[8]:draw()

		love.graphics.pop()
		love.graphics.push()
			love.graphics.translate(cam.x, cam.y)
            stageImages[4]:draw()
            --boyfriend:draw()
            --enemy:draw()
            --player3:draw()
		love.graphics.pop()
		love.graphics.push()
			love.graphics.translate(cam.x * 1.1, cam.y * 1.1)

		love.graphics.pop()
    end,

    leave = function()
        stageImages[1] = nil
        stageImages[2] = nil
        stageImages[3] = nil
    end
}