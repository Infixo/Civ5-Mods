print("Loading TradeRouteOverview.lua from 'UI - Filters in Trade Route Overview (Vox Populi)' version 1.3"); -- TROE

-------------------------------------------------
-- Trade Route Overview
-------------------------------------------------
include( "IconSupport" );
include( "InstanceManager" );
include( "TradeRouteHelpers" );

local g_PopupInfo = nil;

local iTechImmediateRecall = GameInfoTypes.TECH_RADIO

-------------------------------------------------
-- Global Variables
-------------------------------------------------
g_CurrentTab = nil;		-- The currently selected Tab.
g_iSelectedPlayerID = Game.GetActivePlayer();

-------------------------------------------------
-- Global Constants
-------------------------------------------------
g_Tabs = {
	["YourTR"] = {
		SelectHighlight = Controls.YourTRSelectHighlight,
	},
	
	["AvailableTR"] = {
		SelectHighlight = Controls.AvailableTRSelectHighlight,
	},
	
	["TRWithYou"] = {
		SelectHighlight = Controls.TRWithYouSelectHighlight,
	},
}

g_SortOptions = {
	{
		Button = Controls.Domain,
		Column = "Domain",
		DefaultDirection = "asc",
		CurrentDirection = nil,
	},
	-- TROE
	{
		Button = Controls.RouteRange,
		Column = "RouteRange",
		DefaultDirection = "desc",
		CurrentDirection = nil,
		SortType = "numeric",
	},
	{
		Button = Controls.RouteLength,
		Column = "RouteLength",
		DefaultDirection = "desc",
		CurrentDirection = nil,
		SortType = "numeric",
	},
	{
		Button = Controls.RouteTurns,
		Column = "RouteTurns",
		DefaultDirection = "asc",
		CurrentDirection = nil,
		SortType = "numeric",
	},
	-- TROE
	{
		Button = Controls.FromOwnerHeader,
		Column = "FromCiv",
		SecondaryColumn = "FromCityName",
		SecondaryDirection = "asc",
		DefaultDirection = "asc",
		CurrentDirection = nil,
	},
	{
		Button = Controls.FromCityHeader,
		Column = "FromCityName",
		DefaultDirection = "asc",
		CurrentDirection = "asc",
	},
	{
		Button = Controls.ToOwnerHeader,
		Column = "ToCiv",
		SecondaryColumn = "ToCityName",
		SecondaryDirection = "asc",
		DefaultDirection = "asc",
		CurrentDirection = nil,
	},
	{
		Button = Controls.ToCityHeader,
		Column = "ToCityName",
		DefaultDirection = "asc",
		CurrentDirection = nil,
	},
	{
		Button = Controls.FromGPT,
		Column = "FromGPT",
		DefaultDirection = "desc",
		CurrentDirection = nil,
		SortType = "numeric",
	},
	{
		Button = Controls.ToGPT,
		Column = "ToGPT",
		DefaultDirection = "desc",
		CurrentDirection = nil,
		SortType = "numeric",
	},
	{
		Button = Controls.ToFood,
		Column = "ToFood",
		DefaultDirection = "desc",
		CurrentDirection = nil,
		SortType = "numeric",
	},
	{
		Button = Controls.ToProduction,
		Column = "ToProduction",
		DefaultDirection = "desc",
		CurrentDirection = nil,
		SortType = "numeric",
	},
	{
		Button = Controls.FromReligion,
		Column = "FromReligion",
		DefaultDirection = "desc",
		CurrentDirection = nil,
		SortType = "numeric",
	},
	{
		Button = Controls.ToReligion,
		Column = "ToReligion",
		DefaultDirection = "desc",
		CurrentDirection = nil,
		SortType = "numeric",
	},
	{
		Button = Controls.FromScience,
		Column = "FromScience",
		DefaultDirection = "desc",
		CurrentDirection = nil,
		SortType = "numeric",
	},
	{
		Button = Controls.ToScience,
		Column = "ToScience",
		DefaultDirection = "desc",
		CurrentDirection = nil,
		SortType = "numeric",
	},
	{
		Button = Controls.FromCulture,
		Column = "FromCulture",
		DefaultDirection = "desc",
		CurrentDirection = nil,
		SortType = "numeric",
	},
	{
		Button = Controls.ToCulture,
		Column = "ToCulture",
		DefaultDirection = "desc",
		CurrentDirection = nil,
		SortType = "numeric",
	},
	{
		Button = Controls.TurnsLeft,
		Column = "TurnsLeft",
		DefaultDirection = "asc",
		CurrentDirection = nil,
		SortType = "numeric",
	},
};

