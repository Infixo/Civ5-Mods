-- Infixo: 2017.01.30 added support for Religion Spread without FlagsPlus and with BNW
-------------------------------------------------
-- Religion Overview Popup
-------------------------------------------------
include( "IconSupport" );
include( "InstanceManager" );

-------------------------------------------------
-- Global Constants
-------------------------------------------------
g_Tabs = {
	["YourReligion"] = {
		Panel = Controls.YourReligionPanel,
		SelectHighlight = Controls.YourReligionSelectHighlight,
	},
	
	["WorldReligion"] = {
		Panel = Controls.WorldReligionPanel,
		SelectHighlight = Controls.WorldReligionsSelectHighlight,
	},
	
	["Beliefs"] = {
		Panel = Controls.BeliefsPanel,
		SelectHighlight = Controls.BeliefsSelectHighlight,
	},
  -- Infixo: Religion Spread - add a new tab to the window for the map
  ["Map"] = {
    Panel = Controls.MapPanel,
    SelectHighlight = Controls.MapSelectHighlight,
  },
  -- Infixo: Religion Spread
}

g_BeliefSortOptions = {
	{
		Button = Controls.BPSortbyName,
		ImageControl = Controls.BPSortbyNameImage,
		Column = "Name",
		DefaultDirection = "asc",
		CurrentDirection = "asc",
	},
	{
		Button = Controls.BPSortbyType,
		ImageControl = Controls.BPSortbyTypeImage,
		Column = "Type",
		DefaultDirection = "desc",
		CurrentDirection = nil,
	},
	{
		Button = Controls.BPSortbyBonus,
		ImageControl = Controls.BPSortbyBonusImage,
		Column = "Description",
		DefaultDirection = "desc",
		CurrentDirection = nil,
	},
	{
		Button = Controls.BPSortbyReligion,
		ImageControl = Controls.BPSortbyReligionImage,
		Column = "Religion",
		DefaultDirection = "desc",
		CurrentDirection = nil,
	},
};

g_WorldReligionSortOptions = {
	{
		Button = Controls.WRSortByReligion,
		ImageControl = Controls.WRSortByReligionImage,
		Column = "Name",
		DefaultDirection = "asc",
		CurrentDirection = "asc",
	},
	{
		Button = Controls.WRSortByHolyCity,
		ImageControl = Controls.WRSortByHolyCityImage,
		Column = "HolyCity",
		DefaultDirection = "desc",
		CurrentDirection = nil,
	},
	{
		Button = Controls.WRSortByFounder,
		ImageControl = Controls.WRSortByFounderImage,
		Column = "Founder",
		DefaultDirection = "desc",
		CurrentDirection = nil,
	},
	{
		Button = Controls.WRSortByNumCities,
		ImageControl = Controls.WRSortByNumCitiesImage,
		Column = "NumCities",
		DefaultDirection = "desc",
		SortType = "numeric",
		CurrentDirection = nil,
	},
	-- Infixo: Religion Spread - add a new column in existing tab for no of followers
	{
		Button = Controls.WRSortByNumFollowers,
		ImageControl = Controls.WRSortByNumFollowersImage,
		Column = "NumFollowers",
		DefaultDirection = "desc",
		SortType = "numeric",
		CurrentDirection = nil,
	},
	-- Infixo: Religion Spread
};


g_BeliefSortFunction = nil;
g_WorldReligionSortFunction = nil;

local g_ReligiousBeliefsManager = InstanceManager:new("YourReligiousBeliefInstance", "Base", Controls.YourReligiousBeliefsStack);
local g_FaithModifierManager = InstanceManager:new("FaithModifierInstance", "FaithModifier", Controls.FaithModifierStack);
local g_WorldReligionsManager = InstanceManager:new( "WorldReligionInstance", "Base", Controls.WorldReligionsStack);
local g_BeliefsManager = InstanceManager:new( "BeliefInstance", "Base", Controls.BeliefsStack);

-- Infixo: Religion Spread - definitions and variables
local Colours = {
  UNKNOWN   = {r=190, g=190, b=190, a=1.0},
  NONE      = {r=0,   g=0,   b=0,   a=0.0},
  WATER     = {r=0,   g=0,   b=0,   a=0.0},
  ICE       = {r=189, g=242, b=255, a=0.7},
  CITY      = {r=0,   g=0,   b=0,   a=1.0},
  HOLY_CITY = {r=255, g=255, b=0,   a=1.0}
}

local iFeatureIce = GameInfoTypes.FEATURE_ICE
local iTerrainDesert = GameInfoTypes.TERRAIN_DESERT

local mapWidth, mapHeight = Map.GetGridSize()
Controls.ReligionMap:SetMapSize(mapWidth, mapHeight, 0, -1)
-- Infixo: Religion Spread
-------------------------------------------------
-- Global Variables
-------------------------------------------------
g_CurrentTab = nil;		-- The currently selected Tab.

-------------------------------------------------
-------------------------------------------------

