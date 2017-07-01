-- ================ DK ================

-- DK/baseline
-- Death Grip
LCT_SpellData[49576] = {
	class = "DEATHKNIGHT",
	offensive = true,
	cooldown = 25
}
-- Mind Freeze
LCT_SpellData[47528] = {
	class = "DEATHKNIGHT",
	interrupt = true,
	cooldown = 15
}
-- Strangulate
LCT_SpellData[47476] = {
	class = "DEATHKNIGHT",
	silence = true,
	cooldown = 60
}
-- Death and Decay
LCT_SpellData[43265] = {
	class = "DEATHKNIGHT",
	offensive = true,
	duration = 10,
	cooldown = 30
}
-- Icebound Fortitude
LCT_SpellData[48792] = {
	class = "DEATHKNIGHT",
	defensive = true,
	duration = 8,
	cooldown = 180
}
-- Anti-Magic Shell
-- V: changed duration
LCT_SpellData[48707] = {
	class = "DEATHKNIGHT",
	defensive = true,
	duration = 5,
	cooldown = 60
}
-- Empower Rune Weapon
LCT_SpellData[47568] = {
	class = "DEATHKNIGHT",
	offensive = true,
	cooldown = 300
}
-- Army of the Dead
LCT_SpellData[42650] = {
	class = "DEATHKNIGHT",
	offensive = true,
	duration = 40,
	cooldown = 600
}
-- Outbreak
LCT_SpellData[77575] = {
	class = "DEATHKNIGHT",
	offensive = true,
	cooldown = 60
}
-- Dark Simulacrum
LCT_SpellData[77606] = {
	class = "DEATHKNIGHT",
	duration = 8,
	cooldown = 60
}


-- DK/talent
-- Plague Leech
LCT_SpellData[123693] = {
	class = "DEATHKNIGHT",
	talent = true,
	offensive = true,
	cooldown = 25
}
-- Unholy Blight
LCT_SpellData[115989] = {
	class = "DEATHKNIGHT",
	talent = true,
	offensive = true,
	cooldown = 90
}
-- Anti-Magic Zone
LCT_SpellData[51052] = {
	class = "DEATHKNIGHT",
	talent = true,
	defensive = true,
	duration = 10,
	cooldown = 120
}
-- Lichborne
LCT_SpellData[49039] = {
	class = "DEATHKNIGHT",
	talent = true,
	offensive = true,
	defensive = true,
	duration = 10,
	cooldown = 120
}
-- Asphyxiate
LCT_SpellData[108194] = {
	class = "DEATHKNIGHT",
	talent = true,
	stun = true,
	silence = true,
	cooldown = 30
}
-- Death's Advance
--V: removed in legion
--LCT_SpellData[96268] = {
--	class = "DEATHKNIGHT",
--	talent = true,
--	defensive = true,
--	duration = 6,
--	cooldown = 30
--}
-- Death Pact
LCT_SpellData[48743] = {
	class = "DEATHKNIGHT",
	talent = true,
	heal = true,
	cooldown = 120
}
-- Desecrated Ground
LCT_SpellData[108201] = {
	class = "DEATHKNIGHT",
	talent = true,
	defensive = true,
	duration = 10,
	cooldown = 120
}
-- Gorefiend's Grasp
LCT_SpellData[108199] = {
	class = "DEATHKNIGHT",
	talent = true,
	cc = true,
	cooldown = 60
}
-- Remorseless Winter
--V: removed in legion 
--LCT_SpellData[108200] = {
--	class = "DEATHKNIGHT",
--	talent = true,
--	stun = true,
--	duration = 8,
--	cooldown = 60
--}


