local GladiusEx = _G.GladiusEx
local L = LibStub("AceLocale-3.0"):GetLocale("GladiusEx")
local fn = LibStub("LibFunctional-1.0")
local LSM = LibStub("LibSharedMedia-3.0")

-- upvalues
local strfind = string.find
local pairs, select, unpack = pairs, select, unpack
local GetTime, SetPortraitTexture = GetTime, SetPortraitTexture
local GetSpellInfo, UnitAura, UnitClass, UnitGUID, UnitBuff, UnitDebuff = GetSpellInfo, UnitAura, UnitClass, UnitGUID, UnitBuff, UnitDebuff
local UnitIsVisible, UnitIsConnected, GetSpecializationInfoByID, GetTexCoordsForRole = UnitIsVisible, UnitIsConnected, GetSpecializationInfoByID, GetTexCoordsForRole
local CLASS_BUTTONS = CLASS_BUTTONS

-- NOTE: this list can be modified from the ClassIcon module options, no need to edit it here
-- Nonetheless, if you think that we missed an important aura, please post it on the addon site at curse or wowace
local function GetDefaultImportantAuras()
	return {
		-- Spell Name                          = Priority (higher = more priority)
		-- Crowd control
		[GladiusEx:SafeGetSpellName(108194)]   = 4,    -- Asphyxiate
		--V: removed in legion [GladiusEx:SafeGetSpellName(115001)]   = 4,    -- Remorseless Winter
		[GladiusEx:SafeGetSpellName(91800)]    = 4,    -- Gnaw
		[GladiusEx:SafeGetSpellName(91797)]    = 4,    -- Monstrous Blow (Dark Transformation)
		--V: removed in legion [GladiusEx:SafeGetSpellName(113801)]   = 4,    -- Bash (Force of Nature - Feral Treants)
		[GladiusEx:SafeGetSpellName(33786)]    = 4,    -- Cyclone
		[GladiusEx:SafeGetSpellName(99)]       = 4,    -- Disorienting Roar
		[GladiusEx:SafeGetSpellName(22570)]    = 4,    -- Maim
		[GladiusEx:SafeGetSpellName(5211)]     = 4,    -- Mighty Bash
		[GladiusEx:SafeGetSpellName(117526)]   = 4,    -- Binding Shot
		[GladiusEx:SafeGetSpellName(3355)]     = 4,    -- Freezing Trap
		[GladiusEx:SafeGetSpellName(19386)]    = 4,    -- Wyvern Sting
		[GladiusEx:SafeGetSpellName(24394)]    = 4,    -- Intimidation
		--V: removed in legion [GladiusEx:SafeGetSpellName(44572)]    = 4,    -- Deep Freeze
		[GladiusEx:SafeGetSpellName(31661)]    = 4,    -- Dragon's Breath
		[GladiusEx:SafeGetSpellName(118)]      = 4,    -- Polymorph
		[GladiusEx:SafeGetSpellName(61305)]    = 4,    -- Polymorph: Black Cat
		[GladiusEx:SafeGetSpellName(28272)]    = 4,    -- Polymorph: Pig
		[GladiusEx:SafeGetSpellName(61721)]    = 4,    -- Polymorph: Rabbit
		[GladiusEx:SafeGetSpellName(61780)]    = 4,    -- Polymorph: Turkey
		[GladiusEx:SafeGetSpellName(28271)]    = 4,    -- Polymorph: Turtle
		[GladiusEx:SafeGetSpellName(82691)]    = 4,    -- Ring of Frost
		--V: removed in legion [GladiusEx:SafeGetSpellName(123393)]   = 4,    -- Breath of Fire (Glyph of Breath of Fire)
		--V: removed in legion [GladiusEx:SafeGetSpellName(119392)]   = 4,    -- Charging Ox Wave
		[GladiusEx:SafeGetSpellName(119381)]   = 4,    -- Leg Sweep
		[GladiusEx:SafeGetSpellName(115078)]   = 4,    -- Paralysis
		[GladiusEx:SafeGetSpellName(105421)]   = 4,    -- Blinding Light
		--V: removed in elgion[GladiusEx:SafeGetSpellName(105593)]   = 4,    -- Fist of Justice
		[GladiusEx:SafeGetSpellName(853)]      = 4,    -- Hammer of Justice
		-- V: removed in legion [GladiusEx:SafeGetSpellName(119072)]   = 4,    -- Holy Wrath
		[GladiusEx:SafeGetSpellName(20066)]    = 4,    -- Repentance
		--V: removed in legion [GladiusEx:SafeGetSpellName(10326)]    = 4,    -- Turn Evil
		[GladiusEx:SafeGetSpellName(605)]      = 4,    -- Dominate Mind
		[GladiusEx:SafeGetSpellName(88625)]    = 4,    -- Holy Word: Chastise
		[GladiusEx:SafeGetSpellName(64044)]    = 4,    -- Psychic Horror
		[GladiusEx:SafeGetSpellName(8122)]     = 4,    -- Psychic Scream
		[GladiusEx:SafeGetSpellName(9484)]     = 4,    -- Shackle Undead
		[GladiusEx:SafeGetSpellName(131556)]   = 4,    -- Sin and Punishment
		[GladiusEx:SafeGetSpellName(2094)]     = 4,    -- Blind
		[GladiusEx:SafeGetSpellName(1833)]     = 4,    -- Cheap Shot
		[GladiusEx:SafeGetSpellName(1776)]     = 4,    -- Gouge
		[GladiusEx:SafeGetSpellName(408)]      = 4,    -- Kidney Shot
		[GladiusEx:SafeGetSpellName(6770)]     = 4,    -- Sap
		[GladiusEx:SafeGetSpellName(77505)]    = 4,    -- Earthquake
		[GladiusEx:SafeGetSpellName(51514)]    = 4,    -- Hex
		[GladiusEx:SafeGetSpellName(118905)]   = 4,    -- Static Charge (Capacitor Totem)
		[GladiusEx:SafeGetSpellName(710)]      = 4,    -- Banish
		[GladiusEx:SafeGetSpellName(5782)]     = 4,    -- Fear
		[GladiusEx:SafeGetSpellName(118699)]   = 4,    -- Fear
		[GladiusEx:SafeGetSpellName(130616)]   = 4,    -- Fear (Glyph of Fear)
		[GladiusEx:SafeGetSpellName(5484)]     = 4,    -- Howl of Terror
		[GladiusEx:SafeGetSpellName(22703)]    = 4,    -- Infernal Awakening
		[GladiusEx:SafeGetSpellName(6789)]     = 4,    -- Mortal Coil
		[GladiusEx:SafeGetSpellName(30283)]    = 4,    -- Shadowfury
		[GladiusEx:SafeGetSpellName(7922)]     = 4,    -- Charge Stun
		--V: removed in legion [GladiusEx:SafeGetSpellName(118895)]   = 4,    -- Dragon Roar
		[GladiusEx:SafeGetSpellName(5246)]     = 4,    -- Intimidating Shout (aoe)
		[GladiusEx:SafeGetSpellName(132168)]   = 4,    -- Shockwave
		[GladiusEx:SafeGetSpellName(107570)]   = 4,    -- Storm Bolt
		[GladiusEx:SafeGetSpellName(105771)]   = 4,    -- Warbringer
		[GladiusEx:SafeGetSpellName(107079)]   = 4,    -- Quaking Palm
		[GladiusEx:SafeGetSpellName(20549)]    = 4,    -- War Stomp
		[GladiusEx:SafeGetSpellName(118345)]   = 4,    -- Pulverize
		[GladiusEx:SafeGetSpellName(89766)]    = 4,    -- Axe Toss (Felguard/Wrathguard)
		[GladiusEx:SafeGetSpellName(115268)]   = 4,    -- Mesmerize (Shivarra)
		[GladiusEx:SafeGetSpellName(6358)]     = 4,    -- Seduction (Succubus)
		[GladiusEx:SafeGetSpellName(132169)]   = 4,    -- Storm Bolt
		--V: removed in legion [137143]                               = 4,    -- Blood Horror
		[163505]                               = 4,    -- Rake
		[120086]                               = 4,    -- Fists of Fury
--
		-- Silences
		[GladiusEx:SafeGetSpellName(47476)]    = 3,    -- Strangulate
		--V: removed in legion [GladiusEx:SafeGetSpellName(114238)]   = 3,    -- Fae Silence (Glyph of Fae Silence)
		[GladiusEx:SafeGetSpellName(81261)]    = 3,    -- Solar Beam
		--V: removed in legion [GladiusEx:SafeGetSpellName(102051)]   = 3,    -- Frostjaw (also a root)
		[GladiusEx:SafeGetSpellName(31935)]    = 3,    -- Avenger's Shield
		[GladiusEx:SafeGetSpellName(15487)]    = 3,    -- Silence
		[GladiusEx:SafeGetSpellName(1330)]     = 3,    -- Garrote - Silence
		[GladiusEx:SafeGetSpellName(132409)]   = 3,    -- Spell Lock (Grimoire of Sacrifice)
		[GladiusEx:SafeGetSpellName(31117)]    = 3,    -- Unstable Affliction
		[GladiusEx:SafeGetSpellName(25046)]    = 3,    -- Arcane Torrent (Energy)
		[GladiusEx:SafeGetSpellName(28730)]    = 3,    -- Arcane Torrent (Mana)
		[GladiusEx:SafeGetSpellName(50613)]    = 3,    -- Arcane Torrent (Runic Power)
		[GladiusEx:SafeGetSpellName(69179)]    = 3,    -- Arcane Torrent (Rage)
		[GladiusEx:SafeGetSpellName(80483)]    = 3,    -- Arcane Torrent (Focus)
		[GladiusEx:SafeGetSpellName(129597)]   = 3,    -- Arcane Torrent (Chi)
		--V: removed in legion [GladiusEx:SafeGetSpellName(18498)]    = 3,    -- Silenced Gag Order
--
		-- Roots
		[GladiusEx:SafeGetSpellName(64803)]    = 3,    -- Entrapment
		[GladiusEx:SafeGetSpellName(170996)]   = 3,    -- Debilitate
		[GladiusEx:SafeGetSpellName(157997)]   = 3,    -- Ice Nova
		[96294]                                = 2,    -- Chains of Ice (Chilblains)
		[GladiusEx:SafeGetSpellName(91807)]    = 2,    -- Shambling Rush (Dark Transformation)
		[GladiusEx:SafeGetSpellName(339)]      = 2,    -- Entangling Roots
		--V: removed in legion [GladiusEx:SafeGetSpellName(113770)]   = 2,    -- Entangling Roots (Force of Nature - Balance Treants)
		[GladiusEx:SafeGetSpellName(45334)]    = 2,    -- Immobilized (Wild Charge - Bear)
		[GladiusEx:SafeGetSpellName(102359)]   = 2,    -- Mass Entanglement
		[GladiusEx:SafeGetSpellName(128405)]   = 2,    -- Narrow Escape
		[GladiusEx:SafeGetSpellName(122)]      = 2,    -- Frost Nova
		--V: removed in legion [GladiusEx:SafeGetSpellName(111340)]   = 2,    -- Ice Ward
		[GladiusEx:SafeGetSpellName(33395)]    = 2,    -- Freeze
		[GladiusEx:SafeGetSpellName(116706)]   = 2,    -- Disable
		--V: removed in legion [GladiusEx:SafeGetSpellName(87194)]    = 2,    -- Glyph of Mind Blast
		[GladiusEx:SafeGetSpellName(114404)]   = 2,    -- Void Tendril's Grasp
		[GladiusEx:SafeGetSpellName(64695)]    = 2,    -- Earthgrab (Earthgrab Totem)
		--V: removed in legion [GladiusEx:SafeGetSpellName(63685)]    = 2,    -- Freeze (Frozen Power)
		[GladiusEx:SafeGetSpellName(107566)]   = 2,    -- Staggering Shout
--
		-- Buffs
		[GladiusEx:SafeGetSpellName(48792)]    = 1,    -- Icebound Fortitude
		[GladiusEx:SafeGetSpellName(49039)]    = 1,    -- Lichborne
		[GladiusEx:SafeGetSpellName(31821)]    = 1,    -- Aura Mastery
		[GladiusEx:SafeGetSpellName(8178)]     = 1,    -- Grounding Totem Effect (Grounding Totem)
		[GladiusEx:SafeGetSpellName(104773)]   = 1,    -- Unending Resolve
		[GladiusEx:SafeGetSpellName(23920)]    = 1,    -- Spell Reflection
		[GladiusEx:SafeGetSpellName(114028)]   = 1,    -- Mass Spell Reflection
		[GladiusEx:SafeGetSpellName(131557)]   = 1,    -- Spiritwalker's Aegis
		[GladiusEx:SafeGetSpellName(6940)]     = 1,    -- Hand of Sacrifice
		--V: removed in legion [GladiusEx:SafeGetSpellName(110913)]   = 1,    -- Dark Bargain
--
		-- Immunities
		[GladiusEx:SafeGetSpellName(76577)]    = 1,    -- Smoke Bomb
		[GladiusEx:SafeGetSpellName(115018)]   = 1,    -- Desecrated Ground
		[GladiusEx:SafeGetSpellName(48707)]    = 1,    -- Anti-Magic Shell
		[GladiusEx:SafeGetSpellName(19263)]    = 1,    -- Deterrence
		[GladiusEx:SafeGetSpellName(45438)]    = 1,    -- Ice Block
		--V: removed in legion [GladiusEx:SafeGetSpellName(115760)]   = 1,    -- Glyph of Ice Block
		[GladiusEx:SafeGetSpellName(642)]      = 1,    -- Divine Shield
		[GladiusEx:SafeGetSpellName(47585)]    = 1,    -- Dispersion
		[GladiusEx:SafeGetSpellName(31224)]    = 1,    -- Cloak of Shadows
		[GladiusEx:SafeGetSpellName(46924)]    = 1,    -- Bladestorm
	}
