print("Loading VPWE_Chartres.lua from Vox Populi Wonders Expanded mod");
--------------------------------------------------------------
-- Vox Populi Wonders Expanded
-- The script for Chartres Cathedral was created by Sukritact
-- Author: Infixo
-- Dec 12, 2017: Retrofitted for VP
--------------------------------------------------------------

local iMod = 0.1

local iWonder = GameInfoTypes.BUILDING_CHARTRES
local iDummy = GameInfoTypes.BUILDING_CHARTRES_DUMMY

function GetTradeRoutesToCity(pCity)

	local tCities = {}

	local iPlayer = pCity:GetOwner()
	local pPlayer = Players[iPlayer]

	-- Domestic Trade Routes
	local tTradeRoutes = pPlayer:GetTradeRoutes()
	for iKey, tRoute in ipairs(tTradeRoutes) do
		if (tRoute.ToCity == pCity) then
			local pFromCity = tRoute.FromCity
			tCities[pFromCity] = true
		end
	end
	
	-- International Trade Routes
	local tTradeRoutes = pPlayer:GetTradeRoutesToYou()
	for iKey, tRoute in ipairs(tTradeRoutes) do
		if (tRoute.ToCity == pCity) then
			local pFromCity = tRoute.FromCity
			tCities[pFromCity] = true
		end
	end	
	
	return tCities
end

function GetFaithFromCities(tCities)
	local iFaith = 0
	for pCity, _ in pairs(tCities) do
		if pCity:GetFaithPerTurn() > 0 then
			iFaith = iFaith + pCity:GetFaithPerTurn() * iMod
		end
	end
	return math.ceil(iFaith)
end

function SetChartesDummy(pCity)
	-- City has Chartres Cathedral
	if pCity:IsHasBuilding(iWonder) then
		local tCities = GetTradeRoutesToCity(pCity)
		local iFaith = GetFaithFromCities(tCities)
		
		if pCity:GetNumRealBuilding(iDummy) ~= iFaith then
			pCity:SetNumRealBuilding(iDummy, iFaith)
		end
		
	-- City has Chartres Dummies but not Chartres Cathedral
	elseif pCity:IsHasBuilding(iDummy) then
		pCity:SetNumRealBuilding(iDummy, 0)
	end
end

function SerialEventGameDataDirty()
	local pPlayer = Players[Game.GetActivePlayer()]
	for	pCity in pPlayer:Cities() do
		SetChartesDummy(pCity)
	end
end
Events.SerialEventGameDataDirty.Add(SerialEventGameDataDirty)

function PlayerDoTurn(iPlayer)
	local pPlayer = Players[iPlayer]
	for	pCity in pPlayer:Cities() do
		SetChartesDummy(pCity)
	end
end
GameEvents.PlayerDoTurn.Add(PlayerDoTurn)

--=======================================================================================================================
-- FORGE OF DAMASCUS by Ryan
--=======================================================================================================================
-- DateCreated: 4/25/2017 6:40:17 PM
-- Shoutout to Firaxis for only allowing the defining of melee or ranged types instead of specific units in XML
--------------------------------------------------------------

--local tValid = {
-- CLA
--UNIT_HORSEMAN
--UNIT_GREEK_COMPANIONCAVALRY
--[GameInfoTypes["UNIT_SWORDSMAN"]] = true,
--[GameInfoTypes["UNIT_ROMAN_LEGION"]] = true,
--UNIT_BYZANTINE_CATAPHRACT
--[GameInfoTypes["UNIT_KRIS_SWORDSMAN"]] = true,
-- MED
--[GameInfoTypes["UNIT_LONGSWORDSMAN"]] = true,
--[GameInfoTypes["UNIT_JAPANESE_SAMURAI"]] = true,
--[GameInfoTypes["UNIT_KNIGHT"]] = true,
--[GameInfoTypes["UNIT_SONGHAI_MUSLIMCAVALRY"]] = true,
--[GameInfoTypes["UNIT_GERMAN_LANDSKNECHT"]] = true,
--[GameInfoTypes["UNIT_SPANISH_CONQUISTADOR"]] = true,
--[GameInfoTypes["UNIT_DANISH_BERSERKER"]] = true,
--[GameInfoTypes["UNIT_ZULU_IMPI"]] = true,
-- REN
--[GameInfoTypes["UNIT_LANCER"]] = true,
--[GameInfoTypes["UNIT_OTTOMAN_SIPAHI"]] = true,
--[GameInfoTypes["UNIT_SPANISH_TERCIO"]] = true,
--[GameInfoTypes["UNIT_SWEDISH_HAKKAPELIITTA"]] = true,
--[GameInfoTypes["UNIT_POLISH_WINGED_HUSSAR"]] = true,
-- IND
--[GameInfoTypes["UNIT_CAVALRY"]] = true,
--[GameInfoTypes["UNIT_RUSSIAN_COSSACK"]] = true,
--[GameInfoTypes["UNIT_AUSTRIAN_HUSSAR"]] = true,
--[GameInfoTypes["UNIT_BERBER_CAVALRY"]] = true
--UNIT_SHOSHONE_COMANCHE_RIDERS
--}
--[[
local iWonder = GameInfoTypes["BUILDING_DAMASCUS"]
local iWonderProm = GameInfoTypes["PROMOTION_DAMASCUS"]

function C15_ShuddupHammy(playerID, cityID, unitID)
    local pPlayer = Players[playerID]
    local pCity = pPlayer:GetCityByID(cityID)
    local pUnit = pPlayer:GetUnitByID(unitID)
    if pCity:IsHasBuilding(iWonder) and tValid[pUnit:GetUnitType()] then
        pUnit:SetHasPromotion(iWonderProm, true)
    end
end

GameEvents.CityTrained.Add(C15_ShuddupHammy)
--]]


print("Finished loading VPWE_Chartres.lua from Vox Populi Wonders Expanded mod");