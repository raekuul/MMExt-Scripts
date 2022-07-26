-- skill set groups advancing together within a group for a single character
-- if using with Skill Emphasis, comment out lines 3737 - 3812 in skill-mod.lua

local characterLinkedSkillGroups =
{
	["meleeMain"] =
		{
			[const.Skills.Staff] = true,
			[const.Skills.Axe] = true,
			[const.Skills.Spear] = true,
			[const.Skills.Mace] = true,
		},
	["meleeExtra"] =
		{
			[const.Skills.Sword] = true,
			[const.Skills.Dagger] = true,
		},
	["ranged"] =
		{
			[const.Skills.Bow] = true,
			[const.Skills.Blaster] = true,
		},
	["armor"] =
		{
			[const.Skills.Leather] = true,
			[const.Skills.Chain] = true,
			[const.Skills.Plate] = true,
			[const.Skills.Bodybuilding] = true,
		},
	["elemental"] = 
		{
			[const.Skills.Fire] = true,
			[const.Skills.Air] = true,
			[const.Skills.Water] = true,
			[const.Skills.Earth] = true,
			[const.Skills.Dark] = true,
			[const.Skills.Learning] = true,
		},
	["self"] = 
		{
			[const.Skills.Spirit] = true,
			[const.Skills.Mind] = true,
			[const.Skills.Body] = true,
			[const.Skills.Light] = true,
			[const.Skills.Meditation] = true,
		},
}

-- skills advancing together across whole party

local partyLinkedSkills =
{
	[const.Skills.IdentifyItem] = true,
	[const.Skills.Merchant] = true,
	[const.Skills.Repair] = true,
	[const.Skills.Perception] = true,
	[const.Skills.DisarmTraps] = true,
	[const.Skills.Diplomacy] = true,
}

function skillAdvance(t)
	-- get current player
	
	local currentPlayer = Party.Players[Party.CurrentPlayer]
	
	-- get skill
	
	local skill = t.Param

	-- check if skill is advanceable
	
	local skillLevel, skillMastery = SplitSkill(currentPlayer.Skills[skill])
	local skillAdvanceable = (currentPlayer.SkillPoints >= skillLevel + 1)

	if skillAdvanceable then
	
		-- character linked skills
		
		for key, characterLinkedSkills in pairs(characterLinkedSkillGroups) do
		
			if characterLinkedSkills[skill] ~= nil then
		
				-- advance all other skills to at least same level
				
				for characterLinkedSkill, value in pairs(characterLinkedSkills) do
				
					if characterLinkedSkill ~= skill then
					
						local characterLinkedSkillLevel, characterLinkedSkillMastery = SplitSkill(currentPlayer.Skills[characterLinkedSkill])
					
						if characterLinkedSkillMastery ~= 0 and characterLinkedSkillLevel <= skillLevel then
								currentPlayer.Skills[characterLinkedSkill] = JoinSkill(skillLevel + 1, characterLinkedSkillMastery)
						end
						
					end
					
				end
				
			end
			
		end
		
		-- party linked skills
		
		if partyLinkedSkills[skill] ~= nil then
	
			-- advance same skill for other party members to at least same level
			
			for i = 0, 3 do
			
				if i ~= Party.CurrentPlayer then
				
					local player = Party.Players[i]
				
					local partyLinkedSkillLevel, partyLinkedSkillMastery = SplitSkill(player.Skills[skill])
				
					if partyLinkedSkillMastery ~= 0 and partyLinkedSkillLevel <= skillLevel then
							player.Skills[skill] = JoinSkill(skillLevel + 1, partyLinkedSkillMastery)
					end
					
				end
				
			end
			
		end
		
	end
end 

function events.Action(t)
	-- clicked on skill in skill screen
	if t.Action == 121 then
		skillAdvance(t)
	end
end
