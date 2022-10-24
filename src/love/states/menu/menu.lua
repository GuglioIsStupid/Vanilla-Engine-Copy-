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
		danceRight = false
		transparency = {0}
		Timer.tween(
			1,
			transparency,
			{[1] = 1},
			"out-quad"
		)
		function logoRotate()
			Timer.tween(2, logo, {orientation = 0.15}, "in-out-back", function()
				Timer.tween(2, logo, {orientation = -0.15}, "in-out-back", function()
					logoRotate()
				end)
			end)
		end
		titleBG = graphics.newImage(love.graphics.newImage(graphics.imagePath("menu/titleBG")))
		changingMenu = false
		logo = love.filesystem.load("sprites/menu/ve-logo.lua")()
		girlfriendTitle = love.filesystem.load("sprites/menu/girlfriend-title.lua")()
		titleEnter = love.filesystem.load("sprites/menu/titleEnter.lua")()

		whiteRectangles = {}
		for i = 1, 15 do
			table.insert(whiteRectangles, graphics.newImage(love.graphics.newImage(graphics.imagePath("menu/whiteRectangle"))))
			whiteRectangles[i].x = -780 + 100*i
			whiteRectangles[i].y = -1000
		end

		girlfriendTitle.x, girlfriendTitle.y = 500, 65
		titleEnter.x, titleEnter.y = 225, 450
		logo.x, logo.y = -350, -300

		Timer.tween(1, logo, {y = -125}, "out-expo")
		Timer.tween(1, titleEnter, {y = 350}, "out-expo")
		Timer.tween(1, girlfriendTitle, {x = 400}, "out-expo")
		logoRotate()

		girlfriendTitle.x, girlfriendTitle.y = 325, 65

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
	--[[
	danceRight = not danceRight
    if danceRight then
        gf:play("danceRight")
    else
        gf:play("danceLeft")
    end
	]]
	onBeat = function(self, n)
		danceRight = not danceRight
		if girlfriendTitle then if n % 2 == 0 then
			girlfriendTitle:animate("danceRight", false)
		else
			girlfriendTitle:animate("danceLeft", false)
		end end

		if logo then logo:animate("anim", false) end
	end,

	update = function(self, dt)
		girlfriendTitle:update(dt)
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
					for i = 1, 15 do
						Timer.tween(0.5 + 0.1 + 0.03*i, whiteRectangles[i], {y = 0}, "linear",
							function()
								if i == 15 then
									graphics.fadeOut(0.2, function()
										Gamestate.switch(menuSelect)
										status.setLoading(false)
									end)
									
								end
							end
						)
					end
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

			--[[
			love.graphics.push()
				love.graphics.scale(cam.sizeX, cam.sizeY)
				logo:draw()

				girlfriendTitle:draw()
				titleEnter:draw()

				--love.graphics.setColor(1, 63 / 255, 172 / 255, 0.9)
				graphics.setColor(0, 0, 0, 0.9)
				for i = 1, 15 do
					whiteRectangles[i]:draw()
				end
				graphics.setColor(1, 1, 1)

			love.graphics.pop()
			]]--
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
					love.graphics.translate(menuDetails.girlfriendTitle.x, menuDetails.girlfriendTitle.y)
					girlfriendTitle:draw()
				love.graphics.pop()
				love.graphics.push()
					graphics.setColor(0, 0, 0, 0.9)
					for i = 1, 15 do
						whiteRectangles[i]:draw()
					end
					graphics.setColor(1, 1, 1)
				love.graphics.pop()
			love.graphics.pop()

		love.graphics.pop()
	end,

	leave = function(self)
		girlfriendTitle = nil
		titleEnter = nil
		logo = nil

		Timer.clear()
	end
}
