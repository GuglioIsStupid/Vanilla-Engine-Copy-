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
		weeksBrimBF:pixelEnter()

		week = 1

        love.graphics.setDefaultFilter("nearest", "nearest")

        bg = graphics.newImage(love.graphics.newImage(graphics.imagePath("buried/brimstoneBack")))
        floor = graphics.newImage(love.graphics.newImage(graphics.imagePath("buried/floor")))
        graves = graphics.newImage(love.graphics.newImage(graphics.imagePath("buried/graves")))

        shadow = graphics.newImage(love.graphics.newImage(graphics.imagePath("pixel/shadow")))

		song = songNum
		difficulty = songAppend

		healthBarColorEnemy = {175,102,206}		

        enemy = love.filesystem.load("sprites/characters/buryman_assets.lua")()
        enemy2 = love.filesystem.load("sprites/characters/gengar_assets.lua")()
        enemy3 = love.filesystem.load("sprites/characters/leanmonster.lua")()
        enemy4 = love.filesystem.load("sprites/characters/apparitiongf_assets.lua")()
        boyfriend = love.filesystem.load("sprites/characters/ba_BF_assets.lua")()
        missingno = love.filesystem.load("sprites/characters/ba_missingno_assets.lua")()

        boyfriend.x = -475
        boyfriend.y = 275
        missingno.x = -175
        missingno.y = 175

        enemy.x, enemy.y = 400, 0
        enemy2.x, enemy2.y = 275, 200
        enemy3.x, enemy3.y = 275, 200
        enemy4.x, enemy4.y = 200, 75

        grayscale = {0}
        newTime = 0
        waveAmount = {0}
        greenscale = {0}

        enemySinger = "buried"
        boyfriendSinger = "bf"

		self:load()
	end,

	load = function(self)
		weeksBrimBF:load()

		inst = love.audio.newSource("songs/brimstone/Inst.ogg", "stream")
		voices = love.audio.newSource("songs/brimstone/Voices.ogg", "stream")

		self:initUI()

		weeksBrimBF:setupCountdown()
	end,

	initUI = function(self)
		weeksBrimBF:pixelInitUI()
        weeksBrimEnemy:pixelInitUI()

		weeksBrimBF:generateNotes(love.filesystem.load("songs/brimstone/hard.lua")())
        weeksBrimEnemy:generateNotes(love.filesystem.load("songs/brimstone/hard.lua")())
	end,

	update = function(self, dt)
		weeksBrimBF:update(dt)
        weeksBrimEnemy:update(dt)

        if wooShader then
            newTime = newTime + dt
            wavyBGShader:send("time", newTime)
            wavyBGShader:send("grayscale", grayscale[1])
            wavyBGShader:send("waveAmount", waveAmount[1])

            -- move enemy 4 in a very small circle
            enemy4.x = enemy4.x + math.cos(newTime * 2) * 0.5
            enemy4.y = enemy4.y + math.sin(newTime * 2) * 0.5

            shadow.x = enemy4.x
            shadow.y = enemy4.y + 100
        end
        if greenShaderMoment then
            gameboyShader:send("greenValue", greenscale[1])
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
                gengarMoment = true
            end
            if musicTime >= 97385.7868020305 and musicTime < 97410.7868020305 then 
                --GengarSings()
                enemySinger = "gengar"
            end
            if musicTime >= 120609.137055838 and musicTime < 120634.137055838 then 
                --SummonMissingno()
                missingnoMoment = true
            end
            if musicTime >= 130355.329949239 and musicTime < 130380.329949239 then 
                --MissingnoSwitch()
                boyfriendSinger = "missingno"
            end
            if musicTime >= 140101.52284264 and musicTime < 140126.52284264 then 
                --BuriedSings()
                enemySinger = "buried"
            end
            if musicTime >= 144974.61928934 and musicTime < 144999.61928934 then 
                --MissingnoSwitch()
                boyfriendSinger = "bf"
            end
            if musicTime >= 149847.715736041 and musicTime < 149872.715736041 then 
                --GengarSings()
                enemySinger = "gengar"
            end
            if musicTime >= 154720.812182741 and musicTime < 154745.812182741 then 
                --MissingnoSwitch()
                boyfriendSinger = "missingno"
            end
            if musicTime >= 182436.54822335 and musicTime < 182461.54822335 then 
                --MissingnoSwitch()
                boyfriendSinger = "bf"
            end
            if musicTime >= 182436.54822335 and musicTime < 182461.54822335 then 
                --BuriedSings()
                enemySinger = "buried"
            end
            if musicTime >= 182436.54822335 and musicTime < 182461.54822335 then 
                --MissingnoLeave()
                missingnoMoment = false
            end
            if musicTime >= 182436.54822335 and musicTime < 182461.54822335 then 
                --BrimstoneKeyChange()
                -- shader goofys (the green one)
                greenShaderMoment = true
                Timer.tween(0.3, greenscale, {1}, 'linear')
            end
            if musicTime >= 182741.116751269 and musicTime < 182766.116751269 then 
                --BuriedSings()
                enemySinger = "buried"
            end
            if musicTime >= 202233.502538071 and musicTime < 202258.502538071 then 
                --BrimstoneKeyChange()
                -- shader goofys (the green one)
                -- (it goes goodbye)
                Timer.tween(0.3, greenscale, {0}, 'linear', function() greenShaderMoment = false end)
            end
            if musicTime >= 206649.746192894 and musicTime < 206674.746192894 then 
                --MukSummon()
                gengarMoment = false
                mukMoment = true
            end
            if musicTime >= 206649.746192894 and musicTime < 206674.746192894 then 
                --MukSings()
                enemySinger = "muk"
            end
            if musicTime >= 224162.436548223 and musicTime < 224187.436548223 then 
                --BuriedLaughing()
                enemy:animate("laugh", false)
            end
            if musicTime >= 225380.710659899 and musicTime < 225405.710659899 then 
                --BuriedSings()
                enemySinger = "buried"
            end
            if musicTime >= 236345.177664975 and musicTime < 236370.177664975 then 
                --MukSings()
                enemySinger = "muk"
            end
            if musicTime >= 246091.370558376 and musicTime < 246116.370558376 then 
                --BuriedSings()
                enemySinger = "buried"
            end
            if musicTime >= 246091.370558376 and musicTime < 246116.370558376 then 
                --WhiteHandSummon()
            end
            if musicTime >= 249137.055837564 and musicTime < 249162.055837564 then 
                --MukSings()
                enemySinger = "muk"
            end
            if musicTime >= 254619.289340102 and musicTime < 254644.289340102 then 
                --BuriedSings()
                enemySinger = "buried"
            end
            if musicTime >= 257055.837563452 and musicTime < 257080.837563452 then 
                --MukSings()
                enemySinger = "muk"
            end
            if musicTime >= 263147.208121828 and musicTime < 263172.208121828 then 
                --BrimstoneBackgroundDesaturate()
                -- shader goofys (grayscale and wavy)
                mukMoment = false
                if yooo then
                    Timer.cancel(yooo)
                end
                if yoooo then
                    Timer.cancel(yoooo)
                end
                yooo = Timer.tween(
                    5,
                    grayscale,
                    {1},
                    "linear"
                )
                yoooo = Timer.tween(
                    5,
                    waveAmount,
                    {1},
                    "linear"
                )
                wooShader = true
            end
            if musicTime >= 263147.208121828 and musicTime < 263172.208121828 then 
                --ApparitionSummon()
                -- omg hot gf
                soHotGF = true
            end
            if musicTime >= 275177.664974619 and musicTime < 275202.664974619 then 
                --ApparitionSings()
                enemySinger = "apparition"
            end
            if musicTime >= 323908.629441623 and musicTime < 323933.629441623 then 
                --BuriedSings()
                enemySinger = "buried"
            end
            if musicTime >= 332588.832487308 and musicTime < 332613.832487308 then 
                --ApparitionSings()
                enemySinger = "apparition"
            end
            if musicTime >= 342335.025380709 and musicTime < 342360.025380709 then 
                --BuriedSings()
                enemySinger = "buried"
            end
            if musicTime >= 352081.21827411 and musicTime < 352106.21827411 then 
                --ApparitionSings()
                enemySinger = "apparition"
            end
            if musicTime >= 361827.41116751 and musicTime < 361852.41116751 then 
                --BuriedApparitionSing()
                enemySinger = "buriedANDapparition"
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

		weeksBrimBF:updateUI(dt)
        weeksBrimEnemy:updateUI(dt)
	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
			love.graphics.scale(extraCamZoom.sizeX, extraCamZoom.sizeY)
			love.graphics.scale(cam.sizeX, cam.sizeY)
            if wooShader then
                love.graphics.setShader(wavyBGShader)
            end
            if greenShaderMoment then
                love.graphics.setShader(gameboyShader)
            end
            bg:udraw(3.5,3.5)
            floor:udraw(3.5,3.5)
            graves:udraw(3.5,3.5)
            if wooShader then
                love.graphics.setShader()
            end

            enemy:udraw(3.5,3.5)
            if gengarMoment then
                enemy2:udraw(3.5,3.5)
            end
            if mukMoment then
                enemy3:udraw(3.5,3.5)
            end
            if soHotGF then
                shadow:udraw(2.5,2.5)
                enemy4:udraw(3.5,3.5)
            end

            if missingnoMoment then
                missingno:udraw(3.5,3.5)
            end

            boyfriend:udraw(4.25,4.25)

			weeksBrimBF:drawRating(0.9)
            if greenShaderMoment then
                love.graphics.setShader()
            end
		love.graphics.pop()
		

		weeksBrimBF:drawHealthBar()
		if not paused then
			weeksBrimBF:drawUI()
            weeksBrimEnemy:drawUI()
		end
	end,

	leave = function(self)
		weeksBrimBF:leave()
	end
}