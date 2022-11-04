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

		jumpscareAlpha = 1

		week = 1

		song = 1
		difficulty = songAppend

		HUDAlpha = {0}

		healthBarColorEnemy = {175,102,206}		

		enemyIcon:animate("daddy dearest", false)

		boyfriend = love.filesystem.load("sprites/characters/Full_pico_purin.lua")() -- literally doesnt matter what it is
		enemy = love.filesystem.load("sprites/monochrome/Lost Silver Assets Gold.lua")()
		enemyTwo = love.filesystem.load("sprites/monochrome/GoldHead Sheet.lua")()

		celebi = love.filesystem.load("sprites/monochrome/Celebi_Assets.lua")()
		enemyTwo = love.filesystem.load("sprites/monochrome/GoldHead Sheet.lua")()
		HeadRipping = love.filesystem.load("sprites/monochrome/GOLD_HEAD_RIPPING_OFF.lua")()
		noMore = love.filesystem.load("sprites/monochrome/GOLD_NO_MORE.lua")()

		jumpscareOne = graphics.newImage(love.graphics.newImage(graphics.imagePath("monochrome/Gold")))
        jumpscareTwo = graphics.newImage(love.graphics.newImage(graphics.imagePath("monochrome/GoldAlt")))

		jumpscareOne.sizeX, jumpscareOne.sizeY = 0.4, 0.4
		jumpscareTwo.sizeX, jumpscareTwo.sizeY = 0.4, 0.4

		jumpscareOne.x, jumpscareOne.y = 650, 300
		jumpscareTwo.x, jumpscareTwo.y = 650, 300


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

		function HUDFade()
			Timer.tween(5, HUDAlpha, {[1] = 1}, "linear")
		end

		function HUDFadeMidSong()
			print("HAFJKFHKJFDKJHJHFADFHDJASFHDSFHJSDKFHKJDSF")
		end

		function Unown()
			print("minecraft enchantment table")
		end
		function Celebi()
			minHealth = minHealth + 20
		end



	end,

	load = function(self)
		minHealth = 0
		afterTear = false
		headRipped = false
		cutsceneHasHappened = false
		jumpscareAlpha = 0
		HUDAlpha = {0}
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

		jumpscareAlpha = jumpscareAlpha - 0.999999999999 * dt

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




		if musicTime >= 12000 and musicTime < 12025 then 
			HUDFade()

		--	jumpscareAlpha = 1
		end
		if musicTime >= 24000 and musicTime < 24025 then 
			Unown()
		end
		if musicTime >= 34500 and musicTime < 34525 then 
			Celebi()
		end
		if musicTime >= 47250 and musicTime < 47275 then 
			jumpscareAlpha = 1
		end
		if musicTime >= 48000 and musicTime < 48025 then 
			Unown()
		end
		if musicTime >= 60000 and musicTime < 60025 then 
			Unown()
		end
		if musicTime >= 76500 and musicTime < 76525 then 
			Celebi()
		end
		if musicTime >= 85500 and musicTime < 85525 then 
			Unown()
		end
		if musicTime >= 89250 and musicTime < 89275 then 
			jumpscareAlpha = 1
		end
		if musicTime >= 90375 and musicTime < 90400 then 
			jumpscareAlpha = 1
		end
		if musicTime >= 90375 and musicTime < 90400 then 
			jumpscareAlpha = 1
		end
		if musicTime >= 91875 and musicTime < 91900 then 
			jumpscareAlpha = 1
		end
		if musicTime >= 104625 and musicTime < 104650 then 
			jumpscareAlpha = 1
		end
		if musicTime >= 113250 and musicTime < 113275 then 
			jumpscareAlpha = 1
		end
		if musicTime >= 118500 and musicTime < 118525 then 
			Celebi()
		end
		if musicTime >= 132000 and musicTime < 132025 then 
			Unown()
		end
		if musicTime >= 144000 and musicTime < 144025 then 
			jumpscareAlpha = 1
		end
		if musicTime >= 145500 and musicTime < 145525 then 
			HUDFadeMidSong()
		end
		if musicTime >= 156000 and musicTime < 156025 then 
			HUDFadeMidSong()
		end
		if musicTime >= 155999 and musicTime < 156024 then 
			Unown()
		end
		if musicTime >= 179250 and musicTime < 179275 then 
			Unown()
		end
		if musicTime >= 186093.75 and musicTime < 186118.75 then 
			jumpscareAlpha = 1
		end
		if musicTime >= 186093.75 and musicTime < 186118.75 then 
			jumpscareAlpha = 1
		end
		if musicTime >= 189093.75 and musicTime < 189118.75 then 
			jumpscareAlpha = 1
		end
		if musicTime >= 189093.75 and musicTime < 189118.75 then 
			jumpscareAlpha = 1
		end
		if musicTime >= 189093.75 and musicTime < 189118.75 then 
			jumpscareAlpha = 1
		end
		if musicTime >= 189093.75 and musicTime < 189118.75 then 
			jumpscareAlpha = 1
		end
		if musicTime >= 191156.25 and musicTime < 191181.25 then 
			Unown()
		end
		if musicTime >= 197812.5 and musicTime < 197837.5 then 
			jumpscareAlpha = 1
		end
		if musicTime >= 198562.5 and musicTime < 198587.5 then 
			jumpscareAlpha = 1
		end
		if musicTime >= 202500 and musicTime < 202525 then 
			Unown()
		end
		if musicTime >= 216656.25 and musicTime < 216681.25 then 
			jumpscareAlpha = 1
		end
		if musicTime >= 219750 and musicTime < 219775 then 
			jumpscareAlpha = 1
		end
		if musicTime >= 219750 and musicTime < 219775 then 
			jumpscareAlpha = 1
		end
		if musicTime >= 226500 and musicTime < 226525 then 
			Unown()
		end
		if musicTime >= 228375 and musicTime < 228400 then 
			jumpscareAlpha = 1
		end
		if musicTime >= 229968.75 and musicTime < 229993.75 then 
			jumpscareAlpha = 1
		end
		if musicTime >= 229968.75 and musicTime < 229993.75 then 
			jumpscareAlpha = 1
		end
		if musicTime >= 231281.25 and musicTime < 231306.25 then 
			jumpscareAlpha = 1
		end
		if musicTime >= 234187.5 and musicTime < 234212.5 then 
			jumpscareAlpha = 1
		end
		if musicTime >= 235687.5 and musicTime < 235712.5 then 
			jumpscareAlpha = 1
		end
		if musicTime >= 235687.5 and musicTime < 235712.5 then 
			jumpscareAlpha = 1
		end
		if musicTime >= 237093.75 and musicTime < 237118.75 then 
			jumpscareAlpha = 1
		end
		if musicTime >= 240000 and musicTime < 240025 then 
			jumpscareAlpha = 1
		end
		if musicTime >= 241500 and musicTime < 241525 then 
			jumpscareAlpha = 1
		end
		if musicTime >= 241500 and musicTime < 241525 then 
			jumpscareAlpha = 1
		end
		if musicTime >= 241500 and musicTime < 241525 then 
			jumpscareAlpha = 1
		end
		if musicTime >= 245812.5 and musicTime < 245837.5 then 
			jumpscareAlpha = 1
		end
		if musicTime >= 252000 and musicTime < 252025 then 
			jumpscareAlpha = 1
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
		--	love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
			love.graphics.translate(600, 320)
		--	love.graphics.scale(extraCamZoom.sizeX, extraCamZoom.sizeY)
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

			--jumpscareOne:draw()

			weeksMono:drawRating(0.9)
		love.graphics.pop()

		

		weeksMono:drawHealthBar()
		if not paused then
			weeksMono:drawUI()
		end

		--jumpscareOne:draw()

		love.graphics.setColor(1, 1, 1, jumpscareAlpha)
		if afterTear then
			jumpscareTwo:draw()
		else
			jumpscareOne:draw()
		end
		love.graphics.setColor(1, 1, 1, 1)
	end,



	leave = function(self)
		weeksMono:leave()
	end
}
