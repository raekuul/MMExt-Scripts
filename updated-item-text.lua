-- disambiguated item names and clearer item descriptions
-- last updated 2025-10-05

commonNotes = { 
			["AnonItem"] = "FOR TESTING USE ONLY.",
			["Pouch"] = "A leather pouch for holding... things?",
			["Unused Letter"] = "A scrap of paper that makes no sense.",
			["Map"] = "A map of... somewhere?",
			["Oracle"] = "One of four Memory Crystals needed to reawaken the Oracle.",
			["Twillen"] = "One of five statues for Twillen's Ritual.  This one goes to %1s.",
			["Lumbra"] = "One of three statues for Thom Lumbra's request.  This one goes to the shrine in %1s.",
			["Collection"] = "One of the %1s requested by %2s in %3s.  Useless without the full set.",
			["VARN"] = "One of six passwords needed to access the Well of VARN.",
			["Scavenger"] = "One of the six items needed for Lord Markham's scavenger hunt on Emerald Island.",
			["Golem"] = "One of the six golem parts needed to assemble a complete golem.  Speak to your Golem Spirit to assemble it.",
			["Letter"] = "A letter from %1s to %2s.",
			["Quest"] = "Take this to %1s in %2s.",
			["Reagent"] = "A %1s reagent for potion making.",
			["Goods"] = "Sell this to %1s in %2s.",
			["Ore"] = "%1s tier ore.\n\nCan be converted to weapons, armor, or items at the appropriate houses.",
			["MAW Map"] = "Using this will teleport you to the entrance of %1s.",
			["Sealed"] = "A magically sealed letter.  You are unable to read to whom it is addressed.",
}

