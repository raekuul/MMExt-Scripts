-- Monster Overrides for Skill Emphasis Mod
-- supersedes lines 2279 - 2479 in skill-mod.lua

--[[ EASY MODE
Easy Mode uses shallower curves for the Damage Multiplier, and Energy attacks are not multiplied
Easy Mode guarantees every monster will drop at least 1 gold, and increases the number of dice rolled for gold drops by 1
Easy Mode scales all resistances so that they're relative to the resist cap, instead of only reducing immunity to the resist cap
Easy Mode forces all flying monsters to attempt to engage in melee ]]

EASY = false

-- the resist_cap is the highest resistance that generic monsters are allowed to have
-- in the absence of core Skill Emphasis (or other immunity removal mods), "Unique" monsters are still allowed to be immune to stuff
resist_cap = 120

-- EnergyMod
-- This is a divisor applied to Energy attacks
-- the larger this number, the weaker Energy attacks become
-- if EASY == true, this is ignored entirely (under Easy Mode, energy attacks are not multiplied at all)
EnergyMod = 2

-- base multipliers
-- these multipliers are applied after monster customizations and EZ-exclusive tech are applied
-- defaults are 2 for Health and Armor, 1 for Treasure/Experience
-- Health/Armor/Gold functions will set the larger of vanilla or calculated, so base multipliers less than 1 do not apply 

baseHealthMultiplier = 2
baseArmorMultiplier = 2
baseGoldMultiplier = 1

-- Experience will always set calculated (to permit Zero Monster EXP games)
baseExperienceMultiplier = 1

-- masteries text

local masteries =
{
	[const.Novice] = "n",
	[const.Expert] = "e",
	[const.Master] = "m",
}

-- attack types text

local attackTypes =
{
	[const.Damage.Phys] = "Phys",
	[const.Damage.Magic] = "Magic",
	[const.Damage.Fire] = "Fire",
	[const.Damage.Elec] = "Elec",
	[const.Damage.Cold] = "Cold",
	[const.Damage.Poison] = "Poison",
	[const.Damage.Energy] = "Energy",
}

resistanceTypes = { }
for k,v in pairs(attackTypes) do
	if not (v == "Energy")
	then
		resistanceTypes[v] = k
	end
end

-- missiles

local missiles =
{
	["Arrow"] = 1,
	["FireArrow"] = 2,
	["Fire"] = 3,
	["Elec"] = 4,
	["Cold"] = 5,
	["Poison"] = 6,
	["Energy"] = 7,
	["Magic"] = 8,
	["Rock"] = 9,
}

spellTxtIds = { }



