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
		dtWeek:enter()

		week = 1

		song = songNum
		difficulty = songAppend

		healthBarColorEnemy = {175,102,206}		
		enemy = love.filesystem.load("sprites/characters/jigglyassets.lua")()

		floor = graphics.newImage(love.graphics.newImage(graphics.imagePath("hell/floor")))
		floorbot = graphics.newImage(love.graphics.newImage(graphics.imagePath("hell/floorbot")))
		pil = graphics.newImage(love.graphics.newImage(graphics.imagePath("hell/pil")))
		pilfor = graphics.newImage(love.graphics.newImage(graphics.imagePath("hell/pilfor")))
		rocks = graphics.newImage(love.graphics.newImage(graphics.imagePath("hell/rocks")))
		roof = graphics.newImage(love.graphics.newImage(graphics.imagePath("hell/roof")))
		wall = graphics.newImage(love.graphics.newImage(graphics.imagePath("hell/wall")))

		dawn = {
			body = love.filesystem.load("sprites/characters/dawn-atlas/body.lua")(),
			leftarm = love.filesystem.load("sprites/characters/dawn-atlas/arm-left.lua")(),
		}
		dawn.leftarm.x = 120
		dawn.leftarm.y = -8

		enemyIcon:animate("daddy dearest", false)

		self:load()
	end,

	load = function(self)
		dtWeek:load()

		inst = love.audio.newSource("songs/death-toll/Inst.ogg", "stream")
		voices = love.audio.newSource("songs/death-toll/Voices.ogg", "stream")

		self:initUI()

		dtWeek:setupCountdown()
	end,

	initUI = function(self)
		dtWeek:initUI()

		dtWeek:generateNotes(love.filesystem.load("songs/death-toll/hard.lua")())
	end,

	update = function(self, dt)
		dtWeek:update(dt)

		if health >= 80 then
			if enemyIcon:getAnimName() == "daddy dearest" then
				enemyIcon:animate("daddy dearest losing", false)
			end
		else
			if enemyIcon:getAnimName() == "daddy dearest losing" then
				enemyIcon:animate("daddy dearest", false)
			end
		end
		dawn.body:animate(boyfriend:getAnimName(), false)
		dawn.leftarm:animate(boyfriend:getAnimName(), false)

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
			status.setLoading(true)

			graphics.fadeOut(
				0.5,
				function()
					Gamestate.switch(menu)

					status.setLoading(false)
				end
			)
		end

		dtWeek:updateUI(dt)
	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
			love.graphics.scale(extraCamZoom.sizeX, extraCamZoom.sizeY)
			love.graphics.scale(cam.sizeX, cam.sizeY)

            love.graphics.push()
                love.graphics.translate(cam.x * 0.9, cam.y * 0.9)
				floor:draw()
				floorbot:draw()
				pil:draw()
				pilfor:draw()
				rocks:draw()
				roof:draw()
				wall:draw()
            love.graphics.pop()
            love.graphics.push()
                love.graphics.translate(cam.x, cam.y)
				
				dawn.body:draw()
				dawn.leftarm:draw()

            love.graphics.pop()
            love.graphics.push()
                love.graphics.translate(cam.x * 1.1, cam.y * 1.1)
                -- stage foreground (in front of characters)
            love.graphics.pop()
			weeks:drawRating(0.9)
		love.graphics.pop()
		

		dtWeek:drawHealthBar()
		if not paused then
			dtWeek:drawUI()
		end
	end,

	leave = function(self)
		dtWeek:leave()
	end
}
