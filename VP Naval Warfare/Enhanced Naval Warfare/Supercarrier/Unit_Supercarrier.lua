print("Loading Unit_Supercarrier.lua from Enhanced Naval Warfare for Vox Populi");
--------------------------------------------------------------
-- Enhanced Naval Warfare for Vox Populi
-- A player can have a limited number of Supercarriers
-- Author: Infixo
-- 2018-11-19: Created
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


--[[ SYNTAX
//   GameEvents.CanHaveUpgrade.Add(function(iPlayer, iUnit, iUnitClassType, iUnitType) return true end)
--]]

local eSupercarrierClass = GameInfoTypes.UNITCLASS_SUPERCARRIER;

-- main function, will be called MANY times, so make it fast!
function CanHaveUpgrade(iPlayer, iUnit, iUpgradeUnitClass, iUpgradeUnitType)
	--dprint("FUNSTA UnitCanHaveUpgrade()", iPlayer, iUnit, iUpgradeUnitClass, iUpgradeUnitType);
	-- checks
	if iUpgradeUnitClass ~= eSupercarrierClass then return true; end
	local pPlayer = Players[iPlayer];
	if not pPlayer:IsAlive() then return false; end
	-- how many are there already?
	--dprint("Currently have", pPlayer:GetUnitClassCountPlusMaking(eSupercarrierClass));
	--dprint("Maximum is ", GameInfo.UnitClasses[eSupercarrierClass].MaxPlayerInstances);
	return pPlayer:GetUnitClassCountPlusMaking(eSupercarrierClass) < GameInfo.UnitClasses[eSupercarrierClass].MaxPlayerInstances;
end
GameEvents.CanHaveUpgrade.Add(CanHaveUpgrade);

function Initialize()
	--dprint("FUNSTA Initialize()");
	--dprint("FUNEND Initialize()");
end
Initialize();

print("Loaded Unit_Supercarrier.lua from Enhanced Naval Warfare for Vox Populi");