overrides = {
	[6] = {
		newItemNames = { 
			[456] = "Melian's Control Cube",
			[487] = "Inner Forge Key",
			[488] = "Snergle's Chamber Key",
			[489] = "Goblinwatch Key",
			[502] = "Proof of Betrayal",
			[545] = "Letter from King Roland",
			[555] = "West Bathhouse Key",
			[556] = "East Storage Key",
			[557] = "South Treasure Key",
			[559] = "Fire Lord's Key",
			[560] = "Hideout Room Key",
			[561] = "East Bathhouse Key",
			[562] = "West Storage Key",
			[563] = "North Treasure Key",
			[564] = "Kergmond's Key",
			[565] = "Warlord's Supply Key 1",
			[566] = "Tsantsa Jail Key",
			[568] = "Alamos Treasury Key",
			[569] = "Alamos Teleporter Key",
			[571] = "Warlord's Supply Key 2",
			[572] = "Dwarf Jail Key",
			[576] = "Library Chest Key",
			[578] = "Takao's Key"
		},

		newItemNotes = {
			[430] = commonNotes["Pouch"],
			[431] = commonNotes["Pouch"],
			[432] = commonNotes["Pouch"],
			[433] = string.format(commonNotes["Quest"], "Albert Newton", "the Misty Islands"),
			[434] = string.format(commonNotes["Quest"], "the rebuilt temple", "Free Haven"),
			[435] = "This item reveals the current health of monsters.",
			[446] = string.format(commonNotes["Quest"], "Prince Nicolai", "Castle Ironfist"),
			[448] = string.format(commonNotes["Quest"], "Loretta Fliese","Silver Cove"),
			[449] = string.format(commonNotes["Quest"], "Andover Potbello","New Sorpigal"),
			[450] = string.format(commonNotes["Twillen"], "Sweet Water"),
			[451] = string.format(commonNotes["Twillen"], "Kriegspire"),
			[452] = string.format(commonNotes["Twillen"], "the Mire of the Damned"),
			[453] = string.format(commonNotes["Twillen"], "Dragonsand"),
			[454] = string.format(commonNotes["Twillen"], "Bootleg Bay"),
			[455] = string.format(commonNotes["Letter"], "Xenofex", "Sulman") .. "\n" .. string.format(commonNotes["Quest"], "Wilbur Humphrey", "Castle Ironfist"),
			[456] = "Not interchangeable with other control cubes.\n"..string.format(commonNotes["Quest"], "the Oracle", "Free Haven"),
			[457] = string.format(commonNotes["Quest"], "Albert Newton", "the Misty Islands"),
			[458] = string.format(commonNotes["Quest"], "the ghost of Balthazar", "the Lair of the Wolf"),
			[459] = string.format(commonNotes["Quest"], "the ghost of Balthazar", "the Lair of the Wolf"),
			[461] = string.format(commonNotes["Quest"], "Archibald Ironfist", "the library above Castle Ironfist"),
			[462] = string.format(commonNotes["Goods"], "Lawrence Aleman", "Free Haven"),
			[463] = "Awards two Skill Points on use.",
			[464] = string.format(commonNotes["Quest"], "Gabriel Cartman", "Free Haven"),
			[465] = string.format(commonNotes["Goods"], "Lon Miller", "Free Haven"),
			[466] = "This will absorb radiation in the Tomb of VARN.",
			[470] = "Worth one Circus Point at the Main Tent.\n" .. string.format(commonNotes["Goods"], "Davis Carp", "Free Haven"),
			[471] = "Worth three Circus Points at the Main Tent.\n" .. string.format(commonNotes["Goods"], "Bonnie Rotterdamn", "Free Haven"),
			[472] = "The Circus Master gives you this for 30 or more points.\nTrade these for equipment in Dragonsand.",
			[473] = "The Circus Master gives you this for 10 or more points.\nTrade these for equipment in Dragonsand.",
			[474] = string.format(commonNotes["Goods"], "Hejaz Mawsil", "New Sorpigal"),
			[475] = string.format(commonNotes["Quest"], "Janice", "New Sorpigal"),
			[476] = string.format(commonNotes["Goods"], "Sy Roth", "Free Haven"),
			[477] = "Worth five Circus Points at the Main Tent.\n" .. string.format(commonNotes["Goods"], "Geoff Southy", "Free Haven"),
			[479] = string.format(commonNotes["Quest"], "Andrew Vesper", "Castle Ironfist"),
			[480] = string.format(commonNotes["Quest"], "Emil Lime", "Kriegspire"),
			[481] = string.format(commonNotes["Quest"], "Buford T. Allman", "New Sorpigal"),
			[482] = "Used to unward the doors in the Hall of the Fire Lord.\n" ..  string.format(commonNotes["Goods"], "Dillan Robinson", "Free Haven"),
			[483] = string.format(commonNotes["Goods"], "Bendar Jahrom", "Dragonsand"),
			[485] = "Wear this to gain entry to the Supreme Temple of Baa in Kriegspire.",
			[486] = string.format(commonNotes["Quest"], "Erik von Stromgard", "the Frozen Highlands") .. "\nUse these to disable the Dragon Towers across Enroth.",
			[487] = "The key to the deeper parts of Gharik's Laboratory in New Sorpigal.",
			[488] = "The key to the deeper parts of Snergle's Caverns in Castle Ironfist.",
			[489] = "The key to Goblinwatch in New Sorpigal.",
			[490] = "Key #490, used to unlock an unknown lock.", -- I wasn't able to find this key's use condition in the decomp
			[491] = "Key #491, used to unlock an unknown lock.", -- I wasn't able to find this key's use condition in the decomp
			[492] = "One of two keys needed to open the locked chest in the Supreme Temple of Baa in Kriegspire.",
			[493] = commonNotes["Map"],
			[494] = commonNotes["Map"],
			[495] = commonNotes["Map"],
			[496] = commonNotes["Map"],
			[497] = commonNotes["Map"],
			[498] = string.format(commonNotes["Quest"], "Avinril Smythers", "Darkmoor"),
			[499] = string.format(commonNotes["Quest"], "Wilbur Humphrey", "Castle Ironfist"),
			[500] = commonNotes["Unused Letter"],
			[501] = commonNotes["Unused Letter"],
			[502] = string.format(commonNotes["Letter"], "Xenofex", "Slicker Silvertongue") .. "\n" .. string.format(commonNotes["Quest"], "Wilbur Humphrey", "Castle Ironfist"),
			[503] = string.format(commonNotes["Letter"], "Gerrard Blackames", "Jarvis") .. "\n" .. string.format(commonNotes["Quest"], "Charles d'Sorpigal", "the Misty Islands"),
			[504] = string.format(commonNotes["Letter"], "the Prince of Thieves", "Damian") .. "\n" .. string.format(commonNotes["Quest"], "Frank Fairchild", "New Sorpigal"),
			[505] = string.format(commonNotes["Letter"], "Xenofex", "Sulman") .. "\n" .. string.format(commonNotes["Quest"], "Andover Potbello", "New Sorpigal"),
			[506] = string.format(commonNotes["Quest"], "Osric Temper", "Free Haven"),
			[507] = "A record of the Temple of the Sun's activities in Enroth.",
			[508] = string.format(commonNotes["Letter"], "Osric Temper", "Kergmond the Warlord") .. "\n" .. string.format(commonNotes["Quest"], "Osric Temper", "Free Haven"),
			[509] = string.format(commonNotes["Letter"], "Xenofex", "an unknown recipient"),
			[510] = string.format(commonNotes["Letter"], "Cedric Druthers", "an unknown recipient"),
			[511] = "The riddle of the Monolith is contained within.",
			[512] = string.format(commonNotes["Letter"], "Lunstone", "Snergle"),
			[513] = string.format(commonNotes["Letter"], "the Prince of Thieves", "an unknown recipient"),
			[514] = commonNotes["Unused Letter"],
			[515] = string.format(commonNotes["Letter"], "Xenofex", "Gerrard Blackames"),
			[516] = string.format(commonNotes["Letter"], "Fetzil", "the Prince of Thieves"),
			[517] = commonNotes["Unused Letter"],
			[518] = "A diary page detailing an attack on the village of Kriegspire.",
			[519] = "A diary page from the mad artificer Agar.",
			[520] = "The remains of a diary page from Icewind Keep.",
			[521] = string.format(commonNotes["Letter"], "the Dragon Riders", "the occupiers of Icewind Keep"),
			[522] = string.format(commonNotes["Letter"], "the Temple of Baa", "the Temple of the Fist"),
			[523] = "A diary page detailing a failed attempt at attacking New Sorpigal.",
			[524] = commonNotes["Unused Letter"],
			[525] = string.format(commonNotes["Letter"], "Snergle", "his iron mines"),
			[526] = commonNotes["Unused Letter"],
			[527] = "A diary page detailing Corlagon's struggles with the Crystal of Terrax.",
			[528] = string.format(commonNotes["Letter"], "Gerrard Blackames", "Marcus"),
			[529] = "A diary page detailing Gharik's frustrations with Archibald Ironfist.",
			[530] = string.format(commonNotes["Letter"], "Cedric Druthers", "his order of Druids"),
			[531] = string.format(commonNotes["Letter"], "Archibald Ironfist", "Terrax"),
			[532] = "A loose page warning of some of the dangers of the Ritual of the Endless Night.",
			[533] = "A loose page detailing a failed raid on the Hall of the Fire Lord.",
			[534] = string.format(commonNotes["Letter"], "Archibald Ironfist", "Agar"),
			[535] = string.format(commonNotes["Letter"], "Archibald Ironfist", "Gharik"),
			[536] = "A scrap of paper indicating how the Shadow Guildhall is connected to their other haunts.",
			[537] = commonNotes["VARN"],
			[538] = commonNotes["VARN"],
			[539] = commonNotes["VARN"],
			[540] = commonNotes["VARN"],
			[541] = commonNotes["VARN"],
			[542] = commonNotes["VARN"],
			[543] = "The operating instructions for the Goblinwatch Gate.\n" .. string.format(commonNotes["Quest"],"Janice","New Sorpigal"),
			[544] = "Ancient Magic that will protect Enroth from the Kreegan Hive's destruction.",
			[545] = "The final words of King Roland Ironfist of Enroth.",
			[546] = "A strange, scroll-like object with a vaguely insulting message.",
			[547] = commonNotes["Unused Letter"],
			[548] = commonNotes["Unused Letter"],
			[549] = commonNotes["Unused Letter"],
			[550] = commonNotes["Oracle"], 
			[551] = commonNotes["Oracle"],
			[552] = commonNotes["Oracle"],
			[553] = commonNotes["Oracle"],
			[555] = "The key to the West Bathhouse in the Temple of Baa in Castle Ironfist.",
			[556] = "The key to the East Storage Room in the Temple of Baa in Castle Ironfist.",
			[557] = "The key to the South Treasure Room in the Temple of Baa in Castle Ironfist.",
			[558] = "The key to the hidden door in the Temple of Baa in Castle Ironfist.",
			[559] = "The key to the locked chest in the Hall of the Fire Lord in Bootleg Bay.",
			[560] = "The key to the locked room in the Shadow Guild Hideout in Castle Ironfist.",
			[561] = "The key to the East Bathhouse in the Temple of Baa in Castle Ironfist.",
			[562] = "The key to the West Storage Room in the Temple of Baa in Castle Ironfist.",
			[563] = "The key to the North Treasure Room in the Temple of Baa in Castle Ironfist.",
			[564] = "The key to a small room in the Warlord's Fortress in Silver Cove.",
			[565] = "One of two keys needed to open the Supply Room in the Warlord's Fortress in Silver Cove.",
			[566] = "The key to the locked room in the Temple of Tsantsa in Bootleg Bay.",
			[567] = "One of two keys needed to open the locked chest in the Supreme Temple of Baa in Kriegspire.",
			[568] = "The key to the treasure room in Castle Alamos in the Eel-Infested Waters.",
			[569] = "The key to the teleporter room in Castle Alamos in the Eel-Infested Waters.",
			[570] = "The key to the Inner Sanctum of The Kreegan Hive in Sweet Water.",
			[571] = "One of two keys needed to open the Supply Room in the Warlord's Fortress in Silver Cove.",
			[572] = "The key to the jail in Snergle's Iron Mines in the Mire of the Damned.",
			[573] = "The key to the Water Temple in the Tomb of VARN beneath Dragonsand.",
			[574] = "The key to the Flame Door in the Tomb of VARN beneath Dragonsand.",
			[575] = "The key to the Back Door in the Tomb of VARN beneath Dragonsand.",
			[576] = "The key to the chest in the Library of the Tomb of VARN beneath Dragonsand.",
			[577] = "The key to the Chest of VARN deep below Dragonsand.",
			[578] = "The key to the locked room beneath Takao's House in the Free Haven Sewers.",
		},
	},
	[7] = { 
		newItemNames = {
			[542] = "The Perfect Bow?",
			[601] = "Personal Lich Jar",
			[602] = "Case of Jars",
			[606] = "Davrik's Signet Ring",
			[615] = "Empty Lich Jar",
			[620] = "Stolen Tapestry",
			[624] = "Stolen Vase",
			[629] = "Dwarven Elixir",
			[655] = "Barrow IX Key",
			[656] = "Barrow VII Key",
			[657] = "Barrow X Key",
			[675] = "Terran Control Cube",
			[676] = "Right Altar Piece",
			[677] = "Left Altar Piece",
		},
		
		newItemNotes = { 
			[540] = string.format(commonNotes["Quest"], "Seknit Undershadow", "Deyja"),
			[542] = "\nLight: " .. string.format(commonNotes["Quest"], "that one archer guy", "Harmondale") .."\nDark: "..string.format(commonNotes["Quest"], "Steagal Snick", "AvLee"),
			[544] = string.format(commonNotes["Quest"], "Stephen Sand", "the Pit"),
			[600] = string.format(commonNotes["Quest"], "The Oldest Tree", "the Tularean Forest"),
			[602] = "\nLight: " .. string.format(commonNotes["Quest"], "Sir Caneghem", "Celeste") .."\nDark: "..string.format(commonNotes["Quest"], "Maximus", "the Pit"),
			[603] = string.format(commonNotes["Quest"], "Norbert Thrush", "Erathia"),
			[604] = "We're still not sure how or why they work for dragons.",
			[605] = "Light: " .. string.format(commonNotes["Quest"], "Resurrectra", "Castle Lambent") .."\nDark: "..string.format(commonNotes["Quest"], "Kastore", "Castle Gloaming"),
			[606] = string.format(commonNotes["Quest"], "Davrik Peladium", "Harmondale"),
			[607] = string.format(commonNotes["Quest"], "the Faerie King", "AvLee"),
			[614] = string.format(commonNotes["Quest"], "Lord Markham", "Tatalia"),
			[615] = string.format(commonNotes["Quest"], "Halfgild Wynac", "the Pit"), 
			[617] = string.format(commonNotes["Lumbra"], "AvLee"),
			[618] = string.format(commonNotes["Lumbra"], "Tatalia"),
			[619] = string.format(commonNotes["Lumbra"], "the Bracada Desert"),
			[620] = string.format(commonNotes["Quest"], "Niles Stantley", "Tatalia"),
			[621] = string.format(commonNotes["Collection"], "paintings", "Ferdinand Visconti", "Tatalia"),
			[622] = string.format(commonNotes["Collection"], "paintings", "Ferdinand Visconti", "Tatalia"),
			[623] = string.format(commonNotes["Collection"], "paintings", "Ferdinand Visconti", "Tatalia"),
			[624] = string.format(commonNotes["Quest"], "William Lasker", "the Erathian Sewers"),
			[626] = string.format(commonNotes["Quest"], "the concealed tomb", "the dwarven barrows"),
			[628] = string.format(commonNotes["Quest"], "Mazim Dusk", "Nighon"),
			[629] = "Sadly, it's keyed to the seven Keldin brothers - it won't help you.",
			[631] = commonNotes["Scavenger"],
			[632] = commonNotes["Scavenger"],
			[633] = string.format(commonNotes["Quest"], "Johann Kerrid", "the Tularean Forest"),
			[634] = "AvLee Vassalage: " .. string.format(commonNotes["Quest"], "King Eldrich Parson", "Castle Navan") .. "\nErathian Vassalage: " .. string.format(commonNotes["Quest"], "Queen Catherine Ironfist", "Castle Gryphonheart") .. "\nIndependent Harmondale: " .. string.format(commonNotes["Quest"], "the Arbiter", "Harmondale"),
			[635] = commonNotes["Scavenger"],
			[636] = commonNotes["Scavenger"],
			[638] = string.format(commonNotes["Quest"], "Gary Zimm", "the Bracada Desert"),
			[639] = commonNotes["Golem"],
			[640] = commonNotes["Golem"],
			[641] = commonNotes["Golem"],
			[642] = commonNotes["Golem"],
			[643] = commonNotes["Golem"],
			[644] = commonNotes["Golem"],
			[645] = commonNotes["Golem"],			
			[646] = "Awards two Skill Points on use.",
			[647] = string.format(commonNotes["Quest"], "Tor Anwyn", "Nighon"),
			[648] = string.format(commonNotes["Quest"], "Tarin Withern", "Harmondale"),
			[651] = "Show it to Darron Temper in Harmondale.\nRequired in order to participate in the Erathian Arcomage tournament.",
			[652] = "One of three keys needed to pass within the Walls of Mist in Celeste.",
			[653] = "One of three keys needed to pass within the Walls of Mist in Celeste.",
			[654] = "One of three keys needed to pass within the Walls of Mist in Celeste.",
			[655] = "The key that protects the secrets of Barrow IX in the Barrow Downs.",
			[656] = "The key that protects the secrets of Barrow VII in the Barrow Downs.",
			[657] = "The key that protects the secrets of Barrow X in the Barrow Downs.",
			[658] = string.format(commonNotes["Quest"], "Lord Markham", "Emerald Island"),
			[659] = "The key to the locked room in William Setag's Tower in Deyja.",
			[660] = "The key to the locked doors in Castle Gryphonheart in Erathia.",
			[661] = "The key to the inner sanctum of Colony Zod in Eofol.",
			[662] = "The key to the secret loft in the Faerie Mound of AvLee.",
			[675] = "Not interchangeable with other control cubes.\nLight: "..string.format(commonNotes["Quest"], "Robert the Wise", "Celeste").."\nDark: "..string.format(commonNotes["Quest"], "Tolberti", "the Pit"),
			[676] = "Useless without the other half.\nLight: "..string.format(commonNotes["Quest"], "Resurrectra", "Celeste").."\nDark: "..string.format(commonNotes["Quest"], "Kastore", "the Pit"),
			[677] = "Useless without the other half.\nLight: "..string.format(commonNotes["Quest"], "Resurrectra", "Celeste").."\nDark: "..string.format(commonNotes["Quest"], "Kastore", "the Pit"),
			[683] = string.format(commonNotes["Quest"], "Daedalus Falk", "Deyja"),
			[686] = string.format(commonNotes["Ore"],"Iron"),
			[687] = string.format(commonNotes["Ore"],"Poor"),
			[688] = string.format(commonNotes["Ore"],"Average"),
			[689] = string.format(commonNotes["Ore"],"Good"),
			[690] = string.format(commonNotes["Ore"],"Great"),
			[691] = string.format(commonNotes["Ore"],"Best"),
			[692] = string.format(commonNotes["Goods"], "Pip Hiller", "Erathia"),
			[693] = string.format(commonNotes["Goods"], "Robert Belknap", "the Tularean Forest"),
			[694] = string.format(commonNotes["Goods"], "Rydric", "Harmondale"),
			[695] = string.format(commonNotes["Goods"], "Arvin Beneclowd", "the Barrow Downs"),
			[696] = string.format(commonNotes["Goods"], "Infernon", "AvLee"),
			[697] = string.format(commonNotes["Goods"], "Calindra Goldensight", "Tatalia"),
			[705] = string.format(commonNotes["Quest"], "King Eldrich Parson", "Castle Navan"),
			[706] = string.format(commonNotes["Quest"], "King Eldrich Parson", "Castle Navan").." ..if you dare.",
		},
	},
	[8] = { 
		newItemNames = { 
			[617] = "Brekish Onefang's Connector Stone",
			[618] = "Frederick Talimere's Connector Stone",
			[750] = "High Nestmaster's Journal",
			[733] = "Vampire Journals #1",
			[734] = "Vampire Journals #2",
			[735] = "Vampire Journals #3",
			[736] = "Vampire Journals #4",
			[737] = "Vampire Journals #5",
			[738] = "Vampire Journals #6",
			[739] = "Vampire Journals #7",
			[740] = "Vampire Journals #8",
		},
		newItemNotes = { 
			[516] = string.format(commonNotes["Quest"], "Lathius","Ravenshore"),
			[539] = string.format(commonNotes["Quest"], "Sir Charles Quixote", "Garrote Gorge"),
			[541] = string.format(commonNotes["Quest"], "Deftclaw Redreaver", "Garrote Gorge"),
			[541] = string.format(commonNotes["Quest"], "Dadeross", "Dagger Wound Island"),
			
			[603] = string.format(commonNotes["Quest"], "the deepest tomb", "the troll crypt in Ironsand Desert"),
			[604] = string.format(commonNotes["Quest"], "Sandro", "Shadowspire"),
			[605] = "Hunters: " .. string.format(commonNotes["Quest"], "Sir Charles Quixote", "Garrote Gorge") .. "\nDragons: " .. string.format(commonNotes["Quest"], "Deftclaw Redreaver", "Garrote Gorge"),
			[606] = string.format(commonNotes["Collection"], "elemental heartstones", "Xanthor", "Ravenshore"),
			[607] = string.format(commonNotes["Collection"], "elemental heartstones", "Xanthor", "Ravenshore"),
			[608] = string.format(commonNotes["Collection"], "elemental heartstones", "Xanthor", "Ravenshore"),
			[609] = string.format(commonNotes["Collection"], "elemental heartstones", "Xanthor", "Ravenshore"),
			[610] = "Used to enter into Escaton's Crystal in Ravenshore.",
			[611] = string.format(commonNotes["Quest"], "Vetrinus Taleshire","Shadowspire"),
			[612] = string.format(commonNotes["Quest"], "Lathaen","Shadowspire") .. "\nUseless without Korbu's Remains.",
			[613] = "Not interchangeable with other Control Cubes.\n" .. string.format(commonNotes["Quest"], "Benefice","Shadowspire"),
			[614] = string.format(commonNotes["Quest"], "Hallien","Shadowspire"),
			[615] = string.format(commonNotes["Quest"], "Zelim","Garrote Gorge"),
			[616] = string.format(commonNotes["Quest"], "Languid","Dagger Wound Islands"),
			[617] = "Used to activate the teleporter on the southern edge of the big island of the Dagger Wound Islands.\n" .. string.format(commonNotes["Quest"], "Frederick Talimere", "Dagger Wound Islands"),
			[618] = "Used to activate the teleporter on the smaller Island in the Dagger Wound Islands.",
			[619] = "Unlocks the concealed chest in the Pirate Outpost in the Dagger Wound Islands.",
			[620] = "The key to one of the prison cells in the Ogre Raiding Fort in Alvar.",
			[621] = "The key to one of the prison cells in the Ogre Raiding Fort in Alvar.",
			[623] = string.format(commonNotes["Quest"], "Blazen Stormlance","Mad Necromancer's Lab in Shadowspire"),
			[626] = string.format(commonNotes["Quest"], "Stephan", "Murmurwoods"),
			[628] = string.format(commonNotes["Quest"], "Vetrinus Taleshire", "Shadowspire"),
			[629] = "Used to unlock the prisons of the four elemental lords in the Plane between the Planes.",
			[630] = string.format(commonNotes["Quest"], "Hiss", "Dagger Wound Islands"),
			[632] = string.format(commonNotes["Goods"], "Reaver", "Ravenshore"),
			[633] = string.format(commonNotes["Goods"], "Maddigan the Tracker","Ravenshore"),
			[635] = string.format(commonNotes["Goods"], "Schmecker", "the Ironsand Desert"),
			[636] = string.format(commonNotes["Quest"], "Calandril", "Garrote Gorge") .. "\n" .. string.format(commonNotes["Quest"], "Balion Tearwing", "Garrote Gorge"),
			[637] = string.format(commonNotes["Quest"], "Tantillion", "Shadowspire"),
			[640] = string.format(commonNotes["Goods"], "Xevius","Ravage Roaming"),
			[643] = string.format(commonNotes["Goods"], "Treblid", "Ravenshore"),
			[644] = string.format(commonNotes["Goods"], "Gibere", "Alvar"),
			[645] = string.format(commonNotes["Goods"], "Long-Tail", "Dagger Wound Islands"),
			[646] = string.format(commonNotes["Goods"], "Whisper","Shadowspire"),
			[647] = string.format(commonNotes["Goods"], "Pavel","Regna"),
			[648] = string.format(commonNotes["Goods"], "Mylander","Murmurwoods"),
			[649] = string.format(commonNotes["Goods"], "Neblick","Ravenshore"),
			[650] = string.format(commonNotes["Goods"], "Gagnor","Ravage Roaming"),
			[651] = string.format(commonNotes["Goods"], "Journey","Shadowspire"),
			[652] = string.format(commonNotes["Quest"], "Pascella Tisk", "Dagger Wound Islands"),
			[653] = string.format(commonNotes["Goods"], "Keldon","Alvar"),
			[654] = string.format(commonNotes["Goods"], "Veldon","Alvar"),
			[658] = string.format(commonNotes["Collection"], "rare cheeses", "Asahel Fromago", "Alvar"),
			[659] = string.format(commonNotes["Collection"], "rare cheeses", "Asahel Fromago", "Alvar"),
			[660] = string.format(commonNotes["Collection"], "rare cheeses", "Asahel Fromago", "Alvar"),
			[661] = "The key to the Vault of Time in Ravenshore.",
			[662] = "Intended to sink the joint Enrothian/Erathian fleet.\nProbably should be used to sink the Regnan Fleet instead.",
			[686] = string.format(commonNotes["Ore"], "Worst"),
			[687] = string.format(commonNotes["Ore"], "Poor"),
			[688] = string.format(commonNotes["Ore"], "Average"),
			[689] = string.format(commonNotes["Ore"], "Good"),
			[690] = string.format(commonNotes["Ore"], "Great"),
			[691] = string.format(commonNotes["Ore"], "Best"),
			[732] = string.format(commonNotes["Quest"], "Masul", "Balthazar Lair") .. "\nBe sure to bring the Axe of Balthazar with you.",
			[741] = string.format(commonNotes["Quest"], "Elgar Fellmoon", "Ravenshore"),
			[742] = string.format(commonNotes["Quest"], "Arion Hunter", "his lair near Ravenshore"),
			[800] = string.format(commonNotes["Collection"], "rare cheeses", "Asahel Fromago", "Alvar"),
			[801] = string.format(commonNotes["Collection"], "rare cheeses", "Asahel Fromago", "Alvar"),
			[802] = string.format(commonNotes["Collection"], "rare cheeses", "Asahel Fromago", "Alvar"),
		},
	},
	["Merge"] = { 
		newItemNames = { },
		newItemNotes = { 

		},
	},
}

