-- used to be Items. Now PVP trinekts

-- TODO: currently only sets WoTF, should set EMFH(human) as well

-- Every Man For Himself
-- TODO needs to set all trinkets
LCT_SpellData[59752] = {
	pvp_trinket = true,
	race = "Human",
	replaces = 195710,
	sets_cooldown = { spellid = 208683, cooldown = 30 },
	cooldown = 120
}

-- Honorable Medallion
LCT_SpellData[195710] = {
	pvp_trinket = true,
	sets_cooldown = { spellid = 7744, cooldown = 30 },
	cooldown = 180
}
-- Gladiator's Medallion
LCT_SpellData[208683] = {
	pvp_trinket = true,
	talent = true,
	replaces = 195710,
	sets_cooldown = { spellid = 7744, cooldown = 30 },
	cooldown = 120
}
-- Healthstone
LCT_SpellData[6262] = {
	item = true,
	talent = true, -- hack to prevent it being displayed before being detected
	heal = true,
	cooldown = 60
}