end

local defaults = {
	classIconMode = "SPEC",
	classIconGloss = false,
	classIconGlossColor = { r = 1, g = 1, b = 1, a = 0.4 },
	classIconImportantAuras = true,
	classIconCrop = true,
	classIconCooldown = true,
	classIconCooldownReverse = true,
	classIconAuras = GetDefaultImportantAuras()
}

local ClassIcon = GladiusEx:NewGladiusExModule("ClassIcon",
	fn.merge(defaults, {
		classIconPosition = "LEFT",
	}),
	fn.merge(defaults, {
		classIconPosition = "RIGHT",
	}))

function ClassIcon:OnEnable()
	self:RegisterEvent("UNIT_AURA")
	self:RegisterEvent("UNIT_PORTRAIT_UPDATE", "UNIT_AURA")
	self:RegisterEvent("UNIT_MODEL_CHANGED")
	self:RegisterMessage("GLADIUS_SPEC_UPDATE", "UNIT_AURA")

	if not self.frame then
		self.frame = {}
	end
end

function ClassIcon:OnDisable()
	self:UnregisterAllEvents()
	self:UnregisterAllMessages()

	for unit in pairs(self.frame) do
		self.frame[unit]:Hide()
	end
end

function ClassIcon:GetAttachType(unit)
	return "InFrame"