function GetReligiousStatus()

	local text = nil;
	local player = Players[Game.GetActivePlayer()];
	if(player:HasCreatedReligion()) then
		local eReligion = player:GetReligionCreatedByPlayer();
		text = Locale.Lookup("TXT_KEY_RO_STATUS_FOUNDER", Game.GetReligionName(eReligion));
	elseif(player:HasCreatedPantheon()) then
		text = Locale.Lookup("TXT_KEY_RO_STATUS_CREATED_PANTHEON");
	elseif(player:CanCreatePantheon(true)) then
		text = Locale.Lookup("TXT_KEY_RO_STATUS_CAN_CREATE_PANTHEON");
	elseif(player:CanCreatePantheon(false)) then
		local minRequiredFaith = Game.GetMinimumFaithNextPantheon();
		local currentFaith = player:GetFaith();
		local faithNeeded = minRequiredFaith - currentFaith;
		text = Locale.Lookup("TXT_KEY_RO_STATUS_NEED_FAITH" , faithNeeded);
	else
		text = Locale.Lookup("TXT_KEY_RO_STATUS_TOO_LATE");
	end
	
	return text;
end

function GetBeliefType(belief)
	if(belief.Pantheon) then
		return Locale.Lookup("TXT_KEY_RO_BELIEF_TYPE_PANTHEON");
	elseif(belief.Founder) then
		return Locale.Lookup("TXT_KEY_RO_BELIEF_TYPE_FOUNDER");
	elseif(belief.Follower) then
		return Locale.Lookup("TXT_KEY_RO_BELIEF_TYPE_FOLLOWER");
	elseif(belief.Enhancer) then
		return Locale.Lookup("TXT_KEY_RO_BELIEF_TYPE_ENHANCER");
	elseif(belief.Reformation) then
	    return Locale.Lookup("TXT_KEY_RO_BELIEF_TYPE_REFORMATION");
	end
end
	
-------------------------------------------------
-------------------------------------------------
function OnPopupMessage(popupInfo)
	
	local popupType = popupInfo.Type;
	if popupType ~= ButtonPopupTypes.BUTTONPOPUP_RELIGION_OVERVIEW then
		return;
	end
	
	if(not Game.IsOption(GameOptionTypes.GAMEOPTION_NO_RELIGION)) then
		g_PopupInfo = popupInfo;
	
		if( g_PopupInfo.Data1 == 1 ) then
    		if( ContextPtr:IsHidden() == false ) then
    			OnClose();
			else
        		UIManager:QueuePopup( ContextPtr, PopupPriority.InGameUtmost );
    		end
		else
			UIManager:QueuePopup( ContextPtr, PopupPriority.SocialPolicy );
		end   	
   	end
end
Events.SerialEventGameMessagePopup.Add( OnPopupMessage );

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function IgnoreLeftClick( Id )
	-- just swallow it
end
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function InputHandler( uiMsg, wParam, lParam )
    ----------------------------------------------------------------        
    -- Key Down Processing
    ----------------------------------------------------------------        
    if(uiMsg == KeyEvents.KeyDown) then
        if (wParam == Keys.VK_ESCAPE) then
			OnClose();
			return true;
        end
        
        -- Do Nothing.
        if(wParam == Keys.VK_RETURN) then
			return true;
        end
    end
end
ContextPtr:SetInputHandler( InputHandler );
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function OnClose()
	UIManager:DequeuePopup(ContextPtr);
end
Controls.CloseButton:RegisterCallback(Mouse.eLClick, OnClose);
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function TabSelect(tab)

	for i,v in pairs(g_Tabs) do
		local bHide = i ~= tab;
		v.Panel:SetHide(bHide);
		v.SelectHighlight:SetHide(bHide);
	end
	g_CurrentTab = tab;
	g_Tabs[tab].RefreshContent();	
end
Controls.TabButtonYourReligion:RegisterCallback( Mouse.eLClick, function() TabSelect("YourReligion"); end);
Controls.TabButtonWorldReligions:RegisterCallback( Mouse.eLClick, function() TabSelect("WorldReligion"); end );
Controls.TabButtonBeliefs:RegisterCallback( Mouse.eLClick, function() TabSelect("Beliefs"); end );
-- Infixo: Religion Spread - what happens when you press the map button
Controls.TabButtonMap:RegisterCallback( Mouse.eLClick, function() TabSelect("Map"); end );
-- Infixo: Religion Spread

