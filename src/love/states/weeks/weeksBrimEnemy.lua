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

local animList = {
	"left",
	"down",
	"up",
	"right"
}
local inputList = {
	"gameLeft",
	"gameDown",
	"gameUp",
	"gameRight"
}

missCounter = 0
noteCounter = 0
altScore = 0

local useAltAnims1
local notMissed = {}

function tweenPauseButtons()

end

return {
	load = function(self)

		holdingInput = false
		missCounter = 0
		noteCounter = 0
		altScore = 0
		doingAnim = false -- for week 4 stuff
		hitSick = false
		paused = false
		pauseMenuSelection = 1
		
		for i = 1, 4 do
			notMissed[i] = true
		end
		useAltAnims = false

		combo = 0

		enemy:animate("idle")

		graphics.fadeIn(0.5)
	end,

	pixelInitUI = function(self)
		events = {}
		enemyNotes = {}
		health = 50
		score = 0
		missCounter = 0
		altScore = 0
		sicks = 0
		goods = 0
		bads = 0
		shits = 0
		hitCounter = 0

		local curInput = inputList[i]

		sprites.leftArrow = love.filesystem.load("sprites/pixel/notes/" .. noteskins[settings.noteSkins] .. "/left-arrow.lua")
		sprites.downArrow = love.filesystem.load("sprites/pixel/notes/" .. noteskins[settings.noteSkins] .. "/down-arrow.lua")
		sprites.upArrow = love.filesystem.load("sprites/pixel/notes/" .. noteskins[settings.noteSkins] .. "/up-arrow.lua")
		sprites.rightArrow = love.filesystem.load("sprites/pixel/notes/" .. noteskins[settings.noteSkins] .. "/right-arrow.lua")

		enemyArrows = {
			sprites.leftArrow(),
			sprites.downArrow(),
			sprites.upArrow(),
			sprites.rightArrow()
		}

		for i = 1, 4 do
			enemyArrows[i].x = 10 + 165 * i 

			enemyArrows[i].y = 400

			enemyArrows[i].sizeX, enemyArrows[i].sizeY = 7, 7

			enemyNotes[i] = {}
		end
	end,

	generateNotes = function(self, chart)
		local eventBpm

		for i = 1, #chart do
			bpm = chart[i].bpm or 120

			if bpm then
				break
			end
		end
		if not bpm then
			bpm = 100
		end

		if settings.customScrollSpeed == 1 then
			speed = chart.speed
		else
			speed = settings.customScrollSpeed
		end
		songName = chart.songName
		needsVoices = chart.needsVoices

		for i = 1, #chart do
			eventBpm = chart[i].bpm

			for j = 1, #chart[i].sectionNotes do
				local sprite

				local mustHitSection = chart[i].mustHitSection
				local altAnim = chart[i].altAnim
				local noteType = chart[i].sectionNotes[j].noteType
				local noteTime = chart[i].sectionNotes[j].noteTime

				if j == 1 then
					table.insert(events, {eventTime = chart[i].sectionNotes[1].noteTime, mustHitSection = mustHitSection, bpm = eventBpm, altAnim = altAnim})
				end

				if noteType == 0 or noteType == 4 then
					sprite = sprites.leftArrow
				elseif noteType == 1 or noteType == 5 then
					sprite = sprites.downArrow
				elseif noteType == 2 or noteType == 6 then
					sprite = sprites.upArrow
				elseif noteType == 3 or noteType == 7 then
					sprite = sprites.rightArrow
				end

					if mustHitSection then
						if noteType >= 4 then
							local id = noteType - 3
							local c = #enemyNotes[id] + 1
							local x = enemyArrows[id].x
	
							table.insert(enemyNotes[id], sprite())
							enemyNotes[id][c].x = x
							enemyNotes[id][c].y = 400 - noteTime * 0.6 * speed
	
							enemyNotes[id][c]:animate("on", false)
	
							if chart[i].sectionNotes[j].noteLength > 0 then
								local c
	
								for k = 56 / speed, chart[i].sectionNotes[j].noteLength, 56 / speed do
									local c = #enemyNotes[id] + 1
		
									table.insert(enemyNotes[id], sprite())
									enemyNotes[id][c].x = x
									enemyNotes[id][c].y = 400 - (noteTime + k) * 0.6 * speed
		
									enemyNotes[id][c]:animate("hold", false)
								end
		
								c = #enemyNotes[id]
		
								enemyNotes[id][c].offsetY = 1
		
								enemyNotes[id][c]:animate("end", false)
								enemyNotes[id][c].sizeY = -7
							end
						end
					else
						if noteType <= 3 then
							local id = noteType + 1
							local c = #enemyNotes[id] + 1
							local x = enemyArrows[id].x
	
							table.insert(enemyNotes[id], sprite())
							enemyNotes[id][c].x = x
							enemyNotes[id][c].y = 400 - noteTime * 0.6 * speed
	
							enemyNotes[id][c]:animate("on", false)
	
							if chart[i].sectionNotes[j].noteLength > 0 then
								local c
		
								for k = 56 / speed, chart[i].sectionNotes[j].noteLength, 56 / speed do
									local c = #enemyNotes[id] + 1
		
									table.insert(enemyNotes[id], sprite())
									enemyNotes[id][c].x = x
									enemyNotes[id][c].y = 400 - (noteTime + k) * 0.6 * speed
									if k > chart[i].sectionNotes[j].noteLength - 56 / speed then
										enemyNotes[id][c].offsetY = 1
	
										enemyNotes[id][c]:animate("end", false)
										enemyNotes[id][c].sizeY = 7
									else
										enemyNotes[id][c]:animate("hold", false)
									end
								end
		
								c = #enemyNotes[id]
		
								enemyNotes[id][c].offsetY = 1
		
								enemyNotes[id][c]:animate("end", false)
								enemyNotes[id][c].sizeY = -7
							end
						end
					end
			end
		end

		for i = 1, 4 do
			table.sort(enemyNotes[i], function(a, b) return a.y > b.y end)
		end

		-- Workarounds for bad charts that have multiple notes around the same place
		for i = 1, 4 do
			local offset = 0

			for j = 2, #enemyNotes[i] do
				local index = j - offset

				if enemyNotes[i][index]:getAnimName() == "on" and enemyNotes[i][index - 1]:getAnimName() == "on" and ((enemyNotes[i][index].y - enemyNotes[i][index - 1].y >= -10)) then
					table.remove(enemyNotes[i], index)

					offset = offset + 1
				end
			end
		end
	end,

	doDialogue = function(dt)
		local fullDialogue = dialogueList[curDialogue]
		
		timer = timer + 0.75 * love.timer.getDelta()
		
		if timer >= 0.05 then
			if progress < string.len(fullDialogue) then
				sounds["text"]:play()

				progress = progress + 1

				output = string.sub(fullDialogue, 1, math.floor(progress))

				timer = 0
			else
				timer = 0
			end
		end
	end,

	advanceDialogue = function()
		local fullDialogue = dialogueList[curDialogue]

		if progress < string.len(fullDialogue) then
			progress = string.len(fullDialogue)
			output = string.sub(fullDialogue, 1, math.floor(progress))
		else
			if curDialogue < #dialogueList then
				sounds["continue"]:play()
				
				curDialogue = curDialogue + 1
				timer = 0
				progress = 1
				output = ""
			else
				sounds["continue"]:play()

				isDone = true
			end
		end
	end,

	safeAnimate = function(self, sprite, animName, loopAnim, timerID)
		sprite:animate(animName, loopAnim)

		spriteTimers[timerID] = 12
	end,

	update = function(self, dt)
		hitCounter = (sicks + goods + bads + shits)

		if paused then
			if input:pressed("gameDown") then
				if pauseMenuSelection == 3 then
					pauseMenuSelection = 1
				else
					pauseMenuSelection = pauseMenuSelection + 1
				end
			end

			if input:pressed("gameUp") and paused then
				if pauseMenuSelection == 1 then
					pauseMenuSelection = 3
				else
					pauseMenuSelection = pauseMenuSelection - 1
				end
			end
		end

		if input:pressed("pause") and not countingDown and not cutscene and not doingDialogue then
			if not paused then
				pauseTime = musicTime
				paused = true
				tweenPauseButtons()
			end
		end

		if paused then
			musicTime = pauseTime
			if input:pressed("confirm") and pauseMenuSelection == 1 then -- resume button
				paused = false
				love.audio.play(inst, voices)
			elseif input:pressed("confirm") and pauseMenuSelection == 2 then -- restart button 
				pauseRestart = true
				Gamestate.push(gameOver)
			elseif input:pressed("confirm") and pauseMenuSelection == 3 then --  exit button 
				paused = false
				if inst then inst:stop() end
				voices:stop()
				storyMode = false
			end
		else
			love.audio.stop(sounds.breakfast)
		end

		if not doingDialogue and not cutscene then
			oldMusicThres2 = musicThres2
			if countingDown or love.system.getOS() == "Web" then -- Source:tell() can't be trusted on love.js!
				musicTime = musicTime + 1000 * dt
			else
				if not graphics.isFading() then
					local time = love.timer.getTime()
					local seconds = voices:tell("seconds")

					musicTime = musicTime + (time * 1000) - previousFrameTime2
					previousFrameTime2 = time * 1000

					if lastReportedPlaytime2 ~= seconds * 1000 then
						lastReportedPlaytime2 = seconds * 1000
						musicTime = (musicTime + lastReportedPlaytime2) / 2
					end
				end
			end
			
			absMusicTime2 = math.abs(musicTime)
			musicThres2 = math.floor(absMusicTime2 / 100) -- Since "musicTime" isn't precise, this is needed

			for i = 1, #events do
				if events[i].eventTime <= absMusicTime then
					local oldBpm = bpm

					if events[i].bpm then
						bpm = events[i].bpm
						if not bpm then bpm = oldBpm end
					end

					if camTimer then
						Timer.cancel(camTimer)
					end
					if events[i].mustHitSection then
						--camTimer = Timer.tween(1.25, cam, {x = -boyfriend.x + 100, y = -boyfriend.y + 75}, "out-quad")
					else
						camTimer = Timer.tween(1.25, cam, {x = -enemy.x - 100, y = -enemy.y + 75}, "out-quad")
					end

					if events[i].altAnim then
						useAltAnims = true
					else
						useAltAnims = false
					end

					table.remove(events, i)

					break
				end
			end

			if musicThres2 ~= oldMusicThres2 and math.fmod(absMusicTime2, 240000 / bpm) < 100 then
				if camScaleTimer then Timer.cancel(camScaleTimer) end

				camScaleTimer = Timer.tween((60 / bpm) / 16, cam, {sizeX = camScale.x * 1.05, sizeY = camScale.y * 1.05}, "out-quad", function() camScaleTimer = Timer.tween((60 / bpm), cam, {sizeX = camScale.x, sizeY = camScale.y}, "out-quad") end)
			end
			if musicThres2 ~= oldMusicThres2 and math.fmod(absMusicTime2, (240000*2) / bpm) < 100 then
				if uiScaleTimer then Timer.cancel(uiScaleTimer) end

				uiScaleTimer = Timer.tween((60 / bpm) / 16, uiScale, {sizeX = uiScale.x * 1.05, sizeY = uiScale.y * 1.05}, "out-quad", function() uiScaleTimer = Timer.tween((60 / bpm), uiScale, {sizeX = uiScale.x, sizeY = uiScale.y}, "out-quad") end)
			end

			girlfriend:update(dt)
			enemy:update(dt)
			enemy2:update(dt)
			enemy3:update(dt)
			enemy4:update(dt)

			if musicThres ~= oldMusicThres2 and math.fmod(absMusicTime2, 120000 / bpm) < 100 then
				if spriteTimers[1] == 0 then
					girlfriend:animate("idle", false)
	
					girlfriend:setAnimSpeed(14.4 / (60 / bpm))
				end
				if spriteTimers[2] == 0 then
					if enemy:getAnimName() == "laugh" then 
						if not enemy:isAnimated() then
							self:safeAnimate(enemy, "idle", false, 2)
						end
					else 
						self:safeAnimate(enemy, "idle", false, 2)
						
					end
				end
				if spriteTimers[4] == 0 then
					self:safeAnimate(enemy2, "idle", false, 4)
				end
				if spriteTimers[5] == 0 then
					self:safeAnimate(enemy3, "idle", false, 5)
				end
				if spriteTimers[6] == 0 then
					self:safeAnimate(enemy4, "idle", false, 6)
				end

			end

			for i = 1, 7 do
				local spriteTimer = spriteTimers[i]

				if spriteTimer > 0 then
					spriteTimers[i] = spriteTimer - 1
				end
			end
		end
	end,

	updateUI = function(self, dt)
		if not paused then
			if not doingDialogue and not cutscene then
				musicPos2 = -musicTime * 0.6 * speed

				for i = 1, 4 do
					local enemyArrow = enemyArrows[i]
					local enemyNote = enemyNotes[i]
					local curAnim = animList[i]
					local curInput = inputList[i]

					local noteNum = i

					enemyArrow:update(dt)

					if not enemyArrow:isAnimated() then
						enemyArrow:animate("off", false)
					end

					if #enemyNote > 0 then
						if (enemyNote[1].y - musicPos2 >= 400) then
							voices:setVolume(1)

							enemyArrow:animate("confirm", false)

							if enemyNote[1]:getAnimName() == "hold" or enemyNote[1]:getAnimName() == "end" then
								
								if enemySinger == "buried" then
									if (not enemy:isAnimated()) or enemy:getAnimName() == "idle" then self:safeAnimate(enemy, curAnim, true, 2) end
								elseif enemySinger == "gengar" then
									if (not enemy2:isAnimated()) or enemy2:getAnimName() == "idle" then self:safeAnimate(enemy2, curAnim, true, 4) end
								elseif enemySinger == "muk" then
									if (not enemy3:isAnimated()) or enemy3:getAnimName() == "idle" then self:safeAnimate(enemy3, curAnim, true, 5) end
								elseif enemySinger == "apparition" then
									if (not enemy4:isAnimated()) or enemy4:getAnimName() == "idle" then self:safeAnimate(enemy4, curAnim, true, 6) end
								elseif enemySinger == "buriedANDapparition" then
									if (not enemy:isAnimated()) or enemy:getAnimName() == "idle" then self:safeAnimate(enemy, curAnim, true, 2) end
									if (not enemy4:isAnimated()) or enemy4:getAnimName() == "idle" then self:safeAnimate(enemy4, curAnim, true, 6) end
								end
							else
								if enemySinger == "buried" then
									self:safeAnimate(enemy, curAnim, false, 2)
								elseif enemySinger == "gengar" then
									self:safeAnimate(enemy2, curAnim, false, 4)
								elseif enemySinger == "muk" then
									self:safeAnimate(enemy3, curAnim, false, 5)
								elseif enemySinger == "apparition" then
									self:safeAnimate(enemy4, curAnim, false, 6)
								elseif enemySinger == "buriedANDapparition" then
									self:safeAnimate(enemy, curAnim, false, 2)
									self:safeAnimate(enemy4, curAnim, false, 6)
								end
							end

							table.remove(enemyNote, 1)
						end
					end
				end

				if not countingDown and input:pressed("gameBack") then
					if inst then inst:stop() end
					voices:stop()

					storyMode = false
				end
			end
		end
	end,

	zoomCamera = function(self, time, sizeX, sizeY, easeType, direct)
		if extraCamZoom then
			Timer.cancel(extraCamZoom)
		end
		if direct then
			theCamZoom = Timer.tween(
				time,
				extraCamZoom,
				{
					sizeX = sizeX,
					sizeY = sizeY
				},
				easeType
			)
		else
			theCamZoom = Timer.tween(
				time,
				extraCamZoom,
				{
					sizeX = extraCamZoom.sizeX + sizeX,
					sizeY = extraCamZoom.sizeY + sizeY
				},
				easeType
			)
		end
	end,
	drawUI = function(self)
		graphics.setColor(1, 1, 1)
		love.graphics.push()
			love.graphics.translate(lovesize.getWidth() / 2, lovesize.getHeight() / 2)
			love.graphics.scale(0.7, 0.7)
			love.graphics.scale(uiScale.sizeX, uiScale.sizeY)
			

			for i = 1, 4 do
				if enemyArrows[i]:getAnimName() == "off" then
					graphics.setColor(0.6, 0.6, 0.6)
				end
				if paused then 
					graphics.setColor(0.6,0.6,0.6,0.3)
				else
					graphics.setColor(1,1,1)
				end

				if not paused then
					enemyArrows[i]:udraw(7, 7)				
				end
				
				love.graphics.push()
					love.graphics.translate(0, -musicPos2)

					for j = #enemyNotes[i], 1, -1 do
						if (enemyNotes[i][j].y - musicPos2 <= 560) then
							local animName = enemyNotes[i][j]:getAnimName()

							if animName == "hold" or animName == "end" then
								graphics.setColor(1, 1, 1, 0.5)
							end
							enemyNotes[i][j]:udraw(7, enemyNotes[i][j].sizeY)
							graphics.setColor(1, 1, 1)
						end
					end
					graphics.setColor(1, 1, 1)
				love.graphics.pop()
			end
			graphics.setColor(1, 1, 1)
		love.graphics.pop()
	end,
	drawTimeLeftBar = function()
		love.graphics.push()
			graphics.setColor(0, 0, 0, 0.5)
			love.graphics.rectangle("fill", 0, 0, 1282, 25)
			graphics.setColor(1, 0, 0, 0.5)
			love.graphics.rectangle("fill", 0, 0, 1282 * (timeLeft / songLength), 25)
			graphics.setColor(1, 1, 1)
			-- center the text in the bar
			love.graphics.printf("Time Left: " .. timeLeftString, 0, 0, 1282, "center")
		love.graphics.pop()
	end,

	drawDialogue = function()
		if pixel then love.graphics.setFont(pixelFont)
		else love.graphics.setFont(font) end
		uitextf(output, 150, 435, 200, "left", 0, 4.7, 4.7)
	end,

	leave = function(self)
		if inst then inst:stop() end
		voices:stop()
		uiTextColour = {1,1,1}
		extraCamZoom.sizeX = 1
		extraCamZoom.sizeY = 1

		Timer.clear()

		died = false
		modFolderMod = false
	end
}
