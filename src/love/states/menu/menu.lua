local upFunc, downFunc, confirmFunc, backFunc, drawFunc, musicStop

local menuState

local menuNum = 1

local songNum, songAppend
local songDifficulty = 2

local selectSound = love.audio.newSource("sounds/menu/select.ogg", "static")
local confirmSound = love.audio.newSource("sounds/menu/confirm.ogg", "static")
local transparency
local danceRight

local function switchMenu(menu)
	function backFunc()
		graphics.fadeOut(0.5, love.event.quit)
	end

	menuState = 1
end

return {
	enter = function(self, previous)
		transparency = {0}
		Timer.tween(
			1,
			transparency,
			{[1] = 1},
			"out-quad"
		)
		titleBG = graphics.newImage(love.graphics.newImage(graphics.imagePath("menu/titleBG")))
		changingMenu = false
		logo = love.filesystem.load("sprites/menu/ve-logo.lua")()
		titleEnter = love.filesystem.load("sprites/menu/titleEnter.lua")()

		titleEnter.x, titleEnter.y = 225, 450
		logo.x, logo.y = -350, -300

		titleEnter.x, titleEnter.y = 225, 350
		songNum = 0

		switchMenu(1)

		graphics.setFade(0)
		graphics.fadeIn(0.5)

		if useDiscordRPC then
			presence = {
				state = "Press Enter", 
				details = "In the Menu",
				largeImageKey = "logo",
				startTimestamp = now,
			}
			nextPresenceUpdate = 0
		end

		music[1]:play()
	end,

	onBeat = function(self, n)
		if logo then logo:animate("anim", false) end
	end,

	update = function(self, dt)
		titleEnter:update(dt)
		logo:update(dt)

		music[1]:on("beat", function(n)
			self:onBeat(n)
		end)

		if not graphics.isFading() then
			if input:pressed("confirm") then
				
				if not changingMenu then
					titleEnter:animate("pressed", true)
					audio.playSound(confirmSound)
					changingMenu = true
					graphics.fadeOut(0.2, function()
						Gamestate.switch(menuSelect)
						status.setLoading(false)
					end)
				end
			elseif input:pressed("back") then
				audio.playSound(selectSound)

				backFunc()
			end
		end
	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
			love.graphics.push()
				love.graphics.push()
					love.graphics.translate(menuDetails.titleBG.x, menuDetails.titleBG.y)
					titleBG:draw()
				love.graphics.pop()
				love.graphics.push()
					love.graphics.scale(0.9, 0.9)
					love.graphics.translate(menuDetails.titleLogo.x, menuDetails.titleLogo.y)
					logo:draw()
				love.graphics.pop()
				love.graphics.push()
					love.graphics.scale(0.9, 0.9)
				love.graphics.pop()
				love.graphics.push()
				love.graphics.pop()
			love.graphics.pop()

		love.graphics.pop()
	end,

	leave = function(self)
		titleEnter = nil
		logo = nil

		Timer.clear()
	end
}
