-- functions related to showing Monster Info in the right-click pane
-- taken from Skill Emphasis mod, version 0.8.0

-- if using with Skill Emphasis, comment out lines 3818 - 3933 in skill-mod.lua

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

local function GetMonster(p)
	if p == 0 then
		return
	end
	local i = (p - Map.Monsters["?ptr"]) / Map.Monsters[0]["?size"]
	return i, Map.Monsters[i]
end

local function getHitChance(player, ranged, monsterArmorClass)

	-- set default armor class
	
	if monsterArmorClass == nil then
		monsterArmorClass = 100
	end

	-- get combat parameters
	
	local attack
	
	if ranged then
		attack = player:GetRangedAttack()
	else
		attack = player:GetMeleeAttack()
	end
	
	if attack == nil or type(attack) ~= "number" then
		return 0
	end
	
	local chanceToHit = (15 + 2 * attack) / (30 + 2 * attack + monsterArmorClass)
	return string.format("%.1f%%",chanceToHit * 100) 
	
end

function calculateMonsterDebuffRate(level,magicResist)
	rate = 30/(30 + level + magicResist)
	return string.format("%.1f%%",100 * rate)
end

function showResistanceAsPercentage(resist)
	rate = 1 - 30/(30 + resist)
	return string.format("%.1f%%",100 * rate)
end

