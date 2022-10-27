--[[----------------------------------------------------------------------------
Friday Night Funkin' Rewritten v1.1.0 beta 2

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


if love.filesystem.isFused() and love.system.getOS() == "Windows" then
	useDiscordRPC = true -- Set this to false if you don't want to use Discord RPC
	discordRPC = require "lib.discordRPC"
	appId = "924059160054755348"
end
love.graphics.color = {
	print = function(text,x,y,r,sx,sy,R,G,B,A,ox,oy,kx,ky)
		graphics.setColorF(R or 255,G or 255,B or 255,A or 1)
		love.graphics.print(text or "",x or 0,y or 0,r or 0,sx or 1,sy or 1,a or 0,ox or 0,oy or 0,kx or 0,ky or 0)
		love.graphics.setColorF(255,255,255,1)
	end,
	printf = function(text,x,y,limit,align,r,sx,sy,R,G,B,A,ox,oy,kx,ky)
		graphics.setColorF(R or 255,G or 255,B or 255,A or 1)
		love.graphics.printf(text or "",x or 0,y or 0,limit or 0,align or 0,r or 0,sx or 1,sy or 1,ox or 0,oy or 0,kx or 0,ky or 0)
		love.graphics.setColorF(255,255,255,1)
	end
}
function uitextf(text,x,y,limit,align,r,sx,sy,ox,oy,kx,ky)
	local x = x or 0
	local y = y or 0
	local r = r or 0
	local limit = limit or 750
	local align = align or "left"
	local sx = sx or 1
	local sy = sy or 1
	local ox = ox or 0
	local oy = oy or 0
	local kx = kx or 0
	local ky = ky or 0
	graphics.setColor(0,0,0)
	love.graphics.printf(text,x-2,y,limit,align,r,sx,sy,ox,oy,kx,ky)
	love.graphics.printf(text,x+2,y,limit,align,r,sx,sy,ox,oy,kx,ky)
	love.graphics.printf(text,x,y-2,limit,align,r,sx,sy,ox,oy,kx,ky)
	love.graphics.printf(text,x,y+2,limit,align,r,sx,sy,ox,oy,kx,ky)
	graphics.setColor(1,1,1)
    love.graphics.printf(text,x,y,limit,align,r,sx,sy,ox,oy,kx,ky)
end
function uitext(text,x,y,r,sx,sy,ox,oy,kx,ky)
	local x = x or 0
	local y = y or 0
	local r = r or 0
	local sx = sx or 1
	local sy = sy or 1
	local ox = ox or 0
	local oy = oy or 0
	local kx = kx or 0
	local ky = ky or 0
	graphics.setColor(0,0,0)
	love.graphics.print(text,x-2,y,r,sx,sy,a,ox,oy,kx,ky)
	love.graphics.print(text,x+2,y,r,sx,sy,a,ox,oy,kx,ky)
	love.graphics.print(text,x,y-2,r,sx,sy,a,ox,oy,kx,ky)
	love.graphics.print(text,x,y+2,r,sx,sy,a,ox,oy,kx,ky)
	graphics.setColor(1,1,1)
    love.graphics.print(text,x,y,r,sx,sy,a,ox,oy,kx,ky)
end
function uitextflarge(text,x,y,limit,align,hovered,r,sx,sy,ox,oy,kx,ky)
	local x = x or 0
	local y = y or 0
	local r = r or 0
	local limit = limit or 750
	local align = align or "center"
	local hovered = hovered or false
	local sx = sx or 1
	local sy = sy or 1
	local ox = ox or 0
	local oy = oy or 0
	local kx = kx or 0
	local ky = ky or 0
	if not hovered then graphics.setColor(0,0,0) else graphics.setColor(1,1,1) end
	love.graphics.printf(text,x-6,y,limit,align,r,sx,sy,ox,oy,kx,ky)
	love.graphics.printf(text,x+6,y,limit,align,r,sx,sy,ox,oy,kx,ky)
	love.graphics.printf(text,x,y-6,limit,align,r,sx,sy,ox,oy,kx,ky)
	love.graphics.printf(text,x,y+6,limit,align,r,sx,sy,ox,oy,kx,ky)
	if not hovered then graphics.setColor(1,1,1) else graphics.setColor(0,0,0) end
	love.graphics.printf(text,x,y,limit,align,r,sx,sy,ox,oy,kx,ky)
end
volFade = 0

function love.load()
	local curOS = love.system.getOS()

	local selectSound = love.audio.newSource("sounds/menu/select.ogg", "static")
	local confirmSound = love.audio.newSource("sounds/menu/confirm.ogg", "static")

	__VERSION__ = love.filesystem.read("version.txt") or "UNKNOWN"


	wavyBGShader = love.graphics.newShader("shaders/wavyBG.frag")
	greenColours = {
		{8/255,56/255,8/255},
		{48/255,96/255,48/255},
		{136/255,168/255,8/255},
		{183/255,220/255,17/255}
	}
	grayscaleShader = love.graphics.newShader("shaders/grayscale.frag")
	gameboyShader = love.graphics.newShader("shaders/gameboy.frag")
	--gameboyShader:send("COLOR_MASKS", greenColours[1], greenColours[2], greenColours[3], greenColours[4])
	--glitchEffectShader = love.graphics.newShader("shaders/glitchMoment.frag") -- goofy shader i made that just warps the images 💀 - Don't use this, ill just make split rgb shader
	sonicBlurShader = love.graphics.newShader(
		[[
			extern number strength = 1.0;
			extern number radius = 1.0;

			vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords)
			{
				vec4 pixel = Texel(texture, texture_coords); //This is the current pixel color
				number average = (pixel.r + pixel.g + pixel.b) / 3.0;
				number r = 0.0;
				number g = 0.0;
				number b = 0.0;
				number total = 0.0;
				number distance = 0.0;
				number weight = 0.0;
				number offset = 0.0;
				number radius = 1.0;

				for (offset = -radius; offset <= radius; offset += 1.0)
				{
					distance = abs(offset);
					weight = 1.0 - (distance / radius);
					pixel = Texel(texture, texture_coords + vec2(offset, 0.0) / love_ScreenSize.xy);
					r += pixel.r * weight;
					g += pixel.g * weight;
					b += pixel.b * weight;
					total += weight;
				}

				pixel.r = r / total;
				pixel.g = g / total;
				pixel.b = b / total;

				return pixel * color;
			}
		]]
	)

	-- Load libraries
	baton = require "lib.baton"
	ini = require "lib.ini"
	lovesize = require "lib.lovesize"
	Gamestate = require "lib.gamestate"
	Timer = require "lib.timer"
	lume = require "lib.lume"
	lovebpm = require "lib.lovebpm"

	highscores = {
		[0] = {scores = {0, 0, 0}, accuracys = {0, 0, 0}},             -- Tutorial
		[1] = {scores = {0, 0, 0}, accuracys = {0, 0, 0}}, -- Week 1
		[2] = {scores = {0, 0, 0}, accuracys = {0, 0, 0}}, -- Week 2
		[3] = {scores = {0, 0, 0}, accuracys = {0, 0, 0}}, -- Week 3
		[4] = {scores = {0, 0, 0}, accuracys = {0, 0, 0}}, -- Week 4
		[5] = {scores = {0, 0, 0}, accuracys = {0, 0, 0}}, -- Week 5
		[6] = {scores = {0, 0, 0}, accuracys = {0, 0, 0}}, -- Week 6
		[7] = {scores = {0, 0, 0}, accuracys = {0, 0, 0}}, -- Week 7
		version = 1
	}

	music = {
		lovebpm.newTrack(),
		--love.audio.newSource("songs/misc/menu.ogg", "stream"),
		vol = 1
	}

	died = false

	music[1]:load("songs/misc/menu.ogg"):setBPM(102):setVolume(music.vol):setLooping(true)
	--music[1]:setVolume(music.vol)
	-- Load modules
	status = require "modules.status"
	audio = require "modules.audio"
	graphics = require "modules.graphics"

	spongebirth = love.graphics.newImage(graphics.imagePath("spongebirth"))
	
	-- Load settings
	settings = require "settings"

	-- Load states
	clickStart = require "states.click-start"

	debugMenu = require "states.debug.debugMenu"
	spriteDebug = require "states.debug.sprite-debug"
	stageDebug = require "states.debug.stage-debug"

	-- Load stages
	stages = {
		["stage"] = require "stages.stage",
		["hauntedHouse"] = require "stages.hauntedHouse",
		["city"] = require "stages.city",
		["sunset"] = require "stages.sunset",
		["mall"] = require "stages.mall",
		["school"] = require "stages.school",
		["tank"] = require "stages.tank",
		["balls"] = require "stages.balls"
	}

	mods = {
		weekMeta = {},
		modNames = {},
		WeekData = {}
	}
	modloader = require "modules.modloader"
	modloader.load()

	-- Load menus
	menu = require "states.menu.menu"
	menuWeek = require "states.menu.menuWeek"
	menuSelect = require "states.menu.menuSelect"
	menuFreeplay = require "states.menu.menuFreeplay"
	menuChooseFreeplay = require "states.menu.menuChooseFreeplay"
	menuSettings = require "states.menu.menuSettings"
	menuCredits = require "states.menu.menuCredits"

	wowpokemon = require "states.wowpokemon"

	-- Load weeks
	weeks = require "states.weeks.weeks"
	dtWeek = require "states.weeks.dtWeek"
	weeksPur = require "states.weeks.weeksPur"
	weeksMono = require "states.weeks.weeksMono"
	weeksMissingno = require "states.weeks.missingno"
	weeksBrim = require "states.weeks.weeksBrim"

	-- Load substates
	gameOver = require "substates.game-over"
	settingsKeybinds = require "substates.settings-keybinds"

	uiTextColour = {1,1,1} -- Set a custom UI colour (Put it in the weeks file to change it for only that week)
	-- When adding custom colour for the health bar. Make sure to use 255 RGB values. It will automatically convert it for you.
	healthBarColorPlayer = {49,176,209} -- BF's icon colour
	healthBarColorEnemy = {165,0,77} -- GF's icon colour
	pauseColor = {0,0,0} -- Pause screen colour
	theBalls = {width = 1 * 160}

	function setDialogue(strList)
		dialogueList = strList
		curDialogue = 1
		timer = 0
		progress = 1
		output = ""
		isDone = false
	end

	function volumeControl()
		-- Guglios's volume control stuff
		-- (Some is ch's though)
		love.graphics.setColor(1, 1, 1, volFade)
		fixVol = tonumber(string.format(
			"%.1f  ",
			(love.audio.getVolume())
		))
		love.graphics.setColor(0.5, 0.5, 0.5, volFade - 0.3)

		love.graphics.rectangle("fill", 1110, 0, 170, 50)

		love.graphics.setColor(1, 1, 1, volFade)

		if volTween then Timer.cancel(volTween) end
		volTween = Timer.tween(
			0.2, 
			theBalls, 
			{width = fixVol * 160}, 
			"out-quad"
		)
		love.graphics.rectangle("fill", 1113, 10, theBalls.width, 30)
		graphics.setColor(1, 1, 1, 1)
	end

	function saveHighscores()
		local file = love.filesystem.newFile("highscores")
		file:open("w")
		file:write(lume.serialize({highscores = highscores}))
		file:close()
	end

	-- Load week data
	weekData = {
		require "weeks.hypno",
		require "weeks.purin",
		require "weeks.deathtoll",
		require "weeks.monochrome",
		require "weeks.missingno",
		require "weeks.brimstone"
	}
	missingnonoway = require "weeks.missingno"
	weekDesc = { -- Add your week description here
		"LEARN TO FUNK",
		"DADDY DEAREST",
		"SPOOKY MONTH",
		"PICO",
		"MOMMY MUST MURDER",
		"RED SNOW",
		"HATING SIMULATOR FT. MOAWLING",
		"TANKMAN"
	}
	weekMeta = { -- Add/remove weeks here
		{
			"Hypno",
			{
				"Safety Lullaby",
				"Left Unchecked",
				"Lost Cause"
			}
		},
		{
			"Purin",
			{
				"Purin"
			}
		},
		{
			"Death Toll",
			{
				"Death Toll"
			}
		},
		{
			"Monochrome",
			{
				"Monochrome"
			}
		},
		{
			"Missingno",
			{
				"Missingno"
			}
		},
		{
			"Brimstone",
			{
				"Brimstone"
			}
		},
		{
			"Week 6",
			{
				"Senpai",
				"Roses",
				"Thorns"
			},
		},
		{
			"Week 7",
			{
				"Ugh",
				"Guns",
				"Stress"
			}
		}
	}

	noteskins = {
		"arrows",
		"circles"
	}

	if love.filesystem.getInfo("highscores") then
		local file = love.filesystem.read("highscores")
		local data = lume.deserialize(file)
		
		for i = 0, #data.highscores do
			for j = 1, #data.highscores[i].scores do
				highscores[i].scores[j] = data.highscores[i].scores[j]
			end
			for j = 1, #data.highscores[i].accuracys do
				highscores[i].accuracys[j] = data.highscores[i].accuracys[j]
			end
		end
	else
		local file = love.filesystem.newFile("highscores")
		file:open("w")
		file:write(lume.serialize({highscores = highscores}))
		file:close()
	end
	-- You don't need to mess with this unless you are adding a custom setting (Will nil be default (AKA. False)) --
	if love.filesystem.getInfo("settings") then 
		settingdata = love.filesystem.read("settings")
        settingdata = lume.deserialize(settingdata)

		settings.hardwareCompression = settingdata.saveSettingsMoment.hardwareCompression
		settings.downscroll = settingdata.saveSettingsMoment.downscroll
		settings.ghostTapping = settingdata.saveSettingsMoment.ghostTapping
		settings.showDebug = settingdata.saveSettingsMoment.showDebug
		graphics.setImageType(settingdata.saveSettingsMoment.setImageType)
		settings.sideJudgements = settingdata.saveSettingsMoment.sideJudgements
		settings.botPlay = settingdata.saveSettingsMoment.botPlay
		settings.middleScroll = settingdata.saveSettingsMoment.middleScroll
		settings.randomNotePlacements = settingdata.saveSettingsMoment.randomNotePlacements
		settings.practiceMode = settingdata.saveSettingsMoment.practiceMode
		settings.noMiss = settingdata.saveSettingsMoment.noMiss
		settings.customScrollSpeed = settingdata.saveSettingsMoment.customScrollSpeed
		settings.keystrokes = settingdata.saveSettingsMoment.keystrokes
		settings.scrollUnderlayTrans = settingdata.saveSettingsMoment.scrollUnderlayTrans
		settings.instVol = settingdata.saveSettingsMoment.instVol
		settings.vocalsVol = settingdata.saveSettingsMoment.vocalsVol
		settings.Hitsounds = settingdata.saveSettingsMoment.Hitsounds
		settings.hitsoundVol = settingdata.saveSettingsMoment.hitsoundVol
		settings.noteSkins = settingdata.saveSettingsMoment.noteSkins
		customBindDown = settingdata.saveSettingsMoment.customBindDown
		customBindUp = settingdata.saveSettingsMoment.customBindUp
		customBindLeft = settingdata.saveSettingsMoment.customBindLeft
		customBindRight = settingdata.saveSettingsMoment.customBindRight
		settings.flashinglights = settingdata.saveSettingsMoment.flashinglights

		settingsVer = settingdata.saveSettingsMoment.settingsVer

		settingdata.saveSettingsMoment = {
			hardwareCompression = settings.hardwareCompression,
			downscroll = settings.downscroll,
			ghostTapping = settings.ghostTapping,
			showDebug = settings.showDebug,
			setImageType = "dds",
			sideJudgements = settings.sideJudgements,
			botPlay = settings.botPlay,
			middleScroll = settings.middleScroll,
			randomNotePlacements = settings.randomNotePlacements,
			practiceMode = settings.practiceMode,
			noMiss = settings.noMiss,
			customScrollSpeed = settings.customScrollSpeed,
			keystrokes = settings.keystrokes,
			scrollUnderlayTrans = settings.scrollUnderlayTrans,
			Hitsounds = settings.Hitsounds,
			instVol = settings.instVol,
			vocalsVol = settings.vocalsVol,
			hitsoundVol = settings.hitsoundVol,
			noteSkins = settings.noteSkins,
			customBindDown = customBindDown,
			customBindUp = customBindUp,
			customBindLeft = customBindLeft,
			customBindRight = customBindRight,
			flashinglights = settings.flashinglights,
			settingsVer = settingsVer
		}
		serialized = lume.serialize(settingdata)
		love.filesystem.write("settings", serialized)
	end
	if settingsVer ~= 6 then
		love.window.showMessageBox("Uh Oh!", "Settings have been reset.", "warning")
		love.filesystem.remove("settings")
	end
	if not love.filesystem.getInfo("settings") or settingsVer ~= 6 then
		settings.hardwareCompression = true
		graphics.setImageType("dds")
		settings.downscroll = false
		settings.middleScroll = false
		settings.ghostTapping = false
		settings.showDebug = false
		settings.sideJudgements = false
		settings.botPlay = false
		settings.randomNotePlacements = false
		settings.practiceMode = false
		settings.noMiss = false
		settings.customScrollSpeed = 1
		settings.keystrokes = false
		settings.scrollUnderlayTrans = 0
		settings.Hitsounds = false
		settings.instVol = 1
		settings.vocalsVol = 1
		settings.hitsoundVol = 1
		settings.noteSkins = 1
		customBindLeft = "a"
		customBindRight = "d"
		customBindUp = "w"
		customBindDown = "s"
		settings.flashinglights = false
		settingsVer = 6
		settingdata = {}
		settingdata.saveSettingsMoment = {
			hardwareCompression = settings.hardwareCompression,
			downscroll = settings.downscroll,
			ghostTapping = settings.ghostTapping,
			showDebug = settings.showDebug,
			setImageType = "dds",
			sideJudgements = settings.sideJudgements,
			botPlay = settings.botPlay,
			middleScroll = settings.middleScroll,
			randomNotePlacements = settings.randomNotePlacements,
			practiceMode = settings.practiceMode,
			noMiss = settings.noMiss,
			customScrollSpeed = settings.customScrollSpeed,
			keystrokes = settings.keystrokes,
			scrollUnderlayTrans = settings.scrollUnderlayTrans,
			instVol = settings.instVol,
			vocalsVol = settings.vocalsVol,
			Hitsounds = settings.Hitsounds,
			hitsoundVol = settings.hitsoundVol,
			noteSkins = settings.noteSkins,
			customBindLeft = customBindLeft,
			customBindRight = customBindRight,
			customBindUp = customBindUp,
			customBindDown = customBindDown,
			flashinglights = settings.flashinglights,
			
			settingsVer = settingsVer
		}
		serialized = lume.serialize(settingdata)
		love.filesystem.write("settings", serialized)
	end
	input = require "input" -- LOAD INPUT HERE CUZ GOOFY AHH KEYBINDS MENU

	-----------------------------------------------------------------------------------------

	-- LÖVE init
	if curOS == "OS X" then
		love.window.setIcon(love.image.newImageData("icons/macos.png"))
	else
		love.window.setIcon(love.image.newImageData("icons/default.png"))
	end

	lovesize.set(1280, 720)

	-- Variables
	font = love.graphics.newFont("fonts/vcr.ttf", 24)
	FNFFont = love.graphics.newFont("fonts/fnFont.ttf", 24)
	credFont = love.graphics.newFont("fonts/fnFont.ttf", 32)   -- guglio is a bitch
	uiFont = love.graphics.newFont("fonts/Dosis-SemiBold.ttf", 32)
	pauseFont = love.graphics.newFont("fonts/Dosis-SemiBold.ttf", 96)
	weekFont = love.graphics.newFont("fonts/Dosis-SemiBold.ttf", 84)
	weekFontSmall = love.graphics.newFont("fonts/Dosis-SemiBold.ttf", 54)
	unownFont = love.graphics.newImageFont("images/png/unowns.png", " ABCDEFGHIJKLMNOPQRSTUVWXYZ!?")

	weekNum = 1
	songDifficulty = 2

	spriteTimers = {
		0, -- Girlfriend
		0, -- Enemy
		0 -- Boyfriend
	}

	storyMode = false
	countingDown = false

	cam = {x = 0, y = 0, sizeX = 0.9, sizeY = 0.9}
	camEx = {x = 0, y = 0}
	camScale = {x = 0.9, y = 0.9}
	camZoom = {sizeX = 1, sizeY = 1}
	uiScale = {x = 1, y = 1, sizeX = 1, sizeY = 1}
	extraCamZoom = {sizeX = 1, sizeY = 1}
	flash = {alpha = 0}
	menuDetails = {
		titleBG = {x = 0,y = 0,sizeX = 1,sizeY = 1},
		titleLogo = {x = 0,y = 0,sizeX = 1,sizeY = 1},
		girlfriendTitle = {x = 0,y = 0,sizeX = 1,sizeY = 1},
		selectBG = {x = 0,y = 0,sizeX = 1,sizeY = 1},
		selectBGOverlay = {x = 0,y = 0,sizeX = 1,sizeY = 1},
		selectUIElements = {x = 0,y = 0,sizeX = 1,sizeY = 1}
	}

	musicTime = 0
	health = 0
	if useDiscordRPC then 
		discordRPC.initialize(appId, true)
		local now = os.time(os.date("*t"))
		presence = {
			state = "Press Enter",
			details = "In the menu",
			largeImageKey = "logo",
			startTimestamp = now,
		}
		nextPresenceUpdate = 0
	end

	if curOS == "Web" then
		Gamestate.switch(clickStart)
	else
		status.setLoading(true)
                songAppend = "hard"
                songNum = 1
                storyMode = false
                --overworldMusic:stop()
                Gamestate.switch(menu)
                status.setLoading(false)
	end
end
function love.graphics.setColorF(R,G,B,A)
	local R, G, B = R/255 or 1, G/255 or 1, B/255 or 1 -- convert 255 values to work with the setColor
	graphics.setColor(R,G,B,A or 1) -- Alpha is not converted because using 255 alpha can be strange (I much rather 0-1 values lol)
end
if useDiscordRPC then
	function discordRPC.ready(userId, username, discriminator, avatar)
		print(string.format("Discord: ready (%s, %s, %s, %s)", userId, username, discriminator, avatar))
	end

	function discordRPC.disconnected(errorCode, message)
		print(string.format("Discord: disconnected (%d: %s)", errorCode, message))
	end

	function discordRPC.errored(errorCode, message)
		print(string.format("Discord: error (%d: %s)", errorCode, message))
	end
end

function love.resize(width, height)
	lovesize.resize(width, height)
end

function love.keypressed(key)
	if key == "6" then
		love.filesystem.createDirectory("screenshots")

		love.graphics.captureScreenshot("screenshots/" .. os.time() .. ".png")
	elseif key == "7" then
		Gamestate.switch(debugMenu)
	elseif key == "0" then
		volFade = 1
		if fixVol == 0 then
			love.audio.setVolume(lastAudioVolume)
		else
			lastAudioVolume = love.audio.getVolume()
			love.audio.setVolume(0)
		end
	elseif key == "-" then
		volFade = 1
		if fixVol > 0 then
			love.audio.setVolume(love.audio.getVolume() - 0.1)
		end
	elseif key == "=" then
		volFade = 1
		if fixVol <= 0.9 then
			love.audio.setVolume(love.audio.getVolume() + 0.1)
		end
	elseif key == "f11" then
		fullscreen = not fullscreen
		love.window.setFullscreen(fullscreen, fstype)
		love.resize(love.graphics.getDimensions())
	else
		Gamestate.keypressed(key)
	end
end

function love.textinput(text)
	Gamestate.textinput(text)
end

function love.mousepressed(x, y, button, istouch, presses)
	Gamestate.mousepressed(x, y, button, istouch, presses)
end

function love.update(dt)
	dt = math.min(dt, 1 / 30)

	delta = love.timer.getDelta()

	if volFade > 0 then
		volFade = volFade - 0.4 * delta
	end

	music[1]:update()
	music[1]:setVolume(music.vol)

	input:update()

	if status.getNoResize() then
		Gamestate.update(dt)
	else
		love.graphics.setFont(font)
		graphics.screenBase(lovesize.getWidth(), lovesize.getHeight())
		graphics.setColor(1, 1, 1) -- Fade effect on
		Gamestate.update(dt)
		love.graphics.setColor(1, 1, 1) -- Fade effect off
		graphics.screenBase(love.graphics.getWidth(), love.graphics.getHeight())
		love.graphics.setFont(font)
	end
	if useDiscordRPC then
		if nextPresenceUpdate < love.timer.getTime() then
			discordRPC.updatePresence(presence)
			nextPresenceUpdate = love.timer.getTime() + 2.0
		end
		discordRPC.runCallbacks()
	end

	Timer.update(dt)
end

function love.draw()
	love.graphics.setFont(font)
	if Gamestate.current() == menu then love.graphics.draw(spongebirth, 0, 0) end
	graphics.screenBase(lovesize.getWidth(), lovesize.getHeight())
	lovesize.begin()
		graphics.setColor(1, 1, 1) -- Fade effect on
		Gamestate.draw()
		love.graphics.setColor(1, 1, 1) -- Fade effect off
		
		love.graphics.setFont(font)

		if status.getLoading() then
			love.graphics.print("Loading...", lovesize.getWidth() - 175, lovesize.getHeight() - 50)
		end
		volumeControl()
		
		
	lovesize.finish()
	
	graphics.screenBase(love.graphics.getWidth(), love.graphics.getHeight())

	-- Debug output
	if settings.showDebug then
		love.graphics.print(status.getDebugStr(settings.showDebug), 5, 5, nil, 0.5, 0.5)
	end
end
function love.quit()
	if useDiscordRPC then
		discordRPC.shutdown()
	end
end

--the funny test push 

-- god i love cock so much

-- especially when its really fucking hot cock

-- i love cock in my mouth

-- if you dont agree then you are not normal

-- fried chicken is good