end

function ClassIcon:GetAttachPoint(unit)
	return self.db[unit].classIconPosition
end

function ClassIcon:GetAttachSize(unit)
	return GladiusEx:GetBarsHeight(unit)
end

function ClassIcon:GetModuleAttachPoints()
	return {
		["ClassIcon"] = L["ClassIcon"],
	}
end

function ClassIcon:GetModuleAttachFrame(unit)
	if not self.frame[unit] then
		self:CreateFrame(unit)
	end

	return self.frame[unit]
end

function ClassIcon:UNIT_AURA(event, unit)
	if not self.frame[unit] then return end

	-- important auras
	self:UpdateAura(unit)
end

function ClassIcon:UNIT_MODEL_CHANGED(event, unit)
	if not self.frame[unit] then return end

	-- force model update
	if self.frame[unit].portrait3d then
		self.frame[unit].portrait3d.guid = false
	end

	self:UpdateAura(unit)
end

function ClassIcon:ScanAuras(unit)
	local best_priority = 0
	local best_name, best_icon, best_duration, best_expires

	local function handle_aura(name, spellid, icon, duration, expires)
		local prio = self:GetImportantAura(unit, name) or self:GetImportantAura(unit, spellid)
		if prio and prio > best_priority or (prio == best_priority and expires < best_expires) then
			best_name = name
			best_icon = icon
			best_duration = duration
			best_expires = expires
			best_priority = prio
		end
	end

	-- debuffs
	for index = 1, 40 do
		local name, _, icon, _, _, duration, expires, _, _, _, spellid = UnitDebuff(unit, index)
		if not name then break end
		handle_aura(name, spellid, icon, duration, expires)
	end

	-- buffs
	for index = 1, 40 do
		local name, _, icon, _, _, duration, expires, _, _, _, spellid = UnitBuff(unit, index)
		if not name then break end
		handle_aura(name, spellid, icon, duration, expires)
	end

	return best_name, best_icon, best_duration, best_expires
