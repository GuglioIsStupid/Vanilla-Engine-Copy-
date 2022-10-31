local difficulty

local stageBack, stageFront, curtains

return {
	enter = function(self, from, songNum, songAppend)
		usePendulum = false
		pauseColor = {129, 100, 223}
		curCharacter = "Hypno"
		weeksPasta1:enter()
		stages["pasta"]:enter()

		week = 1

		cam.sizeX, cam.sizeY = 0.75, 0.75
		camScale.x, camScale.y = 0.75, 0.75

		song = songNum
		difficulty = songAppend

		boyfriend = love.filesystem.load("sprites/characters/dawn.lua")()
		enemy = love.filesystem.load("sprites/characters/GF-Final.lua")()
        player3 = love.filesystem.load("sprites/characters/Hypno-1.lua")()

		healthBarColorEnemy = {175,102,206}		

		enemyIcon:animate("daddy dearest", false)
		usePendulum = true

		self:load()
	end,

	load = function(self)
		weeksPasta1:load()
		inst = love.audio.newSource("songs/pasta-night/Inst.ogg", "stream")
		voices = love.audio.newSource("songs/pasta-night/Voices.ogg", "stream")
		self:initUI()
		weeksPasta1:setupCountdown()
	end,

	initUI = function(self)
		weeksPasta1:initUI()
        weeksPasta2:initUI()
        weeksPasta3:initUI()
		weeksPasta1:generateNotes(love.filesystem.load("songs/pasta-night/hard.lua")())
        weeksPasta2:generateNotes(love.filesystem.load("songs/pasta-night/hard.lua")())
        weeksPasta3:generateNotes(love.filesystem.load("songs/pasta-night/hard.lua")())
	end,

	update = function(self, dt)
		weeksPasta1:update(dt)
        weeksPasta2:update(dt)
        weeksPasta3:update(dt)
		stages["pasta"]:update(dt)
		if health >= 80 then
			if enemyIcon:getAnimName() == "daddy dearest" then
				enemyIcon:animate("daddy dearest losing", false)
			end
		else
			if enemyIcon:getAnimName() == "daddy dearest losing" then
				enemyIcon:animate("daddy dearest", false)
			end
		end

		if musicTime >= 19230.7692307692 and musicTime <=19255.7692307692 then
				weeksPasta1:notesFukU()
			end
			if musicTime >= 20256.4102564103 and musicTime <=20281.4102564103 then
				weeksPasta1:PastaCam(-1)
			end
			if musicTime >= 22307.6923076923 and musicTime <=22332.6923076923 then
				weeksPasta1:PastaCam(1)
			end
			if musicTime >= 24615.3846153846 and musicTime <=24640.3846153846 then
				weeksPasta1:PastaCam()
			end
			if musicTime >= 26538.4615384615 and musicTime <=26563.4615384615 then
				weeksPasta1:PastaCam(-1)
			end
			if musicTime >= 28589.7435897436 and musicTime <=28614.7435897436 then
				weeksPasta1:PastaCam(1)
			end
			if musicTime >= 31666.6666666667 and musicTime <=31691.6666666667 then
				weeksPasta1:notesFukU()
			end
			if musicTime >= 32820.5128205128 and musicTime <=32845.5128205128 then
				weeksPasta1:PastaCam(-1)
			end
			if musicTime >= 36410.2564102564 and musicTime <=36435.2564102564 then
				weeksPasta1:PastaCam()
			end
			if musicTime >= 40512.8205128205 and musicTime <=40537.8205128205 then
				weeksPasta1:PastaCam(1)
			end
			if musicTime >= 41923.0769230769 and musicTime <=41948.0769230769 then
				weeksPasta1:notesFukU()
			end
			if musicTime >= 44615.3846153846 and musicTime <=44640.3846153846 then
				weeksPasta1:PastaCam()
			end
			if musicTime >= 46923.0769230769 and musicTime <=46948.0769230769 then
				weeksPasta1:PastaCam(-1)
			end
			if musicTime >= 50256.4102564103 and musicTime <=50281.4102564103 then
				weeksPasta1:notesFukU()
			end
			if musicTime >= 49230.7692307693 and musicTime <=49255.7692307693 then
				weeksPasta1:PastaCam()
			end
			if musicTime >= 56282.0512820513 and musicTime <=56307.0512820513 then
				weeksPasta1:notesFukU()
			end
			if musicTime >= 57435.8974358975 and musicTime <=57460.8974358975 then
				weeksPasta1:PastaCam(-1)
			end
			if musicTime >= 65641.0256410257 and musicTime <=65666.0256410257 then
				weeksPasta1:PastaCam(1)
			end
			if musicTime >= 68076.9230769231 and musicTime <=68101.9230769231 then
				weeksPasta1:notesFukU()
			end
			if musicTime >= 74230.7692307693 and musicTime <=74255.7692307693 then
				weeksPasta1:notesFukU()
			end
			if musicTime >= 75897.4358974359 and musicTime <=75922.4358974359 then
				weeksPasta1:PastaCam()
			end
			if musicTime >= 84102.5641025641 and musicTime <=84127.5641025641 then
				weeksPasta1:PastaCam(-1)
			end
			if musicTime >= 85897.4358974359 and musicTime <=85922.4358974359 then
				weeksPasta1:PastaCam(1)
			end
			if musicTime >= 86153.8461538462 and musicTime <=86178.8461538462 then
				weeksPasta1:notesFukU()
			end
			if musicTime >= 88205.1282051282 and musicTime <=88230.1282051282 then
				weeksPasta1:PastaCam()
			end
			if musicTime >= 90769.2307692308 and musicTime <=90794.2307692308 then
				weeksPasta1:notesFukU()
			end
			if musicTime >= 90512.8205128205 and musicTime <=90537.8205128205 then
				weeksPasta1:PastaCam(1)
			end
			if musicTime >= 92564.1025641025 and musicTime <=92589.1025641025 then
				weeksPasta1:PastaCam(-1)
			end
			if musicTime >= 94871.7948717949 and musicTime <=94896.7948717949 then
				weeksPasta1:notesFukU()
			end
			if musicTime >= 94615.3846153846 and musicTime <=94640.3846153846 then
				weeksPasta1:PastaCam(1)
			end
			if musicTime >= 96666.6666666666 and musicTime <=96691.6666666666 then
				weeksPasta1:PastaCam()
			end
			if musicTime >= 98205.1282051282 and musicTime <=98230.1282051282 then
				weeksPasta1:PastaCam(1)
			end
			if musicTime >= 98461.5384615384 and musicTime <=98486.5384615384 then
				weeksPasta1:notesFukU()
			end
			if musicTime >= 100512.82051282 and musicTime <=100537.82051282 then
				weeksPasta1:PastaCam()
			end
			if musicTime >= 108717.948717949 and musicTime <=108742.948717949 then
				weeksPasta1:PastaCam(1)
			end
			if musicTime >= 118974.358974359 and musicTime <=118999.358974359 then
				weeksPasta1:PastaCam(-1)
			end
			if musicTime >= 128205.128205128 and musicTime <=128230.128205128 then
				weeksPasta1:notesFukU()
			end
			if musicTime >= 127179.487179487 and musicTime <=127204.487179487 then
				weeksPasta1:PastaCam()
			end
			if musicTime >= 134102.564102564 and musicTime <=134127.564102564 then
				weeksPasta1:notesFukU()
			end
			if musicTime >= 135384.615384615 and musicTime <=135409.615384615 then
				weeksPasta1:PastaCam(1)
			end
			if musicTime >= 137435.897435897 and musicTime <=137460.897435897 then
				weeksPasta1:PastaCam(-1)
			end
			if musicTime >= 140512.82051282 and musicTime <=140537.82051282 then
				weeksPasta1:notesFukU()
			end
			if musicTime >= 139487.179487179 and musicTime <=139512.179487179 then
				weeksPasta1:PastaCam()
			end
			if musicTime >= 143589.743589744 and musicTime <=143614.743589744 then
				weeksPasta1:PastaCam(-1)
			end
			if musicTime >= 145637.820512821 and musicTime <=145662.820512821 then
				weeksPasta1:PastaCam()
			end
			if musicTime >= 145641.025641026 and musicTime <=145666.025641026 then
				weeksPasta1:notesFukU()
			end
			if musicTime >= 147692.307692308 and musicTime <=147717.307692308 then
				weeksPasta1:PastaCam(1)
			end
			if musicTime >= 149487.179487179 and musicTime <=149512.179487179 then
				weeksPasta1:PastaCam()
			end
			if musicTime >= 150128.205128205 and musicTime <=150153.205128205 then
				weeksPasta1:notesFukU()
			end
			if musicTime >= 154358.974358974 and musicTime <=154383.974358974 then
				weeksPasta1:notesFukU()
			end
			if musicTime >= 155641.025641026 and musicTime <=155666.025641026 then
				weeksPasta1:PastaCam(-1)
			end
			if musicTime >= 157948.717948718 and musicTime <=157973.717948718 then
				weeksPasta1:PastaCam(1)
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

		weeksPasta1:updateUI(dt)
        weeksPasta2:updateUI(dt)
        weeksPasta3:updateUI(dt)
	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
			love.graphics.scale(extraCamZoom.sizeX, extraCamZoom.sizeY)
			love.graphics.scale(cam.sizeX, cam.sizeY)
			stages["pasta"]:draw()
		love.graphics.pop()
		
		weeksPasta1:drawTimeLeftBar()
		weeksPasta1:drawHealthBar()
		if not paused then
			weeksPasta1:drawUI()
            weeksPasta2:drawUI()
            weeksPasta3:drawUI()
		end
	end,

	leave = function(self)
		usePendulum = false
		weeksPasta1:leave()
	end
}