return {
    enter = function()
        stageImages = {
            graphics.newImage(love.graphics.newImage(graphics.imagePath("hell/floor"))), -- floor 1
            graphics.newImage(love.graphics.newImage(graphics.imagePath("hell/floorbot"))), -- floorbot 2
            graphics.newImage(love.graphics.newImage(graphics.imagePath("hell/pil"))), -- pil 3
		    graphics.newImage(love.graphics.newImage(graphics.imagePath("hell/pilfor"))), -- pilfor 4
		    graphics.newImage(love.graphics.newImage(graphics.imagePath("hell/rocks"))), -- rocks 5
		    graphics.newImage(love.graphics.newImage(graphics.imagePath("hell/roof"))), -- roof 6
		    graphics.newImage(love.graphics.newImage(graphics.imagePath("hell/wall"))), -- wall 7
            love.filesystem.load("sprites/characters/hellbell.lua")(), -- hell bell 8
            love.filesystem.load("sprites/hell/lavatop.lua")(), -- lavatop 9 
		    love.filesystem.load("sprites/hell/lavabottom.lua")(), -- lava bottom 10
		    love.filesystem.load("sprites/hell/glowleft.lua")(), -- glow left 11
		    love.filesystem.load("sprites/hell/glowright.lua")() -- glow right 12
        }

        stageImages[1].x, stageImages[1].y = -201, 589
		stageImages[2].x, stageImages[2].y = 139, 536
		stageImages[3].x, stageImages[3].y = -164, 349
		stageImages[4].x, stageImages[4].y = 495, 599
		stageImages[5].x, stageImages[5].y = 73, 606
		stageImages[6].x, stageImages[6].y = 0, -1
		stageImages[7].x, stageImages[7].y = 0, 37

        stageImages[8].x, stageImages[8].y = 21, 175
        stageImages[8].sizeX, stageImages[8].sizeY = 0.55, 0.55

        stageImages[9].x, stageImages[9].y = -109, 653
        stageImages[9].sizeX, stageImages[9].sizeY = 0.6, 0.6
        stageImages[10].x, stageImages[10].y = -25, 611
        stageImages[10].sizeX, stageImages[10].sizeY = 0.55, 0.55

        enemy = love.filesystem.load("sprites/characters/beelze_ooscaryface.lua")()
		enemyCrazy = love.filesystem.load("sprites/characters/beelze_normal.lua")()

        enemy.x, enemy.y = 318, 269
        enemyCrazy.x, enemyCrazy.y = 318, 269
        enemy.sizeX, enemy.sizeY = 0.6, 0.6
        enemyCrazy.sizeX, enemyCrazy.sizeY = 0.6, 0.6
        boyfriend.x, boyfriend.y = 0, 0

    end,

    load = function()

    end,

    update = function(self, dt)
        enemyCrazy.x = enemy.x
        enemyCrazy.y = enemy.y
        enemyCrazy.sizeX = enemy.sizeX
        enemyCrazy.sizeY = enemy.sizeY
        enemyCrazy:update(dt)
    end,

    draw = function()
        love.graphics.push()
			love.graphics.translate(cam.x * 0.9, cam.y * 0.9)
            stageImages[7]:draw()
            stageImages[10]:draw()
            stageImages[9]:draw()
            stageImages[5]:draw()
            stageImages[11]:draw()
            stageImages[12]:draw()
            stageImages[6]:draw()
            stageImages[4]:draw()
            stageImages[1]:draw()
            stageImages[2]:draw()
            enemy:draw()
            enemyCrazy:draw()
            stageImages[8]:draw()

		love.graphics.pop()
		love.graphics.push()
			love.graphics.translate(cam.x, cam.y)
            stageImages[3]:draw()
			
		love.graphics.pop()
		love.graphics.push()
			love.graphics.translate(cam.x * 1.1, cam.y * 1.1)

		love.graphics.pop()
    end,

    leave = function()
        
    end
}