end

function ClassIcon:UpdateAura(unit)
	if not self.frame[unit] or not self.db[unit].classIconImportantAuras then return end

	local name, icon, duration, expires = self:ScanAuras(unit)

	if name then
		self:SetAura(unit, name, icon, duration, expires)
	else
		self:SetClassIcon(unit)
	end
end

function ClassIcon:SetAura(unit, name, icon, duration, expires)
	-- display aura
	self:SetTexture(unit, icon, true, 0, 1, 0, 1)

	if self.db[unit].classIconCooldown then
		CooldownFrame_Set(self.frame[unit].cooldown, expires - duration, duration, 1)
		self.frame[unit].cooldown:Show()
	end
end

function ClassIcon:SetTexture(unit, texture, needs_crop, left, right, top, bottom)
	-- so the user wants a border, but the borders in the blizzard icons are
	-- messed up in random ways (some are missing the alpha at the corners, some contain
	-- random blocks of colored pixels there)
	-- so instead of using the border already present in the icons, we crop them and add
	-- our own (this would have been a lot easier if wow allowed alpha mask textures)
	local needs_border = needs_crop and not self.db[unit].classIconCrop
	local size = self:GetAttachSize(unit)
	if needs_border then
		self.frame[unit].texture:ClearAllPoints()
		self.frame[unit].texture:SetPoint("CENTER")
		self.frame[unit].texture:SetWidth(size * (1 - 6 / 64))
		self.frame[unit].texture:SetHeight(size * (1 - 6 / 64))
		self.frame[unit].texture_border:Show()
	else
		self.frame[unit].texture:ClearAllPoints()
		self.frame[unit].texture:SetPoint("CENTER")
		self.frame[unit].texture:SetWidth(size)
		self.frame[unit].texture:SetHeight(size)
		self.frame[unit].texture_border:Hide()
	end

	if needs_crop then
		local n
		if self.db[unit].classIconCrop then n = 5 else n = 3 end
		left = left + (right - left) * (n / 64)
		right = right - (right - left) * (n / 64)
		top = top + (bottom - top) * (n / 64)
		bottom = bottom - (bottom - top) * (n / 64)
	end

	-- set texture
	self.frame[unit].texture:SetTexture(texture)
	self.frame[unit].texture:SetTexCoord(left, right, top, bottom)

	-- hide portrait
	if self.frame[unit].portrait3d then
		self.frame[unit].portrait3d:Hide()
	end
	if self.frame[unit].portrait2d then
		self.frame[unit].portrait2d:Hide()
	end