local monsterInfos =
{
	--Maddening Eye
	[12] = {["SpellChance"] = 2, ["Spell"] = "Dispell Magic", ["SpellSkill"] = JoinSkill(10, const.Novice), },
	--Priest of Baa
	[16] = 
	{["Name"]= "Priest of Baa",["FullHP"] = 220,["Level"] = 40, ["ArmorClass"]=40,["Experience"]= 1144,["Attack1"] = {["Type"] = const.Damage.Elec, ["DamageDiceCount"] = 6, ["DamageDiceSides"] = 6, ["DamageAdd"] = 0, ["Missile"] = missiles["Elec"], },},
	--Bishop of Baa
	[17] = 
	{["Name"]= "Bishop of Baa",["FullHP"] = 340,["Level"] = 50,["ArmorClass"]=50,["Experience"]= 2375,["Attack1"] = {["Type"] = const.Damage.Elec, ["DamageDiceCount"] = 7, ["DamageDiceSides"] = 6, ["DamageAdd"] = 5, ["Missile"] = missiles["Elec"], },["Spell"] = "Harm", ["SpellSkill"] = JoinSkill(6, const.Master),},
	--Cardinal of Baa
	[18] = 
	{["Name"]= "Cardinal of Baa",["FullHP"] = 510,["Level"] =60,["ArmorClass"]=60,["Experience"]= 4000,["Attack1"] = {["Type"] = const.Damage.Elec, ["DamageDiceCount"] = 10, ["DamageDiceSides"] = 6, ["DamageAdd"] = 10, ["Missile"] = missiles["Elec"], },["Spell"] = "Flying Fist", ["SpellSkill"] = JoinSkill(6, const.Master),},
	--devil captain
	[25] = {["FullHP"] = 650,["Level"] = 70,["ArmorClass"]=60, ["Attack1"] = {["Type"] = const.Damage.Phys, ["DamageDiceCount"] = 6, ["DamageDiceSides"] = 6, ["DamageAdd"] = 0,},},
	--Devil Master
	[26] = {["FullHP"] = 850,["Level"] = 85,["ArmorClass"]=80, ["Attack1"] = {["Type"] = const.Damage.Phys, ["DamageDiceCount"] = 7, ["DamageDiceSides"] = 8, ["DamageAdd"] = 20,},["SpellChance"] = 20, ["Spell"] = "Meteor Shower", ["SpellSkill"] = JoinSkill(3, const.Master),},	
	--Devil King
	[27] = { ["FullHP"] = 1050,["Level"] = 100,["ArmorClass"]=100, ["Attack1"] = {["Type"] = const.Damage.Phys, ["DamageDiceCount"] = 10, ["DamageDiceSides"] = 8, ["DamageAdd"] = 20,},},
	--devil Spawn
	[28] = {["FullHP"] = 190,["Level"] = 50,["ArmorClass"]=40,["Experience"]= 2800, ["Attack1"] = {["Type"] = const.Damage.Phys, ["DamageDiceCount"] = 4, ["DamageDiceSides"] = 6, ["DamageAdd"] = 8,},["SpellChance"] = 20, ["Spell"] = "Fire Bolt", ["SpellSkill"] = JoinSkill(8, const.Master),},
	--devil Worker
	[29] = {["FullHP"] = 580,["Level"] = 70,["ArmorClass"]=60,["Experience"]= 6800, ["Attack1"] = {["Type"] = const.Damage.Phys, ["DamageDiceCount"] = 5, ["DamageDiceSides"] = 6, ["DamageAdd"] = 20,},["SpellChance"] = 20, ["Spell"] = "Fire Bolt", ["SpellSkill"] = JoinSkill(14, const.Master),},
	--devil Warrior
	[30] = {["FullHP"] = 900,["Level"] = 90,["ArmorClass"]=80,["Experience"]= 9500, ["Attack1"] = {["Type"] = const.Damage.Phys, ["DamageDiceCount"] = 5, ["DamageDiceSides"] = 6, ["DamageAdd"] = 30,},["SpellChance"] = 20, ["Spell"] = "Fireball", ["SpellSkill"] = JoinSkill(12, const.Master),},
	--Defender of VARN
	[88] = {["SpellChance"] = 20, ["Spell"] = "Psychic Shock", ["SpellSkill"] = JoinSkill(4, const.Master), },
	--Sentinel of VARN
	[89] = {["SpellChance"] = 20, ["Spell"] = "Psychic Shock", ["SpellSkill"] = JoinSkill(6, const.Master), },
	--Guardian of VARN
	[90] = {["SpellChance"] = 20, ["Spell"] = "Psychic Shock", ["SpellSkill"] = JoinSkill(7, const.Master), },
	--Lich
	[94] = {["SpellChance"] = 1, ["Spell"] = "Dispell Magic", ["SpellSkill"] = JoinSkill(10, const.Novice), },
	--Greater Lich
	[95] = {["SpellChance"] = 1, ["Spell"] = "Dispell Magic", ["SpellSkill"] = JoinSkill(10, const.Novice), },
	--Gorgon
	[102] = {["SpellChance"] = 30, ["Spell"] = "Psychic Shock", ["SpellSkill"] = JoinSkill(5, const.Master), },
	--Minotaur
	[106] = {["Attack1"] = {["Type"] = const.Damage.Phys, ["DamageDiceCount"] = 3, ["DamageDiceSides"] = 7, ["DamageAdd"] = 25,},},
	--Minotaur Mage
	[107] = {["Attack1"] = {["Type"] = const.Damage.Phys, ["DamageDiceCount"] = 6, ["DamageDiceSides"] = 7, ["DamageAdd"] = 28,},},
	--Minotaur King
	[108] = {["Attack1"] = {["Type"] = const.Damage.Phys, ["DamageDiceCount"] = 9, ["DamageDiceSides"] = 7, ["DamageAdd"] = 36,},},
	--Titan
	[166] = {["Attack1"] = {["Type"] = const.Damage.Elec, ["DamageDiceCount"] = 7, ["DamageDiceSides"] = 20, ["DamageAdd"] = 10,["Missile"] = missiles["Elec"],},["SpellChance"] = 50, ["Spell"] = "Psychic Shock", ["SpellSkill"] = JoinSkill(8, const.Master), },
	--Noble Titan
	[167] = {["Attack1"] = {["Type"] = const.Damage.Elec, ["DamageDiceCount"] = 8, ["DamageDiceSides"] = 20, ["DamageAdd"] = 20,["Missile"] = missiles["Elec"],},["SpellChance"] = 50, ["Spell"] = "Psychic Shock", ["SpellSkill"] = JoinSkill(9, const.Master), },
	--Supreme Titan
	[168] = {["Attack1"] = {["Type"] = const.Damage.Elec, ["DamageDiceCount"] = 11, ["DamageDiceSides"] = 20, ["DamageAdd"] = 30,["Missile"] = missiles["Elec"],},["SpellChance"] = 50, ["Spell"] = "Psychic Shock", ["SpellSkill"] = JoinSkill(13, const.Master), },
	-- Follower of Baa
	[139] = {["SpellChance"] = 10, ["Spell"] = "Mind Blast", ["SpellSkill"] = JoinSkill(1, const.Novice), },
	-- Mystic of Baa
	[140] = {["SpellChance"] = 30, ["Spell"] = "Mind Blast", ["SpellSkill"] = JoinSkill(2, const.Novice), },
	-- Fanatic of Baa
	[141] = {["SpellChance"] = 50, ["Spell"] = "Mind Blast", ["SpellSkill"] = JoinSkill(3, const.Novice), },
	-- Cannibal (female)
	[130] = {["SpellChance"] = 10, ["Spell"] = "Deadly Swarm", ["SpellSkill"] = JoinSkill(1, const.Novice), },
	-- Head Hunter (female)
	[131] = {["SpellChance"] = 20, ["Spell"] = "Deadly Swarm", ["SpellSkill"] = JoinSkill(2, const.Novice), },
	-- Witch Doctor (female)
	[132] = {["SpellChance"] = 30, ["Spell"] = "Deadly Swarm", ["SpellSkill"] = JoinSkill(3, const.Novice), },
	-- Cannibal (male)
	[142] = {["SpellChance"] = 10, ["Spell"] = "Fire Bolt", ["SpellSkill"] = JoinSkill(1, const.Novice), },
	-- Head Hunter (male)
	[143] = {["SpellChance"] = 20, ["Spell"] = "Fire Bolt", ["SpellSkill"] = JoinSkill(2, const.Novice), },
	-- Witch Doctor (male)
	[144] = {["SpellChance"] = 30, ["Spell"] = "Fire Bolt", ["SpellSkill"] = JoinSkill(3, const.Novice), },
	--Malekith rebalance
	--skeleton
	[154] = {["SpellChance"] = 10, ["Spell"] = "Flame Arrow", ["SpellSkill"] = JoinSkill(1, const.Novice), },
	-- Skeleton Knight
	[155] = {["SpellChance"] = 20, ["Spell"] = "Flame Arrow", ["SpellSkill"] = JoinSkill(2, const.Novice), },
	-- Skeleton Lord
	[156] = {["SpellChance"] = 30, ["Spell"] = "Flame Arrow", ["SpellSkill"] = JoinSkill(3, const.Novice), },
	--Magyar
	 [  4] = {["SpellChance"] = 10, ["Spell"] = "Lightning Bolt", ["SpellSkill"] = JoinSkill(4, const.Master), },
	-- Magyar Soldier
	 [  5] = {["SpellChance"] = 20, ["Spell"] = "Lightning Bolt", ["SpellSkill"] = JoinSkill(6, const.Master), },
	-- Goblin
	[ 76] = {["SpellChance"] = 10, ["Spell"] = "Fire Bolt", ["SpellSkill"] = JoinSkill(1, const.Novice), },
	-- Goblin Shaman
	[ 77] = {["SpellChance"] = 20, ["Spell"] = "Fire Bolt", ["SpellSkill"] = JoinSkill(2, const.Novice), },
	-- Goblin King
	[ 78] = {["SpellChance"] = 30, ["Spell"] = "Fire Bolt", ["SpellSkill"] = JoinSkill(3, const.Novice), },
	-- Ghost
	[ 73] = {["SpellChance"] = 10, ["Spell"] = "Spirit Arrow", ["SpellSkill"] = JoinSkill(1, const.Novice), },
	-- Evil Spirit
	[ 74] = {["SpellChance"] = 20, ["Spell"] = "Spirit Arrow", ["SpellSkill"] = JoinSkill(2, const.Novice), },
	-- Specter
	[ 75] = {["SpellChance"] = 30, ["Spell"] = "Spirit Arrow", ["SpellSkill"] = JoinSkill(3, const.Novice), },
	-- steal crash workaround	
	-- Cutpurse
	[127] = {["Bonus"] = 0, ["BonusMul"] = 0},
	-- Bounty Hunter
	[128] = {["Bonus"] = 0, ["BonusMul"] = 0},
	-- Thief
	[163] = {["Bonus"] = 0, ["BonusMul"] = 0},
	-- Burglar
	[164] = {["Bonus"] = 0, ["BonusMul"] = 0},
	-- Rogue
	[165] = {["Bonus"] = 0, ["BonusMul"] = 0},
}