g_SortFunction = nil;

-------------------------------------------------------------------------------
-- Sorting Support
-------------------------------------------------------------------------------
function AlphabeticalSortFunction(field, direction, secondarySort)
	if(direction == "asc") then
		return function(a,b)
			local va = (a ~= nil and a[field] ~= nil) and a[field] or "";
			local vb = (b ~= nil and b[field] ~= nil) and b[field] or "";
			
			if(secondarySort ~= nil and va == vb) then
				return secondarySort(a,b);
			else
				return Locale.Compare(va, vb) == -1;
			end
		end
	elseif(direction == "desc") then
		return function(a,b)
			local va = (a ~= nil and a[field] ~= nil) and a[field] or "";
			local vb = (b ~= nil and b[field] ~= nil) and b[field] or "";
			
			if(secondarySort ~= nil and va == vb) then
				return secondarySort(a,b);
			else
				return Locale.Compare(va, vb) == 1;
			end
		end
	end
end

function NumericSortFunction(field, direction, secondarySort)
	if(direction == "asc") then
		return function(a,b)
			local va = (a ~= nil and a[field] ~= nil) and a[field] or -1;
			local vb = (b ~= nil and b[field] ~= nil) and b[field] or -1;
			
			if(secondarySort ~= nil and tonumber(va) == tonumber(vb)) then
				return secondarySort(a,b);
			else
				return tonumber(va) < tonumber(vb);
			end
		end
	elseif(direction == "desc") then
		return function(a,b)
			local va = (a ~= nil and a[field] ~= nil) and a[field] or -1;
			local vb = (b ~= nil and b[field] ~= nil) and b[field] or -1;

			if(secondarySort ~= nil and tonumber(va) == tonumber(vb)) then
				return secondarySort(a,b);
			else
				return tonumber(vb) < tonumber(va);
			end
		end
	end
end

-- Registers the sort option controls click events
function RegisterSortOptions()
	
	for i,v in ipairs(g_SortOptions) do
		if(v.Button ~= nil) then
			v.Button:RegisterCallback(Mouse.eLClick, function() SortOptionSelected(v); end);
		end
	end
	
	g_SortFunction = GetSortFunction(g_SortOptions);
	
	-- TROE called once, so can be used for filters too
	Controls.bTroeLand:RegisterCheckHandler( OnTroeFilterChecked );
	Controls.bTroeSea:RegisterCheckHandler( OnTroeFilterChecked );
	Controls.bTroeFood:RegisterCheckHandler( OnTroeFilterChecked );
	Controls.bTroeProduction:RegisterCheckHandler( OnTroeFilterChecked );
	Controls.bTroeMinor:RegisterCheckHandler( OnTroeFilterChecked );
	Controls.bTroeMajor:RegisterCheckHandler( OnTroeFilterChecked );
	Controls.bTroeBlocked:RegisterCheckHandler( OnTroeFilterChecked );
	-- TROE
	
end

function GetSortFunction(sortOptions)
	local orderBy = nil;
	for i,v in ipairs(sortOptions) do
		if(v.CurrentDirection ~= nil) then
			local secondarySort = nil;
			if(v.SecondaryColumn ~= nil) then
				if(v.SecondarySortType == "numeric") then
					secondarySort = NumericSortFunction(v.SecondaryColumn, v.SecondaryDirection)
				else
					secondarySort = AlphabeticalSortFunction(v.SecondaryColumn, v.SecondaryDirection);
				end
			end
		
			if(v.SortType == "numeric") then
				return NumericSortFunction(v.Column, v.CurrentDirection, secondarySort);
			else
				return AlphabeticalSortFunction(v.Column, v.CurrentDirection, secondarySort);
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

-- Callback for when sort options are selected.
function SortOptionSelected(option)
	local sortOptions = g_SortOptions;
	UpdateSortOptionState(sortOptions, option);
	g_SortFunction = GetSortFunction(sortOptions);
	
	SortData();
	DisplayData();
end

-------------------------------------------------
-------------------------------------------------
function OnPopupMessage(popupInfo)

	local popupType = popupInfo.Type;
	if popupType ~= ButtonPopupTypes.BUTTONPOPUP_TRADE_ROUTE_OVERVIEW then
		return;
	end
	
	g_PopupInfo = popupInfo;
	
	-- Data 2 parameter holds desired tab to open on
	if (g_PopupInfo.Data2 == 1) then
		g_CurrentTab = "YourTR";
	elseif (g_PopupInfo.Data2 == 2) then
		g_CurrentTab = "AvailableTR";
	elseif (g_PopupInfo.Data2 == 3) then
		g_CurrentTab = "TRWithYou";
	end
	
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

