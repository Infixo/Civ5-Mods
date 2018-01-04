print("Loading VPWE_MutEx.lua from Vox Populi Wonders Expanded");
--------------------------------------------------------------
-- Vox Populi Wonders Expanded
-- Mutually Exclusive groups of Wonders using CityCanConstruct event
-- Author: Infixo
-- Dec 14th, 2017: Created
--------------------------------------------------------------

-- debug output routine
function dprint(sStr,p1,p2,p3,p4,p5,p6)
	local sOutStr = sStr;
	if p1 ~= nil then sOutStr = sOutStr.." [1] "..tostring(p1); end
	if p2 ~= nil then sOutStr = sOutStr.." [2] "..tostring(p2); end
	if p3 ~= nil then sOutStr = sOutStr.." [3] "..tostring(p3); end
	if p4 ~= nil then sOutStr = sOutStr.." [4] "..tostring(p4); end
	if p5 ~= nil then sOutStr = sOutStr.." [5] "..tostring(p5); end
	if p6 ~= nil then sOutStr = sOutStr.." [6] "..tostring(p6); end
	print(sOutStr);
end

--[[
SYNTAX
void GameEvents.CityCanConstruct(PlayerID player, CityID city, BuildingType buildingType) 

USAGE
GameEvents.CityCanConstruct.Add(
function(iPlayer, iCity, iBuildingType)
	return true;
end
);
--]]

-- replacement for CountNumBuildings which produced wrong results during tests (idk)
function CountNumBuildingsLocal(player,bid)
	local tot = 0;
	for city in player:Cities() do
		tot = tot + city:GetNumRealBuilding(bid);
	end
	return tot;
end


local tValidWonders = {};
local tWonderGroups = {};

-- main function, will be called MANY times, so make it fast!
function CityCanConstruct(iPlayer, iCity, iBuildingType)
	--dprint("FUNSTA CityCanConstruct()", iPlayer, iCity, iBuildingType);
	
	-- if this is NOT a tracked Wonder then quit immediately
	if not tValidWonders[iBuildingType] then return true; end
	
	local pPlayer = Players[iPlayer];
	if not pPlayer:IsAlive() then return false; end
	
	-- check if one of the group is built
	local iGroup = tWonderGroups[iBuildingType];
	--dprint("Checking (wonder) in (group)", GameInfo.Buildings[iBuildingType].Type, iGroup);
	for wonder, group in pairs(tWonderGroups) do
		-- if group == iGroup and pPlayer:CountNumBuildings(wonder) > 0 then -- for some reasons this function doesn't work sometimes...
		if group == iGroup and CountNumBuildingsLocal(pPlayer, wonder) > 0 then -- for some reasons this function doesn't work sometimes...
			--dprint("FUNEND Player already has constructed (id,wonder)", wonder, GameInfo.Buildings[wonder].Type);
			return false;
		end
	end
	-- not constructed apparently
	--dprint("FUNEND Can be constructed!");
	return true;
end
GameEvents.CityCanConstruct.Add(CityCanConstruct);


function Initialize()
	--dprint("FUNSTA Initialize()");
	
	-- find all valid Wonders
	for building in GameInfo.Buildings() do	
		local thisBuildingClass = GameInfo.BuildingClasses[building.BuildingClass];
		if thisBuildingClass.MaxGlobalInstances == 1 and building.IsCorporation == 0 and building.MutuallyExclusiveGroup > 0 then -- exclude Corporations
			--local iWonder = GameInfoTypes[building.Type];
			dprint("...adding (id,wonder,group)", building.ID, building.Type, building.MutuallyExclusiveGroup);
			tValidWonders[building.ID] = true;
			tWonderGroups[building.ID] = building.MutuallyExclusiveGroup;
		end
	end
	
	-- debug
	--dprint("Tracked wonders:");
	--for wonder, valid in pairs(tValidWonders) do dprint(GameInfo.Buildings[wonder].Type, valid); end
	--dprint("Wonder groups:");
	--for wonder, group in pairs(tWonderGroups) do dprint(GameInfo.Buildings[wonder].Type, group); end
	
	--dprint("FUNEND Initialize()");
end
Initialize();

print("Loaded VPWE_MutEx.lua from Vox Populi Wonders Expanded");

--[[
GameEvents.CityCanConstruct.Add(
function(iPlayer, iCity, iBuildingType)
	local iEngland = -1;
	local iLondonX = 43;
	local iLondonY = 17;
	for iPlayer = 0, 3, 1 do
		local pPlayer = Players[iPlayer];
		local playerStartPlot = pPlayer:GetStartingPlot();
		-- London?
		if (playerStartPlot:GetX() == iLondonX and playerStartPlot:GetY() == iLondonY) then
			iEngland = iPlayer;
			break;
		end
	end
	local pPlayer = Players[iPlayer];
	local pCity = pPlayer:GetCityByID(iCity);
	-- Shire Courts
	if (iBuildingType == GameInfo.Buildings["BUILDING_COURTHOUSE"].ID) then
		-- Only 8+ tiles from London
		if (Map.PlotDistance(pCity:GetX(), pCity:GetY(), iLondonX, iLondonY) < 8) then
			return false;
		end
		-- Only in originally Anglo-Saxon cities
		if (pCity:GetOriginalOwner() ~= iEngland) then
			return false;
		end
	end
	-- Domesday Book (only in London)
	if (iBuildingType == GameInfo.Buildings["BUILDING_NATIONAL_COLLEGE"].ID) then
		if (pCity:GetX() ~= iLondonX or pCity:GetY() ~= iLondonY) then
			return false;
		end
	end
	return true;
end
);
--]]
