local difficulty

local stageBack, stageFront, curtains

return {
	enter = function(self, from, songNum, songAppend)
		usePendulum = false
		pauseColor = {129, 100, 223}
		weeks:enter()

		week = 1

		cam.sizeX, cam.sizeY = 0.75, 0.75
		camScale.x, camScale.y = 0.75, 0.75

		song = songNum
		difficulty = songAppend

        image = graphics.newImage(love.graphics.newImage(graphics.imagePath("image")))
		
		boyfriend = love.filesystem.load("sprites/someone.lua")()
		enemy = love.filesystem.load("sprites/someone.lua")()

		enemy.x, enemy.y = -475, 100
		boyfriend.x, boyfriend.y = 475, 150

		healthBarColorEnemy = {175,102,206}		

		enemyIcon:animate("daddy dearest", false)

		self:load()
	end,

	load = function(self)
		weeks:load()
		inst = love.audio.newSource("songs/song/Inst.ogg", "stream")
		voices = love.audio.newSource("songs/song/Voices.ogg", "stream")
		self:initUI()
		weeks:setupCountdown()
	end,

	initUI = function(self)
		weeks:initUI()
			weeks:generateNotes(love.filesystem.load("songs/song/chart.lua")())
		end
	end,

	update = function(self, dt)
		weeks:update(dt)
		if enemyEntrance then enemyEntrance:update(dt) end
		if playerBoy then playerBoy:update(dt) end


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
				Timer.clear()
				pendulum.orientation = 0
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

				image:draw

				boyfriend:draw()
				enemy:draw()
                girlfriend:draw()
            love.graphics.pop()
            love.graphics.push()
                love.graphics.translate(cam.x, cam.y)
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
		usePendulum = false
		weeks:leave()
	end
}