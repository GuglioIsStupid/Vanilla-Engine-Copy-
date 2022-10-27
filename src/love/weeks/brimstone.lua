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
		weeksBrim:pixelEnter()

		week = 1

        bg = graphics.newImage(love.graphics.newImage(graphics.imagePath("buried/brimstoneBack")))
        floor = graphics.newImage(love.graphics.newImage(graphics.imagePath("buried/floor")))
        graves = graphics.newImage(love.graphics.newImage(graphics.imagePath("buried/graves")))

		song = songNum
		difficulty = songAppend

		healthBarColorEnemy = {175,102,206}		

		enemyIcon:animate("daddy dearest", false)
        enemy = love.filesystem.load("sprites/characters/buryman_assets.lua")()
        boyfriend = love.filesystem.load("sprites/characters/ba_BF_assets.lua")()

        grayscale = {0}
        newTime = 0
        waveAmount = 0

		self:load()
	end,

	load = function(self)
		weeksBrim:load()

		inst = love.audio.newSource("songs/brimstone/Inst.ogg", "stream")
		voices = love.audio.newSource("songs/brimstone/Voices.ogg", "stream")

		self:initUI()

		weeksBrim:setupCountdown()
	end,

	initUI = function(self)
		weeksBrim:pixelInitUI()

		weeksBrim:generateNotes(love.filesystem.load("songs/brimstone/hard.lua")())
	end,

	update = function(self, dt)
		weeksBrim:update(dt)

        newTime = newTime + dt
        grayscale[1] = math.sin(newTime * 2) * 0.5 + 0.5
        waveAmount = math.sin(newTime * 2) * 0.5 + 0.5
        wavyBGShader:send("time", newTime)
        wavyBGShader:send("grayscale", grayscale[1])
        wavyBGShader:send("waveAmount", waveAmount)

		if health >= 80 then
			if enemyIcon:getAnimName() == "daddy dearest" then
				enemyIcon:animate("daddy dearest losing", false)
			end
		else
			if enemyIcon:getAnimName() == "daddy dearest losing" then
				enemyIcon:animate("daddy dearest", false)
			end
		end

        if musicTime >= 7309.64467005076 and musicTime < 7334.64467005076 then 
                --BrimstoneIntro()
            end
            if musicTime >= 8527.91878172589 and musicTime < 8552.91878172589 then 
                --BrimstoneIntro()
            end
            if musicTime >= 9746.19289340102 and musicTime < 9771.19289340102 then 
                --BrimstoneIntro()
            end
            if musicTime >= 9746.19289340102 and musicTime < 9771.19289340102 then 
                --BrimstoneIntro()
            end
            if musicTime >= 10964.4670050761 and musicTime < 10989.4670050761 then 
                --BrimstoneIntro()
            end
            if musicTime >= 71269.035532995 and musicTime < 71294.035532995 then 
                --SummonGengar()
            end
            if musicTime >= 97385.7868020305 and musicTime < 97410.7868020305 then 
                --GengarSings()
            end
            if musicTime >= 120609.137055838 and musicTime < 120634.137055838 then 
                --SummonMissingno()
            end
            if musicTime >= 130355.329949239 and musicTime < 130380.329949239 then 
                --MissingnoSwitch()
            end
            if musicTime >= 140101.52284264 and musicTime < 140126.52284264 then 
                --BuriedSings()
            end
            if musicTime >= 144974.61928934 and musicTime < 144999.61928934 then 
                --MissingnoSwitch()
            end
            if musicTime >= 149847.715736041 and musicTime < 149872.715736041 then 
                --GengarSings()
            end
            if musicTime >= 154720.812182741 and musicTime < 154745.812182741 then 
                --MissingnoSwitch()
            end
            if musicTime >= 182436.54822335 and musicTime < 182461.54822335 then 
                --MissingnoSwitch()
            end
            if musicTime >= 182436.54822335 and musicTime < 182461.54822335 then 
                --BuriedSings()
            end
            if musicTime >= 182436.54822335 and musicTime < 182461.54822335 then 
                --MissingnoLeave()
            end
            if musicTime >= 182436.54822335 and musicTime < 182461.54822335 then 
                --BrimstoneKeyChange()
            end
            if musicTime >= 182741.116751269 and musicTime < 182766.116751269 then 
                --BuriedSings()
            end
            if musicTime >= 202233.502538071 and musicTime < 202258.502538071 then 
                --BrimstoneKeyChange()
            end
            if musicTime >= 206649.746192894 and musicTime < 206674.746192894 then 
                --MukSummon()
            end
            if musicTime >= 206649.746192894 and musicTime < 206674.746192894 then 
                --MukSings()
            end
            if musicTime >= 224162.436548223 and musicTime < 224187.436548223 then 
                --BuriedLaughing()
            end
            if musicTime >= 225380.710659899 and musicTime < 225405.710659899 then 
                --BuriedSings()
            end
            if musicTime >= 236345.177664975 and musicTime < 236370.177664975 then 
                --MukSings()
            end
            if musicTime >= 246091.370558376 and musicTime < 246116.370558376 then 
                --BuriedSings()
            end
            if musicTime >= 246091.370558376 and musicTime < 246116.370558376 then 
                --WhiteHandSummon()
            end
            if musicTime >= 249137.055837564 and musicTime < 249162.055837564 then 
                --MukSings()
            end
            if musicTime >= 254619.289340102 and musicTime < 254644.289340102 then 
                --BuriedSings()
            end
            if musicTime >= 257055.837563452 and musicTime < 257080.837563452 then 
                --MukSings()
            end
            if musicTime >= 263147.208121828 and musicTime < 263172.208121828 then 
                --BrimstoneBackgroundDesaturate()
            end
            if musicTime >= 263147.208121828 and musicTime < 263172.208121828 then 
                --ApparitionSummon()
            end
            if musicTime >= 275177.664974619 and musicTime < 275202.664974619 then 
                --ApparitionSings()
            end
            if musicTime >= 323908.629441623 and musicTime < 323933.629441623 then 
                --BuriedSings()
            end
            if musicTime >= 332588.832487308 and musicTime < 332613.832487308 then 
                --ApparitionSings()
            end
            if musicTime >= 342335.025380709 and musicTime < 342360.025380709 then 
                --BuriedSings()
            end
            if musicTime >= 352081.21827411 and musicTime < 352106.21827411 then 
                --ApparitionSings()
            end
            if musicTime >= 361827.41116751 and musicTime < 361852.41116751 then 
                --BuriedApparitionSing()
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

		weeksBrim:updateUI(dt)
	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
			love.graphics.scale(extraCamZoom.sizeX, extraCamZoom.sizeY)
			love.graphics.scale(cam.sizeX, cam.sizeY)
            love.graphics.setShader(wavyBGShader)
            bg:udraw(3.5,3.5)
            floor:udraw(3.5,3.5)
            graves:udraw(3.5,3.5)
            love.graphics.setShader()
			weeksBrim:drawRating(0.9)
		love.graphics.pop()
		

		weeksBrim:drawHealthBar()
		if not paused then
			weeksBrim:drawUI()
		end
	end,

	leave = function(self)
		weeksBrim:leave()
	end
}
