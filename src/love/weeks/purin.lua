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
		weeks:enter()

		week = 1

		song = songNum
		difficulty = songAppend

		healthBarColorEnemy = {175,102,206}		

		enemyIcon:animate("daddy dearest", false)

		boyfriend = love.filesystem.load("sprites/characters/Full_pico_purin.lua")()
		enemy = love.filesystem.load("sprites/characters/jigglyassets.lua")()

		one = graphics.newImage(love.graphics.newImage(graphics.imagePath("pokecenter/1darknessoverlay")))
		two = graphics.newImage(love.graphics.newImage(graphics.imagePath("pokecenter/2painting")))
		three = graphics.newImage(love.graphics.newImage(graphics.imagePath("pokecenter/3window")))
		four = graphics.newImage(love.graphics.newImage(graphics.imagePath("pokecenter/4toplayer")))
		five = graphics.newImage(love.graphics.newImage(graphics.imagePath("pokecenter/5table")))
		six = graphics.newImage(love.graphics.newImage(graphics.imagePath("pokecenter/6nursejoy")))
		seven = graphics.newImage(love.graphics.newImage(graphics.imagePath("pokecenter/7backlayer")))
		eight = graphics.newImage(love.graphics.newImage(graphics.imagePath("pokecenter/8floor")))

		self:load()
	end,

	load = function(self)
		weeks:load()

		inst = love.audio.newSource("songs/purin/inst.ogg", "stream")
		voices = love.audio.newSource("songs/purin/voices.ogg", "stream")

		self:initUI()

		weeks:setupCountdown()
	end,

	initUI = function(self)
		weeks:initUI()

		weeks:generateNotes(love.filesystem.load("songs/purin/purin-hard.lua")())
	end,

	update = function(self, dt)
		weeks:update(dt)

		if song == 2 and musicThres ~= oldMusicThres and math.fmod(absMusicTime + 500, 480000 / bpm) < 100 then
			weeks:safeAnimate(boyfriend, "hey", false, 3)
			weeks:safeAnimate(girlfriend, "cheer", false, 1)

			--leaving this here just to piss off guglio
			
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

			one:draw()
			two:draw()
			three:draw()
			four:draw()
			five:draw()
			six:draw()
			seven:draw()
			eight:draw()
			boyfriend:draw()
			enemy:draw()




			weeks:drawRating(0.9)
		love.graphics.pop()
		

		weeks:drawHealthBar()
		if not paused then
			weeks:drawUI()
		end
	end,

	leave = function(self)
		weeks:leave()
	end
}
