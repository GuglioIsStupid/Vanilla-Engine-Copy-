local difficulty

local stageBack, stageFront, curtains

return {
	enter = function(self, from, songNum, songAppend)
		usePendulum = true
		pauseColor = {129, 100, 223}
		weeks:enter()

		week = 1

		cam.sizeX, cam.sizeY = 0.75, 0.75
		camScale.x, camScale.y = 0.75, 0.75

		song = songNum
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
			inst = love.audio.newSource("songs/lost-cause/Inst.ogg", "stream")
			voices = love.audio.newSource("songs/lost-cause/Voices.ogg", "stream")
			bg = graphics.newImage(love.graphics.newImage(graphics.imagePath("cave/cave")))
			playerBoy = love.filesystem.load("sprites/characters/omgboyfriendareyoudead.lua")()
			boyfriend = love.filesystem.load("sprites/characters/GF-final.lua")()
			enemy = love.filesystem.load("sprites/characters/Hypno-3.lua")()
			enemyEntrance = love.filesystem.load("sprites/characters/Hypno-3-Enter.lua")()
			dead_ass_bitch_LMAOOOO = graphics.newImage(love.graphics.newImage(graphics.imagePath("characters/dead_ass_bitch_LMAOOOO")))
			enemy.x, enemy.y = 450, -75
			enemyEntrance.x, enemyEntrance.y = enemy.x, enemy.y
			enemy.sizeX, enemy.sizeY = 0.8, 0.8
			enemyEntrance.sizeX, enemyEntrance.sizeY = 0.8, 0.8
			dead_ass_bitch_LMAOOOO.sizeX, dead_ass_bitch_LMAOOOO.sizeY = 0.5, 0.5 -- why is he so large :skull:

			boyfriend.x, boyfriend.y = 75, 205
			playerBoy.x, playerBoy.y = -75, 225
			dead_ass_bitch_LMAOOOO.x, dead_ass_bitch_LMAOOOO.y = -240, 380
			treeBG = nil
			clouds = nil
			treeForeground = nil
			midground = nil
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
			weeks:generateNotes(love.filesystem.load("songs/lost-cause/hard.lua")())
		elseif song == 2 then
			weeks:generateNotes(love.filesystem.load("songs/left-unchecked/hard.lua")())
		else
			weeks:generateNotes(love.filesystem.load("songs/safety-lullaby/hard.lua")())
		end
	end,

	update = function(self, dt)
		weeks:update(dt)
		if enemyEntrance then enemyEntrance:update(dt) end
		if playerBoy then playerBoy:update(dt) end

		if song == 3 then
			if musicTime <= 26735.2941176471 then
				if boyfriend:getAnimName() == "idle" then
					playerBoy:animate("idle", false)
					boyfriend:animate("i love cock", false)
				elseif boyfriend:getAnimName() == "left" then
					playerBoy:animate("left", false)
					boyfriend:animate("i love cock", false)
				elseif boyfriend:getAnimName() == "right" then
					playerBoy:animate("right", false)
					boyfriend:animate("i love cock", false)
				elseif boyfriend:getAnimName() == "up" then
					playerBoy:animate("up", false)
					boyfriend:animate("i love cock", false)
				elseif boyfriend:getAnimName() == "down" then
					playerBoy:animate("down", false)
					boyfriend:animate("i love cock", false)
				elseif boyfriend:getAnimName() == "miss left" then
					playerBoy:animate("miss left", false)
					boyfriend:animate("i love cock", false)
				elseif boyfriend:getAnimName() == "miss right" then
					playerBoy:animate("right miss", false)
					boyfriend:animate("i love cock", false)
				elseif boyfriend:getAnimName() == "miss up" then
					playerBoy:animate("miss up", false)
					boyfriend:animate("i love cock", false)
				elseif boyfriend:getAnimName() == "down" then
					playerBoy:animate("miss down", false)
					boyfriend:animate("i love cock", false)
				end
			end

			if musicTime >= 26735 and musicTime <= 26785 then
				playerBoy:animate("drop", false)
				enemyEntrance:animate("anim", false)
				weeks:pendulumSwing()
			end
		end

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
				if song ~= 3 then
					love.graphics.scale(0.75, 0.75)
				else
					love.graphics.scale(0.85, 0.85)
				end
                -- stage background
				if song ~= 3 then
					bg:draw()
					treeBG:draw()
					clouds:draw()
					treeForeground:draw()
					midground:draw()
					enemy:draw()
					boyfriend:draw()
				else
					bg:draw()
					if musicTime >= 26735.2941176471 then
						if not enemyEntrance:isAnimated() then
							enemy:draw()
						else
							enemyEntrance:draw()
						end
						if musicTime >= 26735.2941176471 and (not playerBoy:isAnimated() and playerBoy:getAnimName() == "drop") then
							dead_ass_bitch_LMAOOOO:draw()
							boyfriend:draw()
						else
							playerBoy:draw()
						end
					end
				end

                --girlfriend:draw()
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
		bg = nil
		treeBG = nil
		clouds = nil
		treeForeground = nil
		midground = nil

		weeks:leave()
	end
}