end

function ClassIcon:SetClassIcon(unit)
	if not self.frame[unit] then return end

	-- hide cooldown frame
	self.frame[unit].cooldown:Hide()

	if self.db[unit].classIconMode == "PORTRAIT2D" then
		-- portrait2d
		if not self.frame[unit].portrait2d then
			self.frame[unit].portrait2d = self.frame[unit]:CreateTexture(nil, "OVERLAY")
			self.frame[unit].portrait2d:SetAllPoints()
			local n = 9 / 64
			self.frame[unit].portrait2d:SetTexCoord(n, 1 - n, n, 1 - n)
		end
		if not UnitIsVisible(unit) or not UnitIsConnected(unit) then
			self.frame[unit].portrait2d:Hide()
		else
			SetPortraitTexture(self.frame[unit].portrait2d, unit)
			self.frame[unit].portrait2d:Show()
			if self.frame[unit].portrait3d then
				self.frame[unit].portrait3d:Hide()
			end
			self.frame[unit].texture:SetTexture(0, 0, 0, 1)
			return
		end
	elseif self.db[unit].classIconMode == "PORTRAIT3D" then
		-- portrait3d
		local zoom = 1.0
		if not self.frame[unit].portrait3d then
			self.frame[unit].portrait3d = CreateFrame("PlayerModel", nil, self.frame[unit])
			self.frame[unit].portrait3d:SetAllPoints()
			self.frame[unit].portrait3d:SetScript("OnShow", function(f) f:SetPortraitZoom(zoom) end)
			self.frame[unit].portrait3d:SetScript("OnHide", function(f) f.guid = nil end)
		end
		if not UnitIsVisible(unit) or not UnitIsConnected(unit) then
			self.frame[unit].portrait3d:Hide()
		else
			local guid = UnitGUID(unit)
			if self.frame[unit].portrait3d.guid ~= guid then
				self.frame[unit].portrait3d.guid = guid
				self.frame[unit].portrait3d:SetUnit(unit)
				self.frame[unit].portrait3d:SetPortraitZoom(zoom)
				self.frame[unit].portrait3d:SetPosition(0, 0, 0)
			end
			self.frame[unit].portrait3d:Show()
			self.frame[unit].texture:SetTexture(0, 0, 0, 1)
			if self.frame[unit].portrait2d then
				self.frame[unit].portrait2d:Hide()
			end
			return
		end
	end

	-- get unit class
	local class, specID
	if not GladiusEx:IsTesting(unit) then
		class = select(2, UnitClass(unit))
		-- check for arena prep info
		if not class then
			class = GladiusEx.buttons[unit].class
		end
		specID = GladiusEx.buttons[unit].specID
	else
		class = GladiusEx.testing[unit].unitClass
		specID = GladiusEx.testing[unit].specID
	end

	local texture
	local left, right, top, bottom
	local needs_crop

	if not class then
		texture = [[Interface\Icons\INV_Misc_QuestionMark]]
		left, right, top, bottom = 0, 1, 0, 1
		needs_crop = true
	elseif self.db[unit].classIconMode == "ROLE" and specID then
		local _, _, _, _, _, role = GetSpecializationInfoByID(specID)
		texture = [[Interface\LFGFrame\UI-LFG-ICON-ROLES]]
		left, right, top, bottom = GetTexCoordsForRole(role)
		needs_crop = false
	elseif self.db[unit].classIconMode == "SPEC" and specID then
		texture = select(4, GetSpecializationInfoByID(specID))
		left, right, top, bottom = 0, 1, 0, 1
		needs_crop = true
	else
		texture = [[Interface\Glues\CharacterCreate\UI-CharacterCreate-Classes]]
		left, right, top, bottom = unpack(CLASS_ICON_TCOORDS[class])
		needs_crop = true
	end

	self:SetTexture(unit, texture, needs_crop, left, right, top, bottom)
