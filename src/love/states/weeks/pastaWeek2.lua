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

ratingTimers = {}

local useAltAnims1
local notMissed = {}
local addJudgements
local judgements = {}
function tweenPauseButtons()

end

return {
	initUI = function(self)
		events = {}
		eventsP = {}
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

		sprites.leftArrow = love.filesystem.load("sprites/notes/" .. noteskins[settings.noteSkins] .. "/left-arrow.lua")
		sprites.downArrow = love.filesystem.load("sprites/notes/" .. noteskins[settings.noteSkins] .. "/down-arrow.lua")
		sprites.upArrow = love.filesystem.load("sprites/notes/" .. noteskins[settings.noteSkins] .. "/up-arrow.lua")
		sprites.rightArrow = love.filesystem.load("sprites/notes/" .. noteskins[settings.noteSkins] .. "/right-arrow.lua")

		enemyArrows = {
			sprites.leftArrow(),
			sprites.downArrow(),
			sprites.upArrow(),
			sprites.rightArrow()
		}

		for i = 1, 4 do
			enemyArrows[i].x = -975 + 150 * i

			enemyArrows[i].y = -400

			enemyNotes[i] = {}
		end
		judgements = {}
		function addJudgements(rating)
			local judgementRating = rating
		
			table.insert(judgements, {
				img = love.filesystem.load("sprites/rating.lua")(),
				rating = judgementRating,
				transparency = 1
			})
			
			judgements[#judgements].img:animate(judgements[#judgements].rating, false)
			judgements[#judgements].img.x = girlfriend.x
			judgements[#judgements].img.y = girlfriend.y - 100
			judgements[#judgements].img.sizeX, judgements[#judgements].img.sizeY = 0.75, 0.75
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

				if noteType == 0 or noteType == 4 or noteType == 8 then
					sprite = sprites.leftArrow
				elseif noteType == 1 or noteType == 5 or noteType == 9 then
					sprite = sprites.downArrow
				elseif noteType == 2 or noteType == 6 or noteType == 10 then
					sprite = sprites.upArrow
				elseif noteType == 3 or noteType == 7 or noteType == 11 then
					sprite = sprites.rightArrow
				end

				if not pixel then
					if mustHitSection then
						if noteType >= 4 and noteType <= 7 then
							local id = noteType - 3
							local c = #enemyNotes[id] + 1
							local x = enemyArrows[id].x

							table.insert(enemyNotes[id], sprite())
							enemyNotes[id][c].x = x
							enemyNotes[id][c].y = -400 + noteTime * 0.6 * speed
							if settings.downscroll then
								enemyNotes[id][c].sizeY = -1
							end

							enemyNotes[id][c]:animate("on", false)

							if chart[i].sectionNotes[j].noteLength > 0 then
								local c

								for k = 71 / speed, chart[i].sectionNotes[j].noteLength, 71 / speed do
									local c = #enemyNotes[id] + 1

									table.insert(enemyNotes[id], sprite())
									enemyNotes[id][c].x = x
									enemyNotes[id][c].y = -400 + (noteTime + k) * 0.6 * speed

									enemyNotes[id][c]:animate("hold", false)
								end

								c = #enemyNotes[id]

								enemyNotes[id][c].offsetY = 10

								enemyNotes[id][c]:animate("end", false)
							end
                        end
					else
						if noteType >= 4 and noteType <= 7 then
						elseif noteType <= 3 then
							local id = noteType + 1
							local c = #enemyNotes[id] + 1
							local x = enemyArrows[id].x

							table.insert(enemyNotes[id], sprite())
							enemyNotes[id][c].x = x
							enemyNotes[id][c].y = -400 + noteTime * 0.6 * speed
							if settings.downscroll then
								enemyNotes[id][c].sizeY = -1
							end

							enemyNotes[id][c]:animate("on", false)

							if chart[i].sectionNotes[j].noteLength > 0 then
								local c

								for k = 71 / speed, chart[i].sectionNotes[j].noteLength, 71 / speed do
									local c = #enemyNotes[id] + 1

									table.insert(enemyNotes[id], sprite())
									enemyNotes[id][c].x = x
									enemyNotes[id][c].y = -400 + (noteTime + k) * 0.6 * speed
									if k > chart[i].sectionNotes[j].noteLength - 71 / speed then
										enemyNotes[id][c].offsetY = 10

										enemyNotes[id][c]:animate("end", false)
									else
										enemyNotes[id][c]:animate("hold", false)
									end
								end

								c = #enemyNotes[id]

								enemyNotes[id][c].offsetY = 10

								enemyNotes[id][c]:animate("end", false)
							end
						end
					end
				end
			end
		end

		for i = 1, 4 do
			table.sort(enemyNotes[i], function(a, b) return a.y < b.y end)
		end

		-- Workarounds for bad charts that have multiple notes around the same place
		for i = 1, 4 do
			local offset = 0

			for j = 2, #enemyNotes[i] do
				local index = j - offset

				if enemyNotes[i][index]:getAnimName() == "on" and enemyNotes[i][index - 1]:getAnimName() == "on" and ((enemyNotes[i][index].y - enemyNotes[i][index - 1].y <= 10)) then
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

		convertedAcc = string.format(
			"%.2f%%",
			(altScore / (noteCounter + missCounter))
		)

		if useDiscordRPC then
			if not modFolderMod then 
				presence = {
					state = "Week " .. weekNum-1 .. " | " .. trackNames[weekNum][song],
					details = "Score: " .. score .. " | Accuracy: " .. convertedAcc,
					largeImageKey = "logo",
					startTimestamp = now,
				}
				nextPresenceUpdate = 0
			else
				presence = {
					state = "Mod Folder",
					details = "Score: " .. score .. " | Accuracy: " .. convertedAcc,
					largeImageKey = "logo",
					startTimestamp = now,
				}
				nextPresenceUpdate = 0
			end
		end

		currentSeconds = voices:tell("seconds")
		songLength = voices:getDuration("seconds")
		timeLeft = songLength - currentSeconds
		--timeLeftFixed = math.floor(timeLeft)
		-- get the minutes and seconds of timeLeft
		timeLeftMinutes = math.floor(timeLeft / 60)
		timeLeftSeconds = math.floor(timeLeft % 60)
		-- format the timeLeft string
		timeLeftString = string.format("%02d:%02d", timeLeftMinutes, timeLeftSeconds)

		if input:pressed("pause") and not countingDown and not cutscene and not doingDialogue then
			if not paused then
				pauseTime = musicTime
				paused = true
				love.audio.pause(inst, voices)
				tweenPauseButtons()
				love.audio.play(sounds.breakfast)
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
			oldMusicThres = musicThres
			if countingDown or love.system.getOS() == "Web" then -- Source:tell() can't be trusted on love.js!
				musicTime = musicTime + 1000 * dt
			else
				if not graphics.isFading() then
					local time = love.timer.getTime()
					local seconds = voices:tell("seconds")

					musicTime = musicTime + (time * 1000) - previousFrameTime
					previousFrameTime = time * 1000

					if lastReportedPlaytime ~= seconds * 1000 then
						lastReportedPlaytime = seconds * 1000
						musicTime = (musicTime + lastReportedPlaytime) / 2
					end
				end
			end

			if settings.botPlay then
				hitSick = true
			end
			
			absMusicTime = math.abs(musicTime)
			musicThres = math.floor(absMusicTime / 100) -- Since "musicTime" isn't precise, this is needed

			for i = 1, #events do
				if events[i].eventTime <= absMusicTime then
					local oldBpm = bpm

					if events[i].bpm then
						bpm = events[i].bpm
						if not bpm then bpm = oldBpm end
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

			if musicThres ~= oldMusicThres and math.fmod(absMusicTime, 240000 / bpm) < 100 then
				if camScaleTimer then Timer.cancel(camScaleTimer) end

				camScaleTimer = Timer.tween((60 / bpm) / 16, cam, {sizeX = camScale.x * 1.05, sizeY = camScale.y * 1.05}, "out-quad", function() camScaleTimer = Timer.tween((60 / bpm), cam, {sizeX = camScale.x, sizeY = camScale.y}, "out-quad") end)
			end
			if musicThres ~= oldMusicThres and math.fmod(absMusicTime, (240000*2) / bpm) < 100 then
				if uiScaleTimer then Timer.cancel(uiScaleTimer) end

				uiScaleTimer = Timer.tween((60 / bpm) / 16, uiScale, {sizeX = uiScale.x * 1.05, sizeY = uiScale.y * 1.05}, "out-quad", function() uiScaleTimer = Timer.tween((60 / bpm), uiScale, {sizeX = uiScale.x, sizeY = uiScale.y}, "out-quad") end)
			end

			girlfriend:update(dt)
			enemy:update(dt)

			if musicThres ~= oldMusicThres and math.fmod(absMusicTime, 120000 / bpm) < 100 then
				if spriteTimers[2] == 0 then
					self:safeAnimate(enemy, "idle", false, 2)
				end
			end

			for i = 2, 3 do
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
				musicPos = musicTime * 0.6 * speed
				for i = 1, 4 do
					local enemyArrow = enemyArrows[i]
					local enemyNote = enemyNotes[i]
					local curAnim = animList[i]
					local curInput = inputList[i]

					local noteNum = i

					enemyArrow:update(dt)

					if curCharacter ~= "MX" then
						if not enemyArrow:isAnimated() then
							enemyArrow:animate("off", false)
						end
					end

					if #enemyNote > 0 then
						if not countingDown then
							if (enemyNote[1].y - musicPos < -500) then
								if curCharacter == "MX" then
									if inst then voices:setVolume(0) end

									notMissed[noteNum] = false
									if not settings.noMiss then
										if enemyNote[1]:getAnimName() ~= "hold" and enemyNote[1]:getAnimName() ~= "end" then
											--health = health - 2
										end
									else
										health = 0
									end
									if enemyNote[1]:getAnimName() ~= "hold" and enemyNote[1]:getAnimName() ~= "end" then
										missCounter = missCounter + 1
									end

									table.remove(enemyNote, 1)

									if girlfriend:isAnimName("sad") then if combo >= 5 then self:safeAnimate(girlfriend, "sad", true, 1) end end

									hitSick = false

									combo = 0
								end
							end
						end
					end

					if curCharacter == "MX" then
						if input:down(curInput) then
							holdingInput = true
						else
							holdingInput = false
						end

						if input:pressed(curInput) then
							if settings.Hitsounds then
								if sounds.Hitsounds[#sounds.Hitsounds]:isPlaying() then
									sounds.Hitsounds[#sounds.Hitsounds] = sounds.Hitsounds[#sounds.Hitsounds]:clone()
									sounds.Hitsounds[#sounds.Hitsounds]:play()
								else
									sounds.Hitsounds[#sounds.Hitsounds]:play()
								end
								for hit = 2, #sounds.Hitsounds do
									if not sounds.Hitsounds[hit]:isPlaying() then
										sounds.Hitsounds[hit] = nil -- Nil afterwords to prevent memory leak
									end --                             maybe, idk how love2d works lmfao
								end
							end
							local success = false

							if settings.ghostTapping then
								success = true
								hitSick = false
							end

							enemyArrow:animate("press", false)

							if #enemyNote > 0 then
								for i = 1, #enemyNote do
									if enemyNote[i] and enemyNote[i]:getAnimName() == "on" then
										if (enemyNote[i].y - musicPos <= -280) then
											local notePos
											local ratingAnim

											notMissed[noteNum] = true

											notePos = math.abs(-400 - (enemyNote[i].y - musicPos))

											voices:setVolume(1)

											if notePos <= 28 then -- "Sick Plus" Note: Just for a cooler looking rating. Does not give anything special
												print("Sick+")
                                                score = score + 350
												addJudgements("sickPlus")
                                                altScore = altScore + 100.00
                                                sicks = sicks + 1
                                                hitSick = true
                                            elseif notePos <= 78 then -- "Sick"
												print("Sick")
                                                score = score + 350
												addJudgements("sick")
                                                altScore = altScore + 100.00
                                                sicks = sicks + 1
                                                hitSick = true
                                            elseif notePos <= 98 then -- "Good"
												print("Good")
                                                score = score + 200
												addJudgements("good")
                                                altScore = altScore + 66.66
                                                goods = goods + 1
                                                hitSick = false
                                            elseif notePos <= 108 then -- "Bad"
												print("Bad")
                                                score = score + 100
												addJudgements("bad")
                                                altScore = altScore + 33.33
                                                bads = bads + 1
                                                hitSick = false
                                            else -- "Shit"
												print("Shit")
                                                if settings.ghostTapping then
                                                    success = false
                                                else
                                                    score = score + 50
                                                end
                                                altScore = altScore + 1.11
												addJudgements("shit")
                                                shits = shits + 1
                                                hitSick = false
                                            end

											combo = combo + 1

											--rating:animate(ratingAnim, false)
											numbers[1]:animate(tostring(math.floor(combo / 100 % 10), false)) -- 100's
											numbers[2]:animate(tostring(math.floor(combo / 10 % 10), false)) -- 10's
											numbers[3]:animate(tostring(math.floor(combo % 10), false)) -- 1's

											for i = 3, 5 do
												if ratingTimers[i] then Timer.cancel(ratingTimers[i]) end
											end -- ratingTimer 1&2 is judgements

											ratingVisibility[1] = 1
											judgements[#judgements].img.y = girlfriend.y - 50
											for i = 1, 3 do
												numbers[i].y = girlfriend.y + 50
											end

											--ratingTimers[1] = Timer.tween(2, ratingVisibility, {0})
											Timer.tween(
												1.1, 
												judgements[#judgements], 
												{
													transparency = 0
												},
												"linear"
											)
											Timer.tween(
												1.25, 
												judgements[#judgements].img, 
												{
													y = girlfriend.y - 100
												}, 
												"out-expo"
											)
											--ratingTimers[2] = Timer.tween(2, rating, {y = girlfriend.y - 100}, "out-elastic")
											if combo >= 100 then
												ratingTimers[3] = Timer.tween(2, numbers[1], {y = girlfriend.y + love.math.random(-10, 10)}, "out-elastic") -- 100's
											end
											if combo >= 10 then
												ratingTimers[4] = Timer.tween(2, numbers[2], {y = girlfriend.y + love.math.random(-10, 10)}, "out-elastic") -- 10's
											end
											ratingTimers[5] = Timer.tween(2, numbers[3], {y = girlfriend.y + love.math.random(-10, 10)}, "out-elastic") -- 1's

											if combo < 10 then
												numbers[3].x = girlfriend.x
											elseif combo < 100 then
												numbers[2].x = girlfriend.x - 25
												numbers[3].x = girlfriend.x + 25
											else
												numbers[1].x = girlfriend.x - 50
												numbers[2].x = girlfriend.x
												numbers[3].x = girlfriend.x + 50
											end
											if not settings.ghostTapping or success then
												enemyArrow:animate("confirm", false)

												self:safeAnimate(enemy, curAnim, false, 3)
												doingAnim = false

												if not settings.noMiss then
													if enemyNote[1]:getAnimName() ~= "hold" or enemyNote[1]:getAnimName() ~= "end" then
														health = health + 1
													end
												else
													health = 0
												end

												health = health + 1
												if enemyNote[1]:getAnimName() ~= "hold" or enemyNote[1]:getAnimName() ~= "end" then
													noteCounter = noteCounter + 1
												end

												success = true
											end
											table.remove(enemyNote, i)
										else
											break
										end
									end
								end
							end

							if not success then
								if not countingDown then
									if curCharacter == "MX" then
										audio.playSound(sounds.miss[love.math.random(3)])

										notMissed[noteNum] = false

										if girlfriend:isAnimName("sad") then if combo >= 5 then self:safeAnimate(girlfriend, "sad", true, 1) end end

										self:safeAnimate(enemy, "miss " .. curAnim, false, 3)

										hitSick = false

										score = score - 10
										combo = 0
										if not settings.noMiss then
											--health = health - 2
										else
											health = 0
										end
										missCounter = missCounter + 1
									end
								end
							end
						end
					end

					if curCharacter == "MX" then
						if notMissed[noteNum] and #enemyNote > 0 and input:down(curInput) and ((enemyNote[1].y - musicPos <= -400)) and (enemyNote[1]:getAnimName() == "hold" or enemyNote[1]:getAnimName() == "end") then
							voices:setVolume(1)

							table.remove(enemyNote, 1)

							enemyArrow:animate("confirm", false)

							if (not enemy:isAnimated()) or (enemy:getAnimName() == "idle" or enemy:getAnimName() == "idle2" or enemy:getAnimName() == "idle3") then self:safeAnimate(enemy, curAnim, true, 3) end

							--health = health + 1
						end

						if input:released(curInput) then
							enemyArrow:animate("off", false)
						end
					else
						if #enemyNote > 0 and ((enemyNote[1].y - musicPos <= -400)) then
							voices:setVolume(1)

							enemyArrow:animate("confirm", false)

							if enemyNote[1]:getAnimName() == "hold" or enemyNote[1]:getAnimName() == "end" then
								if (not enemy:isAnimated()) or (enemy:getAnimName() == "idle" or enemy:getAnimName() == "idle2" or enemy:getAnimName() == "idle3") then self:safeAnimate(enemy, curAnim, true, 2) end
							else
								self:safeAnimate(enemy, curAnim, false, 2)
							end

							table.remove(enemyNote, 1)
						end
					end

					if not settings.botPlay then
						if input:down(curInput) then
							holdingInput = true
						else
							holdingInput = false
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

	doFlash = function(self)
		if not settings.noFlash then
			Timer.tween((60/bpm), flash, {alpha = 1}, "linear", function() Timer.tween((60/bpm), flash, {alpha = 0}, "linear") end)
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

	drawRating = function(self, multiplier)
		if settings.middleScroll then
			love.graphics.translate(400, 0)
		end
		love.graphics.push()
			if not pixel then
				if judgements[1] then
					for i = 1, #judgements do
						graphics.setColor(1, 1, 1, judgements[i].transparency)
						judgements[i].img:draw()
					end
				end
				if combo >= 5 then
					if combo >= 100 then
						numbers[1]:draw()
					end
					if combo >= 10 then
						numbers[2]:draw()
					end
					numbers[3]:draw()
				end
			else
				if judgements[1] then
					for i = 1, #judgements do
						graphics.setColor(1, 1, 1, judgements[i].transparency)
						judgements[i].img:udraw(6,6)
					end
				end
				if combo >= 5 then
					if combo >= 100 then
						numbers[1]:udraw(6,6)
					end
					if combo >= 10 then
						numbers[2]:udraw(6,6)
					end
					numbers[3]:udraw(6,6)
				end
			end
			graphics.setColor(1, 1, 1)
		love.graphics.pop()
	end, -- i love men so much men just make me go wfhjlisdfjkl;jsdrfghnlkgbdehrsgnkadlufhgbkldashbfgoigabdfrsoliabdrsglkadjrshgpio9abejrsgn;kladsfjghlikhb 

	drawUI = function(self)
		graphics.setColor(1, 1, 1)
		love.graphics.push()
			graphics.setColor(1,1,1, flash.alpha)
			love.graphics.rectangle("fill", 0, 0, 1280, 720)
			graphics.setColor(1,1,1)
		love.graphics.pop()
		love.graphics.push()
			love.graphics.translate(lovesize.getWidth() / 2, lovesize.getHeight() / 2)
			if not settings.downscroll then
				love.graphics.scale(0.7, 0.7)
			else
				love.graphics.scale(0.7, -0.7)
			end
			love.graphics.scale(uiScale.sizeX, uiScale.sizeY)
			

			for i = 1, 4 do
				if enemyArrows[i]:getAnimName() == "off" then
					graphics.setColor(0.6, 0.6, 0.6)
				end
				if settings.middleScroll then
					if paused then 
						graphics.setColor(0.6,0.6,0.6,0.3)
					else
						graphics.setColor(0.6,0.6,0.6,0.3)
					end
				else
					if paused then 
						graphics.setColor(0.6,0.6,0.6,0.3)
					else
						graphics.setColor(1,1,1)
					end
				end

				if not paused then
					if not pixel then
						if not settings.downscroll then
							enemyArrows[i]:udraw(1, 1)
						else
							enemyArrows[i]:udraw(1, -1)
						end
					else
						if not settings.downscroll then
							enemyArrows[i]:udraw(7, 7)
						else
							enemyArrows[i]:udraw(7, -7)
						end
					end
				end
				
				love.graphics.push()
					love.graphics.translate(0, -musicPos)

					for j = #enemyNotes[i], 1, -1 do
						if (enemyNotes[i][j].y - musicPos <= 560) then
							local animName = enemyNotes[i][j]:getAnimName()

							if animName == "hold" or animName == "end" then
								graphics.setColor(1, 1, 1, math.min(0.5, (500 + (boyfriendNotes[i][j].y - musicPos)) / 150))
							else
								graphics.setColor(1, 1, 1, math.min(1, (500 + (boyfriendNotes[i][j].y - musicPos)) / 75))
							end
							if pixel then
								enemyNotes[i][j]:udraw(7, enemyNotes[i][j].sizeY)
							else
								enemyNotes[i][j]:udraw(1, enemyNotes[i][j].sizeY)
							end
							graphics.setColor(1, 1, 1)
						end
					end
					graphics.setColor(1, 1, 1)
				love.graphics.pop()
			end
			graphics.setColor(1, 1, 1, countdownFade[1])
			if not settings.downscroll then
				countdown:draw()
			else
				countdown:udraw(1,-1)
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
