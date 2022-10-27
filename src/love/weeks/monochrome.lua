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
		weeksMono:enter()
		print("are you even running this code")

		week = 1

		song = 1
		difficulty = songAppend

		healthBarColorEnemy = {175,102,206}		

		enemyIcon:animate("daddy dearest", false)

		boyfriend = love.filesystem.load("sprites/characters/Full_pico_purin.lua")() -- literally doesnt matter what it is
		enemy = love.filesystem.load("sprites/monochrome/Lost Silver Assets Gold.lua")()
		enemyTwo = love.filesystem.load("sprites/monochrome/GoldHead Sheet.lua")()

		celebi = love.filesystem.load("sprites/monochrome/Celebi_Assets.lua")()
		enemyTwo = love.filesystem.load("sprites/monochrome/GoldHead Sheet.lua")()
		HeadRipping = love.filesystem.load("sprites/monochrome/GOLD_HEAD_RIPPING_OFF.lua")()
		noMore = love.filesystem.load("sprites/monochrome/GOLD_NO_MORE.lua")()

		self:load()

		--[[

		function cutscene()
			Timer.script(function(wait)
				cutsceneHasHappened = true
				noMore:animate("anim")
				wait(5)
				HeadRipping:animate("anim")
			end)
		end

		--]]

	end,

	load = function(self)
		afterTear = false
		headRipped = false
		cutsceneHasHappened = false
		weeksMono:load()

		inst = love.audio.newSource("songs/monochrome/inst.ogg", "stream")
		voices = love.audio.newSource("songs/monochrome/voices.ogg", "stream")

		self:initUI()

		weeksMono:setupCountdown()
  --150750


		print("load")

	end,

	initUI = function(self)
		weeksMono:initUI()

		weeksMono:generateNotes(love.filesystem.load("songs/monochrome/monochrome.lua")())

		print("unitUI")
	end,

	update = function(self, dt)
		noMore:update(dt)
		HeadRipping:update(dt)
		weeksMono:update(dt)

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



		--[[
		if musicTime >= 150750 and musicTime <= 150800 then
			noMore:animate("anim", false)
		end

		if musicTime > 152625 and not noMore:isAnimated() and not headRipped then -- using a boolean because this one needs to be exact
			HeadRipping:animate("anim", false)
			headRipped = true
		end
		--]]


		if musicTime >= 150750 and musicTime <= 150800 then
			noMore:animate("anim", false, function()
				HeadRipping:animate("anim", false, function()
					afterTear = true
				end)
			end)
		end

		--[[
		if musicTime > 152650 and not HeadRipping:isAnimated() then
			afterTear = true
		end

		--]]



		weeksMono:updateUI(dt)
	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
			love.graphics.translate(-cam.x, -cam.y)
			love.graphics.scale(extraCamZoom.sizeX, extraCamZoom.sizeY)
			love.graphics.scale(cam.sizeX, cam.sizeY)

			if afterTear and not HeadRipping:isAnimated() then
				enemyTwo:draw()
			else
				if not noMore:isAnimated() and not HeadRipping:isAnimated() then
					enemy:draw()
				end
			end


			if noMore:isAnimated() then
				noMore:draw()
			end

			if HeadRipping:isAnimated() then
				HeadRipping:draw()
			end
			--noMore:draw()

			weeksMono:drawRating(0.9)
		love.graphics.pop()
		

		weeksMono:drawHealthBar()
		if not paused then
			weeksMono:drawUI()
		end
	end,

	leave = function(self)
		weeksMono:leave()
	end
}