function RefreshYourReligion()
	local player = Players[Game.GetActivePlayer()];
	local capital = player:GetCapitalCity();

	-- faith Display
	local minFaithForProphet = tostring(player:GetMinimumFaithNextGreatProphet());
	Controls.CurrentFaith:LocalizeAndSetText("TXT_KEY_RO_FAITH", player:GetFaith(), minFaithForProphet);
	Controls.CurrentFaith:LocalizeAndSetToolTip("TXT_KEY_RO_FAITH_TOOLTIP", minFaithForProphet);
	
	-- Update faith modifiers
	g_FaithModifierManager:ResetInstances();
	-- Faith from Cities
	local iFaithFromCities = player:GetFaithPerTurnFromCities();
	if (iFaithFromCities ~= 0) then
		local entry = g_FaithModifierManager:GetInstance();
		entry.FaithModifier:LocalizeAndSetText("TXT_KEY_TP_FAITH_FROM_CITIES", iFaithFromCities);
	end

	-- Faith from Minor Civs
	local iFaithFromMinorCivs = player:GetFaithPerTurnFromMinorCivs();
	if (iFaithFromMinorCivs ~= 0) then
		local entry = g_FaithModifierManager:GetInstance();
		entry.FaithModifier:LocalizeAndSetText("TXT_KEY_TP_FAITH_FROM_MINORS", iFaithFromMinorCivs);
	end
	
	-- Faith from Religion
	local iFaithFromReligion = player:GetFaithPerTurnFromReligion();
	if (iFaithFromReligion ~= 0) then
		local entry = g_FaithModifierManager:GetInstance();
		entry.FaithModifier:LocalizeAndSetText("TXT_KEY_TP_FAITH_FROM_RELIGION", iFaithFromReligion);
	end
	
	-- Unlocked Great People
	local unlockedGreatPeople = {}
		
	local capital = player:GetCapitalCity();
	if(capital ~= nil) then	
		for info in GameInfo.Units{Special = "SPECIALUNIT_PEOPLE"} do
			local infoID = info.ID;
			local faithCost = capital:GetUnitFaithPurchaseCost(infoID, true);
			if(faithCost > 0 and player:IsCanPurchaseAnyCity(false, true, infoID, -1, YieldTypes.YIELD_FAITH)) then
				if (player:DoesUnitPassFaithPurchaseCheck(infoID)) then
					table.insert(unlockedGreatPeople, Locale.Lookup(info.Description));
				end
			end
		end
	end
		
	table.sort(unlockedGreatPeople, function(a,b) return Locale.Compare(a,b) == -1 end);
	
	for i = 1,9,1 do
		local c = Controls["GreatPersonName" .. i];
		c:SetHide(true);
	end
	
	for i,v in ipairs(unlockedGreatPeople) do
		local c = Controls["GreatPersonName" .. i];
		if(c ~= nil) then
			c:SetText("[ICON_BULLET] " .. v);
			c:SetHide(false);
		end
	end
	
	if(#unlockedGreatPeople == 0) then
		local c = Controls["GreatPersonName" .. 1];
		c:LocalizeAndSetText("TXT_KEY_RO_YR_NO_GREAT_PEOPLE");
		c:SetHide(false);
	end

	Controls.GreatPersonList:CalculateSize();
	
	local player = Players[Game.GetActivePlayer()];
	if(player:HasCreatedReligion()) then
		local eReligion = player:GetReligionCreatedByPlayer();
	
		local religion = GameInfo.Religions[eReligion];
	
		IconHookup(religion.PortraitIndex, 80, religion.IconAtlas, Controls.FounderReligionIcon);
		Controls.FounderReligionIcon:SetHide(false);
	elseif(player:HasCreatedPantheon()) then
		
		local pantheon = GameInfo.Religions["RELIGION_PANTHEON"];
		IconHookup(pantheon.PortraitIndex, 80, pantheon.IconAtlas, Controls.FounderReligionIcon);
		Controls.FounderReligionIcon:SetHide(false);
	else
		Controls.FounderReligionIcon:SetHide(true);
	end
	
	CivIconHookup(player:GetID(), 80, Controls.FounderIcon, Controls.FounderIconBG, Controls.FounderIconShadow, true, true );

	Controls.ReligiousStatus:SetText(GetReligiousStatus());
	
	--Refresh Beliefs
	g_ReligiousBeliefsManager:ResetInstances();
	Controls.YourReligionNoBeliefs:SetHide(true);
	Controls.YourReligiousBeliefsStack:SetHide(false);
	if (player:HasCreatedReligion()) then
		local eReligion = player:GetReligionCreatedByPlayer();
		for i,v in ipairs(Game.GetBeliefsInReligion(eReligion)) do
			local belief = GameInfo.Beliefs[v];
			if (belief ~= nil) then
				local entry = g_ReligiousBeliefsManager:GetInstance();
				local beliefType = GetBeliefType(belief);
				entry.BeliefType:SetText(beliefType);
				entry.BeliefName:LocalizeAndSetText(belief.ShortDescription);
				entry.BeliefDescription:LocalizeAndSetText(belief.Description);
				if(belief.Tooltip ~= "") then
					entry.BeliefDescription:LocalizeAndSetToolTip(belief.Tooltip);
				else
					entry.BeliefDescription:LocalizeAndSetToolTip(belief.Description);
				end
				
				local bw,bh = entry.Base:GetSizeVal();
				local bdw,bdh = entry.BeliefDescription:GetSizeVal();
				entry.Base:SetSizeVal(bw, bdh + 18);
			end
		end
	elseif (player:HasCreatedPantheon()) then
		
		local iBelief = player:GetBeliefInPantheon();
		
		local belief = GameInfo.Beliefs[iBelief];
		if(belief ~= nil) then
			local entry = g_ReligiousBeliefsManager:GetInstance();
			local beliefType = GetBeliefType(belief);
			entry.BeliefType:SetText(beliefType);
			entry.BeliefName:LocalizeAndSetText(belief.ShortDescription);
			entry.BeliefDescription:LocalizeAndSetText(belief.Description);
			if(belief.Tooltip ~= "") then
				entry.BeliefDescription:LocalizeAndSetToolTip(belief.Tooltip);
			else
				entry.BeliefDescription:LocalizeAndSetToolTip(belief.Description);
			end
			
			local bw,bh = entry.Base:GetSizeVal();
			local bdw,bdh = entry.BeliefDescription:GetSizeVal();
			entry.Base:SetSizeVal(bw, bdh + 18);
		end
	else
		-- No Beliefs
		Controls.YourReligionNoBeliefs:SetHide(false);
		Controls.YourReligiousBeliefsStack:SetHide(true);
	end
	
	Controls.YourReligiousBeliefsStack:CalculateSize();
	Controls.YourReligiousBeliefsStack:ReprocessAnchoring();
	Controls.YourReligiousBeliefsScrollPanel:CalculateInternalSize();
	
	
	local automaticPurchasePullDown = Controls.AutomaticPurchasePD;
	function AddToPullDown(text, tooltip, v1, v2)
	-- set up the random slot
		local controlTable = {};
		automaticPurchasePullDown:BuildEntry( "InstanceOne", controlTable );
		
		controlTable.Button:SetVoids(v1, v2);
		controlTable.Button:SetText(text);
		controlTable.Button:SetToolTipString(tooltip);
	end
	
	function SetCurrentSelection(v1, v2)
		if (v1 == FaithPurchaseTypes.NO_AUTOMATIC_FAITH_PURCHASE) then
			automaticPurchasePullDown:GetButton():LocalizeAndSetText("TXT_KEY_RO_AUTO_FAITH_PROMPT");
		elseif (v1 == FaithPurchaseTypes.FAITH_PURCHASE_SAVE_PROPHET) then
			automaticPurchasePullDown:GetButton():LocalizeAndSetText("TXT_KEY_RO_AUTO_FAITH_PROPHET");		
		elseif (v1 == FaithPurchaseTypes.FAITH_PURCHASE_UNIT) then
			local faithCost = capital:GetUnitFaithPurchaseCost(GameInfo.Units[v2].ID, true);
			local gpString = string.format("%s (%i [ICON_PEACE])", Locale.Lookup(GameInfo.Units[v2].Description), faithCost); 
			automaticPurchasePullDown:GetButton():LocalizeAndSetText("TXT_KEY_RO_AUTO_FAITH_PURCHASE_GREAT_PERSON", gpString);
		else
			local faithCost = capital:GetBuildingFaithPurchaseCost(GameInfo.Buildings[v2].ID, true);
			local gpString = string.format("%s (%i [ICON_PEACE])", Locale.Lookup(GameInfo.Buildings[v2].Description), faithCost); 
			automaticPurchasePullDown:GetButton():LocalizeAndSetText("TXT_KEY_RO_AUTO_FAITH_PURCHASE_GREAT_PERSON", gpString);
		end
		automaticPurchasePullDown:GetButton():SetToolTipString("");
	end
	
	automaticPurchasePullDown:ClearEntries();
	
	-- Add default options	
	AddToPullDown(Locale.Lookup("TXT_KEY_RO_AUTO_FAITH_PROMPT"), "", FaithPurchaseTypes.NO_AUTOMATIC_FAITH_PURCHASE, 0);
	
	if (player:GetReligionCreatedByPlayer() > ReligionTypes.RELIGION_PANTHEON or Game.GetNumReligionsStillToFound() > 0) then
	    if (player:GetCurrentEra() < GameInfo.Eras["ERA_INDUSTRIAL"].ID) then
			AddToPullDown(Locale.Lookup("TXT_KEY_RO_AUTO_FAITH_PROPHET"), "", FaithPurchaseTypes.FAITH_PURCHASE_SAVE_PROPHET, 0);
		end
	end
	
	--Refresh automatic purchase pulldown.
	local capital = player:GetCapitalCity();
	if(capital ~= nil) then
		for unit in GameInfo.Units() do
			local faithCost = capital:GetUnitFaithPurchaseCost(unit.ID, true);
			if(faithCost > 0 and player:IsCanPurchaseAnyCity(false, true, unit.ID, -1, YieldTypes.YIELD_FAITH)) then
			    if (player:DoesUnitPassFaithPurchaseCheck(unit.ID)) then
					local gpString = string.format("%s (%i [ICON_PEACE])", Locale.Lookup(unit.Description), faithCost); 
					AddToPullDown(Locale.Lookup("TXT_KEY_RO_AUTO_FAITH_PURCHASE_GREAT_PERSON", gpString), "", FaithPurchaseTypes.FAITH_PURCHASE_UNIT, unit.ID);
				end
			end
		end
		
		for building in GameInfo.Buildings() do
			local faithCost = capital:GetBuildingFaithPurchaseCost(building.ID);
			if(faithCost > 0 and player:IsCanPurchaseAnyCity(false, true, -1, building.ID, YieldTypes.YIELD_FAITH)) then
				local gpString = string.format("%s (%i [ICON_PEACE])", Locale.Lookup(building.Description), faithCost); 
				AddToPullDown(Locale.Lookup("TXT_KEY_RO_AUTO_FAITH_PURCHASE_GREAT_PERSON", gpString), "", FaithPurchaseTypes.FAITH_PURCHASE_BUILDING, building.ID);
			end
		end
	end
	
	SetCurrentSelection(player:GetFaithPurchaseType(), player:GetFaithPurchaseIndex());
	
	automaticPurchasePullDown:CalculateInternals();
	automaticPurchasePullDown:RegisterSelectionCallback(function(v1, v2)
		
		local player = Players[Game.GetActivePlayer()];					
		Network.SendFaithPurchase(Game.GetActivePlayer(), v1, v2);
		SetCurrentSelection(v1, v2);
	end);

end

g_Tabs["YourReligion"].RefreshContent = RefreshYourReligion;

-- Infixo: Religion Spread - number of followers - walk through alive players and their cities
function GetNumFollowers(eReligion)
  local iFollowers = 0
  
	for iPlayer = 0, GameDefines.MAX_CIV_PLAYERS - 1 do	
		local pPlayer = Players[iPlayer];
    if (pPlayer:IsAlive()) then
      for pCity in pPlayer:Cities() do
        iFollowers = iFollowers + pCity:GetNumFollowers(eReligion)			
      end
    end
  end
  
  return iFollowers
end
-- Infixo: Religion Spread

function RefreshWorldReligions()
	g_WorldReligionsManager:ResetInstances();
	
	local religions = {};
	
	local activePlayer = Players[Game.GetActivePlayer()];
	local activeTeam = Teams[activePlayer:GetTeam()];
		
	-- Pantheon and Religion info (JFD: Changes made to register religions 'founded' by the same player)
	for religion in GameInfo.Religions() do
		local eReligion = religion.ID;
		--print("Processing religion ID=", eReligion);
		local holyCity = Game.GetHolyCityForReligion(eReligion, -1);
		if holyCity then
			--print("Holy City exists");
			local pPlayer = Players[holyCity:GetOwner()]
			local holyCityName = holyCity:GetName();
			--print("Holy City is", holyCityName);
			local civName = pPlayer:GetCivilizationDescription();
			
			local founderID = pPlayer:GetID();
			
			if(not activeTeam:IsHasMet(pPlayer:GetTeam())) then
				founderID = -1;
				holyCityName = "TXT_KEY_RO_WR_UNKNOWN_HOLY_CITY";
				civName = "TXT_KEY_RO_WR_UNKNOWN_CIV";
			end
		-- Infixo: Religion Spread - add colors to religion names
        local colour = Colours[eReligion];
          if (colour == nil) then
		    --print("colour is nil - calling AssignReligionColours()");
            AssignReligionColours();
            colour = Colours[eReligion];
			--if (colour == nil) then print("colour is still nil after ARC()"); end
		  else
		    --print("colour is not nil");
          end
		-- Infixo: Religion Spread
			
			table.insert(religions, {
				Name = Locale.Lookup(Game.GetReligionName(eReligion)),
				ReligionIconIndex = religion.PortraitIndex,
				ReligionIconAtlas = religion.IconAtlas,
				FounderID = founderID,
				HolyCity= Locale.Lookup(holyCityName),
				Founder = Locale.Lookup(civName),
				NumCities = Game.GetNumCitiesFollowing(eReligion),
				-- Infixo: Religion Spread - additional info on tab with all religions
				Color = {x=colour.r/255, y=colour.g/255, z=colour.b/255, w=colour.a},
				NumFollowers = GetNumFollowers(eReligion),
				FounderAlive = pPlayer:IsAlive(),
				-- Infixo: Religion Spread
			});
			--print("#cities    is", Game.GetNumCitiesFollowing(eReligion));
			--print("#followers is", GetNumFollowers(eReligion));
			--print("#religions is", #religions);
		else
			--print("No Holy City found");
		end
	end
	
	-- for iPlayer = 0, GameDefines.MAX_CIV_PLAYERS - 1 do	
		-- local pPlayer = Players[iPlayer];
		-- if (pPlayer:IsEverAlive()) then
			-- if (pPlayer:HasCreatedReligion()) then
				-- local eReligion = pPlayer:GetReligionCreatedByPlayer();
				-- local religion = GameInfo.Religions[eReligion];
				-- local holyCity = Game.GetHolyCityForReligion(eReligion, iPlayer);
				
				-- local holyCityName = holyCity:GetName();
				-- local civName = pPlayer:GetCivilizationDescription();
				
				-- local founderID = pPlayer:GetID();
				
				-- if(not activeTeam:IsHasMet(pPlayer:GetTeam())) then
					-- founderID = -1;
					-- holyCityName = "TXT_KEY_RO_WR_UNKNOWN_HOLY_CITY";
					-- civName = "TXT_KEY_RO_WR_UNKNOWN_CIV";
				-- end
				
				-- table.insert(religions, {
					-- Name = Locale.Lookup(Game.GetReligionName(eReligion)),
					-- ReligionIconIndex = religion.PortraitIndex,
					-- ReligionIconAtlas = religion.IconAtlas,
					-- FounderID = founderID,
					-- HolyCity= Locale.Lookup(holyCityName),
					-- Founder = Locale.Lookup(civName),
					-- NumCities = Game.GetNumCitiesFollowing(eReligion),
				-- });
			-- end
		-- end
	-- end
	
	if(#religions > 0) then
		--print("Listing", #religions, "religions...");
		Controls.WorldReligionsScrollPanel:SetHide(false);
		Controls.NoWorldReligions:SetHide(true);
		
		table.sort(religions, g_WorldReligionSortFunction);	
		
		for i,v in ipairs(religions) do
			local entry = g_WorldReligionsManager:GetInstance();
			entry.ReligionName:SetText(v.Name);
			-- Infixo: Religion Spread
			entry.ReligionName:SetColor(v.Color, 0);
			-- Infixo: Religion Spread
			entry.HolyCityName:SetText(v.HolyCity);
			entry.Founder:SetText(v.Founder);
			entry.NumberOfCities:SetText(v.NumCities);
			-- Infixo: Religion Spread
			entry.NumberOfFollowers:SetText(v.NumFollowers);
			-- Infixo: Religion Spread
			IconHookup(v.ReligionIconIndex, 48, v.ReligionIconAtlas, entry.WorldReligionIcon);
			CivIconHookup(v.FounderID, 45, entry.FounderIcon, entry.FounderIconBG, entry.FounderIconShadow, true, true );
		end
			
		Controls.WorldReligionsStack:CalculateSize();
		Controls.WorldReligionsStack:ReprocessAnchoring();
		Controls.WorldReligionsScrollPanel:CalculateInternalSize();
	else
		--print("No religions to show...");
		Controls.WorldReligionsScrollPanel:SetHide(true);
		Controls.NoWorldReligions:SetHide(false);
	end
	
	local iReligionsLeft = Game.GetNumReligionsStillToFound();
	if (iReligionsLeft < 0) then
		iReligionsLeft = 0;
	end
	Controls.NumberOfReligionsCanBeFounded:LocalizeAndSetText("TXT_KEY_TP_FAITH_RELIGIONS_LEFT", iReligionsLeft);
	
	local text = GetReligiousStatus();
	Controls.TooLateToStartPantheon:SetText(text);

end
g_Tabs["WorldReligion"].RefreshContent = RefreshWorldReligions;

function RefreshBeliefs()
	g_BeliefsManager:ResetInstances();
	
	local beliefs = {};
	
	local activePlayer = Players[Game.GetActivePlayer()];
	local activeTeam = Teams[activePlayer:GetTeam()];
	
	-- Pantheon and Religion info (JFD: Changes made to register religions 'founded' by the same player)
	for religion in GameInfo.Religions() do
		local eReligion = religion.ID
		local holyCity = Game.GetHolyCityForReligion(eReligion, -1);
		if holyCity then
			for i,v in ipairs(Game.GetBeliefsInReligion(eReligion)) do
				local belief = GameInfo.Beliefs[v];
				local religion = GameInfo.Religions[eReligion];
				table.insert(beliefs, {
				Name = Locale.Lookup(belief.ShortDescription),
				Description = Locale.Lookup(belief.Description),
				Type = GetBeliefType(belief),
				Tooltip = Locale.Lookup(belief.Tooltip),
				Religion = Locale.Lookup(Game.GetReligionName(eReligion)),
				ReligionIconIndex = religion.PortraitIndex,
				ReligionIconAtlas = religion.IconAtlas
			});
			end
		end
	end
	
	for iPlayer = 0, GameDefines.MAX_CIV_PLAYERS - 1 do	
		local pPlayer = Players[iPlayer];
		if (pPlayer:IsEverAlive()) then
			-- if (pPlayer:HasCreatedReligion()) then
				-- local eReligion = pPlayer:GetReligionCreatedByPlayer();
				-- for i,v in ipairs(Game.GetBeliefsInReligion(eReligion)) do
				
					-- local belief = GameInfo.Beliefs[v];
					-- local religion = GameInfo.Religions[eReligion];
					-- table.insert(beliefs, {
						-- Name = Locale.Lookup(belief.ShortDescription),
						-- Description = Locale.Lookup(belief.Description),
						-- Type = GetBeliefType(belief),
						-- Tooltip = Locale.Lookup(belief.Tooltip),
						-- Religion = Locale.Lookup(Game.GetReligionName(eReligion)),
						-- ReligionIconIndex = religion.PortraitIndex,
						-- ReligionIconAtlas = religion.IconAtlas
					-- });
				-- end
			-- elseif (pPlayer:HasCreatedPantheon()) then
			if (pPlayer:HasCreatedPantheon()) then
				local iBelief = pPlayer:GetBeliefInPantheon();
				local belief = GameInfo.Beliefs[iBelief];
				
				local religion = nil;
				if(not activeTeam:IsHasMet(pPlayer:GetTeam())) then
					religion = Locale.Lookup("TXT_KEY_RO_BELIEF_UNKNOWN_PANTHEON");
				else
					local civilizationAdjective = pPlayer:GetCivilizationAdjectiveKey();
					religion = Locale.Lookup("TXT_KEY_RO_BELIEF_PANTHEON", civilizationAdjective);
				end
				
				local pantheon = GameInfo.Religions["RELIGION_PANTHEON"];
				
				table.insert(beliefs, {
					Name = Locale.Lookup(belief.ShortDescription),
					Description = Locale.Lookup(belief.Description),
					Type = GetBeliefType(belief),
					Tooltip = Locale.Lookup(belief.Tooltip),
					Religion = religion,
					ReligionIconIndex = pantheon.PortraitIndex,
					ReligionIconAtlas = pantheon.IconAtlas
				});
			end
		end
	end
	
	if(#beliefs > 0) then
		Controls.BeliefsScrollPanel:SetHide(false);
		Controls.NoBeliefs:SetHide(true);
	
		table.sort(beliefs, g_BeliefSortFunction);	
		
		for i,v in ipairs(beliefs) do
			local beliefEntry = g_BeliefsManager:GetInstance();
			beliefEntry.BeliefName:SetText(v.Name);
			beliefEntry.BeliefType:SetText(v.Type);
			beliefEntry.BeliefDescription:SetText(v.Description);
			if(v.Tooltip ~= "") then
				beliefEntry.BeliefDescription:SetToolTipString(v.Tooltip);
			else
				beliefEntry.BeliefDescription:SetToolTipString(v.Description);
			end
			beliefEntry.BeliefReligion:SetText(v.Religion);
			IconHookup(v.ReligionIconIndex, 48, v.ReligionIconAtlas, beliefEntry.BeliefReligionIcon);
		end
		
		
		Controls.BeliefsStack:CalculateSize();
		Controls.BeliefsStack:ReprocessAnchoring();
		Controls.BeliefsScrollPanel:CalculateInternalSize();
	
	else
		Controls.BeliefsScrollPanel:SetHide(true);
		Controls.NoBeliefs:SetHide(false);
	end
end
g_Tabs["Beliefs"].RefreshContent = RefreshBeliefs;

-- Infixo: Religion Spread - functions to draw the spread map
function AssignReligionColours()
	-- Infixo: 2017.01.30 the function has been redesigned; original was awfully complicated
	-- colors are always the same for religions, they are stored in DB
	-- simply iterate through all religions and get them
	--print("function AssignReligionColours() - new version");
	for religion in GameInfo.Religions() do
		-- print("Religion ID", religion.ID, "is", religion.Type);
		local colorMap = GameInfo.Religion_MapColors("ReligionType='" .. religion.Type .. "'")();
        color = GameInfo.Colors[colorMap.ColorType];
		-- print("Color type", colorMap.ColorType, "is RGB", color.Red, color.Green, color.Blue);
        Colours[religion.ID] = {r=(255*color.Red), g=(255*color.Green), b=(255*color.Blue), a=color.Alpha};
	end
--	print("Printing few colors (insanity check)");
--	print("Color ID= 0 is RGBA=", Colours[0].r, Colours[0].g, Colours[0].b, Colours[0].a);
--	print("Color ID= 1 is RGBA=", Colours[1].r, Colours[1].g, Colours[1].b, Colours[1].a);
--	print("Color ID=13 is RGBA=", Colours[13].r, Colours[13].g, Colours[13].b, Colours[13].a);
--	print("end of function AssignReligionColours()");
end

function ShadeCities(iTeam)
  for iPlayer=0, GameDefines.MAX_CIV_PLAYERS-1 do	
    local pPlayer = Players[iPlayer]

    if (pPlayer:IsAlive()) then
      for pCity in pPlayer:Cities() do
        local iReligion = pCity:GetReligiousMajority()

        if (iReligion > 0) then
          if (Colours[iReligion] == nil) then
            AssignReligionColours()
          end

          ShadeCity(iTeam, pCity, Colours[iReligion])
        end
      end
    end
  end
end

function ShadeCity(iTeam, pCity, colour)
  for i = 1, pCity:GetNumCityPlots()-1, 1 do
    local pPlot = pCity:GetCityIndexPlot(i)
    
    if (pPlot ~= nil and pPlot:IsRevealed(iTeam)) then
      if (pPlot:GetOwner() == pCity:GetOwner()) then
        if (pPlot:IsLake() or not pPlot:IsWater()) then 
          if (pPlot:IsMountain() or pPlot:GetTerrainType() == iTerrainDesert or pCity:IsWorkingPlot(pPlot) or pCity:CanWork(pPlot)) then
            Controls.ReligionMap:SetPlot(pPlot:GetX(), pPlot:GetY(), pPlot:GetTerrainType(), colour.r/255, colour.g/255, colour.b/255, colour.a)
          end
        end
      end
    end
  end
end

function RefreshMap()
  local iPlayer = Game.GetActivePlayer()
  local pPlayer = Players[iPlayer]
  local iTeam = pPlayer:GetTeam()

  for y = 0, mapHeight-1, 1 do  
    for x = 0, mapWidth-1, 1 do
      local pPlot = Map.GetPlot(x, y)
      local colour = Colours.UNKNOWN

      if (pPlot:IsRevealed(iTeam)) then
        if (pPlot:IsCity()) then
          local pCity = pPlot:GetPlotCity()
          local iReligion = pCity:GetReligiousMajority()

          if (iReligion >= 0 and pCity:IsHolyCityForReligion(iReligion)) then
            colour = Colours.HOLY_CITY
          else
            colour = Colours.CITY
          end
        else
          if (pPlot:GetFeatureType() == iFeatureIce) then
            colour = Colours.ICE
          elseif (pPlot:IsWater()) then
            colour = Colours.WATER
          else
            colour = Colours.NONE
          end
        end
      end

      Controls.ReligionMap:SetPlot(x, y, pPlot:GetTerrainType(), colour.r/255, colour.g/255, colour.b/255, colour.a)
    end
  end

  ShadeCities(iTeam)
end
g_Tabs["Map"].RefreshContent = RefreshMap;

-- Infixo: Religion Spread
-------------------------------------------------------------------------------
-- Sorting Support
-------------------------------------------------------------------------------
function AlphabeticalSortFunction(field, direction)
	if(direction == "asc") then
		return function(a,b)
			return Locale.Compare(a[field], b[field]) == -1;
		end
	elseif(direction == "desc") then
		return function(a,b)
			return Locale.Compare(a[field], b[field]) == 1;
		end
	end
end

function NumericSortFunction(field, direction)
	if(direction == "asc") then
		return function(a,b)
			return a[field] <= b[field];
		end
	elseif(direction == "desc") then
		return function(a,b)
			return a[field] > b[field];
		end
	end
end

-- Registers the sort option controls click events
function RegisterSortOptions()
	
	for i,v in ipairs(g_BeliefSortOptions) do
		if(v.Button ~= nil) then
			v.Button:RegisterCallback(Mouse.eLClick, function() BeliefSortOptionSelected(v); end);
		end
	end
	
	for i,v in ipairs(g_WorldReligionSortOptions) do
		if(v.Button ~= nil) then
			v.Button:RegisterCallback(Mouse.eLClick, function() WorldReligionSortOptionSelected(v); end);
		end
	end
	
	UpdateSortOptionsDisplay(g_BeliefSortOptions);
	UpdateSortOptionsDisplay(g_WorldReligionSortOptions);
	
	g_BeliefSortFunction = GetSortFunction(g_BeliefSortOptions);
	g_WorldReligionSortFunction = GetSortFunction(g_WorldReligionSortOptions);
end

function GetSortFunction(sortOptions)
	local orderBy = nil;
	for i,v in ipairs(sortOptions) do
		if(v.CurrentDirection ~= nil) then
			if(v.SortType == "numeric") then
				return NumericSortFunction(v.Column, v.CurrentDirection);
			else
				return AlphabeticalSortFunction(v.Column, v.CurrentDirection);
			end
		end
	end
	
	return nil;
end

-- Updates the sort option structure
function UpdateSortOptionState(sortOptions, selectedOption)
	-- Current behavior is to only have 1 sort option enabled at a time 
	-- though the rest of the structure is built to support multiple in the future.
	-- If a sort option was selected that wasn't already selected, use the default 
	-- direction.  Otherwise, toggle to the other direction.
	for i,v in ipairs(sortOptions) do
		if(v == selectedOption) then
			if(v.CurrentDirection == nil) then			
				v.CurrentDirection = v.DefaultDirection;
			else
				if(v.CurrentDirection == "asc") then
					v.CurrentDirection = "desc";
				else
					v.CurrentDirection = "asc";
				end
			end
		else
			v.CurrentDirection = nil;
		end
	end
end

-- Updates the control states of sort options
function UpdateSortOptionsDisplay(sortOptions)
	for i,v in ipairs(sortOptions) do
		local imageControl = v.ImageControl;
		if(imageControl ~= nil) then
			if(v.CurrentDirection == nil) then
				imageControl:SetHide(true);
			else
				local imageToUse = "SelectedUp.dds";
				if(v.CurrentDirection == "desc") then
					imageToUse = "SelectedDown.dds";
				end
				imageControl:SetTexture(imageToUse);
				
				imageControl:SetHide(false);
			end
		end
	end
end

-- Callback for when sort options are selected.
function BeliefSortOptionSelected(option)
	local sortOptions = g_BeliefSortOptions;
	UpdateSortOptionState(sortOptions, option);
	UpdateSortOptionsDisplay(sortOptions);
	g_BeliefSortFunction = GetSortFunction(sortOptions);
	
	RefreshBeliefs();
end

-- Callback for when sort options are selected.
function WorldReligionSortOptionSelected(option)
	local sortOptions = g_WorldReligionSortOptions;
	UpdateSortOptionState(sortOptions, option);
	UpdateSortOptionsDisplay(sortOptions);
	g_WorldReligionSortFunction = GetSortFunction(sortOptions);
	
	RefreshWorldReligions();
end

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function ShowHideHandler( bIsHide, bInitState )
    if( not bInitState ) then
        if( not bIsHide ) then
        	UI.incTurnTimerSemaphore();  
        	Events.SerialEventGameMessagePopupShown(g_PopupInfo);
        	
        	TabSelect(g_CurrentTab);
				-- Infixo: Religion Spread
                -- MODS START
                local pPlayer = Players[Game.GetActivePlayer()]
                Controls.FoundButton:SetHide(pPlayer:HasCreatedPantheon() == true or pPlayer:CanCreatePantheon(true) == false)
                -- MODS END
				-- Infixo: Religion Spread
        else
			if(g_PopupInfo ~= nil) then
				Events.SerialEventGameMessagePopupProcessed.CallImmediate(g_PopupInfo.Type, 0);
            end
            UI.decTurnTimerSemaphore();
        end
    end
end
ContextPtr:SetShowHideHandler( ShowHideHandler );

----------------------------------------------------------------
-- 'Active' (local human) player has changed
----------------------------------------------------------------
function OnActivePlayerChanged()
	--if (not Controls.ChooseConfirm:IsHidden()) then
	--	Controls.ChooseConfirm:SetHide(true);
	--end
end
Events.GameplaySetActivePlayer.Add(OnActivePlayerChanged);

-----------------------------------------------------------------
-- Add Religion Overview to Dropdown (if enabled)
-----------------------------------------------------------------
if(not Game.IsOption(GameOptionTypes.GAMEOPTION_NO_RELIGION)) then
	LuaEvents.AdditionalInformationDropdownGatherEntries.Add(function(entries)
		table.insert(entries, {
			text=Locale.Lookup("TXT_KEY_RELIGION_OVERVIEW"),
			call=function() 
				Events.SerialEventGameMessagePopup{ 
					Type = ButtonPopupTypes.BUTTONPOPUP_RELIGION_OVERVIEW,
				};
			end,
		});
	end);

	-- Just in case :)
	LuaEvents.RequestRefreshAdditionalInformationDropdownEntries();
end

-- Infixo: Religion Spread
-- MODS START
function OnFound()
  OnClose()
  Events.SerialEventGameMessagePopup({Type=ButtonPopupTypes.BUTTONPOPUP_FOUND_PANTHEON, Data2=1})
end
Controls.FoundButton:RegisterCallback(Mouse.eLClick, OnFound)
-- MODS END

AssignReligionColours()
-- Infixo: Religion Spread
RegisterSortOptions();
TabSelect("YourReligion");