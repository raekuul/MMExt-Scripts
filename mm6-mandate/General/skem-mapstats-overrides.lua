--[[

Map Stats Overrides for Skill Emphasis Mod

 -- for overriding Map Reload timers
 -- for replacing one monster type with another
 
 supersedes 'skem-monster-move.lua' and 'refresh-timers.lua'
 
TODO: 

 ]]

-- set BATS to true to enable "Oops, All Bats" mode

BATS = false

-- Maps are ordered by ID, starting from 1

MAPS = {
	"Sweet Water",
	"Paradise Valley",
	"Hermit's Isle",
	"Kriegspire",
	"Blackshire",
	"Dragonsand",
	"Frozen Highlands",
	"Free Haven",
	"Mire of the Damned",
	"Silver Cove",
	"Bootleg Bay",
	"Castle Ironfist",
	"Eel Infested Waters",
	"Misty Islands",
	"New Sorpigal",
	"Goblinwatch",
	"Abandoned Temple",
	"Shadow Guild Hideout",	
	"Hall of the Fire Lord",
	"Snergle's Caverns",
	"Dragoons' Caverns",
	"Silver Helm Outpost",
	"Shadow Guild",
	"Snergle's Iron Mines",
	"Dragoons' Keep",
	"Corlagon's Estate",
	"Silver Helm Stronghold",
	"The Monolith",
	"Tomb of Ethric the Mad",
	"Icewind Keep",
	"Warlord's Fortress",
	"Lair of the Wolf",
	"Gharik's Forge",
	"Agar's Laboratory",
	"Caves of the Dragon Riders",
	"Temple of Baa",
	"Temple of the Fist",
	"Temple of Tsantsa",
	"Temple of the Sun",
	"Temple of the Moon",
	"Supreme Temple of Baa",
	"Superior Temple of Baa",
	"Temple of the Snake",
	"Castle Alamos",
	"Castle Darkmoor",
	"Castle Kriegspire",
	"Free Haven Sewer",
	"Tomb of VARN",
	"Oracle of Enroth",
	"Control Center",
	"The Hive",
	"The Arena",
	"Dragon's Lair",
	"zddb02.blv",
	"zddb03.blv",
	"zddb04.blv",
	"zddb05.blv",
	"zddb06.blv",
	"zddb07.blv",
	"zddb08.blv",
	"zddb09.blv",
	"zddb10.blv",
	"zdtl01.blv",
	"zdtl02.blv",
	"zdwj01.blv",
	"Devil Outpost",
	"New World Computing",
}

MapIDs = { }
for i,v in ipairs(MAPS) do
	MapIDs[v] = i
end

-- Regional Reset stuff

WEEK = 7
YEAR = WEEK * 52
CENTURY = YEAR * 100

globalReset = CENTURY

localResets = { 
	[MapIDs["The Hive"]] = 0,
	[MapIDs["The Arena"]] = 0,
}

function changeAllRegionResets()
	for i = 1, Game.MapStats.high do
		if not (localResets[i] == nil)
		then
			Game.MapStats[i]["RefillDays"] = localResets[i]
		else
			Game.MapStats[i]["RefillDays"] = globalReset
		end
	end
end

-- Monster Substitutions stuff

localSubstitutions = {  
	[MapIDs["Frozen Highlands"]] = { Monster2Pic = "Archer", Monster3Pic = "Ogre" },
	[MapIDs["Temple of the Fist"]] = { Monster1Pic = "Monk" },
	[MapIDs["Free Haven Sewer"]] = { Monster2Pic = "Monk" },
}

function monsterSubstitutions()
	for i = 1, Game.MapStats.high do
		if BATS == true then
			for j = 1, 3 do
				key = "Monster" .. j .. "Pic"
				Game.MapStats[i][key] = "Bat"
			end
		else
			if not (localSubstitutions[i] == nil) then
				for j = 1, 3 do
					key = "Monster" .. j .. "Pic"
					if not (localSubstitutions[i][key] == nil) then
						Game.MapStats[i][key] = localSubstitutions[i][key]
					end
				end
			end	
		end
	end			
end

function events.GameInitialized2()
	changeAllRegionResets()
	monsterSubstitutions()
end
