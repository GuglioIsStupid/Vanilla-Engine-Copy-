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
		doGrayscale = true

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
		didGlitch = false
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
		if inst   then 
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

		if musicTime >= 112868.785009439 and musicTime <=112893.785009439 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 113030.947171601 and musicTime <=113055.947171601 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 113193.109333763 and musicTime <=113218.109333763 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 113355.271495925 and musicTime <=113380.271495925 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 120328.244468898 and musicTime <=120353.244468898 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 120490.406631061 and musicTime <=120515.406631061 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 120652.568793223 and musicTime <=120677.568793223 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 120814.730955385 and musicTime <=120839.730955385 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 120976.893117547 and musicTime <=121001.893117547 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 123247.163387817 and musicTime <=123272.163387817 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 123409.32554998 and musicTime <=123434.32554998 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 123571.487712142 and musicTime <=123596.487712142 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 123733.649874304 and musicTime <=123758.649874304 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 123895.812036466 and musicTime <=123920.812036466 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 150652.568793223 and musicTime <=150677.568793223 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 150814.730955385 and musicTime <=150839.730955385 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 150976.893117547 and musicTime <=151001.893117547 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 154382.298522953 and musicTime <=154407.298522953 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 154544.460685115 and musicTime <=154569.460685115 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 154706.622847277 and musicTime <=154731.622847277 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 154868.785009439 and musicTime <=154893.785009439 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 155030.947171601 and musicTime <=155055.947171601 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 160220.136360791 and musicTime <=160245.136360791 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 160706.622847277 and musicTime <=160731.622847277 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 162490.406631061 and musicTime <=162515.406631061 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 162652.568793223 and musicTime <=162677.568793223 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 163139.055279709 and musicTime <=163164.055279709 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 163463.379604034 and musicTime <=163488.379604034 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 164112.028252682 and musicTime <=164137.028252682 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 164598.514739169 and musicTime <=164623.514739169 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 165247.163387818 and musicTime <=165272.163387818 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 165409.32554998 and musicTime <=165434.32554998 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 184128.920144574 and musicTime <=184153.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 184253.920144574 and musicTime <=184278.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 184378.920144574 and musicTime <=184403.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 184503.920144574 and musicTime <=184528.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 185128.920144574 and musicTime <=185153.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 185378.920144574 and musicTime <=185403.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 185878.920144574 and musicTime <=185903.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 186128.920144574 and musicTime <=186153.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 186003.920144574 and musicTime <=186028.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 187128.920144574 and musicTime <=187153.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 187253.920144574 and musicTime <=187278.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 187378.920144574 and musicTime <=187403.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 187503.920144574 and musicTime <=187528.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 188128.920144574 and musicTime <=188153.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 188378.920144574 and musicTime <=188403.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 188878.920144574 and musicTime <=188903.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 189003.920144574 and musicTime <=189028.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 189128.920144574 and musicTime <=189153.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 189378.920144574 and musicTime <=189403.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 189628.920144574 and musicTime <=189653.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 190003.920144574 and musicTime <=190028.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 190128.920144574 and musicTime <=190153.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 200128.920144574 and musicTime <=200153.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 200253.920144574 and musicTime <=200278.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 200503.920144574 and musicTime <=200528.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 200378.920144574 and musicTime <=200403.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 201128.920144574 and musicTime <=201153.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 201378.920144574 and musicTime <=201403.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 201878.920144574 and musicTime <=201903.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 202003.920144574 and musicTime <=202028.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 202128.920144574 and musicTime <=202153.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 203128.920144574 and musicTime <=203153.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 203253.920144574 and musicTime <=203278.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 203378.920144574 and musicTime <=203403.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 203503.920144574 and musicTime <=203528.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 204128.920144574 and musicTime <=204153.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 204378.920144574 and musicTime <=204403.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 204878.920144574 and musicTime <=204903.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 205003.920144574 and musicTime <=205028.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 205128.920144574 and musicTime <=205153.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 205628.920144574 and musicTime <=205653.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 205878.920144574 and musicTime <=205903.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 206378.920144574 and musicTime <=206403.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 206628.920144574 and musicTime <=206653.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 207628.920144574 and musicTime <=207653.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 207878.920144574 and musicTime <=207903.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 208128.920144574 and musicTime <=208153.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 208253.920144574 and musicTime <=208278.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 208378.920144574 and musicTime <=208403.920144574 then
				weeksMissingno:missingnoThing()
			end
			if musicTime >= 208503.920144574 and musicTime <=208528.920144574 then
				weeksMissingno:missingnoThing()
		end

		-- 110000
		if musicTime >= 110000 and musicTime <=110025 then
			if arrowTween then
				Timer.cancel(arrowTween)
			end
			arrowTween = Timer.tween(
				5,
				arrowTransparency,
				{0},
				"out-quad"
			)
		end


        if musicTime >= 36000 and musicTime <= 36100   then
            if grayscaleTween   then
                Timer.cancel(grayscaleTween)
            end
            if camZoomWow   then
                Timer.cancel(camZoomWow)
            end
            grayscaleTween = Timer.tween(8, grayscaleAmount, {0}, "linear", function() doGrayscale = false end)
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

		if health >= 80   then
			if enemyIcon:getAnimName() == "daddy dearest"   then
				enemyIcon:animate("daddy dearest losing", false)
			end
		else
			if enemyIcon:getAnimName() == "daddy dearest losing"   then
				enemyIcon:animate("daddy dearest", false)
			end
		end

		if not (countingDown or graphics.isFading()) and not (inst:isPlaying() and voices:isPlaying()) and not paused   then
			if score > highscores[weekNum-1].scores[song]   then
				highscores[weekNum-1].scores[song] = score
				saveHighscores()
			end
			newAccuracy = convertedAcc:gsub("%%", "")
			if tonumber(newAccuracy) > highscores[weekNum-1].accuracys[song]   then
				print("New accuracy: " .. newAccuracy)
				highscores[weekNum-1].accuracys[song] = tonumber(newAccuracy)
				saveHighscores()
			end
			if storyMode and song < 3   then
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
		    if doGrayscale then
            	love.graphics.setShader(grayscaleShader)
			end
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
				if drawEnemy   then
					enemy:udraw(6,6)
				end
            love.graphics.pop()

			weeksMissingno:drawRating(0.9)
            love.graphics.setShader()
		love.graphics.pop()
		

		weeksMissingno:drawHealthBar()
		if not paused   then
			weeksMissingno:drawUI()
		end
	end,

	leave = function(self)
		weeksMissingno:leave()
	end
}
