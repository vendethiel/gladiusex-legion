-- ================ ROGUE ================
-- Rogue/baseline
-- Blind
LCT_SpellData[2094] = {
	class = "ROGUE",
	cc = true,
	cooldown = 120
}
-- Cloak of Shadows
LCT_SpellData[31224] = {
	class = "ROGUE",
	defensive = true,
	duration = 5,
	cooldown = 90
}
-- Evasion
LCT_SpellData[5277] = {
	class = "ROGUE",
	specID = { 259, 261 },
	defensive = true,
	duration = 10,
	cooldown = 120
}
-- Gouge
LCT_SpellData[1776] = {
	class = "ROGUE",
	cc = true,
	cooldown = 10
}
-- Kick
LCT_SpellData[1766] = {
	class = "ROGUE",
	interrupt = true,
	cooldown = 15
}
-- Kidney Shot
LCT_SpellData[408] = {
	class = "ROGUE",
	stun = true,
	cooldown = 20
}
-- Smoke Bomb
LCT_SpellData[76577] = {
	class = "ROGUE",
	talent = true,
	specID = { 261 },
	defensive = true,
	duration = 5,
	cooldown = 180
}
-- Sprint
LCT_SpellData[2983] = {
	class = "ROGUE",
	duration = 8,
	cooldown = 60
}
-- Tricks of the Trade
-- V: removed in legion
--LCT_SpellData[57934] = {
--	class = "ROGUE",
--	offensive = true,
--	duration = 6,
--	cooldown = 30
--}
-- Vanish
LCT_SpellData[1856] = {
	class = "ROGUE",
	defensive = true,
	duration = 3,
	cooldown = 120
}

-- Rogue/Assassination 259
-- Vendetta
LCT_SpellData[79140] = {
	class = "ROGUE",
	specID = { 259 },
	offensive = true,
	duration = 20,
	cooldown = 120
}
-- Rogue/Outlaw (ex combat) 260
-- Adrenaline Rush
LCT_SpellData[13750] = {
	class = "ROGUE",
	specID = { 260 },
	offensive = true,
	duration = 15,
	cooldown = 180
}
-- Curse of the Dreadblades
LCT_SpellData[202665] = {
	class = "ROGUE",
	specID = { 260 },
	offensive = true,
	duration = 12,
	cooldown = 90
}
-- Riposte
LCT_SpellData[199754] = {
	class = "ROGUE",
	specID = { 260 },
	defensive = true,
	duration = 10,
	cooldown = 120
}
-- Killing Spree
-- V: removed in legion
--LCT_SpellData[51690] = {
--	class = "ROGUE",
--	specID = { 260 },
--	offensive = true,
--	duration = 3,
--	cooldown = 120
--}

-- Rogue/Subtlety 261
-- Premeditation
--V: removed in legion 
--LCT_SpellData[14183] = {
--	class = "ROGUE",
--	specID = { 261 },
--	offensive = true,
--	cooldown = 20
--}
-- Shadow Dance
--V: changed ID in legion
LCT_SpellData[185313] = {
	class = "ROGUE",
	specID = { 261 },
	offensive = true,
	duration = 4,
	cooldown = 60,
	charges = 2
}
-- Shadow Blades
LCT_SpellData[121471] = {
	class = "ROGUE",
	specID = { 261 },
	offensive = true,
	duration = 15,
	cooldown = 180,
}
-- Goremaw's Bite
LCT_SpellData[209782] = {
	class = "ROGUE",
	specID = { 261 },
	offensive = true,
	duration = 6,
	cooldown = 60,
}

-- Rogue/talents
-- Cheat Death
LCT_SpellData[31230] = {
	class = "ROGUE",
	talent = true,
	defensive = true,
	duration = 3,
	cooldown = 90
}
LCT_SpellData[45181] = 31230
-- Combat Readiness
LCT_SpellData[74001] = {
	class = "ROGUE",
	talent = true,
	defensive = true,
	duration = 20,
	cooldown = 120
}
-- Preparation
--V: removed in legion 
--LCT_SpellData[14185] = {
--	class = "ROGUE",
--	talent = true,
--	defensive = true,
--	resets = { 2983, 1856, 31224, 5277 },
--	cooldown = 300
--}
-- Shadowstep
LCT_SpellData[36554] = {
	class = "ROGUE",
	talent = true,
	offensive = true,
	duration = 2,
	cooldown = 20
}
LCT_SpellData[137619] = {
	class = "ROGUE",
	talent = true,
	offensive = true,
	cooldown = 60
}