function traverseTable(input)
	if not (type(input) == table)
	then
		return input
	else
		output = { }
		for key, value in pairs(input) do
			output[key] = traverseTable(input[key])
		end
		return output
	end
end

function easySkemChangeFlyingRangedToMelee(id)
	if (Game.MonstersTxt[id]["Fly"] == 1 and not (Game.MonstersTxt[id]["Attack1"]["Missile"] == 0))
	then
		Game.MonstersTxt[id]["Attack1"]["Missile"] = 0
		return true
	else
		return false
	end
end

function applyMonsterResistanceAdjustments(MonsterID, easy_mode_enabled)
	for k,_ in pairs(resistanceTypes)
	do
		key = k .. "Resistance"
		value = Game.MonstersTxt[MonsterID][key]
		if (easy_mode_enabled == true) 
		then
			Game.MonstersTxt[MonsterID][key] = value * resist_cap / 200
		else
			Game.MonstersTxt[MonsterID][key] = math.min(value, resist_cap)
		end
	end
end

function calculateDamageMultiplier(MonsterID, divisor, constant)
	multiplier = (Game.MonstersTxt[MonsterID]["Level"] + 5) / divisor + constant
	return multiplier
end

function applyMonsterDamageAdjustments(MonsterID, easy_mode_enabled)
	tier = string.sub(Game.MonstersTxt[MonsterID]["Picture"], -1)
	if (tier == "A")
	then
		Monster2ID = MonsterID + 1
	elseif (tier == "C")
	then
		Monster2ID = MonsterID - 1
	else
		Monster2ID = MonsterID
	end
	
	if (easy_mode_enabled == true)
	then
		multiplier = calculateDamageMultiplier(Monster2ID, 25, 1.25)
	else
		multiplier = calculateDamageMultiplier(Monster2ID, 20, 1.75)
	end
	for i=1,2 do
		v = nil
		key = "Attack" .. i
		resist = Game.MonstersTxt[MonsterID][key]["Type"]
		sides = Game.MonstersTxt[MonsterID][key]["DamageDiceSides"] 
		bonus = Game.MonstersTxt[MonsterID][key]["DamageAdd"] 
		if (resist == const.Damage.Energy)
		then
			if (easy_mode_enabled == true)
			then -- if it's easy mode, we don't apply any multipliers to Energy attacks
				sides = sides
				bonus = bonus 
			else -- if it's not easy mode, we apply multipliers and then divide by EnergyMod
				sides = sides * multiplier / EnergyMod
				bonus = math.min(bonus * multiplier / EnergyMod, 250)
			end
		else -- if it's not an energy attack, the usual math applies
			sides = sides * multiplier
			bonus = math.min(bonus * multiplier, 250)
		end
		Game.MonstersTxt[MonsterID][key]["DamageDiceSides"] = sides
		Game.MonstersTxt[MonsterID][key]["DamageAdd"] = bonus
	end
	
	spell_multiplier = calculateDamageMultiplier(Monster2ID, 30, 1)
	local rank, mastery = SplitSkill(Game.MonstersTxt[MonsterID]["SpellSkill"])
	Game.MonstersTxt[MonsterID]["SpellSkill"] = JoinSkill(rank * spell_multiplier, skillMastery)