end

function ClassIcon:CreateFrame(unit)
	local button = GladiusEx.buttons[unit]
	if (not button) then return end

	-- create frame
	self.frame[unit] = CreateFrame("CheckButton", "GladiusEx" .. self:GetName() .. "Frame" .. unit, button, "ActionButtonTemplate")
	self.frame[unit]:EnableMouse(false)
	self.frame[unit].texture = _G[self.frame[unit]:GetName().."Icon"]
	self.frame[unit].normalTexture = _G[self.frame[unit]:GetName().."NormalTexture"]
	self.frame[unit].cooldown = _G[self.frame[unit]:GetName().."Cooldown"]
	self.frame[unit].texture_border = self.frame[unit]:CreateTexture(nil, "BACKGROUND", nil, -1)
	self.frame[unit].texture_border:SetTexture([[Interface\AddOns\GladiusEx\media\icon_border]])
	self.frame[unit].texture_border:SetAllPoints()
end

function ClassIcon:Update(unit)
	-- create frame
	if not self.frame[unit] then
		self:CreateFrame(unit)
	end

	-- style action button
	self.frame[unit].normalTexture:SetHeight(self.frame[unit]:GetHeight() + self.frame[unit]:GetHeight() * 0.4)
	self.frame[unit].normalTexture:SetWidth(self.frame[unit]:GetWidth() + self.frame[unit]:GetWidth() * 0.4)

	self.frame[unit].normalTexture:ClearAllPoints()
	self.frame[unit].normalTexture:SetPoint("CENTER")
	self.frame[unit]:SetNormalTexture([[Interface\AddOns\GladiusEx\media\gloss]])

	self.frame[unit].texture:ClearAllPoints()
	self.frame[unit].texture:SetPoint("TOPLEFT", self.frame[unit], "TOPLEFT")
	self.frame[unit].texture:SetPoint("BOTTOMRIGHT", self.frame[unit], "BOTTOMRIGHT")

	self.frame[unit].normalTexture:SetVertexColor(self.db[unit].classIconGlossColor.r, self.db[unit].classIconGlossColor.g,
		self.db[unit].classIconGlossColor.b, self.db[unit].classIconGloss and self.db[unit].classIconGlossColor.a or 0)

	self.frame[unit].cooldown:SetReverse(self.db[unit].classIconCooldownReverse)

	-- hide
	self.frame[unit]:Hide()