-- DK/250 - Blood
-- Vampiric Blood
LCT_SpellData[55233] = {
	class = "DEATHKNIGHT",
	specID = { 250 },
	heal = true,
	defensive = true,
	duration = 10,
	cooldown = 90
}
-- Bone Shield
--V: removed in legion 
--LCT_SpellData[49222] = {
--	class = "DEATHKNIGHT",
--	specID = { 250 },
--	defensive = true,
--	cooldown = 60
--}
-- Dancing Rune Weapon
LCT_SpellData[49028] = {
	class = "DEATHKNIGHT",
	specID = { 250 },
	offensive = true,
	defensive = true,
	duration = 12,
	cooldown = 90
}
-- Rune Tap
--V: removed in legion 
--LCT_SpellData[48982] = {
--	class = "DEATHKNIGHT",
--	specID = { 250 },
--	heal = true,
--	charges = 2,
--	cooldown = 30
--}
-- Soul Reaper
--LCT_SpellData[114866] = {
--	class = "DEATHKNIGHT",
--	specID = { 250 },
--	offensive = true,
--	cooldown = 6
--}
-- DK/251 - Frost
-- Pillar of Frost
LCT_SpellData[51271] = {
	class = "DEATHKNIGHT",
	specID = { 251 },
	offensive = true,
	defensive = true,
	duration = 20,
	cooldown = 60
}
-- Soul Reaper
--V: removed in legion 
--LCT_SpellData[130735] = {
--	class = "DEATHKNIGHT",
--	specID = { 251 },
--	offensive = true,
--	cooldown = 6
--}
-- DK/252 - Unholy
-- Raise Dead
LCT_SpellData[46584] = {
	class = "DEATHKNIGHT",
	specID = { 252 },
	cooldown = 60
}
-- Summon Gargoyle
LCT_SpellData[49206] = {
	class = "DEATHKNIGHT",
	specID = { 252 },
	offensive = true,
	duration = 40,
	cooldown = 180
}
-- Soul Reaper
LCT_SpellData[130736] = {
	class = "DEATHKNIGHT",
	specID = { 252 },
	offensive = true,
	cooldown = 6
}

-- DK/pet
-- Gnaw
LCT_SpellData[47481] = {
	class = "DEATHKNIGHT",
	pet = true,
	stun = true,
	cooldown = 60
}
LCT_SpellData[91800] = 47481
-- Huddle
LCT_SpellData[47484] = {
	class = "DEATHKNIGHT",
	pet = true,
	defensive = true,
	duration = 10,
	cooldown = 45
}
LCT_SpellData[91838] = 47484
-- Leap (Unholy)
LCT_SpellData[47482] = {
	class = "DEATHKNIGHT",
	pet = true,
	interrupt = true,
	cc = true,
	cooldown = 30
}
-- Leap
LCT_SpellData[91809] = {
	class = "DEATHKNIGHT",
	pet = true,
	cooldown = 30
}
-- Monstruous Blow
LCT_SpellData[91797] = {
	class = "DEATHKNIGHT",
	pet = true,
	offensive = true,
	stun = true,
	cooldown = 60
}
-- Putrid Bulwark
LCT_SpellData[91837] = {
	class = "DEATHKNIGHT",
	pet = true,
	defensive = true,
	duration = 10,
	cooldown = 45
}
-- Shambling Rush
LCT_SpellData[91802] = {
	class = "DEATHKNIGHT",
	pet = true,
	interrupt = true,
	cc = true,
	cooldown = 30
}
-- V: added in legion
-- Wraith Walk
LCT_SpellData[212552] = {
	class = "DEATHKNIGHT",
	offensive = true,
	duration = 3,
	cooldown = 45
}
-- Artifact - Sindragosa's Fury
LCT_SpellData[190778] = {
	class = "DEATHKNIGHT",
	specID = { 251 },
	offensive = true,
	duration = 10,
	cooldown = 300
}
-- Obliteration
LCT_SpellData[207256] = {
	class = "DEATHKNIGHT",
	specID = { 251 },
	offensive = true,
	duration = 8,
	cooldown = 90
}
-- Breath of Sindragosa
-- V: note: continues until power is exhausted (??)
LCT_SpellData[152279] = {
	class = "DEATHKNIGHT",
	specID = { 251 },
	offensive = true,
	duration = 10,
	cooldown = 120
}
-- Corpse shield
LCT_SpellData[49206] = {
	class = "DEATHKNIGHT",
	specID = { 252 },
	defensive = true,
	cooldown = 60
}