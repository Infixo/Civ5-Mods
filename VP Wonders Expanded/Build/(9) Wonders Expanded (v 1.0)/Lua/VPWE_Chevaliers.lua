print("Loading VPWE_Chevaliers.lua from Vox Populi Wonders Expanded");
--------------------------------------------------------------
-- Vox Populi Wonders Expanded
-- Orginal script for Kronborg was created by LeeS
-- Author: Infixo
-- Dec 13, 2017: Retrofitted for Vox Populi
--------------------------------------------------------------


local iChevaliers = GameInfoTypes["BUILDING_CHEVALIERS"]
local iChevaliersDummy = GameInfoTypes["BUILDING_CHEVALIERS_DUMMY"]
local HasChevaliers = false
local iChevaliersOwner
local iChevaliersCity

print("Chevaliers is", iChevaliers, "Chevaliers Dummy is", iChevaliersDummy);

--------------------------------------------
-- Chevaliers: load game, check if they are built
--------------------------------------------
function OnLoadScreenClose()
for i = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
	local pPlayer = Players[i]
	if pPlayer:IsEverAlive() then
		for pCity in pPlayer:Cities() do
			if pCity:IsHasBuilding(iChevaliers) then
				HasChevaliers = true
				iChevaliersCity = pCity:GetID()
				iChevaliersOwner = i
			end
		end
	end
end
end
Events.LoadScreenClose.Add(OnLoadScreenClose)

--------------------------------------------
-- Chevaliers: check if wonder was built
--------------------------------------------
function OnCityConstructed (iPlayer, iCity, iBuilding, bGold, bFaith) 
	if iBuilding == iChevaliers then
		print("Chevaliers constructed by player "..iPlayer.." in city "..iCity);
		HasChevaliers = true
		iChevaliersCity = iCity
		iChevaliersOwner = iPlayer
		local pPlayer = Players[iPlayer]
		for pCity in pPlayer:Cities() do
			if pCity:IsCoastal(10) then
				print("City "..pCity:GetName().." is coastal");
			else
				print("City "..pCity:GetName().." is NOT coastal, so granting Chevaliers Dummy...");
				pCity:SetNumRealBuilding (iChevaliersDummy, 1);
				-- debug
				if pCity:GetNumRealBuilding(iChevaliersDummy) > 0 then print("...granted ok"); end
			end
		end
	end
end
GameEvents.CityConstructed.Add(OnCityConstructed)

--------------------------------------------
-- Chevaliers: check if wonder conquered by another player
--------------------------------------------
function OnCityCaptureComplete (iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest)
	if HasChevaliers then	
		local pPlot = Map.GetPlot(iX, iY)
		local pConqCity = pPlot:GetPlotCity()
		local iConqCity = pConqCity:GetID()
		if iConqCity == iChevaliersCity then
			-- Chevaliers was conquered, clear all dummies
			local pOldOwner = Players[iOldOwner]
			for pCity in pOldOwner:Cities() do
				-- no need to check for anything, just clear all cities?
				--if pCity:IsCoastal(10) then
				pCity:SetNumRealBuilding (iChevaliersDummy, 0)
				--end
			end
			-- now grant dummies for a new owner
			local pNewOwner = Players[iNewOwner]
			iChevaliersOwner = iNewOwner
			for pCity in pNewOwner:Cities() do
				if not pCity:IsCoastal(10) then
					pCity:SetNumRealBuilding (iChevaliersDummy, 1)
				end
			end		
		else
			-- player that owns Chevaliers conquered another city, check if NOT coastal
			if iNewOwner == iChevaliersOwner and not pConqCity:IsCoastal(10) then
				pConqCity:SetNumRealBuilding (iChevaliersDummy, 1)
			end
		end
	end
end
GameEvents.CityCaptureComplete.Add(OnCityCaptureComplete)

--------------------------------------------
-- Chevaliers: check if new city has effects
--------------------------------------------
function OnPlayerCityFounded (iPlayer, iX, iY)
	if HasChevaliers then
		if iPlayer == iChevaliersOwner then
			local pPlot = Map.GetPlot(iX, iY)
			local pCity = pPlot:GetPlotCity()
			if not pCity:IsCoastal(10) then
				pCity:SetNumRealBuilding (iChevaliersDummy, 1)
			end
		end
	end
end
GameEvents.PlayerCityFounded.Add(OnPlayerCityFounded)

print("Finished loading VPWE_Chevaliers.lua from Vox Populi Wonders Expanded");