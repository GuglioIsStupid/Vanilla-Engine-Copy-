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

local leftFunc, rightFunc, confirmFunc, backFunc, drawFunc

local menuState

local menuNum = 1

local songNum, songAppend
local songDifficulty = 2
local pressedUp = 0

local menuNames = {
	"Story Mode",
	"Freeplay",
	"Options"
}

local difficultyStrs = {
	"easy",
	"normal",
	"hard"
}

local selectSound = love.audio.newSource("sounds/menu/select.ogg", "static")
local confirmSound = love.audio.newSource("sounds/menu/confirm.ogg", "static")

local function switchMenu(menu)
	function upFunc()
		if pressedUp ~= 10 then
			pressedUp = pressedUp + 1
		else
			pressedUp = 0
		end
	end
	if menu == 4 then
		love.window.showMessageBox("lol", "Not implemented yet :P")

		return switchMenu(1)
	elseif menu == 3 then
		
	elseif menu == 2 then
		function leftFunc()
			if menuState == 3 then
				songDifficulty = (songDifficulty > 1) and songDifficulty - 1 or 3
			elseif menuState == 2 then
				songNum = (songNum > 1) and songNum - 1 or #mods.weekMeta[modWeekNum][2]
			else
				modWeekNum = (modWeekNum > 1) and modWeekNum - 1 or #mods.weekMeta
			end
		end
		function rightFunc()
			if menuState == 3 then
				songDifficulty = (songDifficulty < 3) and songDifficulty + 1 or 1
			elseif menuState == 2 then
				songNum = (songNum < #mods.weekMeta[modWeekNum][2]) and songNum + 1 or 1
			else
				modWeekNum = (modWeekNum < #mods.weekMeta) and modWeekNum + 1 or 1
			end
		end
		function confirmFunc()
			if pressedUp ~= 10 then
				if menuState == 3 then

					status.setLoading(true)

					graphics.fadeOut(
						0.5,
						function()
							songAppend = difficultyStrs[songDifficulty]

							storyMode = false
							modFolderMod = true

							music[1]:stop()

							Gamestate.switch(mods.WeekData[modWeekNum], songNum, songAppend)

							status.setLoading(false)
						end
					)
				else
					music[1]:stop()
					if menuState == 1 then
						songNum = 1
					end

					menuState = menuState + 1
				end
			else
				status.setLoading(true)

				graphics.fadeOut(
					0.5,
					function()
						songAppend = "normal"
						songNum = 1

						storyMode = false

						music[1]:stop()

						Gamestate.switch(testSong, songNum, songAppend)

						status.setLoading(false)
					end
				)
			end
		end
		function backFunc()
			if menuState == 1 then
				switchMenu(1)
			else
				menuState = menuState - 1
			end
		end
		function drawFunc()
			graphics.setColor(1, 1, 0)
			if menuState == 3 then
				if songDifficulty == 3 then
					love.graphics.printf("Choose a difficulty: < Hard >", -640, 285, 853, "center", nil, 1.5, 1.5)
				elseif songDifficulty == 2 then
					love.graphics.printf("Choose a difficulty: < Normal >", -640, 285, 853, "center", nil, 1.5, 1.5)
				else
					love.graphics.printf("Choose a difficulty: < Easy >", -640, 285, 853, "center", nil, 1.5, 1.5)
				end
			elseif menuState == 2 then
				love.graphics.printf("Choose a song: < " .. mods.weekMeta[modWeekNum][2][songNum] .. " >", -640, 285, 853, "center", nil, 1.5, 1.5)
			else
				love.graphics.printf("Choose a week: < " .. mods.weekMeta[modWeekNum][1] .. " >", -640, 285, 853, "center", nil, 1.5, 1.5)
			end
			graphics.setColor(1, 1, 1)

			if input:getActiveDevice() == "joy" then
				love.graphics.printf("Left Stick/D-Pad: Select | A: Confirm | B: Back", -640, 350, 1280, "center", nil, 1, 1)
			else
				love.graphics.printf("Arrow Keys: Select | Enter: Confirm | Escape: Back", -640, 350, 1280, "center", nil, 1, 1)
			end
		end
	end

	menuState = 1
end

function tempMenu()
	graphics.setColor(0, 0, 0)
	love.graphics.printf("Welcome to the temporary freeplay menu", -640, 0, 853, "center", nil, 1.5, 1.5)
end
function leftFunc()
	if menuState == 3 then
		songDifficulty = (songDifficulty > 1) and songDifficulty - 1 or 3
	elseif menuState == 2 then
		songNum = (songNum > 1) and songNum - 1 or #mods.weekMeta[modWeekNum][2]
	else
		modWeekNum = (modWeekNum > 1) and modWeekNum - 1 or #mods.weekMeta
	end
end
function rightFunc()
	if menuState == 3 then
		songDifficulty = (songDifficulty < 3) and songDifficulty + 1 or 1
	elseif menuState == 2 then
		songNum = (songNum < #mods.weekMeta[modWeekNum][2]) and songNum + 1 or 1
	else
		modWeekNum = (modWeekNum < #mods.weekMeta) and modWeekNum + 1 or 1
	end
end
function confirmFunc()
	if pressedUp ~= 10 then
		if menuState == 3 then

			status.setLoading(true)

			graphics.fadeOut(
				0.5,
				function()
					songAppend = difficultyStrs[songDifficulty]

					storyMode = false
					modFolderMod = true

					music[1]:stop()

					Gamestate.switch(mods.WeekData[modWeekNum], songNum, songAppend)

					status.setLoading(false)
				end
			)
		else
			if menuState == 1 then
				songNum = 1
			end

			menuState = menuState + 1
		end
	else
		music[1]:stop()
		status.setLoading(true)

		graphics.fadeOut(
			0.5,
			function()
				songAppend = "normal"
				songNum = 1

				storyMode = false

				music[1]:stop()
				Gamestate.switch(testSong, songNum, songAppend)

				status.setLoading(false)
			end
		)
	end
end
function backFunc()
	if menuState == 1 then
		switchMenu(1)
	else
		menuState = menuState - 1
	end
end

function drawFunc()
	if pressedUp ~= 10 then
		graphics.setColor(1, 1, 0)
		if menuState == 3 then
			if songDifficulty == 3 then
				love.graphics.printf("Choose a difficulty: < Hard >", -640, 285, 853, "center", nil, 1.5, 1.5)
			elseif songDifficulty == 2 then
				love.graphics.printf("Choose a difficulty: < Normal >", -640, 285, 853, "center", nil, 1.5, 1.5)
			else
				love.graphics.printf("Choose a difficulty: < Easy >", -640, 285, 853, "center", nil, 1.5, 1.5)
			end
		elseif menuState == 2 then
			love.graphics.printf("Choose a song: < " .. mods.weekMeta[modWeekNum][2][songNum] .. " >", -640, 285, 853, "center", nil, 1.5, 1.5)
		else
			love.graphics.printf("Choose a week: < " .. mods.weekMeta[modWeekNum][1] .. " >", -640, 285, 853, "center", nil, 1.5, 1.5)
		end
		graphics.setColor(1, 1, 1)

		if input:getActiveDevice() == "joy" then
			love.graphics.printf("Left Stick/D-Pad: Select | A: Confirm | B: Back", -640, 350, 1280, "center", nil, 1, 1)
		else
			love.graphics.printf("Arrow Keys: Select | Enter: Confirm | Escape: Back", -640, 350, 1280, "center", nil, 1, 1)
		end
	else
		graphics.setColor(1, 1, 1)
		love.graphics.printf("Press enter to play the Test song", -640, 0, 1280, "center", nil, 1, 1)
	end
		
end

function upFunc()
	if pressedUp ~= 10 then
		pressedUp = pressedUp + 1
	else
		pressedUp = 0
	end
end

return {
	enter = function(self, previous)
		songNum = 0
		modWeekNum = 1
		bf = love.filesystem.load("sprites/boyfriend.lua")()
		love.graphics.setDefaultFilter("nearest")
		pbf = love.filesystem.load("sprites/pixel/boyfriend.lua")()
		love.graphics.setDefaultFilter("linear")
		bf:animate("idle", true)
		
		bf.x = 375
		pbf.x, pbf.y = -375, -45

		cam.sizeX, cam.sizeY = 0.9, 0.9
		camScale.x, camScale.y = 0.9, 0.9

		switchMenu(1)

		menuBG = graphics.newImage(love.graphics.newImage(graphics.imagePath("menu/menuDesat")))

		graphics.setFade(0)
		graphics.fadeIn(0.5)
		if useDiscordRPC then
			presence = {
				state = "Choosing a song",
				details = "In the Freeplay Menu",
				largeImageKey = "logo",
				startTimestamp = now,
			}
			nextPresenceUpdate = 0
		end

	end,

	update = function(self, dt)

		if not graphics.isFading() then
			if input:pressed("left") then
				audio.playSound(selectSound)

				leftFunc()
			elseif input:pressed("right") then
				audio.playSound(selectSound)

				rightFunc()
			elseif input:pressed("up") then
				upFunc()
			elseif input:pressed("confirm") then
				audio.playSound(confirmSound)

				confirmFunc()
			elseif input:pressed("back") then
				audio.playSound(selectSound)

				if menuState == 1 then
					graphics.fadeOut(
                        0.3,
                        function()
                            Gamestate.switch(menuChooseFreeplay)
                            status.setLoading(false)
                        end
	            	)
				else
					menuState = menuState - 1
				end
				
			end
		end
		if pressedUp == 10 then
			bf:update(dt)
			pbf:update(dt)
		end
	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)

			menuBG:draw()

			if pressedUp == 10 then
				pbf:udraw(-6.2,6.2)
				bf:udraw(0.9, 0.9)
			end

			love.graphics.push()
				love.graphics.scale(cam.sizeX, cam.sizeY)

				drawFunc()
			love.graphics.pop()
		love.graphics.pop()
	end,

	leave = function(self)
		menuBG = nil
		bf = nil
		pbf = nil
		Timer.clear()
	end
}
