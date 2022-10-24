local difficulty

local stageBack, stageFront, curtains

return {
	enter = function(self, from, songNum, songAppend)
		pauseColor = {129, 100, 223}
		weeks:enter()

		week = 1

		cam.sizeX, cam.sizeY = 0.75, 0.75
		camScale.x, camScale.y = 0.75, 0.75

		song = 2
		difficulty = songAppend

        bg = graphics.newImage(love.graphics.newImage(graphics.imagePath("alley/BACKGROUND")))
        treeBG = graphics.newImage(love.graphics.newImage(graphics.imagePath("alley/Behind the clouds and fence")))
        clouds = graphics.newImage(love.graphics.newImage(graphics.imagePath("alley/Behind the Fence")))
        treeForeground = graphics.newImage(love.graphics.newImage(graphics.imagePath("alley/FOREGROUND TREE")))
        midground = graphics.newImage(love.graphics.newImage(graphics.imagePath("alley/MIDGROUND")))
		
		boyfriend = love.filesystem.load("sprites/characters/Hypno-GF.lua")()
		enemy = love.filesystem.load("sprites/characters/Hypno-1.lua")()

		enemy.x, enemy.y = -475, 100
		boyfriend.x, boyfriend.y = 475, 150

		healthBarColorEnemy = {175,102,206}		

		enemyIcon:animate("daddy dearest", false)

		self:load()
	end,

	load = function(self)
		weeks:load()

		if song == 3 then
			inst = love.audio.newSource("songs/week1/dadbattle/inst.ogg", "stream")
			voices = love.audio.newSource("songs/week1/dadbattle/voices.ogg", "stream")
		elseif song == 2 then
			inst = love.audio.newSource("songs/left-unchecked/Inst.ogg", "stream")
			voices = love.audio.newSource("songs/left-unchecked/Voices.ogg", "stream")
			midground = graphics.newImage(love.graphics.newImage(graphics.imagePath("alley/MIDGROUND BLOOD"))) -- switch to blood midground on song 2
			enemy = love.filesystem.load("sprites/characters/Hypno-2.lua")()
			enemy.x, enemy.y = -425, 50
		else
			inst = love.audio.newSource("songs/safety-lullaby/Inst.ogg", "stream")
			voices = love.audio.newSource("songs/safety-lullaby/Voices.ogg", "stream")
		end

		self:initUI()

		weeks:setupCountdown()
	end,

	initUI = function(self)
		weeks:initUI()

		if song == 3 then
			weeks:generateNotes(love.filesystem.load("songs/week1/dadbattle/" .. difficulty .. ".lua")())
		elseif song == 2 then
			weeks:generateNotes(love.filesystem.load("songs/left-unchecked/hard.lua")())
		else
			weeks:generateNotes(love.filesystem.load("songs/safety-lullaby/hard.lua")())
		end
	end,

	update = function(self, dt)
		weeks:update(dt)

		if health >= 80 then
			if enemyIcon:getAnimName() == "daddy dearest" then
				enemyIcon:animate("daddy dearest losing", false)
			end
		else
			if enemyIcon:getAnimName() == "daddy dearest losing" then
				enemyIcon:animate("daddy dearest", false)
			end
		end

		if not (countingDown or graphics.isFading()) and not (inst:isPlaying() and voices:isPlaying()) and not paused then
			if score > highscores[weekNum-1].scores[song] then
				highscores[weekNum-1].scores[song] = score
				saveHighscores()
			end
			newAccuracy = convertedAcc:gsub("%%", "")
			if tonumber(newAccuracy) > highscores[weekNum-1].accuracys[song] then
				print("New accuracy: " .. newAccuracy)
				highscores[weekNum-1].accuracys[song] = tonumber(newAccuracy)
				saveHighscores()
			end
			if storyMode and song < 3 then
				song = song + 1

				self:load()
			else
				status.setLoading(true)

				graphics.fadeOut(
					0.5,
					function()
						Gamestate.switch(menu)

						status.setLoading(false)
					end
				)
			end
		end

		weeks:updateUI(dt)
	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
			love.graphics.scale(extraCamZoom.sizeX, extraCamZoom.sizeY)
			love.graphics.scale(cam.sizeX, cam.sizeY)

            love.graphics.push()
                love.graphics.translate(cam.x * 0.9, cam.y * 0.9)
				love.graphics.scale(0.75, 0.75)
                -- stage background
				if song ~= 3 then
					bg:draw()
					treeBG:draw()
					clouds:draw()
					treeForeground:draw()
					midground:draw()
				end

                --girlfriend:draw()
            love.graphics.pop()
            love.graphics.push()
                love.graphics.translate(cam.x, cam.y)
                -- characters
                enemy:draw()
                boyfriend:draw()
            love.graphics.pop()
            love.graphics.push()
                love.graphics.translate(cam.x * 1.1, cam.y * 1.1)
                -- stage foreground (in front of characters)
            love.graphics.pop()
			weeks:drawRating(0.9)
		love.graphics.pop()
		
		weeks:drawTimeLeftBar()
		weeks:drawHealthBar()
		if not paused then
			weeks:drawUI()
		end
	end,

	leave = function(self)
		bg = nil
		treeBG = nil
		clouds = nil
		treeForeground = nil
		midground = nil

		weeks:leave()
	end
}