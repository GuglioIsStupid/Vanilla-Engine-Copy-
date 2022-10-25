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

local difficulty

local stageBack, stageFront, curtains

return {
	enter = function(self, from, songNum, songAppend)
		pauseColor = {129, 100, 223}
		weeksMissingno:pixelEnter()

		week = 1
        love.graphics.setDefaultFilter("nearest", "nearest")

        water = love.filesystem.load("sprites/missingno/BG_Assets.lua")()
        ground = love.filesystem.load("sprites/missingno/ground.lua")()
        sky = graphics.newImage(love.graphics.newImage(graphics.imagePath("missingno/sky")))
        bg = graphics.newImage(love.graphics.newImage(graphics.imagePath("missingno/bg")))
        boyfriend = love.filesystem.load("sprites/pixel/boyfriend.lua")()
        enemy = love.filesystem.load("sprites/characters/Missingno.lua")()

		love.graphics.setDefaultFilter("linear", "linear")

        ground.x = -400
        ground.y = -200
        water.x, water.y = -360, -160
        boyfriend.x = -50
        boyfriend.y = -58
		enemy.x = -775
		enemy.y = -350

        cam.sizeX, cam.sizeY = 0.88, 0.88
        camScale.x, camScale.y = 0.88, 0.88

		song = songNum
		difficulty = songAppend

		healthBarColorEnemy = {175,102,206}		

		enemyIcon:animate("daddy dearest", false)

		self:load()

        grayscaleAmount = {1}
		drawEnemy = false
        -- what number makes it normal? i forgot

	end,

	load = function(self)
		weeksMissingno:load()

		inst = love.audio.newSource("songs/missingno/inst.ogg", "stream")
		voices = love.audio.newSource("songs/missingno/voices.ogg", "stream")

		self:initUI()

		countingDown = false

	    previousFrameTime = love.timer.getTime() * 1000
		musicTime = 0

		voices:setVolume(settings.vocalsVol)
		if inst then 
			inst:setVolume(settings.instVol)
			inst:play() 
		end
		voices:play()
	end,

	initUI = function(self)
		weeksMissingno:pixelInitUI()

		weeksMissingno:generateNotes(love.filesystem.load("songs/missingno/missingno-hard.lua")())
	end,

	update = function(self, dt)
		weeksMissingno:update(dt)
        water:update(dt)
        ground:update(dt)


        if musicTime >= 36000 and musicTime <= 36100 then
            if grayscaleTween then
                Timer.cancel(grayscaleTween)
            end
            if camZoomWow then
                Timer.cancel(camZoomWow)
            end
            grayscaleTween = Timer.tween(8, grayscaleAmount, {0}, "linear")
            camZoomWow = Timer.tween(
                7.5,
                extraCamZoom,
                {
                    sizeX = 1.75,
                    sizeY = 1.75
                },
                "linear",
                function()
					Timer.after(
						0.15,
						function()
							weeks:safeAnimate(enemy, "intro", false, 2)
							drawEnemy = true
						end
					)
					
                    camZoomWow = Timer.tween(
                        0.25,
                        extraCamZoom,
                        {
                            sizeX = 1,
                            sizeY = 1
                        },
                        "linear"
                    )
                end
            )
        end


        grayscaleShader:send("grayScale", grayscaleAmount[1])
        --sonicBlurShader:send("strength", grayscaleAmount[1] * 1.1)

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

		weeksMissingno:updateUI(dt)
	end,

	draw = function(self)
		love.graphics.push()
            love.graphics.setShader(grayscaleShader)
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
			love.graphics.scale(extraCamZoom.sizeX, extraCamZoom.sizeY)
			love.graphics.scale(cam.sizeX, cam.sizeY)

            love.graphics.push()
                love.graphics.translate(cam.x * 0.9, cam.y * 0.9)
                sky:udraw(6,6)
                bg:udraw(6,6)
                water:udraw(6,6)
            love.graphics.pop()

            love.graphics.push()
                love.graphics.translate(cam.x, cam.y)
                ground:udraw(6,6)
                boyfriend:udraw(6,6)
				if drawEnemy then
					enemy:udraw(6,6)
				end
            love.graphics.pop()

			weeksMissingno:drawRating(0.9)
            love.graphics.setShader()
		love.graphics.pop()
		

		weeksMissingno:drawHealthBar()
		if not paused then
			weeksMissingno:drawUI()
		end
	end,

	leave = function(self)
		weeksMissingno:leave()
	end
}