-- TROE
function OnTroeFilterChecked(bIsChecked)
	--[[print("Filters are:",
		Controls.bTroeLand:IsChecked(),
		Controls.bTroeSea:IsChecked(),
		Controls.bTroeFood:IsChecked(),
		Controls.bTroeProduction:IsChecked(),
		Controls.bTroeMinor:IsChecked(),
		Controls.bTroeMajor:IsChecked(),
		Controls.bTroeBlocked:IsChecked());--]]
	DisplayData();
end
-- TROE

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function TabSelect(tab)
	for i,v in pairs(g_Tabs) do
		local bHide = i ~= tab;
		v.SelectHighlight:SetHide(bHide);
	end
	g_CurrentTab = tab;
	-- TROE
	Controls.bTroeLand:SetHide(g_CurrentTab ~= "AvailableTR");
	Controls.bTroeSea:SetHide(g_CurrentTab ~= "AvailableTR");
	Controls.bTroeFood:SetHide(g_CurrentTab ~= "AvailableTR");
	Controls.bTroeProduction:SetHide(g_CurrentTab ~= "AvailableTR");
	Controls.bTroeMinor:SetHide(g_CurrentTab ~= "AvailableTR");
	Controls.bTroeMajor:SetHide(g_CurrentTab ~= "AvailableTR");
	Controls.bTroeBlocked:SetHide(g_CurrentTab ~= "AvailableTR");
	-- TROE
	g_Tabs[tab].RefreshContent();	
end
Controls.TabButtonYourTR:RegisterCallback( Mouse.eLClick, function() TabSelect("YourTR"); end);
Controls.TabButtonAvailableTR:RegisterCallback( Mouse.eLClick, function() TabSelect("AvailableTR"); end );
Controls.TabButtonTRWithYou:RegisterCallback( Mouse.eLClick, function() TabSelect("TRWithYou"); end );

function RefreshYourTR()
	local pPlayer = Players[ Game.GetActivePlayer() ];
    
    --print("RefreshYourTR");
	SetAlreadyActiveRoutes(pPlayer); -- TROE
	SetData(pPlayer:GetTradeRoutes());
	SortData();
	DisplayData();
	
end
g_Tabs["YourTR"].RefreshContent = RefreshYourTR;

function RefreshAvailableTR()
	local pPlayer = Players[ Game.GetActivePlayer() ];

	SetAlreadyActiveRoutes(pPlayer); -- TROE
    SetData(pPlayer:GetTradeRoutesAvailable());
	SortData();
	DisplayData();
end
g_Tabs["AvailableTR"].RefreshContent = RefreshAvailableTR;

function RefreshTRWithYou()
	local pPlayer = Players[ Game.GetActivePlayer() ];
    
    SetData(pPlayer:GetTradeRoutesToYou());
    SortData();
    DisplayData();
    
end
g_Tabs["TRWithYou"].RefreshContent = RefreshTRWithYou;

-- TROE
-- blocked routes - Vox Populi feature
local tAlreadyActiveRoutes = {}; -- gonna store concatenated CivType and CityName
function SetAlreadyActiveRoutes(pPlayer)
	pPlayerTradeRoutes = pPlayer:GetTradeRoutes();
	if not pPlayerTradeRoutes then return end
	for _,v in ipairs(pPlayerTradeRoutes) do
		local sToRouteName = v.ToCityName.."#"..v.ToCivilizationType;
		tAlreadyActiveRoutes[ sToRouteName ] = true; -- tricky
	end
end
-- TROE end

function SetData(data)
	local cityStateCiv = GameInfo.Civilizations["CIVILIZATION_MINOR"];
	local cityStateCivID = cityStateCiv and cityStateCiv.ID or -1;

	function GetCivName(playerID)
		local civType = PreGame.GetCivilization(playerID);
		local civ = GameInfo.Civilizations[civType];
		if(civ.ID == cityStateCivID) then
			local minorCivPlayer = Players[playerID];
			local minorCivType = minorCivPlayer:GetMinorCivType();
			local minorCiv = GameInfo.MinorCivilizations[minorCivType];
		
			return Locale.Lookup(minorCiv.ShortDescription);
		else
			return Locale.Lookup(civ.Description);
		end
	end
	
	for i,v in ipairs(data) do
		v.FromCiv = GetCivName(v.FromID);
		v.ToCiv = GetCivName(v.ToID);
		-- TROE
		v.RouteRange  = Players[v.FromID]:GetTradeRouteRange(v.Domain, v.FromCity);
		v.RouteLength = Players[v.FromID]:GetTradeConnectionDistance(v.FromCity, v.ToCity, v.Domain);
		v.RouteTurns  = Players[v.FromID]:GetTradeRouteTurns(v.FromCity, v.ToCity, v.Domain);
		-- TROE
	end
	g_Data = data;
