-- ================ DRUID ================

-- Specs
-- 102 balance
-- 103 feral
-- 104 guardian
-- 105 resto

-- Druid/baseline
-- Barkskin (except feral)
LCT_SpellData[22812] = {
	class = "DRUID",
	specID = { 102, 104, 105 },
	defensive = true,
	duration = 12,
	cooldown = 60
}
-- Dash
LCT_SpellData[1850] = {
	class = "DRUID",
	duration = 15,
	cooldown = 180
}
-- Stampeding Roar
LCT_SpellData[77761] = {
	class = "DRUID",
	duration = 8,
	cooldown = 120
}
LCT_SpellData[77764] = 77761
LCT_SpellData[106898] = 77761


-- Druid/talents
-- Cenarion Ward
LCT_SpellData[102351] = {
	class = "DRUID",
	talent = true,
	heal = true,
	duration = 30,
	cooldown = 30
}
-- Disorienting Roar
LCT_SpellData[99] = {
	class = "DRUID",
	talent = true,
	cc = true,
	cooldown = 30
}
-- Displacer Beast (not guardian)
LCT_SpellData[102280] = {
	class = "DRUID",
	specID = { 102, 103, 105 },
	--talent = true,
	cooldown = 30
}
-- Wild Charge
LCT_SpellData[102401] = {
	class = "DRUID",
	talent = true,
	cooldown = 15
}
LCT_SpellData[16979] = 102401 -- Bear
LCT_SpellData[49376] = 102401 -- Cat
LCT_SpellData[102416] = 102401 -- Aquatic
LCT_SpellData[102417] = 102401 -- Travel
LCT_SpellData[102383] = 102401 -- Moonkin
-- Force of Nature
--V: removed in legion 
--LCT_SpellData[33831] = { -- Balance
--	class = "DRUID",
--	talent = true,
--	offensive = true,
--	charges = 3,
--	cooldown = 20
--}
--LCT_SpellData[102706] = 33831 -- Guardian
--LCT_SpellData[102703] = 33831 -- Feral
--LCT_SpellData[102693] = 33831 -- Restoration
-- Heart of the Wild
--V: removed in legion 
--LCT_SpellData[108291] = {
--	class = "DRUID",
--	talent = true,
--	offensive = true,
--	defensive = true,
--	duration = 45,
--	cooldown = 360
--}
--LCT_SpellData[108292] = 108291
--LCT_SpellData[108293] = 108291
--LCT_SpellData[108294] = 108291
-- Mass Entanglement
LCT_SpellData[102359] = {
	class = "DRUID",
	talent = true,
	cc = true,
	cooldown = 30
}
-- Mighty Bash
LCT_SpellData[5211] = {
	class = "DRUID",
	talent = true,
	stun = true,
	cooldown = 50
}
-- Nature's Swiftness
--V: removed in legion 
--LCT_SpellData[132158] = {
--	class = "DRUID",
--	talent = true,
--	heal = true,
--	cooldown_starts_on_aura_fade = true,
--	cooldown = 60
--}
-- Nature's Vigil
LCT_SpellData[124974] = {
	class = "DRUID",
	talent = true,
	offensive = true,
	defensive = true,
	duration = 30,
	cooldown = 90
}
-- Renewal
LCT_SpellData[108238] = {
	class = "DRUID",
	talent = true,
	heal = true,
	cooldown = 120
}
-- Typhoon
LCT_SpellData[132469] = {
	class = "DRUID",
	talent = true,
	knockback = true,
	cooldown = 30
}
-- Ursol's Vortex
LCT_SpellData[102793] = {
	class = "DRUID",
	talent = true,
	cc = true,
	cooldown = 60
}

-- Druid/Balance
-- Celestial Alignment
--V: removed in legion 
--LCT_SpellData[112071] = {
--	class = "DRUID",
--	specID = { 102 },
--	offensive = true,
--	duration = 15,
--	cooldown = 180
--}
-- Remove Corruption
LCT_SpellData[2782] = {
	class = "DRUID",
	specID = { 102, 103, 104 },
	dispel = true,
	cooldown_starts_on_dispel = true,
	cooldown = 8
}
-- Solar Beam
LCT_SpellData[78675] = {
	class = "DRUID",
	specID = { 102 },
	interrupt = true,
	silence = true,
	duration = 10,
	cooldown = 60
}
--[[ TODO: support shared charges
-- Starfall
LCT_SpellData[48505] = {
	class = "DRUID",
	specID = { 102 },
	offensive = true,
	duration = 10,
	cooldown = 90
}
-- Starsurge
LCT_SpellData[78674] = {
	class = "DRUID",
	specID = { 102 },
	offensive = true,
	cooldown = 15
}
]]