end

function ClassIcon:Refresh(unit)
	self:SetClassIcon(unit)
	self:UpdateAura(unit)
end

function ClassIcon:Show(unit)
	-- show frame
	self.frame[unit]:Show()

	-- set class icon
	self:SetClassIcon(unit)
	self:UpdateAura(unit)
end

function ClassIcon:Reset(unit)
	if not self.frame[unit] then return end

	-- hide
	self.frame[unit]:Hide()
end

function ClassIcon:Test(unit)
end

function ClassIcon:GetImportantAura(unit, name)
	return self.db[unit].classIconAuras[name]
end

local function HasAuraEditBox()
	return not not LibStub("AceGUI-3.0").WidgetVersions["Aura_EditBox"]
end

function ClassIcon:GetOptions(unit)
	local options
	options = {
		general = {
			type = "group",
			name = L["General"],
			order = 1,
			args = {
				widget = {
					type = "group",
					name = L["Widget"],
					desc = L["Widget settings"],
					inline = true,
					order = 1,
					args = {
						classIconMode = {
							type = "select",
							name = L["Show"],
							values = {
								["CLASS"] = L["Class"],
								["SPEC"] = L["Spec"],
								["ROLE"] = L["Role"],
								["PORTRAIT2D"] = L["Portrait 2D"],
								["PORTRAIT3D"] = L["Portrait 3D"],
							},
							desc = L["When available, show specialization instead of class icons"],
							disabled = function() return not self:IsUnitEnabled(unit) end,
							order = 3,
						},
						sep = {
							type = "description",
							name = "",
							width = "full",
							order = 4,
						},
						classIconImportantAuras = {
							type = "toggle",
							name = L["Important auras"],
							desc = L["Show important auras instead of the class icon"],
							disabled = function() return not self:IsUnitEnabled(unit) end,
							order = 5,
						},
						classIconCrop = {
							type = "toggle",
							name = L["Crop borders"],
							desc = L["Toggle if the icon borders should be cropped or not"],
							disabled = function() return not self:IsUnitEnabled(unit) end,
							order = 6,
						},
						sep2 = {
							type = "description",
							name = "",
							width = "full",
							order = 7,
						},
						classIconCooldown = {
							type = "toggle",
							name = L["Cooldown spiral"],
							desc = L["Display the cooldown spiral for the important auras"],
							disabled = function() return not self:IsUnitEnabled(unit) end,
							order = 10,
						},
						classIconCooldownReverse = {
							type = "toggle",
							name = L["Cooldown reverse"],
							desc = L["Invert the dark/bright part of the cooldown spiral"],
							disabled = function() return not self:IsUnitEnabled(unit) end,
							order = 15,
						},
						sep3 = {
							type = "description",
							name = "",
							width = "full",
							order = 17,
						},
						classIconGloss = {
							type = "toggle",
							name = L["Gloss"],
							desc = L["Toggle gloss on the icon"],
							disabled = function() return not self:IsUnitEnabled(unit) end,
							order = 20,
						},
						classIconGlossColor = {
							type = "color",
							name = L["Gloss color"],
							desc = L["Color of the gloss"],
							get = function(info) return GladiusEx:GetColorOption(self.db[unit], info) end,
							set = function(info, r, g, b, a) return GladiusEx:SetColorOption(self.db[unit], info, r, g, b, a) end,
							hasAlpha = true,
							disabled = function() return not self:IsUnitEnabled(unit) end,
							order = 25,
						},
					},
				},
				position = {
					type = "group",
					name = L["Position"],
					desc = L["Position settings"],
					inline = true,
					order = 3,
					args = {
						classIconPosition = {
							type = "select",
							name = L["Position"],
							desc = L["Position of the frame"],
							values = { ["LEFT"] = L["Left"], ["RIGHT"] = L["Right"] },
							disabled = function() return not self:IsUnitEnabled(unit) end,
							order = 1,
						},
					},
				},
			},
		},
		auraList = {
			type = "group",
			name = L["Important auras"],
			childGroups = "tree",
			order = 3,
			args = {
				newAura = {
					type = "group",
					name = L["New aura"],
					desc = L["New aura"],
					inline = true,
					order = 1,
					args = {
						name = {
							type = "input",
							dialogControl = HasAuraEditBox() and "Aura_EditBox" or nil,
							name = L["Name"],
							desc = L["Name of the aura"],
							get = function() return self.newAuraName and tostring(self.newAuraName) or "" end,
							set = function(info, value)
								if tonumber(value) and GetSpellInfo(value) then
									value = tonumber(value)
								end
								self.newAuraName = value
							end,
							disabled = function() return not self:IsUnitEnabled(unit) end,
							order = 1,
						},
						priority = {
							type= "range",
							name = L["Priority"],
							desc = L["Select what priority the aura should have - higher equals more priority"],
							get = function() return self.newAuraPriority or "" end,
							set = function(info, value) self.newAuraPriority = value end,
							disabled = function() return not self:IsUnitEnabled(unit) end,
							min = 0,
							max = 10,
							step = 1,
							order = 2,
						},
						add = {
							type = "execute",
							name = L["Add new aura"],
							func = function(info)
								self.db[unit].classIconAuras[self.newAuraName] = self.newAuraPriority
								options.auraList.args[tostring(self.newAuraName)] = self:SetupAuraOptions(options, unit, self.newAuraName)
								self.newAuraName = nil
								GladiusEx:UpdateFrames()
							end,
							disabled = function() return not self:IsUnitEnabled(unit) or not (self.newAuraName and self.newAuraPriority) end,
							order = 3,
						},
					},
				},
			},
		},
	}

	-- set some initial value for the auras priority
	self.newAuraPriority = 5

	-- setup auras
	for aura, priority in pairs(self.db[unit].classIconAuras) do
		options.auraList.args[tostring(aura)] = self:SetupAuraOptions(options, unit, aura)
	end

	return options
