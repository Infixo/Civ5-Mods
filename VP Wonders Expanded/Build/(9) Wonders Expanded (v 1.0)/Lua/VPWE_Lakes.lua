print("Loading VPWE_Lakes.lua from Vox Populi Wonders Expanded");
--------------------------------------------------------------
-- Vox Populi Wonders Expanded
-- Support for true Lake locations for Wonders and Buildings using CityCanConstruct event
-- Lake is when: FreshWater = 1, Water = 1, MinAreaSize = 1
-- The game allows for building on the Coast with River in that situation - the script removes that possibility
-- Author: Infixo
-- Dec 15th, 2017: Created
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


local tValidBuildings = {};

-- main function, will be called MANY times, so make it fast!
function CityCanConstruct(iPlayer, iCity, iBuildingType)
	--dprint("FUNSTA CityCanConstruct()", iPlayer, iCity, iBuildingType);
	-- if this is NOT a tracked Building then quit immediately
	if not tValidBuildings[iBuildingType] then return true; end
	local pPlayer = Players[iPlayer];
	if not pPlayer:IsAlive() then return false; end
	local pCity = pPlayer:GetCityByID(iCity);
	if pCity:IsCoastal(1) and not pCity:IsCoastal(10) then
		--dprint("FUNEND Lake!");
		return true;
	end
	--dprint("FUNEND NOT Lake!");
	return false;
end
GameEvents.CityCanConstruct.Add(CityCanConstruct);

function Initialize()
	--dprint("FUNSTA Initialize()");
	-- find all valid Buildings
	-- Lake is when: FreshWater = 1, Water = 1, MinAreaSize = 1
	for building in GameInfo.Buildings() do	
		--local thisBuildingClass = GameInfo.BuildingClasses[building.BuildingClass];
		--if thisBuildingClass.MaxGlobalInstances == 1 and building.IsCorporation == 0 and building.MutuallyExclusiveGroup > 0 then -- exclude Corporations
		if building.FreshWater and building.Water and building.MinAreaSize == 1 and building.IsCorporation == 0 then
			local iBuilding = GameInfoTypes[building.Type];
			dprint("...adding (id,building)", building.ID, building.Type);
			tValidBuildings[building.ID] = true;
		end
	end
	--dprint("FUNEND Initialize()");
end
Initialize();

print("Loaded VPWE_Lakes.lua from Vox Populi Wonders Expanded");