end

function applyMonsterMovespeedAdjustments(MonsterID) 
	speed = Game.MonstersTxt[MonsterID]["MoveSpeed"]
	if (Game.MonstersTxt[MonsterID]["Attack1"]["Missile"] == 0)
	then
		speed = (speed + (400 - speed) / 2 + 100) * 101 / 100
	else
		speed = speed * 99 / 100
	end
	Game.MonstersTxt[MonsterID]["MoveSpeed"] = speed
end

function applyMonsterACAdjustments(MonsterID) 
	armor = Game.MonstersTxt[MonsterID]["ArmorClass"]
	armor = armor * baseArmorMultiplier
	Game.MonstersTxt[MonsterID]["ArmorClass"] = math.max(armor, Game.MonstersTxt[MonsterID]["ArmorClass"])
end

function applyMonsterHPAdjustments(MonsterID)
	tier = string.sub(Game.MonstersTxt[MonsterID]["Picture"], -1)
	level = Game.MonstersTxt[MonsterID]["Level"]
	health = Game.MonstersTxt[MonsterID]["FullHitPoints"]
	if (tier == "A")
	then
		tier3Level = Game.MonstersTxt[MonsterID+2]["Level"]
	elseif (tier == "B")
	then
		tier3Level = Game.MonstersTxt[MonsterID+1]["Level"]
	else
		tier3Level = Game.MonstersTxt[MonsterID]["Level"]
	end
	if (tier3Level >= (level * 2))
	then
		healthMod = tier3Level/(level * 5)
	else
		healthMod = 0
	end
	health = health * (baseHealthMultiplier + healthMod)
	Game.MonstersTxt[MonsterID]["FullHitPoints"] = math.max(health, Game.MonstersTxt[MonsterID]["FullHitPoints"])
