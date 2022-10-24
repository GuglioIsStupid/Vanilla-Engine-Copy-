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
		CONTRACTTEXT = "BOYFRIEND"
		curText = ""

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
		hellBell = love.filesystem.load("sprites/characters/hellbell.lua")()
		contract = love.filesystem.load("sprites/characters/ContractBF.lua")()

		dawn = {
			body = love.filesystem.load("sprites/characters/dawn-atlas/body.lua")(),
			leftarm = love.filesystem.load("sprites/characters/dawn-atlas/arm-left.lua")(),
		}
		dawn.leftarm.x = 120
		dawn.leftarm.y = -8

		function bong()
			hellBell:animate("bongLmao", false)
		end

		function ContractAdvance()
			-- everytime this function is called, it will advance the contract text by one letter
			curText = curText .. CONTRACTTEXT:sub(curText:len() + 1, curText:len() + 1)
			contract:animate(curText, true)
		end

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
		hellBell:update(dt)

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

		if not hellBell:isAnimated() and hellBell:getAnimName() == "bongLmao" then
			hellBell:animate("idle", true)
		end
		
		-- hell bell bong
		if musicTime >= 10212.7659574468 and musicTime < 10237.7659574468 then  -- its indented a bit so i can just hide it
				bong()
			end
			if musicTime >= 11489.3617021277 and musicTime < 11514.3617021277 then 
				bong()
			end
			if musicTime >= 13244.6808510638 and musicTime < 13269.6808510638 then 
				bong()
			end
			if musicTime >= 14042.5531914894 and musicTime < 14067.5531914894 then 
				bong()
			end
			if musicTime >= 14042.5531914894 and musicTime < 14067.5531914894 then 
				bong()
			end
			if musicTime >= 15319.1489361702 and musicTime < 15344.1489361702 then 
				bong()
			end
			if musicTime >= 16595.7446808511 and musicTime < 16620.7446808511 then 
				bong()
			end
			if musicTime >= 17872.3404255319 and musicTime < 17897.3404255319 then 
				bong()
			end
			if musicTime >= 19148 and musicTime < 19173 then 
				bong()
			end
			if musicTime >= 19148 and musicTime < 19173 then 
				bong()
			end
			if musicTime >= 20425.5319148936 and musicTime < 20450.5319148936 then 
				bong()
			end
			if musicTime >= 30638.2978723404 and musicTime < 30663.2978723404 then 
				bong()
			end
			if musicTime >= 34468.085106383 and musicTime < 34493.085106383 then 
				bong()
			end
			if musicTime >= 34468.085106383 and musicTime < 34493.085106383 then 
				bong()
			end
			if musicTime >= 34468.085106383 and musicTime < 34493.085106383 then 
				bong()
			end
			if musicTime >= 40851.0638297872 and musicTime < 40876.0638297872 then 
				bong()
			end
			if musicTime >= 44680.8510638298 and musicTime < 44705.8510638298 then 
				bong()
			end
			if musicTime >= 45957.4468085106 and musicTime < 45982.4468085106 then 
				bong()
			end
			if musicTime >= 51063.8297872341 and musicTime < 51088.8297872341 then 
				bong()
			end
			if musicTime >= 54893.6170212766 and musicTime < 54918.6170212766 then 
				bong()
			end
			if musicTime >= 54893.6170212766 and musicTime < 54918.6170212766 then 
				bong()
			end
			if musicTime >= 54893.6170212766 and musicTime < 54918.6170212766 then 
				bong()
			end
			if musicTime >= 60478.7234042554 and musicTime < 60503.7234042554 then 
				bong()
			end
			if musicTime >= 60478.7234042554 and musicTime < 60503.7234042554 then 
				bong()
			end
			if musicTime >= 66542.5531914894 and musicTime < 66567.5531914894 then 
				bong()
			end
			if musicTime >= 71489.3617021277 and musicTime < 71514.3617021277 then 
				bong()
			end
			if musicTime >= 76595.7446808511 and musicTime < 76620.7446808511 then 
				bong()
			end
			if musicTime >= 81702.1276595745 and musicTime < 81727.1276595745 then 
				bong()
			end
			if musicTime >= 86808.5106382979 and musicTime < 86833.5106382979 then 
				bong()
			end
			if musicTime >= 91914.8936170212 and musicTime < 91939.8936170212 then 
				bong()
			end
			if musicTime >= 97021.2765957446 and musicTime < 97046.2765957446 then 
				bong()
			end
			if musicTime >= 103404.255319149 and musicTime < 103429.255319149 then 
				bong()
			end
			if musicTime >= 113617.021276596 and musicTime < 113642.021276596 then 
				bong()
			end
			if musicTime >= 125106 and musicTime < 125131 then 
				bong()
			end
			if musicTime >= 126382 and musicTime < 126407 then 
				bong()
			end
			if musicTime >= 127659.574468085 and musicTime < 127684.574468085 then 
				bong()
			end
			if musicTime >= 128936.170212766 and musicTime < 128961.170212766 then 
				bong()
			end
			if musicTime >= 135159.574468085 and musicTime < 135184.574468085 then 
				bong()
			end
			if musicTime >= 139468.085106383 and musicTime < 139493.085106383 then 
				bong()
			end
			if musicTime >= 144255.319148936 and musicTime < 144280.319148936 then 
				bong()
			end
			if musicTime >= 149361.702127659 and musicTime < 149386.702127659 then 
				bong()
			end
			if musicTime >= 154468.085106383 and musicTime < 154493.085106383 then 
				bong()
			end
			if musicTime >= 157978.723404255 and musicTime < 158003.723404255 then 
				bong()
			end
			if musicTime >= 159574.468085106 and musicTime < 159599.468085106 then 
				bong()
			end
			if musicTime >= 162127.659574468 and musicTime < 162152.659574468 then 
				bong()
			end
			if musicTime >= 164680.851063829 and musicTime < 164705.851063829 then 
				bong()
			end
			if musicTime >= 167234.042553191 and musicTime < 167259.042553191 then 
				bong()
			end
			if musicTime >= 169787.234042553 and musicTime < 169812.234042553 then 
				bong()
			end
			if musicTime >= 172340.425531915 and musicTime < 172365.425531915 then 
				bong()
			end
			if musicTime >= 174893.617021276 and musicTime < 174918.617021276 then 
				bong()
			end
			if musicTime >= 176170.212765957 and musicTime < 176195.212765957 then 
				bong()
			end
			if musicTime >= 177446.808510638 and musicTime < 177471.808510638 then 
				bong()
			end
			if musicTime >= 178723.404255319 and musicTime < 178748.404255319 then 
				bong()
			end
			if musicTime >= 180000 and musicTime < 180025 then 
				bong()
			end
			if musicTime >= 181276.59574468 and musicTime < 181301.59574468 then 
				bong()
			end
			if musicTime >= 182553.191489361 and musicTime < 182578.191489361 then 
				bong()
			end
			if musicTime >= 183829.787234042 and musicTime < 183854.787234042 then 
				bong()
			end
			if musicTime >= 185106.382978723 and musicTime < 185131.382978723 then 
				bong()
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
			status.setLoading(true)

			graphics.fadeOut(
				0.5,
				function()
					Gamestate.switch(menu)

					status.setLoading(false)
				end
			)
		end

		if musicTime >= 100053.191489362 and musicTime < 100078.191489362 then 
			-- look at his devious walk
		end
		-- contracts stuffies
		if musicTime >= 105957.446808511 and musicTime < 105982.446808511 then 
			ContractAdvance()
		end
		if musicTime >= 109787.234042553 and musicTime < 109812.234042553 then 
			ContractAdvance()
		end
		if musicTime >= 113617.021276596 and musicTime < 113642.021276596 then 
			ContractAdvance()
		end
		if musicTime >= 117446.808510638 and musicTime < 117471.808510638 then 
			ContractAdvance()
		end
		if musicTime >= 121276.595744681 and musicTime < 121301.595744681 then 
			ContractAdvance()
		end
		if musicTime >= 124148 and musicTime < 124173 then 
			ContractAdvance()
		end
		if musicTime >= 128936.170212766 and musicTime < 128961.170212766 then 
			ContractAdvance()
		end
		if musicTime >= 135159.574468085 and musicTime < 135184.574468085 then 
			ContractAdvance()
		end
		if musicTime >= 139468.085106383 and musicTime < 139493.085106383 then 
			ContractAdvance()
		end
		if musicTime >= 142978 and musicTime < 143003 then 
			ContractAdvance()
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
				hellBell:draw()
				contract:draw()
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
