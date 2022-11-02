local difficulty

local stageBack, stageFront, curtains

return {
	enter = function(self, from, songNum, songAppend)
		usePendulum = false
		pauseColor = {129, 100, 223}
		weeksFrost:enter()

		week = 1

		cam.sizeX, cam.sizeY = 0.75, 0.75
		camScale.x, camScale.y = 0.75, 0.75

		song = songNum
		difficulty = songAppend

        bg = graphics.newImage(love.graphics.newImage(graphics.imagePath("frostbite/bg")))
        blas = graphics.newImage(love.graphics.newImage(graphics.imagePath("frostbite/Blastoise")))
		char = graphics.newImage(love.graphics.newImage(graphics.imagePath("frostbite/Charizard")))
        fog = graphics.newImage(love.graphics.newImage(graphics.imagePath("frostbite/fog")))
		poke = graphics.newImage(love.graphics.newImage(graphics.imagePath("frostbite/Pokemons")))

		blas.sizeX, blas.sizeY = 0.3, 0.3
		char.sizeX, char.sizeY = 0.3, 0.3
		poke.sizeX, poke.sizeY = 0.3, 0.3

		poke.x, poke.y = 380, -150
		char.x, char.y = -50, -250
		blas.x, blas.y = -380, -150


		
		boyfriend = love.filesystem.load("sprites/frostbite/Cold_Gold.lua")()
		enemy = love.filesystem.load("sprites/frostbite/mt_silver_red_norm.lua")()
		enemyTwo = love.filesystem.load("sprites/frostbite/mt_silver_red_dead.lua")()
		typhlosion = love.filesystem.load("sprites/frostbite/TYPHLOSION_MECHANIC.lua")()
		pikachuSpawn = love.filesystem.load("sprites/frostbite/freakachu_entrance.lua")()

		pikachu = love.filesystem.load("sprites/frostbite/Freakachu.lua")()

		enemy.sizeY, enemy.sizeX = 0.75, 0.75
		enemyTwo.sizeY, enemyTwo.sizeX = 0.75, 0.75
		boyfriend.sizeY, boyfriend.sizeX = 1.15, 1.15

		enemy.x, enemy.y = 530, 0
		enemyTwo.x, enemyTwo.y = 530, 0
		boyfriend.x, boyfriend.y = -570, 240
		typhlosion.x, typhlosion.y = -200, 440

		pikachuSpawn.sizeX, pikachuSpawn.sizeY = 0.97, 0.97

		pikachuSpawn.x, pikachuSpawn.y = 296, 8

		pikachu.x, pikachu.y = 135, 110

		pikachu.sizeX, pikachu.sizeY = 1.5, 1.5

		healthBarColorEnemy = {175,102,206}

		enemyIcon:animate("daddy dearest", false)

		--pikachuSpawn:animate("anim", true)
		pikachu:animate("idle", true)
		typhlosion:animate("idle", true)

		self:load()

	end,

	load = function(self)
		weeksFrost:load()
		inst = love.audio.newSource("songs/frostbite/Inst.ogg", "stream")
		voices = love.audio.newSource("songs/frostbite/Voices.ogg", "stream")
		self:initUI()
		weeksFrost:setupCountdown()

		--inst:setPitch(1.25)
		--voices:setPitch(1.25)

		--inst:seek(80)
		--voices:seek(80)

		afterPikachu = false
		zoomed = false
	end,

	initUI = function(self)
		weeksFrost:initUI()
		weeksFrost:generateNotes(love.filesystem.load("songs/frostbite/chart.lua")())
	end,

	update = function(self, dt)
		weeksFrost:update(dt)
		if enemyEntrance then enemyEntrance:update(dt) end
		if playerBoy then playerBoy:update(dt) end  
		pikachuSpawn:update(dt)
		pikachu:update(dt)
		typhlosion:update(dt)




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


		if musicTime > 89739 and not afterPikachu then
			afterPikachu = true
			pikachuSpawn:animate("anim", false)
		end

		if musicTime > 90260 and not zoomed then
			zoomed = true
			Timer.tween(2, extraCamZoom, {sizeX = 2.5, sizeY = 2.5}, "out-expo", function()
				Timer.tween(0.5, extraCamZoom, {sizeX = 1, sizeY = 1}, "out-quad", function()
				end)
			end)
		end
		weeksFrost:updateUI(dt)
	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
			love.graphics.scale(extraCamZoom.sizeX, extraCamZoom.sizeY)
			love.graphics.scale(cam.sizeX, cam.sizeY)

            love.graphics.push()
                love.graphics.translate(cam.x * 0.9, cam.y * 0.9)

				bg:draw()
				blas:draw()
				char:draw()
				poke:draw()


			

				boyfriend:draw()
				typhlosion:draw()

				--love.graphics.setColor(1, 1, 1, 0.6)

				if pikachuSpawn:isAnimated() then
					pikachuSpawn:draw()
				else
					if not afterPikachu then
						enemy:draw()
					else
						enemyTwo:draw()
						pikachu:draw()
					end
				end

            love.graphics.pop()
            love.graphics.push()
                love.graphics.translate(cam.x, cam.y)
            love.graphics.pop()
            love.graphics.push()
                love.graphics.translate(cam.x * 1.1, cam.y * 1.1)
                -- stage foreground (in front of characters)
            love.graphics.pop()
			weeksFrost:drawRating(0.9)
		love.graphics.pop()
		
		weeksFrost:drawTimeLeftBar()
		weeksFrost:drawHealthBar()
		if not paused then
			weeksFrost:drawUI()
		end
	end,

	leave = function(self)
		usePendulum = false
		weeksFrost:leave()
	end
}