end

function applyMonsterExperienceAdjustments(MonsterID)
	experience = Game.MonstersTxt[MonsterID]["Experience"]
	experience = experience * baseExperienceMultiplier
	Game.MonstersTxt[MonsterID]["Experience"] = experience
end

function applyMonsterTreasureAdjustments(MonsterID, easy_mode_enabled)
	dice = Game.MonstersTxt[MonsterID]["TreasureDiceCount"]
	sides = Game.MonstersTxt[MonsterID]["TreasureDiceSides"]
	
	dice = dice * baseGoldMultiplier
	if (easy_mode_enabled == true)
	then
		dice = dice + 1
		sides = math.max(1, sides)
	end
	dice = math.max(dice, Game.MonstersTxt[MonsterID]["TreasureDiceCount"])
	
	Game.MonstersTxt[MonsterID]["TreasureDiceCount"] = dice
	Game.MonstersTxt[MonsterID]["TreasureDiceSides"] = sides
end

function applyMonsterInfos()
	for i = 1, Game.MonstersTxt.high do
		if not (monsterInfos[i] == nil)
		then
			monsterInfos[i]["Spell"] = spellTxtIds[monsterInfos[i]["Spell"]]
			for k,v in pairs(monsterInfos[i]) do
				if not (type(Game.MonstersTxt[i][k]) == table)
				then
					Game.MonstersTxt[i][k] = v
				else
					Game.MonstersTxt[i][k] = traverseTable(v)
				end
			end
		end
		if EASY == true --easy mode exclusive tech
		then
			easySkemChangeFlyingRangedToMelee(i)
		end
		-- monster movespeed adjustments must immediately follow all monsterInfos-based changes
		applyMonsterMovespeedAdjustments(i)
		
		applyMonsterResistanceAdjustments(i,EASY)
		applyMonsterACAdjustments(i)
		applyMonsterHPAdjustments(i)
		
		applyMonsterDamageAdjustments(i,EASY)
		applyMonsterExperienceAdjustments(i)
		applyMonsterTreasureAdjustments(i,EASY)
	end
end

function events.GameInitialized2()
	for spellTxtId = 1, Game.SpellsTxt.high do
		spellTxtIds[Game.SpellsTxt[spellTxtId].Name] = spellTxtId
	end
	applyMonsterInfos()
end
