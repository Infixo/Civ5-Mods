print("Loading VPWE_Michel.lua from Vox Populi Wonders Expanded");
--------------------------------------------------------------
-- Vox Populi Wonders Expanded
-- Special location for Mont Saint Michel: 1-tile island!
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

local iWonder = GameInfoTypes["BUILDING_MICHEL"];

-- main function, will be called MANY times, so make it fast!
function CityCanConstruct(iPlayer, iCity, iBuildingType)
	--dprint("FUNSTA CityCanConstruct()", iPlayer, iCity, iBuildingType);
	-- if this is NOT a tracked Building then quit immediately
	if iBuildingType ~= iWonder then return true; end
	local pPlayer = Players[iPlayer];
	if not pPlayer:IsAlive() then return false; end
	local pCity = pPlayer:GetCityByID(iCity);
	local iCityX = pCity:GetX();
	local iCityY = pCity:GetY();
	--dprint("...checking (wonder) for city @(x,y)", GameInfo.Buildings[iWonder].Type, iCityX, iCityY);
	-- check all six dir, quit if not water
	for dir = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1 do
		if not Map.PlotDirection(iCityX, iCityY, dir):IsWater() then
			--dprint("FUNEND NOT Island!");
			return false;
		end
	end
	--dprint("FUNEND ISLAND!");
	return true;
end
GameEvents.CityCanConstruct.Add(CityCanConstruct);

print("Loaded VPWE_Michel.lua from Vox Populi Wonders Expanded");