end

function ClassIcon:SetupAuraOptions(options, unit, aura)
	local function setAura(info, value)
		if (info[#(info)] == "name") then
			local new_name = value
			if tonumber(new_name) and GetSpellInfo(new_name) then
				new_name = tonumber(new_name)
			end

			-- create new aura
			self.db[unit].classIconAuras[new_name] = self.db[unit].classIconAuras[aura]
			options.auraList.args[new_name] = self:SetupAuraOptions(options, unit, new_name)

			-- delete old aura
			self.db[unit].classIconAuras[aura] = nil
			options.auraList.args[aura] = nil
		else
			self.db[unit].classIconAuras[info[#(info) - 1]] = value
		end

		GladiusEx:UpdateFrames()
	end

	local function getAura(info)
		if (info[#(info)] == "name") then
			return tostring(aura)
		else
			return self.db[unit].classIconAuras[aura]
		end
	end

	local name = aura
	if type(aura) == "number" then
		name = string.format("%s [%s]", GladiusEx:SafeGetSpellName(aura), aura)
	end

	return {
		type = "group",
		name = name,
		desc = name,
		get = getAura,
		set = setAura,
		disabled = function() return not self:IsUnitEnabled(unit) end,
		args = {
			name = {
				type = "input",
				dialogControl = HasAuraEditBox() and "Aura_EditBox" or nil,
				name = L["Name"],
				desc = L["Name of the aura"],
				disabled = function() return not self:IsUnitEnabled(unit) end,
				order = 1,
			},
			priority = {
				type= "range",
				name = L["Priority"],
				desc = L["Select what priority the aura should have - higher equals more priority"],
				min = 0, softMax = 10, step = 1,
				order = 2,
			},
			delete = {
				type = "execute",
				name = L["Delete"],
				func = function(info)
					local aura = info[#(info) - 1]
					self.db[unit].classIconAuras[aura] = nil
					options.auraList.args[aura] = nil
					GladiusEx:UpdateFrames()
				end,
				disabled = function() return not self:IsUnitEnabled(unit) end,
				order = 3,
			},
		},
	}
end