function modifiedDrawMonsterInfoName(d, def, dialog, font, left, top, color, str, a6)

	-- get monster
	
	local monsterIndex, monster = GetMonster(d.edi)
	local monsterTxt = Game.MonstersTxt[monster.Id]
	
	-- invoke original function
	
	def(dialog, font, left, top, color, str, a6)
	
	-- display monster txt statistics
	
	local textLines = {}
	
	-- player damage rate on monster
	if Game.CurrentPlayer >= 0 and Game.CurrentPlayer <= 3 then
		local player = Party.Players[Game.CurrentPlayer]
		local meleeDamageRate = getHitChance(player, false, monsterTxt.ArmorClass)
		local rangedDamageRate = getHitChance(player, true, monsterTxt.ArmorClass)
		
		table.insert(textLines, {["key"] = "Melee Hit Chance", ["value"] = string.format("%s", meleeDamageRate), ["type"] = "damageRate", })
		table.insert(textLines, {["key"] = "Ranged Hit Chance", ["value"] = string.format("%s", rangedDamageRate), ["type"] = "damageRate", })
		table.insert(textLines, {["key"] = "", ["value"] = "", })
	else
		table.insert(textLines, {["key"] = "", ["value"] = "", })
		table.insert(textLines, {["key"] = "", ["value"] = "", })
		table.insert(textLines, {["key"] = "", ["value"] = "", })
	end
	
	table.insert(textLines, {["key"] = "Full Hit Points", ["value"] = string.format("%d", monsterTxt.FullHitPoints)})
	table.insert(textLines, {["key"] = "Armor Class", ["value"] = string.format("%d", monsterTxt.ArmorClass)})
	table.insert(textLines, {["key"] = "Level", ["value"] = string.format("%d", monsterTxt.Level)})
	table.insert(textLines, {["key"] = "Debuff Chance", ["value"] = string.format("%s", calculateMonsterDebuffRate(monsterTxt.Level,monsterTxt.MagicResistance))})
	table.insert(textLines, {["key"] = string.format("Att 1: %s %s", attackTypes[monsterTxt.Attack1.Type], (monsterTxt.Attack1.Missile == 0) and "melee" or "ranged"), ["value"] = string.format("%d-%d", monsterTxt.Attack1.DamageAdd + monsterTxt.Attack1.DamageDiceCount, monsterTxt.Attack1.DamageAdd + monsterTxt.Attack1.DamageDiceCount * monsterTxt.Attack1.DamageDiceSides)})
	if monsterTxt.Attack2Chance == 0 then
		table.insert(textLines, {["key"] = "Att 2:", ["value"] = ""})
	else
		table.insert(textLines, {["key"] = string.format("Att 2: %s %s", attackTypes[monsterTxt.Attack2.Type], (monsterTxt.Attack2.Missile == 0) and "melee" or "ranged"), ["value"] = string.format("%d-%d", monsterTxt.Attack2.DamageAdd + monsterTxt.Attack2.DamageDiceCount, monsterTxt.Attack2.DamageAdd + monsterTxt.Attack2.DamageDiceCount * monsterTxt.Attack2.DamageDiceSides)})
	end
	if monsterTxt.SpellChance == 0 then
		table.insert(textLines, {["key"] = "Spell:", ["value"] = ""})
	else
		local spellLevel, spellMastery = SplitSkill(monsterTxt.SpellSkill)
		table.insert(textLines, {["key"] = string.format("Spell: %s (%s.%d)", string.replace(Game.SpellsTxt[monsterTxt.Spell].ShortName, "\"", ""), masteries[spellMastery], spellLevel), ["value"] = ""})
	end
	table.insert(textLines, {["key"] = "Fire", ["value"] = string.format("%d", monsterTxt.FireResistance), ["type"] = "resistance", })
	table.insert(textLines, {["key"] = "Elec", ["value"] = string.format("%d", monsterTxt.ElecResistance), ["type"] = "resistance", })
	table.insert(textLines, {["key"] = "Cold", ["value"] = string.format("%d", monsterTxt.ColdResistance), ["type"] = "resistance", })
	table.insert(textLines, {["key"] = "Poison", ["value"] = string.format("%d", monsterTxt.PoisonResistance), ["type"] = "resistance", })
	table.insert(textLines, {["key"] = "Magic", ["value"] = string.format("%d", monsterTxt.MagicResistance), ["type"] = "resistance", })
	table.insert(textLines, {["key"] = "Phys", ["value"] = string.format("%d", monsterTxt.PhysResistance), ["type"] = "resistance", })

	-- draw info
	
	font = Game.Smallnum_fnt
	local top = 36
	local lineHeight = 11
	local normalKeyMargin = 20
	local normalKeyColor = 0x0000					-- white
	local resistanceKeyMargin = 180
	local resistanceKeyColor = 0xFFC0			-- yellow
	local damageRateKeyMargin = normalKeyMargin
	local damageRateKeyColor = 0x07C0
	local valueRightMargin = 230
	local valueNumberShift = 8
	local normalValueColor = 0x07FE				-- cyan
	local damageRateValueColor = 0xF8C6		-- reddish
	
	for index, tuple in pairs(textLines) do
	
		-- draw key
	
		local keyMargin;
		local keyColor;
	
		if tuple.type == "resistance" then
			keyMargin = resistanceKeyMargin
			keyColor = resistanceKeyColor
		elseif tuple.type == "damageRate" then
			keyMargin = damageRateKeyMargin
			keyColor = damageRateKeyColor
		else
			keyMargin = normalKeyMargin
			keyColor = normalKeyColor
		end
		
		Game.TextBuffer = tuple.key .. string.rep(" ", 100)
		def(dialog, font, keyMargin, top + lineHeight * index, keyColor, str, 0)
		
		-- draw value
		
		local valueColor;
	
		if tuple.type == "damageRate" then
			valueColor = damageRateValueColor
		else
			valueColor = normalValueColor
		end
		
		local valueMargin = valueRightMargin - valueNumberShift * string.len(tuple.value)
		for c in string.gmatch(tuple.value, ".") do
			valueMargin = valueMargin + valueNumberShift
			local adjustedValueMargin = valueMargin
			if c == "-" then
				adjustedValueMargin = adjustedValueMargin + 1
			elseif c == "4" then
				adjustedValueMargin = adjustedValueMargin - 1
			end
			Game.TextBuffer = c .. string.rep(" ", 100)
			def(dialog, font, adjustedValueMargin, top + lineHeight * index, valueColor, str, 0)
		end
		
	end
	
end

mem.hookcall(0x0041D18D, 2, 5, modifiedDrawMonsterInfoName)