end

function SortData()
	table.sort(g_Data, g_SortFunction);
end

function round(num, idp)
  return tonumber(string.format("%." .. (idp or 0) .. "f", num))
end

function LookAtOrRecall(instance, v)
  local pPlayer = Players[v.FromID]
  if (pPlayer) then
    local pUnit = pPlayer:GetUnitByID(v.UnitID)
	if (pUnit) then
--	  if (UIManager:GetControl()) then
--	    if (pUnit:IsTrade() and not pUnit:IsRecalledTrader()) then
--		  local tr = Game.GetTradeRoute(pUnit:GetTradeRouteIndex())
		  
	--	  if (tr.FromID == tr.ToID) then
			-- Domestic TR, stop sending stuff immediately
	--	    pUnit:EndTrader()
--		  else
			-- International TR, send a messenger to hold the shipments
--		    pUnit:RecallTrader(Teams[pPlayer:GetTeam()]:IsHasTech(iTechImmediateRecall))
	--	  end
--		  instance.TurnsLeft:LocalizeAndSetText("TXT_KEY_TRO_RECALLED")
--		end
--	  end

	  UI.LookAt(pUnit:GetPlot())
  	  Events.SerialEventUnitFlagSelected(v.FromID, v.UnitID)
	end
  end
end

function DisplayData()

	-- TROE
	local bTroeLand = Controls.bTroeLand:IsChecked();
	local bTroeSea = Controls.bTroeSea:IsChecked();
	local bTroeFood = Controls.bTroeFood:IsChecked();
	local bTroeProduction = Controls.bTroeProduction:IsChecked();
	local bTroeMinor = Controls.bTroeMinor:IsChecked();
	local bTroeMajor = Controls.bTroeMajor:IsChecked();
	local bTroeBlocked	= Controls.bTroeBlocked:IsChecked();
	--print("DisplayData with filters:", bTroeLand, bTroeSea, bTroeFood, bTroeProduction, bTroeMinor, bTroeMajor, bTroeBlocked);
	local iMinorCivType = GameInfoTypes["CIVILIZATION_MINOR"];
	-- TROE

	Controls.MainStack:DestroyAllChildren(); 
    for i,v in ipairs(g_Data) do
		-- TROE
		-- Filtering will happen here - any record that does NOT meet criteria will be skipped, this a DEFAULT action
		-- For a record to be included, it has to meet one of mutex criteria
		-- VP-Blocked will be treated separately at the end, only for International routes
		-- That way all unnecessary instances will not be build and entire list should generate faster
		local bIncludeDomain = false;
		local bIncludeInternal = false;
		local bIncludeForeign = false;
		local bIncludeBlocked = true; -- the only case where we look to exclude things
		local sToRouteName = v.ToCityName.."#"..v.ToCivilizationType;
		if g_CurrentTab == "AvailableTR" then -- run filters only in this page
			if v.Domain == DomainTypes.DOMAIN_LAND and bTroeLand then bIncludeDomain = true; end
			if v.Domain == DomainTypes.DOMAIN_SEA  and bTroeSea  then bIncludeDomain = true; end
			if v.TradeConnectionType == TradeConnectionTypes.TRADE_CONNECTION_FOOD and bTroeFood then bIncludeInternal = true; end
			if (v.TradeConnectionType == TradeConnectionTypes.TRADE_CONNECTION_PRODUCTION or 
				v.TradeConnectionType == TradeConnectionTypes.TRADE_CONNECTION_WONDER_RESOURCE) and bTroeProduction then bIncludeInternal = true; end
			if v.TradeConnectionType == TradeConnectionTypes.TRADE_CONNECTION_INTERNATIONAL then
				-- check for Minor/Major, I assume Barbarians will never come here :)
				if v.ToCivilizationType == iMinorCivType and bTroeMinor then bIncludeForeign = true; end
				if v.ToCivilizationType ~= iMinorCivType and bTroeMajor then bIncludeForeign = true; end
				-- check for Blocked ones and exclude INT routes that already exists AND checkbox is UNCHECKED
				if not bTroeBlocked and tAlreadyActiveRoutes[ sToRouteName ] then bIncludeBlocked = false; end
			end
		end		
		if (g_CurrentTab ~= "AvailableTR") or  -- filters active only in Available TRs page
		   (g_CurrentTab == "AvailableTR" and bIncludeDomain and (bIncludeInternal or bIncludeForeign) and bIncludeBlocked) then
		-- TROE
        local instance = {};
		ContextPtr:BuildInstanceForControl( "TRInstance", instance, Controls.MainStack );

		instance.DomainButton:RegisterCallback(Mouse.eLClick, function() LookAtOrRecall(instance, v); end);
		-- instance.Domain_Land:LocalizeAndSetToolTip("TXT_KEY_TRO_LAND_DOMAIN_TT"); 
		-- instance.Domain_Sea:LocalizeAndSetToolTip("TXT_KEY_TRO_SEA_DOMAIN_TT"); 	
	
		instance.Domain_Land:SetHide(true);
		instance.Domain_Sea:SetHide(true);
		
		if (v.FromCity == nil) then
			print("v.FromCity is nil");
		end
		
		if (v.ToCity == nil) then
			print("v.ToCity is nil");
		end
		
		local strTT = BuildTradeRouteToolTipString(Players[v.FromID], v.FromCity, v.ToCity, v.Domain);
		
		if (v.Domain == DomainTypes.DOMAIN_LAND) then
			instance.Domain_Land:SetHide(false);
			-- instance.Domain_Land:SetToolTipString(strTT);
		elseif (v.Domain == DomainTypes.DOMAIN_SEA) then
			instance.Domain_Sea:SetHide(false);
			-- instance.Domain_Sea:SetToolTipString(strTT);
		end
		
		CivIconHookup(v.FromID, 32, instance.FromCivIcon, instance.FromCivIconBG, instance.FromCivIconShadow, false, true, instance.FromCivIconHighlight);
		
		--Since I don't know which icon to use, use em all!
		instance.FromCivIcon:SetToolTipString(v.FromCiv);
		instance.FromCivIconBG:SetToolTipString(v.FromCiv);
		instance.FromCivIconShadow:SetToolTipString(v.FromCiv);
		instance.FromCivIconHighlight:SetToolTipString(v.FromCiv);
		instance.FromCity:SetText(v.FromCityName);
		instance.FromCity:SetToolTipString(strTT);
		
		CivIconHookup(v.ToID, 32, instance.ToCivIcon, instance.ToCivIconBG, instance.ToCivIconShadow, false, true, instance.ToCivIconHighlight);
		instance.ToCivIcon:SetToolTipString(v.ToCiv);
		instance.ToCivIconBG:SetToolTipString(v.ToCiv);
		instance.ToCivIconShadow:SetToolTipString(v.ToCiv);
		instance.ToCivIconHighlight:SetToolTipString(v.ToCiv);
		instance.ToCity:SetText(v.ToCityName);
		-- TROE add more info
		instance.RouteRange:SetText(v.RouteRange);
		instance.RouteLength:SetText(v.RouteLength);
		instance.RouteTurns:SetText(v.RouteTurns);
		-- TROE add red exclamation mark for already targeted INT cities (not active in TRWithYou tab)
		if v.TradeConnectionType == TradeConnectionTypes.TRADE_CONNECTION_INTERNATIONAL and tAlreadyActiveRoutes[ sToRouteName ] and g_CurrentTab ~= "TRWithYou" then
			instance.ToCity:SetText(v.ToCityName.."[COLOR_RED]![ENDCOLOR]");
		end
		-- TROE
		instance.ToCity:SetToolTipString(strTT);
		
		local strToGPT = "";
		if (v.ToGPT ~= 0) then
			strToGPT = Locale.ConvertTextKey("TXT_KEY_TRO_GPT_ENTRY",  v.ToGPT / 100);
			instance.ToGPT:SetToolTipString(strTT);	
		end
		instance.ToGPT:SetText(strToGPT);

		local strFromGPT = "";		
		if (v.FromGPT ~= 0) then
			strFromGPT = Locale.ConvertTextKey("TXT_KEY_TRO_GPT_ENTRY",  v.FromGPT / 100);
			instance.FromGPT:SetToolTipString(strTT);	
		end
		instance.FromGPT:SetText(strFromGPT);
		
		local strToFood = "";
		if (v.ToFood ~= 0) then
			strToFood = round(v.ToFood / 100, 1);
			instance.ToFood:SetToolTipString(strTT);	
		end
		instance.ToFood:SetText(strToFood);
		
		local strToProduction = "";
		if (v.ToProduction ~= 0) then
			strToProduction = round(v.ToProduction / 100, 1);
			instance.ToProduction:SetToolTipString(strTT);	
		end
		instance.ToProduction:SetText(strToProduction);
		
		if (v.TradeConnectionType == TradeConnectionTypes.TRADE_CONNECTION_WONDER_RESOURCE) then
			instance.ToProduction:SetToolTipString(strTT);	
			instance.ToProduction:SetText("[ICON_RES_MARBLE]");
		end

		local strToPressure = "";
		if (v.ToReligion > 0 and v.ToPressure ~= 0) then
			local religion = GameInfo.Religions[v.ToReligion];
			local strIcon = religion.IconString;
			strToPressure = Locale.ConvertTextKey("TXT_KEY_TRO_RELIGIOUS_PRESSURE_ENTRY", strIcon, v.ToPressure);
			instance.ToReligion:SetToolTipString(strTT);	
		end
		instance.ToReligion:SetText(strToPressure);
		
		local strFromPressure = "";
		if (v.FromReligion > 0 and v.FromPressure ~= 0) then
			local religion = GameInfo.Religions[v.FromReligion];
			local strIcon = religion.IconString;
			strFromPressure = Locale.ConvertTextKey("TXT_KEY_TRO_RELIGIOUS_PRESSURE_ENTRY", strIcon, v.FromPressure);
			instance.FromReligion:SetToolTipString(strTT);	
		end
		instance.FromReligion:SetText(strFromPressure);
		
		local fromScience = "";
		local toScience = "";

		local fromCulture = "";
		local toCulture = "";
		
		if (v.FromID ~= v.ToID) then
		
			if(v.FromScience ~= 0) then
				fromScience = v.FromScience / 100;
				instance.FromScience:SetToolTipString(strTT);	
			end
			
			if(v.ToScience ~= 0) then
				toScience = v.ToScience / 100;
				instance.ToScience:SetToolTipString(strTT);	
			end

			if(v.FromCulture ~= 0) then
				fromCulture = v.FromCulture / 100;
				instance.FromCulture:SetToolTipString(strTT);	
			end
			
			if(v.ToCulture ~= 0) then
				toCulture = v.ToCulture / 100;
				instance.ToCulture:SetToolTipString(strTT);	
			end
		end
		instance.FromScience:SetText(fromScience);
		instance.ToScience:SetText(toScience);

		instance.FromCulture:SetText(fromCulture);
		instance.ToCulture:SetText(toCulture);
		
		local strTurnsRemaining = "";
		if (v.IsRecalled) then
		  strTurnsRemaining = Locale.Lookup("TXT_KEY_TRO_RECALLED")
		else
		  if (v.TurnsLeft ~= nil and v.TurnsLeft >= 0) then
		    strTurnsRemaining = v.TurnsLeft;
		  end
		end
		instance.TurnsLeft:SetText(strTurnsRemaining);
        instance.TurnsButton:RegisterCallback(Mouse.eLClick, function() LookAtOrRecall(instance, v); end);
		-- TROE filter's IF ends here
		end
		-- TROE
    end
    
    Controls.MainStack:CalculateSize();
    Controls.MainStack:ReprocessAnchoring();
    Controls.MainScroll:CalculateInternalSize();

end

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function ShowHideHandler( bIsHide, bInitState )

	-- Set Civ Icon
	CivIconHookup( Game.GetActivePlayer(), 64, Controls.CivIcon, Controls.CivIconBG, Controls.CivIconShadow, false, true );

    if( not bInitState ) then
        if( not bIsHide ) then
        	UI.incTurnTimerSemaphore();  
        	Events.SerialEventGameMessagePopupShown(g_PopupInfo);
        	
        	TabSelect(g_CurrentTab);
        else
			if(g_PopupInfo ~= nil) then
				Events.SerialEventGameMessagePopupProcessed.CallImmediate(g_PopupInfo.Type, 0);
            end
            UI.decTurnTimerSemaphore();
        end
    end
end
ContextPtr:SetShowHideHandler( ShowHideHandler );

RegisterSortOptions();
TabSelect("YourTR");

print("OK loaded TradeRouteOverview.lua from 'UI - Filters in Trade Route Overview (Vox Populi)'"); -- TROE