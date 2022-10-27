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
local confirmSound = love.audio.newSource("sounds/menu/confirm.ogg", "static")

--[[

--the order they go in
hypno (safety lullaby)
hypno (left unchecked)
hypno (lost cause)
gold (monochrome)
gold (frostbite)
red (dead red)
pikachu (freakachu)
Silver
feraligatr
missingno
burried alive (+ co)
s!3v3n 
glitchy red
disabled
ponyta
hell bell (+ old man)
purin
nurse joy (+ co)
shinto
grey
shitno
hypno (pasta night)
lord x
mx


--]]

return {
	enter = function(self, previous)

		names = {
			"Hypno (Safety Lullaby)",
			"Hypno (Left Unchecked)",
			"Hypno (Lost Cause)",
			"Gold (Monochrome)",
			"Gold (Frostbite)",
			"Red (Dead Red)",
			"Pikachu (Freakachu)",
			"Silver",
			"Feraligatr",
			"Missingo",
			"Burried Alive (+ Co)",
			"S!3V3N",
			"Glitchy Red",
			"DISABLED",
			"Ponyta",
			"Hell Bell (+ Old Man)",
			"Purin",
			"Nurse Joy (+ Co)",
			"Shinto",
			"Grey",
			"Shitno",
			"Hypno (Pasta Night)",
			"Lord X",
			"MX"
		}
		subtitles = {
			"The Hypnosis Pokemon",
			"The Hypnosis Pokemon",
			"The Hypnosis Pokemon",
			"The Tortured Trainer",
			"The Tortured Trainer",
			"The Frozen Trainer",
			"The Mouse Pokemon",
			"The Silenced Trainer",
			"The Big Jaw Pokemon", -- goofy 
			"???",
			"The Improsoned Half-Man",
			"...",
			"The Sentient Glitch",
			"The Balloon Pokemon",
			"The Fire Horse Pokemon", -- nintendo what are you on
			"The Bronze Bell Pokemon", -- literally a fuckin bell 
			"The Balloon Pokemon",
			"",
			"The Bootleg Pokemon", -- wish.com looking ass
			"The Bootleg Trainer", -- aliexpress
			"...",
			"",
			""
		}
		stats = {
			"HT 6'05\"   WT 26.5 lbs",
			"HT 6'05\"   WT 26.5 lbs",
			"HT 6'05\"   WT 26.5 lbs",
			"HT 5'06\"   WT 114 lbs,",
			"HT 5'06\"   WT 114 lbs,",
			"HT ???   WT ???",
			"HT 1'04\4   WT 13.2 lbs",
			"HT 5'07\"   WT 116 lbs",
			"HT 7'07\"   WT 195.8 lbs",
			"HT 10'0\"   WT 3507.2 lbs", -- fat fucker
			"HT ???   WT ???",
			"HT ???   WT ???",
			"HT ???   WT ???",
			"HT 3'03\"   WT 26.5 lbs",
			"HT 3'03\"   WT 66.1 lbs",
			"HT 666'   WT 666 lbs",
			"HT 1'08\"   WT 12.1 lbs",
			"HT 5'05\"   WT 120 lbs",
			"HT TALL   WT NOT FAT",
			"HT 5'07\" WT 116 lbs",
			"HT ???   WT ???",
			"HT 6'05\"   WT 26.5 lbs",
			"3'03\" WT 77 lbs",
			"HT ???   WT ???"
		}
		descriptions = {
			"Hypno holds a pendulum in its hand. The arcing movement and glitter of the pendulum lull the foe into a deep state of hypnosis. While this Pokemon searches for prey, it polishes the pendulum.",
			"When it is very hungry, it puts humans it meets to sleep, then it feasts on their dreams.",
			"Avoid eye contact if you come across one. It will try to put you to sleep by using its pendulum.",
			"With Unowns as his puppeteer, his groans are pitiful sparks of hope that Gold is possibly still alive.",
			"Determined and filled with hope, this trainer's ignorance gets to him and the Pokemon he loved. His Typhlosion's last breath will be God's burden of thinking before acting, even in death.",
			"The Kanto Region's Greatest Champion, residing in isolation with his Pokemon at the freezing top of Mt. Silver. What a fool he was.",
			"It keeps its tail raised to monitor its surroundings. If you yank its tail, it will try to bite you.", -- who tf would just grab a pikachus tail and pull it like wtf
			"Certain Pokemon have been able to hear the muffled screams and wails this trainer does. When they hear it, their faces are filled with fear.",
			"When it bites with its massive and powerful jaws, it shakes its head and savagely tears its victims up.",
			"MissingNo. is a glitch type Pokemon in Pokemon Red, Blue, and Yellow. The glitch occurs due to a bug in the game's programming from the Old Man battle, and others",
			"Buried at the top of Pokemon Tower, his attempts to break free from his grave causes subtle but noticable rumbles throughout the whole tower with anyone inside",
			"After the tragic events of his beloved Miki, he wonders from town to town is sorrow and anger. Any Wild Pokemon he comes in contact with completely ignore him.",
			"A misfortunate trainer designed to be wronged by his creator, forever trapped in a box, to be forgotten and replaced by the next generation.",
			"A Wigglytuff received through trade, with it's name in all captial letters. It only knew four moves, but all of them were disabled. And so it struggles, and struggles, and struggles, and struggles, and struggles, and struggles, and struggles, and struggles, and struggles, and struggles, and struggles, and struggles, and struggles, and struggles, and struggles, and struggles, and struggles, and struggles, and struggles, and struggles, and struggles, theres no damn way you can read this far wtf you doing looking in here get tf out",
			"It is a weak runner immediately after birth. It gradually becomes faster by chasing after its parents.",
			"A Bronzong with all its stats saying 666. Upon receiving it through trade, a piece of mail was attactched from it, the owner's name being \"Beelze.\"",
			"This unknown form of Jigglypuff appears to have a far deadlier Sing ability than usual, be cautious.",
			"This kind-hearted Nurse Joy is a Pokemon caretaker found in an abandoned Pokecenter. She'd do anything for her precious little Pokemon... Anything at all.",
			"SHINTO SO COOL!!!! SHINJTO NOT FROM BOOT LEG GAME BUT FROM REAL ONE!!!! PLAY WITH ME???",
			"Rumors say the developers that created this character couldn't be bothered to code him, so they trapped the soul of a dead kid in it and called it a day", -- yes because human souls can run on the gameboy
			"Her name is actually Shinto, but due to the fact that it's not possible to beat her in the game she's from, players nicknamed her 'Shitno.' The only way to capture her would be to use a hacked copy and go beyond the glitched difficulty cap. But you don't want to do that...",
			"Hypno holds a pendulum in its hand. It refuses to let go or put anything else in its hands, so it uses its psychic abilities to lift other objects.",
			"A sinister entitity comprised of VOID energy, doing whatever it likes so long as it satisfies them. Seems like an innocent game of cards, but things are sure to turn deadly.",
			"This maniac version of Mario resides within an NES Mario cartridge with the sole purpose of torturing the soul of an innocent child. Although today he's just here to play some cards."
		}
	end,


	update = function(self, dt)
		if input:pressed("gameUp") then
			if dexSelection == 1 then
				dexSelection = 24
			else 
				dexSelection = dexSelection - 1
			end
		elseif input:pressed("gameDown") then
			if dexSelection == 24 then
				dexSelection = 1
			else
				dexSelection = dexSelection + 1
			end
		end




		
	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)

			love.graphics.push()
				love.graphics.scale(cam.sizeX, cam.sizeY)

				love.graphics.printf(names[dexSelection], 0, 0, 50)
				love.graphics.printf(stats[dexSelection], 0, -20, 50)
				love.graphics.printf(descriptions[dexSelection], 0, -40, 100)
				love.graphics.print()
			love.graphics.pop()
		love.graphics.pop()
	end
}