-- Druid/Feral
-- Berserk (Cat Form)
--LCT_SpellData[106951] = {
--	class = "DRUID",
--	specID = { 103, 104 },
--	offensive = true,
--	sets_cooldown = { spellid = 50334, cooldown = 180 },
--	duration = 15,
--	cooldown = 180
--}
-- Berserk (Bear Form)
--LCT_SpellData[50334] = {
--	class = "DRUID",
--	specID = { 103, 104 },
--	offensive = true,
--	sets_cooldown = { spellid = 106951, cooldown = 180 },
--	duration = 10,
--	cooldown = 180
--}
-- Tiger's Fury
LCT_SpellData[5217] = {
	class = "DRUID",
	specID = { 103 },
	offensive = true,
	duration = 6,
	cooldown = 30
}
-- Savage Defense
--V: removed in legion 
--LCT_SpellData[62606] = {
--	class = "DRUID",
--	specID = { 104 },
--	charges = 2,
--	defensive = true,
--	duration = 6,
--	cooldown = 9
--}
-- Druid/Restoration
-- Ironbark
LCT_SpellData[102342] = {
	class = "DRUID",
	specID = { 105 },
	defensive = true,
	duration = 12,
	cooldown = 60
}
-- Nature's Cure
LCT_SpellData[88423] = {
	class = "DRUID",
	specID = { 105 },
	dispel = true,
	cooldown_starts_on_dispel = true,
	cooldown = 8
}
-- Swiftmend
LCT_SpellData[18562] = {
	class = "DRUID",
	specID = { 105 },
	heal = true,
	cooldown = 15
}
-- Wild Growth
LCT_SpellData[48438] = {
	class = "DRUID",
	specID = { 105 },
	heal = true,
	cooldown = 8
}

-- V: legion
-- Full Moon
--NOT ACTUALLY A CD --LCT_SpellData[202771] = {
--	class = "DRUID",
--	specID = { 102 },
--	heal = true,
--	cooldown = 8
--}
-- Incarnation (balance)
LCT_SpellData[102560] = {
	class = "DRUID",
	specID = { 102 },
	offensive = true,
	duration = 30,
	cooldown = 180
}
-- Celestial alignment
LCT_SpellData[194223] = {
	class = "DRUID",
	specID = { 102 },
	offensive = true,
	duration = 15,
	cooldown = 180
}

-- Incarnation (guardian)
LCT_SpellData[102558] = {
	class = "DRUID",
	specID = { 104 },
	offensive = true,
	duration = 30,
	cooldown = 180
}
-- Rage of Sleeper
LCT_SpellData[200851] = {
	class = "DRUID",
	specID = { 104 },
	offensive = true,
	duration = 10,
	cooldown = 90
}
-- Frenzied Regeneration
LCT_SpellData[22842] = {
	class = "DRUID",
	specID = { 104 },
	defensive = true,
	cooldown = 24,
	charges = 2
}
-- Mark of Ursol
-- V: was in the post, but apparently doesn't exist?
--LCT_SpellData[192083] = {
--	class = "DRUID",
--	specID = { 104 },
--	defensive = true,
--	cooldown = 1, -- V: technically 0.5
--	duration = 6
--}

-- Incarnation (feral)
LCT_SpellData[102543] = {
	class = "DRUID",
	specID = { 103 },
	offensive = true,
	cooldown = 180,
	duration = 30
}
-- Berserk
LCT_SpellData[106951] = {
	class = "DRUID",
	specID = { 103 },
	offensive = true,
	cooldown = 180,
	duration = 30
}
-- Survival instincts
LCT_SpellData[61336] = {
	class = "DRUID",
	specID = { 103 },
	defensive = true,
	cooldown = 180,
	duration = 6,
	charges = 2
}

-- Incarnation (resto)
LCT_SpellData[33891] = {
	class = "DRUID",
	specID = { 105 },
	defensive = true,
	cooldown = 180,
}
-- Tranquility
LCT_SpellData[740] = {
	class = "DRUID",
	specID = { 105 },
	defensive = true,
	cooldown = 180,
}
-- Innervate
LCT_SpellData[29166] = {
	class = "DRUID",
	specID = { 105 },
	cooldown = 180,
}