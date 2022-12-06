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
	"dodge", -- taco bell
	"up",
	"right"
}
local inputList = {
	"gameLeft",
	"gameDown",
	"spare",
	"gameUp",
	"gameRight"
}

missCounter = 0
noteCounter = 0
altScore = 0

ratingTimers = {}

local useAltAnims1
local notMissed = {}
local judgements = {}
zoom = {}

function tweenPauseButtons()

end

return {
	enter = function(self)
		font = love.graphics.newFont("fonts/vcr.ttf", 24)
		love.graphics.setDefaultFilter("nearest")
		pixelFont = love.graphics.newFont("fonts/pixel.fnt")
		love.graphics.setDefaultFilter("linear")
		totalScore = 0

		--PAUSE MENU IMAGES
		pauseBG = graphics.newImage(love.graphics.newImage(graphics.imagePath("pause/pause_box")))
		pauseShadow = graphics.newImage(love.graphics.newImage(graphics.imagePath("pause/pause_shadow")))

		sounds = {
			countdown = {
				three = love.audio.newSource("sounds/countdown-3.ogg", "static"),
				two = love.audio.newSource("sounds/countdown-2.ogg", "static"),
				one = love.audio.newSource("sounds/countdown-1.ogg", "static"),
				go = love.audio.newSource("sounds/countdown-go.ogg", "static")
			},
			miss = {
				love.audio.newSource("sounds/miss1.ogg", "static"),
				love.audio.newSource("sounds/miss2.ogg", "static"),
				love.audio.newSource("sounds/miss3.ogg", "static")
			},
			Hitsounds = {
				love.audio.newSource("sounds/hitSound.ogg", "static"),
			},
			death = love.audio.newSource("sounds/death.ogg", "static"),
			breakfast = love.audio.newSource("songs/misc/breakfast.ogg", "stream"),
			["text"] = love.audio.newSource("sounds/pixel/text.ogg", "static"),
			["continue"] = love.audio.newSource("sounds/pixel/continue-text.ogg", "static"),
		}

		images = {
			icons = love.graphics.newImage(graphics.imagePath("icons")),
			notes = love.graphics.newImage(graphics.imagePath(noteskins[settings.noteSkins])),
			notesMiddle = love.graphics.newImage(graphics.imagePath("ui/Bronzong_Gong_mechanic")),
			notesplashes = love.graphics.newImage(graphics.imagePath("noteSplashes")),
			numbers = love.graphics.newImage(graphics.imagePath("numbers")),
			rating = love.graphics.newImage(graphics.imagePath("rating")),
		}
		sprites = {
			icons = love.filesystem.load("sprites/icons.lua"),
			numbers = love.filesystem.load("sprites/numbers.lua")
		}

		pauseVolume = {
			vol = 0
		}

		girlfriend = love.filesystem.load("sprites/girlfriend.lua")()
		boyfriend = love.filesystem.load("sprites/boyfriend.lua")()

		rating = love.filesystem.load("sprites/rating.lua")()

		rating.sizeX, rating.sizeY = 0.75, 0.75
		numbers = {}
		for i = 1, 3 do
			numbers[i] = sprites.numbers()

			numbers[i].sizeX, numbers[i].sizeY = 0.5, 0.5
		end

		enemyIcon = sprites.icons()
		boyfriendIcon = sprites.icons()

		if settings.downscroll then
			downscrollOffset = -750
		else
			downscrollOffset = 0
		end

		enemyIcon.y = 350 + downscrollOffset
		boyfriendIcon.y = 350 + downscrollOffset
		enemyIcon.sizeX, enemyIcon.sizeY = -1.5, 1.5
		boyfriendIcon.sizeX, boyfriendIcon.sizeY = 1.5, 1.5
		healthBarColorPlayer = {49,176,209}

		countdownFade = {}
		countdown = love.filesystem.load("sprites/countdown.lua")()

		function setDialogue(strList)
			dialogueList = strList
			curDialogue = 1
			timer = 0
			progress = 1
			output = ""
			isDone = false
		end

		function addJudgements(rating)
			local judgementRating = rating

			if not pixel then 
				table.insert(judgements, {
					img = love.filesystem.load("sprites/rating.lua")(),
					rating = judgementRating,
					transparency = 1
				})
			else
				table.insert(judgements, {
					img = love.filesystem.load("sprites/pixel/rating.lua")(),
					rating = judgementRating,
					transparency = 1
				})
			end
			judgements[#judgements].img:animate(judgements[#judgements].rating, false)
			judgements[#judgements].img.x = girlfriend.x
			judgements[#judgements].img.y = girlfriend.y - 100
			if not pixel then judgements[#judgements].img.sizeX, judgements[#judgements].img.sizeY = 0.75, 0.75 end
		end
	end,

	load = function(self)

		holdingInput = false
		missCounter = 0
		noteCounter = 0
		altScore = 0
		doingAnim = false -- for week 4 stuff
		hitSick = false
		paused = false
		pauseMenuSelection = 1

		zoom[1] = 1
		
		for i = 1, 5 do
			notMissed[i] = true
		end
		useAltAnims = false

		cam.x, cam.y = -boyfriend.x + 100, -boyfriend.y + 75

		rating.x = girlfriend.x
		if not pixel then
			for i = 1, 3 do
				numbers[i].x = girlfriend.x - 100 + 50 * i
			end
		else
			for i = 1, 3 do
				numbers[i].x = girlfriend.x - 100 + 58 * i
			end
		end

		ratingVisibility = {0}
		combo = 0

		enemy:animate("idle")
		boyfriend:animate("idle")

		graphics.fadeIn(0.5)
	end,

	initUI = function(self)
		events = {}
		eventsP = {}
		enemyNotes = {}
		boyfriendNotes = {}
		picoNotes = {}
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
		sprites.middle = love.filesystem.load("sprites/notes/middle.lua")

		leftArrowSplash = love.filesystem.load("sprites/notes/noteSplashes.lua")()
		downArrowSplash = love.filesystem.load("sprites/notes/noteSplashes.lua")()
		upArrowSplash = love.filesystem.load("sprites/notes/noteSplashes.lua")()
		rightArrowSplash = love.filesystem.load("sprites/notes/noteSplashes.lua")()

		enemyArrows = {
			sprites.leftArrow(),
			sprites.downArrow(),
			sprites.upArrow(),
			sprites.rightArrow()
		}
		boyfriendArrows = {
			sprites.leftArrow(),
			sprites.downArrow(),
			sprites.middle(),
			sprites.upArrow(),
			sprites.rightArrow(),
		}
		picoArrows = {
			sprites.leftArrow(),
			sprites.downArrow(),
			sprites.upArrow(),
			sprites.rightArrow()
		}

		for i = 1, 5 do
			if not settings.middleScroll then
				boyfriendArrows[1].x = -925 + 165 * 1
				boyfriendArrows[2].x = -925 + 165 * 2
				boyfriendArrows[3].x = -895 + 165 * 3
				boyfriendArrows[4].x = -860 + 165 * 4
				boyfriendArrows[5].x = -860 + 165 * 5
				if enemyArrows[i] then enemyArrows[i].x = 100 + 165 * i end
				leftArrowSplash.x = -925 + 165 * 1 + 5
				downArrowSplash.x = -925 + 165 * 2 + 5
				upArrowSplash.x =  -860 + 165 * 3 + 25
				rightArrowSplash.x = -860 + 165 * 4 + 25
			else
				boyfriendArrows[i].x = -410 + 165 * i
				-- ew stuff
				enemyArrows[1].x = -925 + 165 * 1 
				enemyArrows[2].x = -925 + 165 * 2
				enemyArrows[3].x = 100 + 165 * 3
				enemyArrows[4].x = 100 + 165 * 4
				leftArrowSplash.x = -440 + 165 * 1 + 5
				downArrowSplash.x = -440 + 165 * 2 + 5
				upArrowSplash.x =  -440 + 165 * 3 + 5
				rightArrowSplash.x = -440 + 165 * 4 + 5
			end
			if enemyArrows[i] then enemyArrows[i].y = -400 end
			boyfriendArrows[i].y = -400
			leftArrowSplash.y = -400
			downArrowSplash.y = -400
			upArrowSplash.y = -400
			rightArrowSplash.y = -400

			if enemyArrows[i] then enemyNotes[i] = {} end
			boyfriendNotes[i] = {}
			if picoNotes[i] then picoNotes[i] = {} end
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
				if noteType == 8 then
					sprite = sprites.middle
				end

				if not pixel then
					if mustHitSection then
						if noteType == 8 then
							local id = 3
							local c = #boyfriendNotes[id] + 1
							local x = boyfriendArrows[id].x

							table.insert(boyfriendNotes[id], sprite())
							boyfriendNotes[id][c].x = x
							boyfriendNotes[id][c].y = -400 + noteTime * 0.6 * speed
							if settings.downscroll then
								boyfriendNotes[id][c].sizeY = -1
							end

							boyfriendNotes[id][c]:animate("on", false)

							if chart[i].sectionNotes[j].noteLength > 0 then
								local c

								for k = 71 / speed, chart[i].sectionNotes[j].noteLength, 71 / speed do
									local c = #boyfriendNotes[id] + 1

									table.insert(boyfriendNotes[id], sprite())
									boyfriendNotes[id][c].x = x
									boyfriendNotes[id][c].y = -400 + (noteTime + k) * 0.6 * speed

									boyfriendNotes[id][c]:animate("hold", false)
								end

								c = #boyfriendNotes[id]

								boyfriendNotes[id][c].offsetY = 10

								boyfriendNotes[id][c]:animate("end", false)
							end	
						end
						if noteType ~= 8 then
							if noteType >= 4 then
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
							else
								local id = noteType + 1
								if id >= 3 then
									id = id + 1
								end
								local c = #boyfriendNotes[id] + 1
								local x = boyfriendArrows[id].x

								table.insert(boyfriendNotes[id], sprite())
								boyfriendNotes[id][c].x = x
								boyfriendNotes[id][c].y = -400 + noteTime * 0.6 * speed
								if settings.downscroll then
									boyfriendNotes[id][c].sizeY = -1
								end

								boyfriendNotes[id][c]:animate("on", false)

								if chart[i].sectionNotes[j].noteLength > 0 then
									local c

									for k = 71 / speed, chart[i].sectionNotes[j].noteLength, 71 / speed do
										local c = #boyfriendNotes[id] + 1

										table.insert(boyfriendNotes[id], sprite())
										boyfriendNotes[id][c].x = x
										boyfriendNotes[id][c].y = -400 + (noteTime + k) * 0.6 * speed

										boyfriendNotes[id][c]:animate("hold", false)
									end

									c = #boyfriendNotes[id]

									boyfriendNotes[id][c].offsetY = 10

									boyfriendNotes[id][c]:animate("end", false)
								end	
							end
						end
					else
						if noteType == 8 then
							local id = 3
							local c = #boyfriendNotes[id] + 1
							local x = boyfriendArrows[id].x

							table.insert(boyfriendNotes[id], sprite())
							boyfriendNotes[id][c].x = x
							boyfriendNotes[id][c].y = -400 + noteTime * 0.6 * speed
							if settings.downscroll then
								boyfriendNotes[id][c].sizeY = -1
							end

							boyfriendNotes[id][c]:animate("on", false)

							if chart[i].sectionNotes[j].noteLength > 0 then
								local c

								for k = 71 / speed, chart[i].sectionNotes[j].noteLength, 71 / speed do
									local c = #boyfriendNotes[id] + 1

									table.insert(boyfriendNotes[id], sprite())
									boyfriendNotes[id][c].x = x
									boyfriendNotes[id][c].y = -400 + (noteTime + k) * 0.6 * speed

									boyfriendNotes[id][c]:animate("hold", false)
								end

								c = #boyfriendNotes[id]

								boyfriendNotes[id][c].offsetY = 10

								boyfriendNotes[id][c]:animate("end", false)
							end	
						end
						if noteType ~= 8 then
							if noteType >= 4 then
								local id = noteType - 3
								if id >= 3 then
									id = id + 1
								end
								local c = #boyfriendNotes[id] + 1
								local x = boyfriendArrows[id].x

								table.insert(boyfriendNotes[id], sprite())
								boyfriendNotes[id][c].x = x
								boyfriendNotes[id][c].y = -400 + noteTime * 0.6 * speed
								if settings.downscroll then
									boyfriendNotes[id][c].sizeY = -1
								end

								boyfriendNotes[id][c]:animate("on", false)

								if chart[i].sectionNotes[j].noteLength > 0 then
									local c

									for k = 71 / speed, chart[i].sectionNotes[j].noteLength, 71 / speed do
										local c = #boyfriendNotes[id] + 1

										table.insert(boyfriendNotes[id], sprite())
										boyfriendNotes[id][c].x = x
										boyfriendNotes[id][c].y = -400 + (noteTime + k) * 0.6 * speed

										boyfriendNotes[id][c]:animate("hold", false)
									end

									c = #boyfriendNotes[id]

									boyfriendNotes[id][c].offsetY = 10

									boyfriendNotes[id][c]:animate("end", false)
								end
							else
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
		end

		for i = 1, 4 do
			table.sort(enemyNotes[i], function(a, b) return a.y < b.y end)
			table.sort(boyfriendNotes[i], function(a, b) return a.y < b.y end)
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
		for i = 1, 4 do
			local offset = 0

			for j = 2, #boyfriendNotes[i] do
				local index = j - offset

				if boyfriendNotes[i][index]:getAnimName() == "on" and boyfriendNotes[i][index - 1]:getAnimName() == "on" and ((boyfriendNotes[i][index].y - boyfriendNotes[i][index - 1].y <= 10)) then
					table.remove(boyfriendNotes[i], index)

					offset = offset + 1
				end
			end
		end
	end,
	generatePicoNotes = function(self, chartP)
		for i = 1, #chartP do
			for j = 1, #chartP[i].sectionNotes do
				local spriteP

				local noteTimeP = chartP[i].sectionNotes[j].noteTime
				local noteTypeP = chartP[i].sectionNotes[j].noteType
				local Pspeed = chartP.speed

				spriteP = sprites.downArrow

				local id = noteTypeP + 1
				local c = #picoNotes[id] + 1
				local x = picoNotes[id].x

				table.insert(picoNotes[id], spriteP())
				picoNotes[id][c].x = x
				picoNotes[id][c].y = -400 + (noteTimeP + 1010*j) * 0.6 * Pspeed

				picoNotes[id][c]:animate("on", false)
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

	-- Gross countdown script
	setupCountdown = function(self)
		lastReportedPlaytime = 0
		musicTime = (240 / bpm) * -1000

		musicThres = 0
		musicPos = 0

		countingDown = true
		countdownFade[1] = 0
		audio.playSound(sounds.countdown.three)
		Timer.after(
			(60 / bpm),
			function()
				countdown:animate("ready")
				countdownFade[1] = 1
				audio.playSound(sounds.countdown.two)
				Timer.tween(
					(60 / bpm),
					countdownFade,
					{0},
					"linear",
					function()
						countdown:animate("set")
						countdownFade[1] = 1
						audio.playSound(sounds.countdown.one)
						Timer.tween(
							(60 / bpm),
							countdownFade,
							{0},
							"linear",
							function()
								if not pixel then
									countdown:animate("go")
								else
									countdown:animate("date")
								end
								countdownFade[1] = 1
								audio.playSound(sounds.countdown.go)
								Timer.tween(
									(60 / bpm),
									countdownFade,
									{0},
									"linear",
									function()
										countingDown = false

										previousFrameTime = love.timer.getTime() * 1000
										musicTime = 0
										crochet = (60/bpm)*1000
										stepCrochet = crochet/4

										voices:setVolume(settings.vocalsVol)
										if inst then 
											inst:setVolume(settings.instVol)
											inst:play() 
										end
										voices:play()
									end
								)
							end
						)
					end
				)
			end
		)
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

					if camTimer then
						Timer.cancel(camTimer)
					end
					if zoomTimer then
						Timer.cancel(zoomTimer)
					end
					if events[i].mustHitSection then
						camTimer = Timer.tween(1.25, cam, {x = -boyfriend.x + 100, y = -boyfriend.y + 75}, "out-quad")
						zoomTimer = Timer.tween(1.25, zoom, {1}, "out-quad")
					else
						camTimer = Timer.tween(1.25, cam, {x = -enemy.x - -125, y = -enemy.y + 75}, "out-quad")
						zoomTimer = Timer.tween(1.25, zoom, {1.5}, "out-quad")
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
			boyfriend:update(dt)
			if picoSpeaker then picoSpeaker:update(dt) end
			leftArrowSplash:update(dt)
			rightArrowSplash:update(dt)
			upArrowSplash:update(dt)
			downArrowSplash:update(dt)

			if musicThres ~= oldMusicThres and math.fmod(absMusicTime, 120000 / bpm) < 100 then
				if spriteTimers[1] == 0 then
					girlfriend:animate("idle", false)
					if picoSpeaker then picoSpeaker:animate("idle", false) end
	
					girlfriend:setAnimSpeed(14.4 / (60 / bpm))
					if picoSpeaker then picoSpeaker:setAnimSpeed(14.4 / (60 / bpm)) end
				end
				if spriteTimers[2] == 0 then
					if enemy:getAnimName() == "good" then 
						if not enemy:isAnimated() then
							self:safeAnimate(enemy, "idle", false, 2)
						end
					else self:safeAnimate(enemy, "idle", false, 2) end
				end
				if spriteTimers[3] == 0 then
					
					self:safeAnimate(boyfriend, "idle", false, 3)
				end
			end

			for i = 1, 3 do
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

				for i = 1, 5 do
					local enemyArrow = enemyArrows[i]
					local boyfriendArrow = boyfriendArrows[i]
					local picoArrow = picoArrows[i]
					local enemyNote = enemyNotes[i]
					local boyfriendNote = boyfriendNotes[i]
					local picoNote = picoNotes[i]
					local curAnim = animList[i]
					local curInput = inputList[i]

					local noteNum = i

					if enemyNote then enemyArrow:update(dt) end
					boyfriendArrow:update(dt)

					if enemyArrow then
						if not enemyArrow:isAnimated() then
							enemyArrow:animate("off", false)
						end
					end
					if settings.botPlay then
						if not boyfriendArrow:isAnimated() then
							boyfriendArrow:animate("off", false)
						end
					end

					if enemyNote then
						if #enemyNote > 0 then
							if (enemyNote[1].y - musicPos <= -400) then
								voices:setVolume(1)

								enemyArrow:animate("confirm", false)

								if enemyNote[1]:getAnimName() == "hold" or enemyNote[1]:getAnimName() == "end" then
									if useAltAnims then
										if (not enemy:isAnimated()) or enemy:getAnimName() == "idle" then self:safeAnimate(enemy, curAnim .. " alt", true, 2) end
									else
										if (not enemy:isAnimated()) or enemy:getAnimName() == "idle" then self:safeAnimate(enemy, curAnim, true, 2) end
									end
								else
									if useAltAnims then
										self:safeAnimate(enemy, curAnim .. " alt", false, 2)
									else
										self:safeAnimate(enemy, curAnim, false, 2)
									end
								end

								table.remove(enemyNote, 1)
							end
						end
					end

					if #boyfriendNote > 0 then
						if not countingDown then
							if (boyfriendNote[1].y - musicPos < -500) then
								if not settings.botPlay then
									if inst then voices:setVolume(0) end

									notMissed[noteNum] = false
									if not settings.noMiss then
										if boyfriendNote[1]:getAnimName() ~= "hold" and boyfriendNote[1]:getAnimName() ~= "end" then
											health = health + 2
										end
									else
										health = 0
									end
									if boyfriendNote[1]:getAnimName() ~= "hold" and boyfriendNote[1]:getAnimName() ~= "end" then
										missCounter = missCounter + 1
									end

									table.remove(boyfriendNote, 1)

									if girlfriend:isAnimName("sad") then if combo >= 5 then self:safeAnimate(girlfriend, "sad", true, 1) end end

									hitSick = false

									combo = 0
								end
							end
						end
					end

					if picoSpeaker then 
						if #picoNote > 0 then
							if (picoNote[1].y - musicPos <= -400)then
								voices:setVolume(1)

								self:safeAnimate(picoSpeaker, curAnim, false, 2)

								table.remove(picoNote, 1)
							end
						end
					end

					if not settings.botPlay then
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

							boyfriendArrow:animate("press", false)

							if #boyfriendNote > 0 then
								for i = 1, #boyfriendNote do
									if boyfriendNote[i] and boyfriendNote[i]:getAnimName() == "on" then
										if (boyfriendNote[i].y - musicPos <= -280) then
											local notePos
											local ratingAnim

											notMissed[noteNum] = true

											notePos = math.abs(-400 - (boyfriendNote[i].y - musicPos))

											voices:setVolume(1)

											if notePos <= 28 then -- "Sick Plus" Note: Just for a cooler looking rating. Does not give anything special
                                                score = score + 350
												addJudgements("sickPlus")
                                                altScore = altScore + 100.00
                                                sicks = sicks + 1
                                                hitSick = true
                                            elseif notePos <= 78 then -- "Sick"
                                                score = score + 350
												addJudgements("sick")
                                                altScore = altScore + 100.00
                                                sicks = sicks + 1
                                                hitSick = true
                                            elseif notePos <= 98 then -- "Good"
                                                score = score + 200
												addJudgements("good")
                                                altScore = altScore + 66.66
                                                goods = goods + 1
                                                hitSick = false
                                            elseif notePos <= 108 then -- "Bad"
                                                score = score + 100
												addJudgements("bad")
                                                altScore = altScore + 33.33
                                                bads = bads + 1
                                                hitSick = false
                                            else -- "Shit"
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
												boyfriendArrow:animate("confirm", false)

												self:safeAnimate(boyfriend, curAnim, false, 3)
												doingAnim = false

												if not settings.noMiss then
													if boyfriendNote[1]:getAnimName() ~= "hold" or boyfriendNote[1]:getAnimName() ~= "end" then
														health = health - 1
													end
												else
													health = 0
												end

												health = health - 1
												if boyfriendNote[1]:getAnimName() ~= "hold" or boyfriendNote[1]:getAnimName() ~= "end" then
													noteCounter = noteCounter + 1
												end

												success = true
											end
											table.remove(boyfriendNote, i)
										else
											break
										end
									end
								end
							end

							if not success then
								if not countingDown then
									if not settings.botPlay then
										audio.playSound(sounds.miss[love.math.random(3)])

										notMissed[noteNum] = false

										if girlfriend:isAnimName("sad") then if combo >= 5 then self:safeAnimate(girlfriend, "sad", true, 1) end end

										self:safeAnimate(boyfriend, "miss " .. curAnim, false, 3)

										hitSick = false

										score = score - 10
										combo = 0
										if not settings.noMiss then
											health = health + 2
										else
											health = 0
										end
										missCounter = missCounter + 1
									end
								end
							end
						end
					end

					if not settings.botPlay then
						if notMissed[noteNum] and #boyfriendNote > 0 and input:down(curInput) and ((boyfriendNote[1].y - musicPos <= -400)) and (boyfriendNote[1]:getAnimName() == "hold" or boyfriendNote[1]:getAnimName() == "end") then
							voices:setVolume(1)

							table.remove(boyfriendNote, 1)

							boyfriendArrow:animate("confirm", false)

							if (not boyfriend:isAnimated()) or (boyfriend:getAnimName() == "idle" or boyfriend:getAnimName() == "idle2" or boyfriend:getAnimName() == "idle3") then self:safeAnimate(boyfriend, curAnim, true, 3) end

							--health = health + 1
						end

						if input:released(curInput) then
							boyfriendArrow:animate("off", false)
						end
					else
						if #boyfriendNote > 0 and ((boyfriendNote[1].y - musicPos <= -400)) then
							voices:setVolume(1)

							boyfriendArrow:animate("confirm", false)

							if boyfriendNote[1]:getAnimName() == "hold" or boyfriendNote[1]:getAnimName() == "end" then
								if (not boyfriend:isAnimated()) or (boyfriend:getAnimName() == "idle" or boyfriend:getAnimName() == "idle2" or boyfriend:getAnimName() == "idle3") then self:safeAnimate(boyfriend, curAnim, true, 2) end
							else
								self:safeAnimate(boyfriend, curAnim, false, 2)
							end

							table.remove(boyfriendNote, 1)
						end
					end
				end

				if health < 0 then
					health = 0
				elseif health < 80 and boyfriendIcon:getAnimName() == "boyfriend losing" then
					boyfriendIcon:animate("boyfriend", false)
				elseif health >= 100 then -- Game over
					health = 0
					if not settings.practiceMode then
						Gamestate.push(gameOver)
					end
				elseif health >= 80 and boyfriendIcon:getAnimName() == "boyfriend" then
					boyfriendIcon:animate("boyfriend losing", false)
				end

				enemyIcon.x = 585 - health * 10
				boyfriendIcon.x = 425 - health * 10

				if not countingDown then
					if musicThres ~= oldMusicThres and math.fmod(absMusicTime, 60000 / bpm) < 100 then
						if enemyIconTimer then Timer.cancel(enemyIconTimer) end
						if boyfriendIconTimer then Timer.cancel(boyfriendIconTimer) end

						enemyIconTimer = Timer.tween((60 / bpm) / 16, enemyIcon, {sizeX = -1.75, sizeY = 1.75, orientation = -0.15}, "out-quad", function() enemyIconTimer = Timer.tween((60 / bpm), enemyIcon, {sizeX = -1.5, sizeY = 1.5, orientation = 0}, "out-quad") end)
						boyfriendIconTimer = Timer.tween((60 / bpm) / 16, boyfriendIcon, {sizeX = 1.75, sizeY = 1.75, orientation = 0.15}, "out-quad", function() boyfriendIconTimer = Timer.tween((60 / bpm), boyfriendIcon, {sizeX = 1.5, sizeY = 1.5, orientation = 0}, "out-quad") end)
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
				love.graphics.push()
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
				
				love.graphics.pop()
				
				love.graphics.push()
					love.graphics.translate(0, -musicPos)

					for j = #enemyNotes[i], 1, -1 do
						if (enemyNotes[i][j].y - musicPos <= 560) then
							local animName = enemyNotes[i][j]:getAnimName()

							if animName == "hold" or animName == "end" then
								graphics.setColor(1, 1, 1, 0.5)
							end
							if settings.middleScroll then
								graphics.setColor(1, 1, 1, 0.5)
							end
							if pixel then
								enemyNotes[i][j]:udraw(7, enemyNotes[i][j].sizeY)
							else
								enemyNotes[i][j]:udraw(1, enemyNotes[i][j].sizeY)
							end
							graphics.setColor(1, 1, 1)
						end
					end
					for j = #boyfriendNotes[i], 1, -1 do
						if (boyfriendNotes[i][j].y - musicPos <= 560) then
							local animName = boyfriendNotes[i][j]:getAnimName()

							if animName == "hold" or animName == "end" then
								graphics.setColor(1, 1, 1, math.min(0.5, (500 + (boyfriendNotes[i][j].y - musicPos)) / 150))
							else
								graphics.setColor(1, 1, 1, math.min(1, (500 + (boyfriendNotes[i][j].y - musicPos)) / 75))
							end
							if pixel then
								boyfriendNotes[i][j]:udraw(7, boyfriendNotes[i][j].sizeY)
							else
								boyfriendNotes[i][j]:udraw(1, boyfriendNotes[i][j].sizeY)
							end
						end
					end
					graphics.setColor(1, 1, 1)
				love.graphics.pop()
			end
			for i = 1, 5 do
					if paused then 
						graphics.setColor(0.6,0.6,0.6,0.3)
					else
						graphics.setColor(1, 1, 1, 1)
					end
					if not paused then
						if not pixel then
							if not settings.downscroll then
								boyfriendArrows[i]:udraw(1, 1)
							else
								boyfriendArrows[i]:udraw(1, -1)
							end
						else
							if not settings.downscroll then
								boyfriendArrows[i]:udraw(7, 7)
							else
								boyfriendArrows[i]:udraw(7, -7)
							end
						end
					end
					if hitSick then
						if not settings.botPlay then
							if input:pressed("gameLeft") then
								if not pixel then leftArrowSplash:animate("left" .. love.math.random(1,2))
								else leftArrowSplash:animate("left") end
							elseif input:pressed("gameRight") then
								if not pixel then rightArrowSplash:animate("right" .. love.math.random(1,2))
								else rightArrowSplash:animate("right") end
							elseif input:pressed("gameUp") then
								if not pixel then upArrowSplash:animate("up" .. love.math.random(1,2))
								else upArrowSplash:animate("up") end
							elseif input:pressed("gameDown") then
								if not pixel then downArrowSplash:animate("down" .. love.math.random(1,2))
								else downArrowSplash:animate("down") end
							end
						else
							if boyfriendArrows[1]:getAnimName() == "confirm" then
								if wasReleased1 then
									leftArrowSplash:animate("left" .. love.math.random(1,2))
									wasReleased1 = false
								end
							end
							if boyfriendArrows[2]:getAnimName() == "confirm" then
								if wasReleased2 then
									downArrowSplash:animate("down" .. love.math.random(1,2))
									wasReleased2 = false
								end
							end
							if boyfriendArrows[3]:getAnimName() == "confirm" then
								if wasReleased3 then
									upArrowSplash:animate("up" .. love.math.random(1,2))
									wasReleased3 = false
								end
							end
							if boyfriendArrows[4]:getAnimName() == "confirm" then
								if wasReleased4 then
									rightArrowSplash:animate("right" .. love.math.random(1,2))
									wasReleased4 = false
								end
							end
						end
					end
					if settings.botPlay and not pixel then
						if boyfriendArrows[1]:getAnimName() ~= "confirm" then
							wasReleased1 = true
						end
						if boyfriendArrows[2]:getAnimName() ~= "confirm" then
							wasReleased2 = true
						end
						if boyfriendArrows[3]:getAnimName() ~= "confirm" then
							wasReleased3 = true
						end
						if boyfriendArrows[4]:getAnimName() ~= "confirm" then
							wasReleased4 = true
						end
					end
					love.graphics.push()
						if not paused then
							if not pixel then
								if leftArrowSplash:isAnimated() then
									leftArrowSplash:draw()
								end
								if rightArrowSplash:isAnimated() then
									rightArrowSplash:draw()
								end
								if upArrowSplash:isAnimated() then
									upArrowSplash:draw()
								end
								if downArrowSplash:isAnimated() then
									downArrowSplash:draw()
								end
							else
								if leftArrowSplash:isAnimated() then
									leftArrowSplash:udraw()
								end
								if rightArrowSplash:isAnimated() then
									rightArrowSplash:udraw()
								end
								if upArrowSplash:isAnimated() then
									upArrowSplash:udraw()
								end
								if downArrowSplash:isAnimated() then
									downArrowSplash:udraw()
								end
							end
						end
					love.graphics.pop()
					love.graphics.push()
					love.graphics.translate(0, -musicPos)

					for j = #boyfriendNotes[i], 1, -1 do
						if (boyfriendNotes[i][j].y - musicPos <= 560) then
							local animName = boyfriendNotes[i][j]:getAnimName()

							if animName == "hold" or animName == "end" then
								graphics.setColor(1, 1, 1, math.min(0.5, (500 + (boyfriendNotes[i][j].y - musicPos)) / 150))
							else
								graphics.setColor(1, 1, 1, math.min(1, (500 + (boyfriendNotes[i][j].y - musicPos)) / 75))
							end
							if pixel then
								boyfriendNotes[i][j]:udraw(7, boyfriendNotes[i][j].sizeY)
							else
								boyfriendNotes[i][j]:udraw(1, boyfriendNotes[i][j].sizeY)
							end
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
	drawHealthBar = function()
		love.graphics.push()
			-- Scroll underlay
			love.graphics.push()
				graphics.setColor(0,0,0,settings.scrollUnderlayTrans)
				if settings.middleScroll then
					love.graphics.rectangle("fill", 400, -100, 90 + 170 * 2.35, 1000)
				else
					love.graphics.rectangle("fill", 755, -100, 90 + 170 * 2.35, 1000)
				end
				graphics.setColor(1,1,1,1)
			love.graphics.pop()
			love.graphics.translate(lovesize.getWidth() / 2, lovesize.getHeight() / 2)
			love.graphics.scale(0.7, 0.7)
			love.graphics.scale(uiScale.sizeX, uiScale.sizeY)
			graphics.setColor(healthBarColorPlayer[1]/255, healthBarColorPlayer[2]/255, healthBarColorPlayer[3]/255)
			love.graphics.rectangle("fill", -500, 350+downscrollOffset, 1000, 25)
			graphics.setColor(healthBarColorEnemy[1]/255, healthBarColorEnemy[2]/255, healthBarColorEnemy[3]/255)
			love.graphics.rectangle("fill", 500, 350+downscrollOffset, -health * 10, 25)
			graphics.setColor(0, 0, 0)
			love.graphics.setLineWidth(10)
			love.graphics.rectangle("line", -500, 350+downscrollOffset, 1000, 25)
			love.graphics.setLineWidth(1)
			graphics.setColor(1, 1, 1)

			enemyIcon:draw()
			boyfriendIcon:draw()
			graphics.setColor(uiTextColour[1],uiTextColour[2],uiTextColour[3])
			accForRatingText = (altScore / (noteCounter + missCounter))
			if accForRatingText >= 101 then
				ratingText = "what"
			elseif accForRatingText >= 100 then
				ratingText = "PERFECT!!!"
			elseif accForRatingText >= 90 then
				ratingText = "Great!"
			elseif accForRatingText >= 70 then
				ratingText = "Good!"
			elseif accForRatingText >= 69 then
				ratingText = "Nice!"
			elseif accForRatingText >= 60 then
				ratingText = "Okay"
			elseif accForRatingText >= 50 then
				ratingText = "Meh..."
			elseif accForRatingText >= 40 then
				ratingText = "Could be better..."
			elseif accForRatingText >= 30 then
				ratingText = "It's an issue of skill."
			elseif accForRatingText >= 20 then
				ratingText = "Bad."
			elseif accForRatingText >= 10 then
				ratingText = "How."
			elseif accForRatingText >= 0 then
				ratingText = "Bruh."
			end -- Marvellous 
			if not settings.botPlay then
				if noteCounter + missCounter <= 0 then
					if (math.floor((altScore / (noteCounter + missCounter)) / 3.5)) >= 100 then
						uitextf("Score: " .. score .. " | Misses: " .. missCounter .. " | Accuracy: 0% | Rating: ???", -600, 400+downscrollOffset, 1200, "center")
					else
						uitextf("Score: " .. score .. " | Misses: " .. missCounter .. " | Accuracy: 0% | Rating: ???", -600, 400+downscrollOffset, 1200, "center")
					end
				else
					if (math.floor((altScore / (noteCounter + missCounter)) / 3.5)) >= 100 then
						uitextf("Score: " .. score .. " | Misses: " .. missCounter .. " | Accuracy: 100% | Rating: PERFECT!!!", -600, 400+downscrollOffset, 1200, "center")
					else
						uitextf("Score: " .. score .. " | Misses: " .. missCounter .. " | Accuracy: " .. convertedAcc .. " | Rating: " .. ratingText, -600, 400+downscrollOffset, 1200, "center")
					end
				end

				if settings.sideJudgements then
					uitextf(
						"Sicks: " .. sicks ..
						"\n\nGoods: " .. goods ..
						"\n\nBads: " .. bads ..
						"\n\nShits: " .. shits ..
						"\n\nTotal: " .. (sicks + goods + bads + shits),
						-900,
						0, 
						750, -- annoying limit and i don't want to test if it works with nil 
						"left"
					)
				end
			end
		love.graphics.pop()
		if settings.keystrokes then
			love.graphics.push()
				love.graphics.scale(uiScale.sizeX, uiScale.sizeY)
				-- keystrokes
				graphics.setColor(1, 1, 1)

				if input:down("gameUp") then
					love.graphics.rectangle("fill", 131, 631, 30, 30) 
				end
				
				if input:down("gameDown") then
					love.graphics.rectangle("fill", 100, 631, 30, 30)
				end
				
				if input:down("gameRight") then
					love.graphics.rectangle("fill", 162, 631, 30, 30)
				end
								
				if input:down("gameLeft") then
					love.graphics.rectangle("fill", 69, 631, 30, 30)
				end
				if input:down("spare") then
					love.graphics.rectangle("fill", 69, 661, 120, 30)
				end
				
				graphics.setColor(0, 0, 0)

				love.graphics.rectangle("line", 69, 631, 30, 30) -- left
				love.graphics.rectangle("line", 100, 631, 30, 30) -- down
				love.graphics.rectangle("line", 131, 631, 30, 30) -- up
				love.graphics.rectangle("line", 162, 631, 30, 30) -- right
				love.graphics.rectangle("line", 69, 661, 120, 30) -- spare

				love.graphics.color.printf(customBindLeft, 74, 626, 20, "left", nil, 1.5, 1.5, 255, 255, 255)  -- left
				love.graphics.color.printf(customBindDown, 105, 626, 20, "left", nil, 1.5, 1.5, 255, 255, 255)  -- down
				love.graphics.color.printf(customBindUp, 136, 626, 20, "left", nil, 1.5, 1.5, 255, 255, 255)  -- up
				love.graphics.color.printf(customBindRight, 167, 626, 20, "left", nil, 1.5, 1.5, 255, 255, 255)  -- right

				graphics.setColor(1, 1, 1)
			love.graphics.pop()
		end
		love.graphics.push()
			love.graphics.setFont(pauseFont)
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
			if paused then
				graphics.setColorF(pauseColor[1], pauseColor[2], pauseColor[3])
				if week == 5 then
					love.graphics.translate(lovesize.getWidth() / 2, lovesize.getHeight() / 2)
					love.graphics.scale(0.7, 0.7)
					love.graphics.scale(uiScale.sizeX, uiScale.sizeY)
				end
				graphics.setColor(0, 0, 0, 0.8)
				love.graphics.rectangle("fill", -10000, -2000, 25000, 10000)
				graphics.setColor(1, 1, 1)
				pauseShadow:draw()
				pauseBG:draw()
				if pauseMenuSelection ~= 1 then
					uitextflarge("Resume", -305, -275, 600, "center", false)
				else
					uitextflarge("Resume", -305, -275, 600, "center", true)
				end
				if pauseMenuSelection ~= 2 then
					uitextflarge("Restart", -305, -75, 600, "center", false)
					--  -600, 400+downscrollOffset, 1200, "center"
				else
					uitextflarge("Restart", -305, -75, 600, "center", true)
				end
				if pauseMenuSelection ~= 3 then
					uitextflarge("Quit", -305, 125, 600, "center", false)
				else
					uitextflarge("Quit", -305, 125, 600, "center", true)
				end
			end
			love.graphics.setFont(font)
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

		fakeBoyfriend = nil
		died = false
		modFolderMod = false
		pixel = false
	end
}