itemTableIndexOffsets = {
	[6] = 1620,		-- MM6 Mage Dagger (3rd/4th spellbooks are duplicated, so the offset needs an offset)
	[7] = 802,		-- MM8 Ball of Dunduck (for some reason the mm7 null item didn't get put in)
	[8] = 0			-- MM8 null element
}

--- and now, the functions for injecting the new names/descriptions
function testGameEnvironment()
	if (isThisMerge() == true) then
		return "Merge"
	else
		return Game.Version
	end
end

function isThisMerge()
	output = false
	for k = 0, Game.ItemsTxt.high do
		if (Game.ItemsTxt[k].Name == "Telelocator") then
			output = true
		end
	end
	return output
end

function buildMergeItemTable()
	for game,offset in pairs(itemTableIndexOffsets) do
		for key,value in pairs(overrides[game].newItemNames) do
			q = key + offset
			if (overrides["Merge"].newItemNames[key] == nil) then
				overrides["Merge"].newItemNames[q] = value
			end
		end
		for key,value in pairs(overrides[game].newItemNotes) do
			q = key + offset
			if (overrides["Merge"].newItemNotes[q] == nil) then
				overrides["Merge"].newItemNotes[q] = value
			end
		end
	end
end

function setNewItemNames(gametype)
	for itemID = 0, Game.ItemsTxt.high do
		if not (overrides[gametype].newItemNames[itemID] == nil) then
			Game.ItemsTxt[itemID]["Name"] = overrides[gametype].newItemNames[itemID]
		end
	end
end

function setNewItemNotes(gametype)
	for itemID = 0, Game.ItemsTxt.high do
		if not (overrides[gametype].newItemNotes[itemID] == nil) then
			Game.ItemsTxt[itemID]["Notes"] = overrides[gametype].newItemNotes[itemID]
		end
		Game.ItemsTxt[itemID]["Notes"] = "ID " .. itemID .. "\n" .. Game.ItemsTxt[itemID]["Notes"]
	end
end

function events.GameInitialized2()
	gametype = testGameEnvironment()
	if (gametype == "Merge") then
		buildMergeItemTable()
	end
	setNewItemNames(gametype)
	setNewItemNotes(gametype)
end
