----------------------------------------------------
-- Vox Populi Wonders Expanded
-- Main file for all Wonders
-- Author: Infixo
-- Dec 9, 2017: Created
----------------------------------------------------

----------------------------------------------------
-- Costs and Tech placement - only for active Wonders
----------------------------------------------------
-- ANC
UPDATE Buildings SET Cost =  150, PrereqTech = 'TECH_THE_WHEEL',    NumPoliciesNeeded = 0, MaxStartEra = 'ERA_CLASSICAL' WHERE Type = 'BUILDING_KARNAK';
UPDATE Buildings SET Cost =  150, PrereqTech = 'TECH_MINING',       NumPoliciesNeeded = 0, MaxStartEra = 'ERA_CLASSICAL' WHERE Type = 'BUILDING_NAZCA';
--UPDATE Buildings SET Cost =  185, PrereqTech = 'TECH_MASONRY',      NumPoliciesNeeded = 2, MaxStartEra = 'ERA_CLASSICAL' WHERE Type = 'BUILDING_ABUSIMBEL';
-- CLA
--UPDATE Buildings SET Cost =  250, PrereqTech = 'TECH_PHILOSOPHY',   NumPoliciesNeeded = 5, MaxStartEra = 'ERA_MEDIEVAL' WHERE Type = 'BUILDING_BAMIYAN';
UPDATE Buildings SET Cost =  250, PrereqTech = 'TECH_PHILOSOPHY',   NumPoliciesNeeded = 5, MaxStartEra = 'ERA_MEDIEVAL' WHERE Type = 'BUILDING_SOLOMON';
UPDATE Buildings SET Cost =  250, PrereqTech = 'TECH_CURRENCY',     NumPoliciesNeeded = 5, MaxStartEra = 'ERA_MEDIEVAL' WHERE Type = 'BUILDING_SHWEDAGON';
UPDATE Buildings SET Cost =  250, PrereqTech = 'TECH_ENGINEERING',  NumPoliciesNeeded = 5, MaxStartEra = 'ERA_MEDIEVAL' WHERE Type = 'BUILDING_MALWIYA';
-- MED
UPDATE Buildings SET Cost =  400, PrereqTech = 'TECH_STEEL',        NumPoliciesNeeded = 0,  MaxStartEra = 'ERA_RENAISSANCE' WHERE Type = 'BUILDING_DAMASCUS'; -- HONOR
UPDATE Buildings SET Cost =  400, PrereqTech = 'TECH_THEOLOGY',     NumPoliciesNeeded = 7,  MaxStartEra = 'ERA_RENAISSANCE' WHERE Type = 'BUILDING_NABAWI';
UPDATE Buildings SET Cost =  400, PrereqTech = 'TECH_EDUCATION',    NumPoliciesNeeded = 7,  MaxStartEra = 'ERA_RENAISSANCE' WHERE Type = 'BUILDING_MICHEL';
UPDATE Buildings SET Cost =  500, PrereqTech = 'TECH_COMPASS',      NumPoliciesNeeded = 0,  MaxStartEra = 'ERA_RENAISSANCE' WHERE Type = 'BUILDING_ITSUKUSHIMA'; -- LIBERTY
UPDATE Buildings SET Cost =  500, PrereqTech = 'TECH_MACHINERY',    NumPoliciesNeeded = 8,  MaxStartEra = 'ERA_RENAISSANCE' WHERE Type = 'BUILDING_CHEVALIERS';
UPDATE Buildings SET Cost =  500, PrereqTech = 'TECH_CIVIL_SERVICE', NumPoliciesNeeded = 0, MaxStartEra = 'ERA_RENAISSANCE' WHERE Type = 'BUILDING_CHARTRES'; -- TRADITION
--UPDATE Buildings SET Cost =  500, PrereqTech = 'TECH_MACHINERY',    NumPoliciesNeeded = 8,  MaxStartEra = 'ERA_RENAISSANCE' WHERE Type = 'BUILDING_WARTBURG';
-- REN
--UPDATE Buildings SET Cost =  800, PrereqTech = 'TECH_PRINTING_PRESS', NumPoliciesNeeded = 10, MaxStartEra = 'ERA_INDUSTRIAL' WHERE Type = 'BUILDING_DUOMO';
UPDATE Buildings SET Cost =  800, PrereqTech = 'TECH_ASTRONOMY',    NumPoliciesNeeded = 10, MaxStartEra = 'ERA_INDUSTRIAL' WHERE Type = 'BUILDING_TOCALI';
--UPDATE Buildings SET Cost =  800, PrereqTech = 'TECH_GUNPOWDER',    NumPoliciesNeeded = 10, MaxStartEra = 'ERA_INDUSTRIAL' WHERE Type = 'BUILDING_BENHADDOU';
UPDATE Buildings SET Cost =  800, PrereqTech = 'TECH_CHEMISTRY',    NumPoliciesNeeded = 10, MaxStartEra = 'ERA_INDUSTRIAL' WHERE Type = 'BUILDING_KINKAKUJI';
UPDATE Buildings SET Cost =  900, PrereqTech = 'TECH_NAVIGATION',   NumPoliciesNeeded = 11, MaxStartEra = 'ERA_INDUSTRIAL' WHERE Type = 'BUILDING_GRIPSHOLM';
--UPDATE Buildings SET Cost =  900, PrereqTech = 'TECH_ECONOMICS',    NumPoliciesNeeded = 11, MaxStartEra = 'ERA_INDUSTRIAL' WHERE Type = 'BUILDING_LEONARDO';
UPDATE Buildings SET Cost =  900, PrereqTech = 'TECH_ACOUSTICS',    NumPoliciesNeeded = 0,  MaxStartEra = 'ERA_INDUSTRIAL' WHERE Type = 'BUILDING_STPETERS'; -- PIETY
-- IND
--UPDATE Buildings SET Cost = 1000, PrereqTech = 'TECH_RIFLING',      NumPoliciesNeeded = 13, MaxStartEra = 'ERA_MODERN' WHERE Type = 'BUILDING_ALAMO';
UPDATE Buildings SET Cost = 1000, PrereqTech = 'TECH_RAILROAD',     NumPoliciesNeeded =  0, MaxStartEra = 'ERA_MODERN' WHERE Type = 'BUILDING_BROOKLYN'; -- PATRONAGE
UPDATE Buildings SET Cost = 1600, PrereqTech = 'TECH_FERTILIZER',   NumPoliciesNeeded = 17                             WHERE Type = 'BUILDING_TRAFALGAR'; -- exception for FREEDOM!
UPDATE Buildings SET Cost = 1250, PrereqTech = 'TECH_FERTILIZER',   NumPoliciesNeeded =  0, MaxStartEra = 'ERA_MODERN' WHERE Type = 'BUILDING_MONTECARLO'; -- AESTHETICS
UPDATE Buildings SET Cost = 1250, PrereqTech = 'TECH_DYNAMITE',     NumPoliciesNeeded = 14, MaxStartEra = 'ERA_MODERN' WHERE Type = 'BUILDING_PANAMA';
--UPDATE Buildings SET Cost = 1250, PrereqTech = 'TECH_FERTILIZER',   NumPoliciesNeeded = 14, MaxStartEra = 'ERA_MODERN' WHERE Type = 'BUILDING_SAGRADA';
-- MOD
--UPDATE Buildings SET Cost = 1600, PrereqTech = 'TECH_COMBUSTION',   NumPoliciesNeeded = 17 WHERE Type = 'BUILDING_RUSHMORE';
UPDATE Buildings SET Cost = 1700, PrereqTech = 'TECH_PLASTIC',      NumPoliciesNeeded = 18 WHERE Type = 'BUILDING_HOLLYWOOD'; -- FREEDOM
UPDATE Buildings SET Cost = 1700, PrereqTech = 'TECH_PLASTIC',      NumPoliciesNeeded = 18 WHERE Type = 'BUILDING_SOVIETS'; -- ORDER
UPDATE Buildings SET Cost = 1700, PrereqTech = 'TECH_RADIO',        NumPoliciesNeeded = 18 WHERE Type = 'BUILDING_ROCKEFELLER';
-- ATO
UPDATE Buildings SET Cost = 1900, PrereqTech = 'TECH_COMBINED_ARMS', NumPoliciesNeeded = 18 WHERE Type = 'BUILDING_MILLAU'; -- exception for AUTOCRACY!
UPDATE Buildings SET Cost = 1900, PrereqTech = 'TECH_REFRIGERATION', NumPoliciesNeeded = 18 WHERE Type = 'BUILDING_ANITKABIR'; -- exception for AUTOCRACY!
UPDATE Buildings SET Cost = 1900, PrereqTech = 'TECH_ROCKETRY',     NumPoliciesNeeded = 18 WHERE Type = 'BUILDING_SPUTNIK'; -- exception for ORDER!
UPDATE Buildings SET Cost = 1900, PrereqTech = 'TECH_ROCKETRY',     NumPoliciesNeeded =  0 WHERE Type = 'BUILDING_WHITESANDS'; -- EXPLORATION
UPDATE Buildings SET Cost = 2150, PrereqTech = 'TECH_COMPUTERS',    NumPoliciesNeeded =  0 WHERE Type = 'BUILDING_ARECIBO'; -- RATIONALISM; RADAR would be better but there is no space left on tech tree!
UPDATE Buildings SET Cost = 2150, PrereqTech = 'TECH_ELECTRONICS',  NumPoliciesNeeded =  0 WHERE Type = 'BUILDING_WILLIS'; -- COMMERCE
-- INF
--UPDATE Buildings SET Cost = 2300, PrereqTech = 'TECH_TELECOM',      NumPoliciesNeeded = 23 WHERE Type = 'BUILDING_SKYTREE';
--UPDATE Buildings SET Cost = 2300, PrereqTech = 'TECH_ECOLOGY',      NumPoliciesNeeded = 23 WHERE Type = 'BUILDING_PETRONAS';
UPDATE Buildings SET Cost = 3000, PrereqTech = 'TECH_ROBOTICS',     NumPoliciesNeeded = 24 WHERE Type = 'BUILDING_JUMEIRAH';
UPDATE Buildings SET Cost = 3000, PrereqTech = 'TECH_LASERS',       NumPoliciesNeeded = 24 WHERE Type = 'BUILDING_TAIPEI101';
--UPDATE Buildings SET Cost = 3000, PrereqTech = 'TECH_STEALTH',      NumPoliciesNeeded = 24 WHERE Type = 'BUILDING_MARINASANDS';


----------------------------------------------------
-- Hide all INACTIVE Wonders - override any previous settings
-- Warning! They will still be visible in Civilopedia!
----------------------------------------------------

UPDATE Buildings
SET Cost = -1, FaithCost = -1, PrereqTech = NULL, GreatWorkCount = -1
WHERE Type IN (SELECT 'BUILDING_'||WType FROM VPWEConfig WHERE WActive = 0);



----------------------------------------------------
-- Policy Finishers
-- MutuallyExclusiveGroup indicator works only on the city level, so you cannot build a Wonder in the city where the other exists
-- but you can build it in another city. To achieve true 'mutually exclusive' situation we need a dummy building that will be placed
-- in all your cities and block the construction of the 2nd Wonder.
----------------------------------------------------

UPDATE Buildings SET MutuallyExclusiveGroup = 61, PolicyType = 'POLICY_TRADITION_FINISHER' 	 WHERE Type IN ('BUILDING_MOSQUE_OF_DJENNE', 'BUILDING_CHARTRES');
UPDATE Buildings SET MutuallyExclusiveGroup = 62, PolicyType = 'POLICY_LIBERTY_FINISHER' 	 WHERE Type IN ('BUILDING_FORBIDDEN_PALACE', 'BUILDING_ITSUKUSHIMA');
UPDATE Buildings SET MutuallyExclusiveGroup = 63, PolicyType = 'POLICY_HONOR_FINISHER' 		 WHERE Type IN ('BUILDING_ALHAMBRA',         'BUILDING_DAMASCUS');
UPDATE Buildings SET MutuallyExclusiveGroup = 64, PolicyType = 'POLICY_PIETY_FINISHER' 		 WHERE Type IN ('BUILDING_TAJ_MAHAL',        'BUILDING_STPETERS');
UPDATE Buildings SET MutuallyExclusiveGroup = 65, PolicyType = 'POLICY_PATRONAGE_FINISHER'   WHERE Type IN ('BUILDING_BIG_BEN', 		 'BUILDING_BROOKLYN');
UPDATE Buildings SET MutuallyExclusiveGroup = 66, PolicyType = 'POLICY_AESTHETICS_FINISHER'  WHERE Type IN ('BUILDING_LOUVRE', 			 'BUILDING_MONTECARLO');
UPDATE Buildings SET MutuallyExclusiveGroup = 67, PolicyType = 'POLICY_COMMERCE_FINISHER' 	 WHERE Type IN ('BUILDING_BROADWAY', 		 'BUILDING_WILLIS');
UPDATE Buildings SET MutuallyExclusiveGroup = 68, PolicyType = 'POLICY_EXPLORATION_FINISHER' WHERE Type IN ('BUILDING_PENTAGON', 		 'BUILDING_WHITESANDS');
UPDATE Buildings SET MutuallyExclusiveGroup = 69, PolicyType = 'POLICY_RATIONALISM_FINISHER' WHERE Type IN ('BUILDING_BLETCHLEY_PARK',   'BUILDING_ARECIBO');

UPDATE Language_en_US SET Text = Text||'[NEWLINE][ICON_BULLET] Unlocks building the [COLOR_CYAN]Chartres Cathedral[ENDCOLOR]. However, only [COLOR_RED]one[ENDCOLOR] of those newly unlocked Wonders can be built.' WHERE Tag = 'TXT_KEY_POLICY_BRANCH_TRADITION_HELP';
UPDATE Language_en_US SET Text = Text||'[NEWLINE][ICON_BULLET] Unlocks building the [COLOR_CYAN]Itsukushima Shrine[ENDCOLOR]. However, only [COLOR_RED]one[ENDCOLOR] of those newly unlocked Wonders can be built.' WHERE Tag = 'TXT_KEY_POLICY_BRANCH_LIBERTY_HELP';
UPDATE Language_en_US SET Text = Text||'[NEWLINE][ICON_BULLET] Unlocks building the [COLOR_CYAN]Forge of Damascus[ENDCOLOR]. However, only [COLOR_RED]one[ENDCOLOR] of those newly unlocked Wonders can be built.' WHERE Tag = 'TXT_KEY_POLICY_BRANCH_HONOR_HELP';
UPDATE Language_en_US SET Text = Text||'[NEWLINE][ICON_BULLET] Unlocks building the [COLOR_CYAN]St. Peter'' Basilica[ENDCOLOR]. However, only [COLOR_RED]one[ENDCOLOR] of those newly unlocked Wonders can be built.' WHERE Tag = 'TXT_KEY_POLICY_BRANCH_PIETY_HELP';
UPDATE Language_en_US SET Text = Text||'[NEWLINE][ICON_BULLET] Unlocks building the [COLOR_CYAN]Brooklyn Bridge[ENDCOLOR]. However, only [COLOR_RED]one[ENDCOLOR] of those newly unlocked Wonders can be built.' WHERE Tag = 'TXT_KEY_POLICY_BRANCH_PATRONAGE_HELP';
UPDATE Language_en_US SET Text = Text||'[NEWLINE][ICON_BULLET] Unlocks building the [COLOR_CYAN]Monte Carlo Casino[ENDCOLOR]. However, only [COLOR_RED]one[ENDCOLOR] of those newly unlocked Wonders can be built.' WHERE Tag = 'TXT_KEY_POLICY_BRANCH_AESTHETICS_HELP';
UPDATE Language_en_US SET Text = Text||'[NEWLINE][ICON_BULLET] Unlocks building the [COLOR_CYAN]Willis Tower[ENDCOLOR]. However, only [COLOR_RED]one[ENDCOLOR] of those newly unlocked Wonders can be built.' WHERE Tag = 'TXT_KEY_POLICY_BRANCH_COMMERCE_HELP';
UPDATE Language_en_US SET Text = Text||'[NEWLINE][ICON_BULLET] Unlocks building the [COLOR_CYAN]White Sands Missile Range[ENDCOLOR]. However, only [COLOR_RED]one[ENDCOLOR] of those newly unlocked Wonders can be built.' WHERE Tag = 'TXT_KEY_POLICY_BRANCH_EXPLORATION_HELP';
UPDATE Language_en_US SET Text = Text||'[NEWLINE][ICON_BULLET] Unlocks building the [COLOR_CYAN]Arecibo Observatory[ENDCOLOR]. However, only [COLOR_RED]one[ENDCOLOR] of those newly unlocked Wonders can be built.' WHERE Tag = 'TXT_KEY_POLICY_BRANCH_RATIONALISM_HELP';


----------------------------------------------------
-- Ideology Wonders
----------------------------------------------------

UPDATE Buildings SET MutuallyExclusiveGroup = 71, PolicyBranchType = 'POLICY_BRANCH_FREEDOM'   WHERE Type IN ('BUILDING_STATUE_OF_LIBERTY', 'BUILDING_HOLLYWOOD', 'BUILDING_TRAFALGAR');
UPDATE Buildings SET MutuallyExclusiveGroup = 72, PolicyBranchType = 'POLICY_BRANCH_ORDER'     WHERE Type IN ('BUILDING_MOTHERLAND_STATUE', 'BUILDING_SPUTNIK',   'BUILDING_SOVIETS');
UPDATE Buildings SET MutuallyExclusiveGroup = 73, PolicyBranchType = 'POLICY_BRANCH_AUTOCRACY' WHERE Type IN ('BUILDING_PRORA_RESORT',      'BUILDING_MILLAU',    'BUILDING_ANITKABIR');


----------------------------------------------------
-- Holy City Wonders
----------------------------------------------------

--UPDATE Language_en_US SET Text = 'Enables you to select a Reformation Belief without the normal prerequisites.' WHERE Tag = 'TXT_KEY_WONDER_KREMLIN_HELP'; -- so group update can be used later

UPDATE Buildings SET HolyCity = 1, MutuallyExclusiveGroup = 70 WHERE Type IN
('BUILDING_BOROBUDUR', 'BUILDING_HAGIA_SOPHIA', 'BUILDING_NABAWI', 'BUILDING_SOLOMON');
--'BUILDING_KREMLIN',
UPDATE Language_en_US SET Text = Text||'[NEWLINE][NEWLINE]Must be built in a [COLOR_CYAN]Holy City[ENDCOLOR].' WHERE Tag IN
('TXT_KEY_WONDER_BOROBUDUR_HELP', 'TXT_KEY_WONDER_HAGIA_SOPHIA_HELP');--, 'TXT_KEY_WONDER_KREMLIN_HELP');


----------------------------------------------------
-- GLOBAL updates for Terrain and few other conditions (easier that way, can see the big picture)
-- Water - city must be built NEXT TO a COAST tile or LAKE tile (MinAreaSize=10 is Sea, MinAreaSize=1 is Lake)
-- River - city must be built NEXT TO a RIVER
-- FreshWater - city must be built next to a RIVER or adjacent to a LAKE or OASIS tile
-- Mountain - city must be built NEXT TO a MOUNTAIN tile
-- NearbyMountainRequired - city must be built WITHIN 2 TILES OF a MOUNTAIN tile, Mountain must be within cultural borders
-- Hill - city must be built ON a HILL tile
-- Flat - city MUST NOT be built ON a HILL tile
-- HolyCity
-- (VP) IsNoWater - very strict, forbids ALL Water types: River, Lake and Coast
-- (VP) IsNoRiver
-- (VP) CapitalOnly
-- (VP) ResourceType - Allows for Building to be unlocked by a specific resource being owned (can be strategic or luxury)
-- (VP) RequiresRail - rail connection
----------------------------------------------------

-- River
UPDATE Buildings SET River = 1 WHERE Type IN
('BUILDING_EIFFEL_TOWER', 'BUILDING_GLOBE_THEATER', 'BUILDING_NOTRE_DAME', 'BUILDING_SLATER_MILL',
'BUILDING_BROOKLYN', 'BUILDING_TRAFALGAR', 'BUILDING_SOVIETS');
-- 'BUILDING_ABUSIMBEL', 'BUILDING_SKYTREE', 

UPDATE Language_en_US SET Text = Text||'[NEWLINE][NEWLINE]City must be built next to a [COLOR_CYAN]River[ENDCOLOR].' WHERE Tag IN
('TXT_KEY_WONDER_EIFFEL_TOWER_HELP', 'TXT_KEY_WONDER_GLOBE_THEATER_HELP', 'TXT_KEY_BUILDING_NOTRE_DAME_HELP');
-- 'TXT_KEY_BUILDING_SLATER_MILL_HELP'

-- Coast is easy	
UPDATE Buildings SET Water = 1, MinAreaSize = 10 WHERE Type IN
('BUILDING_COLOSSUS', 'BUILDING_GREAT_LIGHTHOUSE', 'BUILDING_PRORA_RESORT', 'BUILDING_STATUE_OF_LIBERTY', 'BUILDING_SYDNEY_OPERA_HOUSE', 
'BUILDING_ITSUKUSHIMA', 'BUILDING_MONTECARLO', 'BUILDING_JUMEIRAH', 'BUILDING_PANAMA'); 
-- , 'BUILDING_MARINASANDS'

UPDATE Language_en_US SET Text = Text||'[NEWLINE][NEWLINE]City must be built on the [COLOR_CYAN]Coast[ENDCOLOR].' WHERE Tag IN
('TXT_KEY_WONDER_STATUE_OF_LIBERTY_HELP');
-- 'TXT_KEY_WONDER_COLOSSUS_HELP', 'TXT_KEY_WONDER_GREAT_LIGHTHOUSE_HELP', 'TXT_KEY_WONDER_PRORA_RESORT_HELP', 'TXT_KEY_WONDER_SYDNEY_OPERA_HOUSE_HELP'

-- Lake is not fully supported!
-- FreshWater - can built with River only!
-- Water&Size=1 - can built on Any Coast
-- The closest is FreshWater+Water which a) eliminates River-only b) eliminates Coast-only. Only Bad condition is Coast+River :(
UPDATE Buildings SET Water = 1, MinAreaSize = 1, FreshWater = 1 WHERE Type IN
('BUILDING_SUMMER_PALACE',
'BUILDING_GRIPSHOLM', 'BUILDING_KINKAKUJI', 'BUILDING_WILLIS');
-- 'BUILDING_TOCALI', 

UPDATE Language_en_US SET Text = Text||'[NEWLINE][NEWLINE]City must be built near the [COLOR_CYAN]Lake[ENDCOLOR].' WHERE Tag IN
('TXT_KEY_BUILDING_SUMMER_PALACE_HELP');

-- Fresh Water	
UPDATE Buildings SET FreshWater = 1 WHERE Type IN
('BUILDING_HANGING_GARDEN', 'BUILDING_TEMPLE_ARTEMIS');

UPDATE Language_en_US SET Text = Text||'[NEWLINE][NEWLINE]City must be built near a source of [COLOR_CYAN]Fresh Water[ENDCOLOR].' WHERE Tag IN
('TXT_KEY_WONDER_HANGING_GARDEN_HELP', 'TXT_KEY_WONDER_TEMPLE_ARTEMIS_HELP');

-- NearbyMountain
UPDATE Buildings SET NearbyMountainRequired = 1 WHERE Type IN
('BUILDING_CRISTO_REDENTOR', 'BUILDING_MACHU_PICHU', 'BUILDING_NEUSCHWANSTEIN');
--'BUILDING_RUSHMORE');

UPDATE Language_en_US SET Text = Text||'[NEWLINE][NEWLINE]City must be built within 2 tiles of a [COLOR_CYAN]Mountain[ENDCOLOR] that is inside your territory.' WHERE Tag IN
('TXT_KEY_WONDER_CRISTO_REDENTOR_HELP');
-- 'TXT_KEY_WONDER_MACHU_PICHU_HELP', 'TXT_KEY_WONDER_NEUSCHWANSTEIN_HELP'

-- Hill
UPDATE Buildings SET Hill = 1 WHERE Type IN
('BUILDING_CHICHEN_ITZA', 'BUILDING_FORUM', 'BUILDING_HIMEJI_CASTLE', 'BUILDING_MAUSOLEUM_HALICARNASSUS', 'BUILDING_MOTHERLAND_STATUE',
'BUILDING_CHEVALIERS', 'BUILDING_MILLAU', 'BUILDING_NAZCA', 'BUILDING_HOLLYWOOD');
-- 'BUILDING_WARTBURG', 

UPDATE Language_en_US SET Text = Text||'[NEWLINE][NEWLINE]City must be built on a [COLOR_CYAN]Hill[ENDCOLOR].' WHERE Tag IN
('TXT_KEY_WONDER_TAJ_MAHAL_HELP', -- VP quirk
'TXT_KEY_BUILDING_FORUM_HELP', 'TXT_KEY_WONDER_HIMEJI_CASTLE_HELP', 'TXT_KEY_WONDER_MAUSOLEUM_HALICARNASSUS_HELP', 'TXT_KEY_WONDER_MOTHERLAND_STATUE_HELP');

-- Flat
UPDATE Buildings SET Flat = 1 WHERE Type IN
('BUILDING_BRANDENBURG_GATE', 'BUILDING_EMPIRE_STATE_BUILDING', 'BUILDING_LEANING_TOWER', 'BUILDING_PYRAMID', 'BUILDING_RED_FORT', 'BUILDING_STONEHENGE',
'BUILDING_PANAMA', 'BUILDING_ANITKABIR', 'BUILDING_SPUTNIK', 'BUILDING_TAIPEI101');

UPDATE Language_en_US SET Text = Text||'[NEWLINE][NEWLINE]City must be built on a [COLOR_CYAN]Flat[ENDCOLOR] terrain.' WHERE Tag IN 
('TXT_KEY_WONDER_BRANDENBURG_GATE_HELP', 'TXT_KEY_BUILDING_EMPIRE_STATE_BUILDING_HELP', 'TXT_KEY_WONDER_LEANING_TOWER_HELP', 
'TXT_KEY_WONDER_CHICHEN_ITZA_HELP', -- VP quirk
'TXT_KEY_WONDER_RED_FORT_HELP', 'TXT_KEY_BUILDING_STONEHENGE_HELP');

-- Terrain
UPDATE Buildings SET NearbyTerrainRequired = 'TERRAIN_DESERT' WHERE Type IN ('BUILDING_PETRA', 'BUILDING_WHITESANDS'); -- City must be built on or next to Desert.
-- 'BUILDING_BAMIYAN', 
UPDATE Buildings SET NearbyTerrainRequired = 'TERRAIN_PLAINS' WHERE Type IN ('BUILDING_NAZCA');

-- Features
INSERT INTO Building_LocalFeatureOrs (BuildingType, FeatureType) VALUES
('BUILDING_ANGKOR_WAT', 'FEATURE_JUNGLE'),
('BUILDING_ANGKOR_WAT', 'FEATURE_FOREST'),
('BUILDING_CHICHEN_ITZA', 'FEATURE_JUNGLE'),
('BUILDING_CHICHEN_ITZA', 'FEATURE_FOREST'),
('BUILDING_TAIPEI101', 'FEATURE_JUNGLE'),
('BUILDING_TAIPEI101', 'FEATURE_FOREST'),
('BUILDING_KARNAK', 'FEATURE_FLOOD_PLAINS'),
('BUILDING_KARNAK', 'FEATURE_OASIS'),
('BUILDING_JUMEIRAH', 'FEATURE_ATOLL'),
('BUILDING_JUMEIRAH', 'FEATURE_OASIS');

UPDATE Language_en_US SET Text = Text||'[NEWLINE][NEWLINE]Requires a [COLOR_CYAN]Jungle[ENDCOLOR] or [COLOR_CYAN]Forest[ENDCOLOR] nearby.' WHERE Tag = 'TXT_KEY_WONDER_ANGKOR_WAT_HELP';
UPDATE Language_en_US SET Text = Text||' Requires a [COLOR_CYAN]Jungle[ENDCOLOR] or [COLOR_CYAN]Forest[ENDCOLOR] nearby.' WHERE Tag = 'TXT_KEY_WONDER_TAJ_MAHAL_HELP'; -- 2 reqs! VP quirk

-- Improved Resources nearby
INSERT INTO Building_LocalResourceOrs (BuildingType, ResourceType) VALUES
('BUILDING_PORCELAIN_TOWER', 'RESOURCE_MARBLE'),	
('BUILDING_PORCELAIN_TOWER', 'RESOURCE_JADE'),
('BUILDING_PORCELAIN_TOWER', 'RESOURCE_AMBER'),
('BUILDING_PORCELAIN_TOWER', 'RESOURCE_LAPIS'),
('BUILDING_PORCELAIN_TOWER', 'RESOURCE_IVORY'),
('BUILDING_DAMASCUS', 'RESOURCE_IRON'),
('BUILDING_DAMASCUS', 'RESOURCE_COPPER'),
('BUILDING_DAMASCUS', 'RESOURCE_SILVER'),
('BUILDING_ROCKEFELLER', 'RESOURCE_OIL'),
('BUILDING_ROCKEFELLER', 'RESOURCE_COAL'),
('BUILDING_SHWEDAGON', 'RESOURCE_GOLD'),
('BUILDING_SHWEDAGON', 'RESOURCE_SILVER'),
('BUILDING_SHWEDAGON', 'RESOURCE_GEMS'),	
('BUILDING_SHWEDAGON', 'RESOURCE_PEARLS');

UPDATE Language_en_US SET Text = Text||
'[NEWLINE][NEWLINE]Requires an improved [ICON_RES_MARBLE] [COLOR_CYAN]Marble[ENDCOLOR], [ICON_RES_JADE] [COLOR_CYAN]Jade[ENDCOLOR], [ICON_RES_AMBER] [COLOR_CYAN]Amber[ENDCOLOR], [ICON_RES_LAPIS] [COLOR_CYAN]Lapis[ENDCOLOR] or [ICON_RES_IVORY] [COLOR_CYAN]Ivory[ENDCOLOR] nearby.' WHERE Tag = 'TXT_KEY_WONDER_PORCELAIN_TOWER_HELP';
	
-- Consumed Resources
INSERT INTO Building_ResourceQuantityRequirements (BuildingType, ResourceType, Cost) VALUES
('BUILDING_DAMASCUS', 'RESOURCE_IRON', 1),
--('BUILDING_HUBBLE', 'RESOURCE_ALUMINUM', 1), -- Leave this change to a mod that deals with Science Victory
('BUILDING_WHITESANDS', 'RESOURCE_OIL', 1);


	
--('ABUSIMBEL', 1), -- Abu Simbel
-- ALAMO
--('BAMIYAN', 1), -- Buddhas of Bamiyan
--('BENHADDOU', 1), -- Ait Benhaddou
--('DUOMO', 1), -- Cattedrale di Santa Maria del Fiore /  Il Duomo di Firenze
--('LEONARDO', 1), -- Leonardo's Workshop
--('MARINASANDS', 1), -- Marina Bay Sands
--('PETRONAS', 1), -- The Petronas Towers
--('RUSHMORE', 1), -- Mount Rushmore
--('SAGRADA', 1), -- Sagrada Familia
--('SKYTREE', 1), -- Tokyo Skytree
--('TOCALI', 1), -- Templo Mayor
--('WARTBURG', 1), -- Wartburg Castle


----------------------------------------------------
-- ANITKABIR
-- Tyranny: Can bully friendly CS. It decreases Influence from other Civs by 25% and increases your by 25%
-- Anitkabir: Reduces Boredom, All Military buildings (ex. Barracks) +1 GDP (Great Diplomat Point), Military Academy +25% Production towards Diplo units
-- Inc rate of GDs, +2 GDP, +20% production Diplomat, +2 Paper
----------------------------------------------------

UPDATE Buildings
SET FreePolicies = 1, ExtraLeagueVotes = 1, SpecialistType = 'SPECIALIST_CIVIL_SERVANT', GreatPeopleRateChange = 2
WHERE Type = 'BUILDING_ANITKABIR';

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_ANITKABIR', 'YIELD_CULTURE', 5);

INSERT INTO Building_SpecificGreatPersonRateModifier (BuildingType, SpecialistType, Modifier) VALUES
('BUILDING_ANITKABIR', 'SPECIALIST_CIVIL_SERVANT', 33);

INSERT INTO Building_UnitCombatProductionModifiers 	(BuildingType, UnitCombatType, Modifier) VALUES
('BUILDING_ANITKABIR', 'UNITCOMBAT_DIPLOMACY', 33);

--INSERT INTO Building_ResourceQuantity (BuildingType, ResourceType, Quantity) VALUES
--('BUILDING_ANITKABIR', 'RESOURCE_PAPER', 2);

INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) VALUES
('BUILDING_ANITKABIR', 'FLAVOR_CULTURE', 10),
('BUILDING_ANITKABIR', 'FLAVOR_DIPLOMACY', 60);

INSERT INTO Language_en_US (Tag, Text)VALUES
('TXT_KEY_BUILDING_ANITKABIR',     'Anitkabir'),
('TXT_KEY_WONDER_ANITKABIR_HELP',  '1 Free [COLOR_POSITIVE_TEXT]Social Policy[ENDCOLOR]. Grants 1 additional Delegate in the World Congress for every 8 City-States in the game. +33% faster production of Diplomacy Units and generation of [ICON_DIPLOMAT] Great Diplomats in the City.[NEWLINE][NEWLINE]Requires [COLOR_CYAN]Autocracy[ENDCOLOR]. City must be built on a [COLOR_CYAN]Flat[ENDCOLOR] terrain.'),
('TXT_KEY_WONDER_ANITKABIR_QUOTE', '[NEWLINE]"Peace at Home, Peace in the World"[NEWLINE][NEWLINE] - Mustafa Kemal Ataturk[NEWLINE]'),
('TXT_KEY_WONDER_ANITKABIR_PEDIA', 'Anitkabir ("memorial tomb") is the mausoleum of Mustafa Kemal Ataturk, the leader of the Turkish War of Independence and the founder and first President of the Republic of Turkey. It is located in Ankara and was designed by architects Professor Emin Onat and Assistant Professor Ahmet Orhan Arda, whose proposal beat 48 other entries from several countries in a competition held by the Turkish Government in 1941 for a "monumental tomb" for Ataturk.[NEWLINE][NEWLINE] The site is also the final resting place of Ismet Inonu, the second President of Turkey, who was interred there after he died in 1973. His tomb faces the Ataturk Mausoleum, on the opposite side of the Ceremonial Ground.');


----------------------------------------------------
-- ARECIBO - Arecibo Observatory
-- +5 Science from Observatories [but Observatories will require a mountain nearby!]
-- +1 Science from all Scientist specialists
----------------------------------------------------

-- NearbyMountain for Observatory
UPDATE Buildings SET NearbyMountainRequired = 1 WHERE Type = 'BUILDING_OBSERVATORY';
UPDATE Language_en_US SET Text = Text||'[NEWLINE][NEWLINE]City must be built within 2 tiles of a [COLOR_CYAN]Mountain[ENDCOLOR] that is inside your territory.' WHERE Tag = 'TXT_KEY_BUILDING_OBSERVATORY_HELP';

UPDATE Buildings
SET SpecialistType = 'SPECIALIST_SCIENTIST', GreatPeopleRateChange = 2
WHERE Type = 'BUILDING_ARECIBO';

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_ARECIBO', 'YIELD_SCIENCE', 5);

INSERT INTO Building_BuildingClassYieldChanges (BuildingType, BuildingClassType, YieldType, YieldChange) VALUES
('BUILDING_ARECIBO', 'BUILDINGCLASS_OBSERVATORY', 'YIELD_SCIENCE', 5);

INSERT INTO Building_BuildingClassHappiness (BuildingType, BuildingClassType, Happiness) VALUES
('BUILDING_ARECIBO', 'BUILDINGCLASS_OBSERVATORY', 1);

INSERT INTO Building_SpecialistYieldChanges (BuildingType, SpecialistType, YieldType, Yield) VALUES
('BUILDING_ARECIBO', 'SPECIALIST_SCIENTIST', 'YIELD_SCIENCE', 1);

INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) VALUES
('BUILDING_ARECIBO', 'FLAVOR_SCIENCE', 80);

INSERT INTO Language_en_US (Tag, Text)VALUES
('TXT_KEY_BUILDING_ARECIBO',     'Arecibo Observatory'),
('TXT_KEY_WONDER_ARECIBO_HELP',  'All Scientist Specialists gain +1 [ICON_RESEARCH] Science. All Observatories gain +5 [ICON_RESEARCH] Science and provide +1 [ICON_HAPPINESS_1] Happiness.[NEWLINE][NEWLINE]Requires completion of [COLOR_CYAN]Rationalism Branch[ENDCOLOR].'),
('TXT_KEY_WONDER_ARECIBO_QUOTE', '[NEWLINE]"The surface of the Earth is the shore of the cosmic ocean. From it we have learned most of what we know. Recently, we have waded a little out to sea, enough to dampen our toes or, at most, wet our ankles. The water seems inviting. The ocean calls."[NEWLINE] - Carl Sagan[NEWLINE]'),
('TXT_KEY_WONDER_ARECIBO_PEDIA', 'The Arecibo Observatory is the world''s largest Radio Telescope, at 305 metres (1000 feet) in width. It was constructed in 1963 in a naturally-formed sinkhole near Arecibo, Puerto Rico. It consists of the dish, which is on the ground, and a large reciever suspended above the dish by three towers which vary in height due to ground elevation.[NEWLINE][NEWLINE]  Since its construction in 1963, the observatory has been used for a variety of different purposes. Originally designed to study Earth''s Ionosphere (The layer of Earth''s atmosphere above 85 kilometres where solar radiation still affects the atmosphere. Auroras form in this layer), the Arecibo Observatory has since made a variety of discoveries and been used for several research projects. In 1990, the telescope was used to discover the first ever known Exo-planets (Planets existing outside our own Solar System). It was also used to discover Neutron stars (stars that half half a million times more mass than Earth in an area equivalent to the size of Brooklyn, New York). It has also been used for countless other astronomical discoveries.[NEWLINE][NEWLINE]  In 1974, the Observatory sent a message of binary characters, consisting of the numbers 1 to 10, DNA makeup, the solar system and more information, towards a star cluster known as globular cluser M13, around 25,000 light years away, in the hope of contacting intelligent life.');

    
----------------------------------------------------
-- BROOKLYN - Brooklyn Bridge
-- Free GreatDiplo, +1TR, +25 Influence with CSs, +25% diplo units
----------------------------------------------------

UPDATE Buildings
SET NumTradeRouteBonus = 1, MinorFriendshipChange = 25, SpecialistType = 'SPECIALIST_ENGINEER', GreatPeopleRateChange = 2
WHERE Type = 'BUILDING_BROOKLYN';

INSERT INTO Building_FreeUnits (BuildingType, UnitType, NumUnits) VALUES
('BUILDING_BROOKLYN', 'UNIT_GREAT_DIPLOMAT', 1);

INSERT INTO Building_UnitCombatProductionModifiers 	(BuildingType, UnitCombatType, Modifier) VALUES
('BUILDING_BROOKLYN', 'UNITCOMBAT_DIPLOMACY', 33);

INSERT INTO Building_SpecificGreatPersonRateModifier (BuildingType, SpecialistType, Modifier) VALUES
('BUILDING_BROOKLYN', 'SPECIALIST_CIVIL_SERVANT', 33);

INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) VALUES
('BUILDING_BROOKLYN', 'FLAVOR_CULTURE', 10),
('BUILDING_BROOKLYN', 'FLAVOR_DIPLOMACY', 60);

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_BUILDING_BROOKLYN',     'Brooklyn Bridge'),
('TXT_KEY_WONDER_BROOKLYN_HELP',  'Receive a [COLOR_POSITIVE_TEXT]free[ENDCOLOR] [ICON_DIPLOMAT]Great Diplomat, an additional +1 [ICON_INTERNATIONAL_TRADE] Trade Route and an increase of +25% [ICON_INFLUENCE] Influence with all City-States in the world. +33% faster production of Diplomacy Units and generation of [ICON_DIPLOMAT] Great Diplomats in the City.[NEWLINE][NEWLINE]Requires completion of [COLOR_CYAN]Statecraft Branch[ENDCOLOR]. City must be built next to a [COLOR_CYAN]River[ENDCOLOR].'),
('TXT_KEY_WONDER_BROOKLYN_QUOTE', '[NEWLINE]"Scientists are people who build the Brooklyn Bridge and then buy it."[NEWLINE] - William F. Buckley jr.[NEWLINE]'),
('TXT_KEY_WONDER_BROOKLYN_PEDIA', 'The Brooklyn Bridge is an iconic suspension bridge joining the boroughs of Manhattan and Brooklyn in New York City, New York across the East River. It was constructed between January 3 1870 and May 24, 1883 when it was opened to the public. The bridge is constructed in a Neo-Gothic style, as exhibited by the pointed arches in the towers.[NEWLINE][NEWLINE]  During scares of stability of the bridge in 1884, P.T. Barnum lead a herd of 21 elephants from his circus across the bridge. The bridge also has been used for exoduses of people following events such as 9/11, during which circumstances the bridge wobbled in a similar manner to the Millenium bridge in London.');


----------------------------------------------------
-- CHARTRES - Chartres Cathedral
-- TradeRouteRecipientBonus - city (x1)
-- TradeRouteTargetBonus - TR owner (x1)
----------------------------------------------------

UPDATE Buildings
SET FreeBuildingThisCity = 'BUILDINGCLASS_UNIVERSITY', TradeRouteRecipientBonus = 1, TradeRouteTargetBonus = 3, SpecialistType = 'SPECIALIST_ENGINEER', GreatPeopleRateChange = 1
WHERE Type = 'BUILDING_CHARTRES';

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_CHARTRES', 'YIELD_CULTURE', 2),
('BUILDING_CHARTRES_DUMMY', 'YIELD_FAITH', 1); -- This can be used to get other yields from cities as well!

INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) VALUES
('BUILDING_CHARTRES', 'FLAVOR_CULTURE', 30),
('BUILDING_CHARTRES', 'FLAVOR_RELIGION', 30),
('BUILDING_CHARTRES', 'FLAVOR_I_TRADE_DESTINATION', 25);

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_BUILDING_CHARTRES',     'Chartres Cathedral'),
('TXT_KEY_WONDER_CHARTRES_HELP',  'Gain 10% of the [ICON_PEACE] Faith of all cities connected by a Trade Route to this City. Incoming [ICON_INTERNATIONAL_TRADE] Trade Routes generate +1 [ICON_GOLD] Gold for the City, and +3 [ICON_GOLD] Gold for Trade Route owner. Provides a free [COLOR_POSITIVE_TEXT]University[ENDCOLOR].[NEWLINE][NEWLINE]Requires completion of [COLOR_CYAN]Tradition Branch[ENDCOLOR].'),
('TXT_KEY_WONDER_CHARTRES_QUOTE', '[NEWLINE]"The pursuit of peace resembles the building of a great cathedral. It is the work of a generation. In concept it requires a master-architect; in execution, the labors of many."[NEWLINE] - Hubert H. Humphrey[NEWLINE]'),
('TXT_KEY_WONDER_CHARTRES_PEDIA', 'The Cathedral Basilica of Our Lady of Chartres is a medieval Roman Rite Catholic church in Chartres in France. The building is one of the best examples of French Gothic architecture and is a World Heritage Site. The current cathedral is the the fifth in the town''s history as it became a bishopric in the 4th century, the current structure had begun construction after a fire ruined the previous structure in 1194. Since the 12th century the cathedral is a popular site for Christian pilgrims and visitors, all to see the building''s infamous relic - the Sancta Camisa, a tunic said to be worn by the Virgin Mary during the birth of Christ. During the Middle Ages the cathedral was also a cathedral school, Bishop Fulbert in the 11th century established Chartres as a leading school in Europe. By the new century the status of the cathedral was on the wane as the University of Paris grew into prominence and the emphasis of the cathedral moved away from education.');


----------------------------------------------------
-- CHEVALIERS - Krak des Chevaliers
----------------------------------------------------

UPDATE Buildings
SET ExtraCityHitPoints = 0, Defense = 0, FreeBuildingThisCity = 'BUILDINGCLASS_ORDER'
WHERE Type = 'BUILDING_CHEVALIERS';

UPDATE Buildings
SET ExtraCityHitPoints = 50, Defense = 500, CitySupplyFlat = 1
WHERE Type = 'BUILDING_CHEVALIERS_DUMMY';

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_CHEVALIERS', 'YIELD_PRODUCTION', 2),
('BUILDING_CHEVALIERS_DUMMY', 'YIELD_FAITH', 1);

INSERT INTO Building_UnitCombatProductionModifiers 	(BuildingType, UnitCombatType, Modifier) VALUES
('BUILDING_CHEVALIERS', 'UNITCOMBAT_MOUNTED', 33),
('BUILDING_CHEVALIERS', 'UNITCOMBAT_SIEGE', 33);

--INSERT INTO Building_FreeUnits (BuildingType, UnitType, NumUnits) VALUES
--('BUILDING_CHEVALIERS', 'UNIT_GREAT_GENERAL', 1);

INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) VALUES
('BUILDING_CHEVALIERS', 'FLAVOR_CITY_DEFENSE', 60),
('BUILDING_CHEVALIERS', 'FLAVOR_DEFENSE', 40),
('BUILDING_CHEVALIERS', 'FLAVOR_OFFENSE', 30);

INSERT INTO Language_en_US (Tag, Text)VALUES
('TXT_KEY_BUILDING_CHEVALIERS',     'Krak des Chevaliers'),
('TXT_KEY_WONDER_CHEVALIERS_HELP',  'Grants a free [COLOR_POSITIVE_TEXT]Order[ENDCOLOR]. +33% faster production of Mounted and Siege Units in this City. All Cities that are [COLOR_RED]not[ENDCOLOR] on the Coast +1 [ICON_PEACE] Faith, have increased +5 [ICON_STRENGTH] City Defense, +50 HP and provide +1 Military Unit Supply Cap.[NEWLINE][NEWLINE]City must be built on a [COLOR_CYAN]Hill[ENDCOLOR].'),
('TXT_KEY_WONDER_CHEVALIERS_QUOTE', '[NEWLINE]"I have long since been aware that your king is a man of the greatest honor and bravery, but he is imprudent" - Saladin to Richard I[NEWLINE]'),
('TXT_KEY_WONDER_CHEVALIERS_PEDIA', 'Krak des Chevaliers, also Crac des Chevaliers, is a Crusader castle in Syria and one of the most important preserved medieval castles in the world. The site was first inhabited in the 11th century by a settlement of Kurds; as a result it was known as Hisn al Akrad, meaning the "Castle of the Kurds". In 1142 it was given by Raymond II, Count of Tripoli, to the Knights Hospitaller. It remained in their possession until it fell in 1271. It became known as Crac de l''Ospital; the name Krak des Chevaliers was coined in the 19th century.');


----------------------------------------------------
-- DAMASCUS - Forge of Damascus
-- Enhances metals, Promo Damascus Steel for Sword units (+20% CS), free Forge
-- Cannot use FreePromotion because not all Melee/Mounted units use swords - ok, 1st version is easier approach
----------------------------------------------------

UPDATE Buildings
SET FreeBuildingThisCity = 'BUILDINGCLASS_FORGE', FreePromotion = 'PROMOTION_DAMASCUS', SpecialistType = 'SPECIALIST_SCIENTIST', GreatPeopleRateChange = 1, EnhancedYieldTech = 'TECH_METALLURGY'
WHERE Type = 'BUILDING_DAMASCUS';

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield)
VALUES ('BUILDING_DAMASCUS', 'YIELD_PRODUCTION', 2);

-- wonder gains additional production at metallurgy
INSERT INTO Building_TechEnhancedYieldChanges (BuildingType, YieldType, Yield)
VALUES ('BUILDING_DAMASCUS', 'YIELD_PRODUCTION', 3);

INSERT INTO Building_ResourceYieldChanges (BuildingType, ResourceType, YieldType, Yield) VALUES
('BUILDING_DAMASCUS', 'RESOURCE_IRON',   'YIELD_PRODUCTION', 1),
('BUILDING_DAMASCUS', 'RESOURCE_COPPER', 'YIELD_PRODUCTION', 1),
('BUILDING_DAMASCUS', 'RESOURCE_GOLD',   'YIELD_GOLD', 1),
('BUILDING_DAMASCUS', 'RESOURCE_SILVER', 'YIELD_GOLD', 1),
('BUILDING_DAMASCUS', 'RESOURCE_ALUMINUM', 'YIELD_SCIENCE', 2);

INSERT INTO UnitPromotions (Type, Description, Help, Sound, CannotBeChosen, LostWithUpgrade, AttackMod, PortraitIndex, IconAtlas, PediaType, PediaEntry) VALUES
('PROMOTION_DAMASCUS', 'TXT_KEY_PROMOTION_DAMASCUS', 'TXT_KEY_PROMOTION_DAMASCUS_HELP', 'AS2D_IF_LEVELUP', 1, 1, 20, 13, 'PROMOTION_ATLAS', 'PEDIA_SHARED', 'TXT_KEY_PROMOTION_DAMASCUS');

INSERT INTO UnitPromotions_UnitCombats (PromotionType, UnitCombatType) VALUES
('PROMOTION_DAMASCUS', 'UNITCOMBAT_MELEE'),
('PROMOTION_DAMASCUS', 'UNITCOMBAT_MOUNTED');

INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) VALUES
('BUILDING_DAMASCUS', 'FLAVOR_DEFENSE', 20),
('BUILDING_DAMASCUS', 'FLAVOR_OFFENSE', 50),
('BUILDING_DAMASCUS', 'FLAVOR_PRODUCTION', 30);

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_BUILDING_DAMASCUS',     'Forge of Damascus'),
('TXT_KEY_WONDER_DAMASCUS_HELP',  'Enhances metals worked by this city: [ICON_RES_IRON][ICON_RES_COPPER]: +1 [ICON_PRODUCTION], [ICON_RES_GOLD][ICON_RES_SILVER]: +1 [ICON_GOLD], [ICON_RES_ALUMINUM]: +2 [ICON_RESEARCH]. Provides a free [COLOR_POSITIVE_TEXT]Forge[ENDCOLOR]. All Melee and Mounted units get [COLOR_POSITIVE_TEXT]Damascus Steel[ENDCOLOR] promotion which improves +20% [ICON_STRENGTH] Combat Strength. +3 [ICON_PRODUCTION] Production with Metallurgy.[NEWLINE]  Requires completion of [COLOR_CYAN]Authority Branch[ENDCOLOR] and an improved source of [ICON_RES_IRON] [COLOR_CYAN]Iron[ENDCOLOR] or [ICON_RES_COPPER] [COLOR_CYAN]Copper[ENDCOLOR] nearby. In any case, 1 [ICON_RES_IRON] [COLOR_CYAN]Iron[ENDCOLOR] is used to build the Forge.'),
('TXT_KEY_WONDER_DAMASCUS_QUOTE', '[NEWLINE]The reputation and history of Damascus steel has given rise to many legends, such as the ability to cut through a rifle barrel or to cut a hair falling across the blade. The manufacturing technique has yet to be reverse engineered, even in modern times.'),
('TXT_KEY_WONDER_DAMASCUS_PEDIA', 'Damascus steel was a type of steel used for manufacturing sword blades in the Near East made with wootz steel. These swords are characterized by distinctive patterns of banding and mottling reminiscent of flowing water. Such blades were reputed to be tough, resistant to shattering and capable of being honed to a sharp, resilient edge.[NEWLINE][NEWLINE]  The reputation and history of Damascus steel has given rise to many legends, such as the ability to cut through a rifle barrel or to cut a hair falling across the blade. Although many types of modern steel outperform ancient Damascus alloys, chemical reactions in the production process made the blades extraordinary for their time, as Damascus steel was superplastic and very hard at the same time.'),
('TXT_KEY_PROMOTION_DAMASCUS',     'Damascus Steel'),
('TXT_KEY_PROMOTION_DAMASCUS_HELP', 'Exceptional Blades (+20% [ICON_STRENGTH] Combat Strength)');


----------------------------------------------------
-- GRIPSHOLM - Gripsholm Castle
----------------------------------------------------

UPDATE Buildings
SET GlobalPopulationChange = 1, SpecialistType = 'SPECIALIST_ARTIST', GreatPeopleRateChange = 1
WHERE Type = 'BUILDING_GRIPSHOLM';

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_GRIPSHOLM', 'YIELD_CULTURE', 3);

INSERT INTO Building_LakePlotYieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_GRIPSHOLM', 'YIELD_FOOD', 2);

INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) VALUES
('BUILDING_GRIPSHOLM', 'FLAVOR_DEFENSE', 15),
('BUILDING_GRIPSHOLM', 'FLAVOR_GROWTH', 25);
	
INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_BUILDING_GRIPSHOLM',     'Gripsholm Castle'),
('TXT_KEY_WONDER_GRIPSHOLM_HELP',  '+1 [ICON_CITIZEN] Population in each city. +2 [ICON_FOOD] Food from each Lake tile worked by the city.[NEWLINE][NEWLINE]City must be built near the [COLOR_CYAN]Lake[ENDCOLOR].'),
('TXT_KEY_WONDER_GRIPSHOLM_QUOTE', '[NEWLINE]"A man who dares to waste one hour of time has not discovered the value of life."[NEWLINE] - Charles Darwin'),
('TXT_KEY_WONDER_GRIPSHOLM_PEDIA', 'Gripsholm Castle is a Renaissance fortress located on the shore of Lake Mälaren, approximately 60 kilometres west of Sweden''s capital, Stockholm. The site had been used as the location for a fortress since the mid 14th century. This fortress was siezed by King Gustav I in 1526, who subsequently tore the old fortress down and rebuilt it in the form of Gripsholm Castle.[NEWLINE][NEWLINE]  Over the years, subsequent owners, like many of history''s marvels, have added their own touch. King Gustav III added his own theater to the Castle in the years following its decomission as a prison, and in the late 19th century a mass refurbishment was undertaken under the guidance of architect Fredrik Lilljekvist, which involved adding a third floor.');


----------------------------------------------------
-- HOLLYWOOD
-- Media Culture: +25% Tourism with BTs, +20% Culture with Stadiums
-- All Guilds +33% inc rate of the respective GP. Also +5 Gold & +5 Culture from each Guild. Reduces Boredom
----------------------------------------------------

UPDATE Buildings
SET FreePolicies = 1, UnculturedHappinessChangeGlobal = -20, SpecialistType = 'SPECIALIST_WRITER', GreatPeopleRateChange = 2
WHERE Type = 'BUILDING_HOLLYWOOD';

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_HOLLYWOOD', 'YIELD_GOLD', 10);

INSERT INTO Building_SpecificGreatPersonRateModifier (BuildingType, SpecialistType, Modifier) VALUES
('BUILDING_HOLLYWOOD', 'SPECIALIST_WRITER', 33),
('BUILDING_HOLLYWOOD', 'SPECIALIST_MUSICIAN', 33),
('BUILDING_HOLLYWOOD', 'SPECIALIST_ARTIST', 33);

INSERT INTO Building_BuildingClassYieldChanges (BuildingType, BuildingClassType, YieldType, YieldChange) VALUES
('BUILDING_HOLLYWOOD', 'BUILDINGCLASS_WRITERS_GUILD', 'YIELD_GOLD', 5),
('BUILDING_HOLLYWOOD', 'BUILDINGCLASS_WRITERS_GUILD', 'YIELD_CULTURE', 5),
('BUILDING_HOLLYWOOD', 'BUILDINGCLASS_ARTISTS_GUILD', 'YIELD_GOLD', 5),
('BUILDING_HOLLYWOOD', 'BUILDINGCLASS_ARTISTS_GUILD', 'YIELD_CULTURE', 5),
('BUILDING_HOLLYWOOD', 'BUILDINGCLASS_MUSICIANS_GUILD', 'YIELD_GOLD', 5),
('BUILDING_HOLLYWOOD', 'BUILDINGCLASS_MUSICIANS_GUILD', 'YIELD_CULTURE', 5);

INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) VALUES
('BUILDING_HOLLYWOOD', 'FLAVOR_HAPPINESS', 20),
('BUILDING_HOLLYWOOD', 'FLAVOR_CULTURE', 20),
('BUILDING_HOLLYWOOD', 'FLAVOR_GOLD', 20),
('BUILDING_HOLLYWOOD', 'FLAVOR_GREAT_PEOPLE', 40);

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_BUILDING_HOLLYWOOD',     'Hollywood'),
('TXT_KEY_WONDER_HOLLYWOOD_HELP',  '1 Free [COLOR_POSITIVE_TEXT]Social Policy[ENDCOLOR]. Reduces [ICON_HAPPINESS_3] Boredom in all cities. +33% faster generation of [ICON_GREAT_WRITER] Great Writers, [ICON_GREAT_ARTIST] Artists and [ICON_GREAT_MUSICIAN] Musicians in the City. +5 [ICON_GOLD] Gold and +5 [ICON_CULTURE] Culture from all Guilds.[NEWLINE][NEWLINE]Requires [COLOR_CYAN]Freedom[ENDCOLOR]. City must be built on a [COLOR_CYAN]Hill[ENDCOLOR].'),
('TXT_KEY_WONDER_HOLLYWOOD_QUOTE', '[NEWLINE]"Hollywood is a place where they''ll pay you a thousand dollars for a kiss and fifty cents for your soul."[NEWLINE] - Marilyn Monroe[NEWLINE]'),
('TXT_KEY_WONDER_HOLLYWOOD_PEDIA', 'Hollywood is a district of Los Angeles, USA, famous for it''s film industry. The area started life as a idealistic "suburban America", however it quickly grew from 1909, when film-makers started to arrive, and is now synonomous with the American Film Industry.[NEWLINE][NEWLINE]  Today, Hollywood is glamourised for being the land of the rich and famous, where dreams are made and wishes come true. It is home to several iconic buildings, including the Hollywood Bowl and Grauman''s Chinese Theatre. However, when most people think of Hollywood, they think of the large sign atop the Hollywood hills. This sign started life as a billboard for the suburban settlement, then named "Hollywoodland". In 1949, the "Land" was removed as part of a renovation contract.');


----------------------------------------------------
-- ITSUKUSHIMA - Itsukushima Shrine
-- Progress Finisher
-- Culture from Sea, Faith from SeaRes, Faster workers and cost of tiles -15%
----------------------------------------------------

UPDATE Buildings
SET WorkerSpeedModifier = 25, GlobalPlotCultureCostModifier = -15, GlobalPlotBuyCostModifier = -15
WHERE Type = 'BUILDING_ITSUKUSHIMA';

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_ITSUKUSHIMA', 'YIELD_CULTURE', 2);

/*
INSERT INTO Building_ResourceYieldChanges (BuildingType, ResourceType, YieldType, Yield) VALUES
('BUILDING_ITSUKUSHIMA', 'RESOURCE_CORAL',  'YIELD_FAITH', 2),
('BUILDING_ITSUKUSHIMA', 'RESOURCE_CRAB',   'YIELD_FAITH', 2),
('BUILDING_ITSUKUSHIMA', 'RESOURCE_FISH',   'YIELD_FAITH', 2),
('BUILDING_ITSUKUSHIMA', 'RESOURCE_PEARLS', 'YIELD_FAITH', 2),
('BUILDING_ITSUKUSHIMA', 'RESOURCE_WHALE',  'YIELD_FAITH', 2);
*/
INSERT INTO Building_ImprovementYieldChangesGlobal (BuildingType, ImprovementType, YieldType, Yield) VALUES
('BUILDING_ITSUKUSHIMA', 'IMPROVEMENT_FISHING_BOATS', 'YIELD_FAITH', 1);

INSERT INTO Building_SeaPlotYieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_ITSUKUSHIMA', 'YIELD_CULTURE', 1);

INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) VALUES
('BUILDING_ITSUKUSHIMA', 'FLAVOR_CULTURE', 40),
('BUILDING_ITSUKUSHIMA', 'FLAVOR_GROWTH', 40),
('BUILDING_ITSUKUSHIMA', 'FLAVOR_RELIGION', 50),
('BUILDING_ITSUKUSHIMA', 'FLAVOR_TILE_IMPROVEMENT', 30);

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_BUILDING_ITSUKUSHIMA',     'Itsukushima Shrine'),
--('TXT_KEY_WONDER_ITSUKUSHIMA_HELP',  'Tile improvement construction speed increased by 25%. [ICON_GOLD] Gold and [ICON_CULTURE] Culture cost of acquiring new tiles reduced by 15% in all cities. +2 [ICON_PEACE] Faith from each sea resource worked by the city, and +1 [ICON_CULTURE] Culture from each sea tile.[NEWLINE][NEWLINE]Requires completion of [COLOR_CYAN]Progress Branch[ENDCOLOR]. City must be built on the [COLOR_CYAN]Coast[ENDCOLOR].'),
('TXT_KEY_WONDER_ITSUKUSHIMA_HELP',  'Tile improvement construction speed increased by 25%. [ICON_GOLD] Gold and [ICON_CULTURE] Culture cost of acquiring new tiles reduced by 15% in all cities. All Fishing Boats provide +1 [ICON_PEACE] Faith. In this City +1 [ICON_CULTURE] Culture from each worked sea tile.[NEWLINE][NEWLINE]Requires completion of [COLOR_CYAN]Progress Branch[ENDCOLOR]. City must be built on the [COLOR_CYAN]Coast[ENDCOLOR].'),
('TXT_KEY_WONDER_ITSUKUSHIMA_QUOTE', '[NEWLINE]"From far and near, Hearing the sounds of waterfalls, Young leaves"[NEWLINE] - Buson[NEWLINE]'),
('TXT_KEY_WONDER_ITSUKUSHIMA_PEDIA', 'Itsukushima shrine is one of the most iconic Shinto shrines in Japan. It is world renowned for it''s iconic "Floating" torii gate, which pilgrims had to steer their boat through before they could enter the shrine''s grounds. It is located on the island of Itsukushima, at the western end of Japan''s "inland sea". There has been a shrine at the location since approximately 628 CE, when one was constructed under the reign of Empresss Suiko. The current design, however, dates from 1168, when the shrine was constructed with funds provided by the warlord Taiya no Kiyomori.[NEWLINE][NEWLINE]  The shrine, and it''s floating Torii, are one of the "Three Views of Japan", along with the sandbar at Amanohashidate, and Matsushima bay. These have been designated as the most beautiful scenes of Japan, and are frequented by tourists.');


----------------------------------------------------
-- JUMEIRAH - Palm Jumeirah
-- It is the first monorail in the Middle East
----------------------------------------------------

--UPDATE Buildings
--SET SpecialistType = 'SPECIALIST_ENGINEER', GreatPeopleRateChange = 2
--WHERE Type = 'BUILDING_JUMEIRAH';

INSERT INTO Building_YieldModifiers (BuildingType, YieldType, Yield) VALUES
('BUILDING_JUMEIRAH', 'YIELD_FOOD', 10),
('BUILDING_JUMEIRAH', 'YIELD_TOURISM', 10);

INSERT INTO Building_BuildingClassYieldChanges (BuildingType, BuildingClassType, YieldType, YieldChange) VALUES
('BUILDING_JUMEIRAH', 'BUILDINGCLASS_TRAINSTATION', 'YIELD_TOURISM', 5);

INSERT INTO Building_BuildingClassHappiness (BuildingType, BuildingClassType, Happiness) VALUES
('BUILDING_JUMEIRAH', 'BUILDINGCLASS_TRAINSTATION', 2);

INSERT INTO Building_FeatureYieldChanges (BuildingType, FeatureType, YieldType, Yield) VALUES
('BUILDING_JUMEIRAH', 'FEATURE_ATOLL', 'YIELD_GOLD', 10),
('BUILDING_JUMEIRAH', 'FEATURE_ATOLL', 'YIELD_TOURISM', 10),
('BUILDING_JUMEIRAH', 'FEATURE_OASIS', 'YIELD_GOLD', 10),
('BUILDING_JUMEIRAH', 'FEATURE_OASIS', 'YIELD_TOURISM', 10);

INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) VALUES
('BUILDING_JUMEIRAH', 'FLAVOR_CULTURE', 60),
('BUILDING_JUMEIRAH', 'FLAVOR_GOLD', 20),
('BUILDING_JUMEIRAH', 'FLAVOR_GROWTH', 30),
('BUILDING_JUMEIRAH', 'FLAVOR_HAPPINESS', 40);

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_BUILDING_JUMEIRAH',     'Palm Jumeirah'),
('TXT_KEY_WONDER_JUMEIRAH_HELP',  'All Train Stations +5 [ICON_TOURISM] Tourism and +2 [ICON_HAPPINESS_1] Happiness. In the City +10% [ICON_FOOD] Food and [ICON_TOURISM] Tourism, and each worked Atoll or Oasis +10 [ICON_GOLD] Gold and [ICON_TOURISM] Tourism.[NEWLINE][NEWLINE]City must be built on the [COLOR_CYAN]Coast[ENDCOLOR] and have an [COLOR_CYAN]Atoll[ENDCOLOR] or an [COLOR_CYAN]Oasis[ENDCOLOR] nearby.'),
('TXT_KEY_WONDER_JUMEIRAH_QUOTE', '[NEWLINE]"It is the nature of the strong heart, that like the palm tree it strives ever upwards when it is most burdened."[NEWLINE] - Phillip Sydney[NEWLINE]'),
('TXT_KEY_WONDER_JUMEIRAH_PEDIA', 'Located off the shore of Dubai in the United Arab Emirates (UAE), Palm Jumeirah is a large archipelago created by man in the shape of a palm tree. It was announced in 2001, and originally was intended to be one of three "Palm Islands" along with the Palm Jebel Ali and the Palm Deira, which was intended to be the largest of the three islands at the time. The archipelago has a total area of 25 square kilometres, comparable to over 800 American football pitches.[NEWLINE][NEWLINE] Palm Jumeirah consists of a central trunk, connected to the mainland by a 300 metre long bridge, sixteen fronds of the palm, and an 11 kilometre breakwater surrounding the construction. In total, the islands more than doubled Dubai''s existing coastline.[NEWLINE][NEWLINE] The islands are also a hotbed for new developments and resorts, much like the rest of Dubai. The Atlantis resort opened on the breakwater in 2008, which later became a symbol of the developments.');


----------------------------------------------------
-- KARNAK - Karnak Temple Complex
----------------------------------------------------

UPDATE Buildings
SET FreeBuildingThisCity = 'BUILDINGCLASS_MONUMENT', EnhancedYieldTech = 'TECH_FLIGHT', TechEnhancedTourism = 4,
	SpecialistType = 'SPECIALIST_ENGINEER', GreatPeopleRateChange = 1
WHERE Type = 'BUILDING_KARNAK';

--INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
--('BUILDING_KARNAK', 'YIELD_CULTURE', 2);

INSERT INTO Building_FeatureYieldChanges (BuildingType, FeatureType, YieldType, Yield) VALUES
('BUILDING_KARNAK', 'FEATURE_FLOOD_PLAINS', 'YIELD_FAITH', 1),
('BUILDING_KARNAK', 'FEATURE_FLOOD_PLAINS', 'YIELD_PRODUCTION', 1),
('BUILDING_KARNAK', 'FEATURE_OASIS', 'YIELD_FAITH', 1),
('BUILDING_KARNAK', 'FEATURE_OASIS', 'YIELD_PRODUCTION', 1);
	
INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) VALUES
('BUILDING_KARNAK', 'FLAVOR_CULTURE', 30),
('BUILDING_KARNAK', 'FLAVOR_HAPPINESS', 20),
('BUILDING_KARNAK', 'FLAVOR_PRODUCTION', 30),
('BUILDING_KARNAK', 'FLAVOR_RELIGION', 40);

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_BUILDING_KARNAK',     'Karnak'),
('TXT_KEY_WONDER_KARNAK_HELP',  'Free [COLOR_POSITIVE_TEXT]Monument[ENDCOLOR] in this city. +1 [ICON_PEACE] Faith and [ICON_PRODUCTION] Production from Flood Plains and Oases worked by the city. +4 [ICON_TOURISM] Tourism with Flight.[NEWLINE][NEWLINE]City must have [COLOR_CYAN]Flood Plains[ENDCOLOR] or an [COLOR_CYAN]Oasis[ENDCOLOR] nearby.'),
('TXT_KEY_WONDER_KARNAK_QUOTE', '[NEWLINE]"The body is the house of god. That is why it is said ''Man know yourself''"[NEWLINE] - Egyptian Proverb[NEWLINE]'),
('TXT_KEY_WONDER_KARNAK_PEDIA', 'Karnak is a large temple complex located in Thebes (nowadays is Luxor). It was constructed during the reign of Ramesses II as a place of worship for many different gods and goddesses, instead of focusing on just one member of the Egyptian Pantheon.[NEWLINE][NEWLINE]  The complex is a vast open-air museum, and the second largest ancient religious site in the world (after the Angkor Wat in Cambodia). It is believed to be the second most visited historical site in Egypt, only the Giza Pyramids near Cairo receive more visits.[NEWLINE][NEWLINE]  One famous aspect of Karnak is the Hypostyle Hall in the Precinct of Amun-Re, a hall area of 50,000 sq ft (5,000 m2) with 134 massive columns arranged in 16 rows. 122 of these columns are 10 meters tall, and the other 12 are 21 meters tall with a diameter of over three meters.');


----------------------------------------------------
-- KINKAKUJI - Kinkaku-ji / Golden Pavilion
----------------------------------------------------

UPDATE Buildings
SET FreeBuildingThisCity = 'BUILDINGCLASS_PAGODA'
WHERE Type = 'BUILDING_KINKAKUJI';

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_KINKAKUJI', 'YIELD_CULTURE', 3),
('BUILDING_KINKAKUJI', 'YIELD_FAITH', 3);

INSERT INTO Building_LakePlotYieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_KINKAKUJI', 'YIELD_CULTURE', 1),
('BUILDING_KINKAKUJI', 'YIELD_FAITH', 1);

INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) VALUES
('BUILDING_KINKAKUJI', 'FLAVOR_CULTURE', 30),
('BUILDING_KINKAKUJI', 'FLAVOR_RELIGION', 30);

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_BUILDING_KINKAKUJI',     'Kinkaku-ji (The Golden Pavilion)'),
('TXT_KEY_WONDER_KINKAKUJI_HELP',  'Grants a free [COLOR_POSITIVE_TEXT]Pagoda[ENDCOLOR]. +1 [ICON_PEACE] Faith and +1 [ICON_CULTURE] Culture from each Lake tile worked by the city.[NEWLINE][NEWLINE]City must be built near the [COLOR_CYAN]Lake[ENDCOLOR].'),
('TXT_KEY_WONDER_KINKAKUJI_QUOTE', '[NEWLINE]"A book holds a house of Gold"[NEWLINE] - Chinese Proverb[NEWLINE]'),
('TXT_KEY_WONDER_KINKAKUJI_PEDIA', 'Kinkaku-ji (literally "Temple of the Golden Pavilion") is a Buddhist temple in Kyoto, Japan. it was originally built as a villa at an unknown date, however was bought in 1397 by Shogun Ashikaga Yoshimitsu, who converted the villa into the Kinkaku-ji complex. Upon his death, it was converted to a Zen temple by his son.[NEWLINE][NEWLINE]  In July 1950 it was burnt down by a Monk with a mental illness, causing a massive renovation project to be undertaken. The renovations took five years, completed in 1955. The exterior of the upper two floors were covered in pure gold leave, giving the name "Golden Pavilion", however it is unclear wether the gold leaf was present in the pre-1950''s version.');


----------------------------------------------------
-- MALWIYA - Malwiya Minaret (Great Mosque of Samarra)
-- Free GE, ResStoneMarble +1P +1F, StoneWorks +1F
-- Quarries! IMPROVEMENT_QUARRY
----------------------------------------------------

-- special condition for Malwiya
INSERT INTO Building_ClassesNeededInCity (BuildingType, BuildingClassType) VALUES
('BUILDING_MALWIYA', 'BUILDINGCLASS_STONE_WORKS');

UPDATE Buildings
SET SpecialistType = 'SPECIALIST_ENGINEER', GreatPeopleRateChange = 1
WHERE Type = 'BUILDING_MALWIYA';

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_MALWIYA', 'YIELD_CULTURE', 2);

INSERT INTO Building_FreeUnits (BuildingType, UnitType, NumUnits) VALUES
('BUILDING_MALWIYA', 'UNIT_ENGINEER', 1);

INSERT INTO Building_ImprovementYieldChangesGlobal (BuildingType, ImprovementType, YieldType, Yield) VALUES
('BUILDING_MALWIYA', 'IMPROVEMENT_MANUFACTORY', 'YIELD_FAITH', 3),
('BUILDING_MALWIYA', 'IMPROVEMENT_MANUFACTORY', 'YIELD_PRODUCTION', 3),
('BUILDING_MALWIYA', 'IMPROVEMENT_QUARRY', 'YIELD_FAITH', 1),
('BUILDING_MALWIYA', 'IMPROVEMENT_QUARRY', 'YIELD_PRODUCTION', 1);

INSERT INTO Building_BuildingClassYieldChanges (BuildingType, BuildingClassType, YieldType, YieldChange) VALUES
('BUILDING_MALWIYA', 'BUILDINGCLASS_STONE_WORKS', 'YIELD_FAITH', 1),
('BUILDING_MALWIYA', 'BUILDINGCLASS_STONE_WORKS', 'YIELD_PRODUCTION', 1);

/*
INSERT INTO Building_ResourceYieldChanges (BuildingType, ResourceType, YieldType, Yield) VALUES
('BUILDING_MALWIYA', 'RESOURCE_STONE',  'YIELD_PRODUCTION', 1),
('BUILDING_MALWIYA', 'RESOURCE_STONE',  'YIELD_FAITH', 1),
('BUILDING_MALWIYA', 'RESOURCE_MARBLE', 'YIELD_PRODUCTION', 1),
('BUILDING_MALWIYA', 'RESOURCE_MARBLE', 'YIELD_FAITH', 1),
('BUILDING_MALWIYA', 'RESOURCE_JADE',   'YIELD_PRODUCTION', 1),
('BUILDING_MALWIYA', 'RESOURCE_JADE',   'YIELD_FAITH', 1),
('BUILDING_MALWIYA', 'RESOURCE_LAPIS',  'YIELD_PRODUCTION', 1),
('BUILDING_MALWIYA', 'RESOURCE_LAPIS',  'YIELD_FAITH', 1);
*/

INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) VALUES
('BUILDING_MALWIYA', 'FLAVOR_GREAT_PEOPLE', 30),
('BUILDING_MALWIYA', 'FLAVOR_PRODUCTION', 50),
('BUILDING_MALWIYA', 'FLAVOR_RELIGION', 60);

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_BUILDING_MALWIYA',     'Malwiya Minaret'),
('TXT_KEY_WONDER_MALWIYA_HELP',  'Grants a free [ICON_GREAT_ENGINEER] [COLOR_POSITIVE_TEXT]Great Engineer[ENDCOLOR]. All Stone Works and Quarries receive +1 [ICON_PRODUCTION] Production and [ICON_PEACE] Faith. All Manufactories receive +3 [ICON_PRODUCTION] Production and [ICON_PEACE] Faith.[NEWLINE][NEWLINE]City must have [COLOR_CYAN]Stone Works[ENDCOLOR] already constructed.'),
('TXT_KEY_WONDER_MALWIYA_QUOTE', '[NEWLINE]"Aim at heaven and you will get Earth... Aim at Earth and you will get neither."[NEWLINE] - C.S.Lewis[NEWLINE]'),
('TXT_KEY_WONDER_MALWIYA_PEDIA', 'The Malwiya Minaret (also known as the Spiral Minaret) is part of the Great Mosque of Samarra, located in Samarra, Iraq. The complex was built over a period of four years, from 848 to 852 CE. The main mosque was completed one year before the Minaret. The complex was constructed during the reign of Al-Mutawakkil, an Abbasid Caliph. For a time it was the largest mosque in the world.[NEWLINE][NEWLINE]  The minaret (tower) was constructed of sandstone, and is unique among other minarets because of its ascending spiral conical design. 52 metres high and 33 metres wide at the base, the spiral contains stairs reaching to the top. The word "malwiya" translates as "twisted" or "snail shell".[NEWLINE][NEWLINE]  With the turbulence of the Iraq war, the Malwiya Minaret has been damaged by bomb blasts, one in 2005 and one in 2011, when it was attacked by Iraqi insurgents.');


----------------------------------------------------
-- MICHEL - Mont Saint-Michel
-- Unique condition via Lua: 1-tile island!
----------------------------------------------------

UPDATE Buildings
SET FreeBuildingThisCity = 'BUILDINGCLASS_MONASTERY', ExtraCityHitPoints = 100, Defense = 1000, EnhancedYieldTech = 'TECH_FLIGHT', TechEnhancedTourism = 4
WHERE Type = 'BUILDING_MICHEL';

INSERT INTO Building_SeaPlotYieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_MICHEL', 'YIELD_FOOD', 1),
('BUILDING_MICHEL', 'YIELD_PRODUCTION', 1);

INSERT INTO Building_YieldChangesPerPop (BuildingType, YieldType, Yield) VALUES
('BUILDING_MICHEL', 'YIELD_FAITH', 25);

INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) VALUES
('BUILDING_MICHEL', 'FLAVOR_DEFENSE', 50),
('BUILDING_MICHEL', 'FLAVOR_GROWTH', 30),
('BUILDING_MICHEL', 'FLAVOR_PRODUCTION', 30),
('BUILDING_MICHEL', 'FLAVOR_RELIGION', 50);

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_BUILDING_MICHEL',     'Mont Saint-Michel'),
('TXT_KEY_WONDER_MICHEL_HELP',  'Grants a free [COLOR_POSITIVE_TEXT]Monastery[ENDCOLOR]. +1 [ICON_PRODUCTION] Production and [ICON_FOOD] Food from each sea tile worked by the City. +1 [ICON_PEACE] for every 4 [ICON_CITIZEN] population. Increases +10 [ICON_STRENGTH] City Defense and +100 HP.[NEWLINE][NEWLINE]City must be built on a [COLOR_CYAN]Single Tile Island[ENDCOLOR].'),
('TXT_KEY_WONDER_MICHEL_QUOTE', '[NEWLINE]"Therefore in the east give glory to the Lord; exalt the name of the Lord, the God of Israel, in the islands of the sea."[NEWLINE] - The Bible, Isaiah  24:15[NEWLINE]'),
('TXT_KEY_WONDER_MICHEL_PEDIA', 'Perched on a rocky islet in the midst of vast sandbanks exposed to powerful tides between Normandy and Brittany stand the "Wonder of the West", a Gothic-style Benedictine abbey dedicated to the archangel St Michael, and the village that grew up in the shadow of its great walls. Built between the 11th and 16th centuries, the abbey is a technical and artistic tour de force, having had to adapt to the problems posed by this unique natural site.');


----------------------------------------------------
-- MILLAU - Millau Viaduct
-- Air Supremacy: Free Airport in every City, can built Zeroes, +25% prod for Air units
-- Millau Viaduct: Armor, Archer and Gun units +1 Movement. 25% Faster movement on Roads and Railroads.
----------------------------------------------------

UPDATE Buildings
SET FreePolicies = 1, FreePromotion = 'PROMOTION_MILLAU', TradeRouteLandDistanceModifier = 50, TradeRouteLandGoldBonus = 300, TradeRouteRecipientBonus = 3, SpecialistType = 'SPECIALIST_ENGINEER', GreatPeopleRateChange = 1
WHERE Type = 'BUILDING_MILLAU';

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_MILLAU', 'YIELD_GOLD', 5);

INSERT INTO UnitPromotions (Type, Description, Help, Sound, CannotBeChosen, MovesChange, PortraitIndex, IconAtlas, PediaType, PediaEntry) VALUES
('PROMOTION_MILLAU', 'TXT_KEY_PROMOTION_MILLAU', 'TXT_KEY_PROMOTION_MILLAU_HELP', 'AS2D_IF_LEVELUP', 1, 1, 33, 'PROMOTION_ATLAS', 'PEDIA_SHARED', 'TXT_KEY_PROMOTION_MILLAU');

INSERT INTO UnitPromotions_UnitCombats (PromotionType, UnitCombatType) VALUES
('PROMOTION_MILLAU', 'UNITCOMBAT_ARCHER'),
('PROMOTION_MILLAU', 'UNITCOMBAT_ARMOR'),
('PROMOTION_MILLAU', 'UNITCOMBAT_GUN'),
('PROMOTION_MILLAU', 'UNITCOMBAT_SIEGE');

INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) VALUES
('BUILDING_MILLAU', 'FLAVOR_OFFENSE', 50),
('BUILDING_MILLAU', 'FLAVOR_I_LAND_TRADE_ROUTE', 40),
('BUILDING_MILLAU', 'FLAVOR_I_TRADE_DESTINATION', 30),
('BUILDING_MILLAU', 'FLAVOR_I_TRADE_ORIGIN', 30),
('BUILDING_MILLAU', 'FLAVOR_MILITARY_TRAINING', 20);

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_BUILDING_MILLAU',     'Millau Viaduct'),
('TXT_KEY_WONDER_MILLAU_HELP',  '1 Free [COLOR_POSITIVE_TEXT]Social Policy[ENDCOLOR]. All Archery, Armor, Gun and Siege units receive +1 [ICON_MOVES] Movement. Land Trade Routes originating from this city have a 50% increase in range and provide +3 [ICON_GOLD] Gold for the city owner.[NEWLINE][NEWLINE]Requires [COLOR_CYAN]Autocracy[ENDCOLOR]. City must be built on a [COLOR_CYAN]Hill[ENDCOLOR].'),
('TXT_KEY_WONDER_MILLAU_QUOTE', '[NEWLINE]"Above the cloud with its shadow is the star with its light. Above all things reverence thyself."[NEWLINE][NEWLINE] - Pythagoras[NEWLINE]'),
('TXT_KEY_WONDER_MILLAU_PEDIA', 'The Millau Viaduct is a cable stayed suspension bridge located in the South of France, spanning the Tarn River valley in Millau. It has a length of 2,460 metres and is the tallest bridge in the world, the highest point being 343 metres from the base. The Viaduct is part of a highway from Paris to Montpiller, in southern France. It is also the tallest structure in France, with the P2 Pillar being taller than the Eifel Tower. The route for the highway was chosen in 1989, with construction beginning in 2001 and taking 5 years.'),
('TXT_KEY_PROMOTION_MILLAU',     'Millau Viaduct'),
('TXT_KEY_PROMOTION_MILLAU_HELP', '+1 [ICON_MOVES] Movement for Archery, Armor, Gun and Siege units');


----------------------------------------------------
-- MONTECARLO - Monte Carlo Casino
-- Free Hotel and Jewelery, +1T&2G from all Hotels
----------------------------------------------------

UPDATE Buildings
SET FreeBuildingThisCity = 'BUILDINGCLASS_HOTEL'
WHERE Type = 'BUILDING_MONTECARLO';

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_MONTECARLO', 'YIELD_CULTURE', 2),
('BUILDING_MONTECARLO', 'YIELD_GOLD', 4);

--INSERT INTO Building_YieldChangesPerPop (BuildingType, YieldType, Yield) VALUES
--('BUILDING_MONTECARLO', 'YIELD_GOLD', 25);

INSERT INTO Building_ResourceQuantity (BuildingType, ResourceType, Quantity) VALUES
('BUILDING_MONTECARLO', 'RESOURCE_JEWELRY', 1);

INSERT INTO Building_BuildingClassYieldChanges (BuildingType, BuildingClassType, YieldType, YieldChange) VALUES
('BUILDING_MONTECARLO', 'BUILDINGCLASS_HOTEL', 'YIELD_GOLD', 2),
('BUILDING_MONTECARLO', 'BUILDINGCLASS_HOTEL', 'YIELD_TOURISM', 1);

INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) VALUES
('BUILDING_MONTECARLO', 'FLAVOR_CULTURE', 40),
('BUILDING_MONTECARLO', 'FLAVOR_GOLD', 30),
('BUILDING_MONTECARLO', 'FLAVOR_HAPPINESS', 10);

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_BUILDING_MONTECARLO',     'Monte Carlo Casino'),
('TXT_KEY_WONDER_MONTECARLO_HELP',  'Grants a free [COLOR_POSITIVE_TEXT]Hotel[ENDCOLOR] and +1 [ICON_RES_JEWELRY] [COLOR_POSITIVE_TEXT]Jewelery[ENDCOLOR]. All Hotels generate +1 [ICON_TOURISM] Tourism and +2 [ICON_GOLD] Gold.[NEWLINE][NEWLINE]Requires completion of [COLOR_CYAN]Artistry Branch[ENDCOLOR]. City must be built on the [COLOR_CYAN]Coast[ENDCOLOR].'),
('TXT_KEY_WONDER_MONTECARLO_QUOTE', '[NEWLINE]"Luck was a servant and not a master. Luck had to be accepted with a shrug or taken advantage of up to the hilt. But it had to be understood and recognized for what it was and not confused with a faulty appreciation of the odds, for, at gambling, the deadly sin is to mistake bad play for bad luck."[NEWLINE] - Ian Fleming[NEWLINE]'),
('TXT_KEY_WONDER_MONTECARLO_PEDIA', 'The Monte Carlo Casino is a gambling and entertainment complex located in Monte Carlo, Monaco. It includes a casino, the Grand Theatre de Monte Carlo, and the office of Les Ballets de Monte Carlo. The Monte Carlo Casino is owned and operated by the Société des bains de mer de Monaco, a public company in which the Monaco government and the ruling family have a majority interest. The company also owns the principal hotels, sports clubs, foodservice establishments, and nightclubs throughout Monaco.');


----------------------------------------------------
-- NABAWI - Al-Masjid an-Nabawi (Prophet's Mosque)
-- Gives a free Mosque. Building_GlobalYieldModifiers +10% Faith. 2 slot of GWW
----------------------------------------------------

UPDATE Buildings
SET FreeBuildingThisCity = 'BUILDINGCLASS_MOSQUE', GreatWorkSlotType = 'GREAT_WORK_SLOT_LITERATURE', GreatWorkCount = 2,
	SpecialistType = 'SPECIALIST_WRITER', GreatPeopleRateChange = 2, ThemingBonusHelp = 'TXT_KEY_NABAWI_THEMING_BONUS_HELP'
WHERE Type = 'BUILDING_NABAWI';

--INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
--('BUILDING_NABAWI', 'YIELD_CULTURE', 3);

INSERT INTO Building_SpecificGreatPersonRateModifier (BuildingType, SpecialistType, Modifier) VALUES
('BUILDING_NABAWI', 'SPECIALIST_WRITER', 33);

INSERT INTO Building_GlobalYieldModifiers (BuildingType, YieldType, Yield) VALUES
('BUILDING_NABAWI', 'YIELD_FAITH', 10);

INSERT INTO Building_ThemingBonuses (BuildingType, Description, Bonus, RequiresOwner, AIPriority)
VALUES ('BUILDING_NABAWI', 'TXT_KEY_THEMING_BONUS_NABAWI', 8, 1, 5);

INSERT INTO Building_ThemingYieldBonus (BuildingType, YieldType, Yield) VALUES
('BUILDING_NABAWI', 'YIELD_GOLDEN_AGE_POINTS', 4),
('BUILDING_NABAWI', 'YIELD_FAITH', 4);

INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) VALUES
('BUILDING_NABAWI', 'FLAVOR_CULTURE', 50),
('BUILDING_NABAWI', 'FLAVOR_RELIGION', 60);

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_BUILDING_NABAWI',     'Al-Masjid an-Nabawi'),
('TXT_KEY_WONDER_NABAWI_HELP',  'Grants a free [COLOR_POSITIVE_TEXT]Mosque[ENDCOLOR]. All Cities generate +10% [ICON_PEACE] Faith. Has 2 slot for [ICON_GREAT_WORK] Great Works of Writing that provide +4 [ICON_PEACE] Faith and [ICON_GOLDEN_AGE] Golden Age Points if Themed. +33% faster generation of [ICON_GREAT_WRITER] Great Writers in the City.[NEWLINE][NEWLINE]Must be built in a [COLOR_CYAN]Holy City[ENDCOLOR].'),
('TXT_KEY_WONDER_NABAWI_QUOTE', '[NEWLINE]"When you see a person who has been given more than you in money and beauty, look to those, who have been given less."[NEWLINE] - Prophet Muhammad[NEWLINE]'),
('TXT_KEY_WONDER_NABAWI_PEDIA', 'Al-Masjid al-Nabawi, often called the Prophet''s Mosque, is a mosque situated in the city of Medina. As the final resting place of the Islamic prophet Muhammad, it is considered the second holiest site in Islam by Muslims (the first being the Masjid al-Haram in Mecca) and is one of the largest mosques in the World. The mosque is under the control of the Custodian of the Two Holy Mosques. It is the second mosque built in history.[NEWLINE][NEWLINE]  One of the most notable features of the site is the Green Dome over the center of the mosque, where the tomb of Muhammad is located. It is not exactly known when the green dome was constructed but manuscripts dating to the early 12th century describe the dome. It is known as the Dome of the Prophet or the Green Dome. Subsequent Islamic rulers greatly expanded and decorated it. Early Muslim leaders Abu Bakr and Umar are buried in an adjacent area in the mosque.[NEWLINE][NEWLINE]  The site was originally Muhammad''s house; he settled there after his Hijra to Medina, later building a mosque on the grounds. He himself shared in the heavy work of construction. The original mosque was an open-air building. The basic plan of the building has been adopted in the building of other mosques throughout the world.'),
('TXT_KEY_NABAWI_THEMING_BONUS_HELP', 'To maximize your bonus, make sure both Great Works are filled with Writings created by you.'),
('TXT_KEY_THEMING_BONUS_NABAWI', 'Islamic Calligraphy Works');


----------------------------------------------------
-- NAZCA - Nazca Lines
-- +1 Faith from Shrines, Tourism with Flight, +1 Food from Plains, +1 Sci in city
----------------------------------------------------

UPDATE Buildings
SET EnhancedYieldTech = 'TECH_FLIGHT', TechEnhancedTourism = 4, SpecialistType = 'SPECIALIST_SCIENTIST', GreatPeopleRateChange = 1
WHERE Type = 'BUILDING_NAZCA';

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_NAZCA', 'YIELD_SCIENCE', 1);

INSERT INTO Building_TerrainYieldChanges (BuildingType, TerrainType, YieldType, Yield) VALUES
('BUILDING_NAZCA', 'TERRAIN_PLAINS', 'YIELD_FOOD', 1);
	
INSERT INTO Building_BuildingClassYieldChanges (BuildingType, BuildingClassType, YieldType, YieldChange) VALUES
('BUILDING_NAZCA', 'BUILDINGCLASS_SHRINE', 'YIELD_FAITH', 1);

INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) VALUES
('BUILDING_NAZCA', 'FLAVOR_GROWTH', 40),
('BUILDING_NAZCA', 'FLAVOR_RELIGION', 40),
('BUILDING_NAZCA', 'FLAVOR_SCIENCE', 20);

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_BUILDING_NAZCA',     'Nazca Lines'),
('TXT_KEY_WONDER_NAZCA_HELP',  'Nearby Plains receive +1 [ICON_FOOD] Food. +1 [ICON_PEACE] Faith from all Shrines. +4 [ICON_TOURISM] Tourism with Flight.[NEWLINE][NEWLINE]City must be built on a [COLOR_CYAN]Hill[ENDCOLOR] and on or next to [COLOR_CYAN]Plains[ENDCOLOR].'),
('TXT_KEY_WONDER_NAZCA_QUOTE', '[NEWLINE]"The true mystery of the world is the visible, not the invisible."[NEWLINE] - Oscar Wilde[NEWLINE]'),
('TXT_KEY_WONDER_NAZCA_PEDIA', 'The Nazca Lines, located between the Peruvian towns of Nazca and Palpa, are a series of enormous Geoglyphs designed on a large plateau, spanning over 80 kilometres. The designs have long been a source of mystery for those who have gazed upon them. It is estimated that the lines were constructed by the Nazca culture, hense the name, between 450 and 600 CE. The level of complexity of design varies between designs. Some are simple lines hundreds of metres long, while others are incredibly complex patterns resembling a variety of zoological designs - Monkeys, Condors, Spiders and Orca (Killer whale) to name but a few.[NEWLINE][NEWLINE]  The Nazca Lines are particularily popular amongst circles which believe in the existance of extra-terrestrial life, which the Nazca culture mistook for their gods. They believe that the simpler, straight lines are in fact landing strips for interstellar crafts used by the extra-terrestrials to land, and that a humanoid figure represented in the patterns is one of the extraterrestrials. Modern science has had a range of theories, amongst which the lines serving a purpose similar to that of Stonehenge as an early form of an observatory / astronomical calendar. Other theories were that the geometric lines could indicate the flow of water, irrigation schemes, or be a part of rituals to "summon" water. However, to this day the exact purpose of the lines remains a mystery.');


----------------------------------------------------
-- PANAMA - Panama Canal
-- +1 TR; +1G from Maritime Infrastructure, all sea trade routes +3 Gold, extends sea trade routes by 50%
----------------------------------------------------

UPDATE Buildings
SET NumTradeRouteBonus = 1, TradeRouteSeaDistanceModifier = 50, TradeRouteSeaGoldBonus = 300, TradeRouteRecipientBonus = 3, SpecialistType = 'SPECIALIST_MERCHANT', GreatPeopleRateChange = 1
WHERE Type = 'BUILDING_PANAMA';

INSERT INTO Building_BuildingClassYieldChanges (BuildingType, BuildingClassType, YieldType, YieldChange) VALUES
('BUILDING_PANAMA', 'BUILDINGCLASS_HARBOR',  'YIELD_GOLD', 1),
('BUILDING_PANAMA', 'BUILDINGCLASS_SEAPORT', 'YIELD_GOLD', 2);

INSERT INTO Building_FreeUnits (BuildingType, UnitType, NumUnits) VALUES
('BUILDING_PANAMA', 'UNIT_MERCHANT', 1);

INSERT INTO Building_SpecificGreatPersonRateModifier (BuildingType, SpecialistType, Modifier) VALUES
('BUILDING_PANAMA', 'SPECIALIST_MERCHANT', 33);

INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) VALUES
('BUILDING_PANAMA', 'FLAVOR_GOLD', 60),
('BUILDING_PANAMA', 'FLAVOR_GREAT_PEOPLE', 40),
('BUILDING_PANAMA', 'FLAVOR_I_SEA_TRADE_ROUTE', 40),
('BUILDING_PANAMA', 'FLAVOR_I_TRADE_DESTINATION', 30),
('BUILDING_PANAMA', 'FLAVOR_I_TRADE_ORIGIN', 30);

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_BUILDING_PANAMA',     'Panama Canal'),
('TXT_KEY_WONDER_PANAMA_HELP',  'All Harbors +1 [ICON_GOLD] Gold and all Seaports +2 [ICON_GOLD] Gold. Grants a free [ICON_GREAT_MERCHANT] [COLOR_POSITIVE_TEXT]Great Merchant[ENDCOLOR] and an additional +1 [ICON_INTERNATIONAL_TRADE] Trade Route. Sea Trade Routes originating from this City have a 50% increase in range and provide +3 [ICON_GOLD] Gold for the city owner. +33% faster generation of [ICON_GREAT_MERCHANT] Great Merchants in the City.[NEWLINE]  City must be built on the [COLOR_CYAN]Coast[ENDCOLOR] and on a [COLOR_CYAN]Flat[ENDCOLOR] terrain.'),
('TXT_KEY_WONDER_PANAMA_QUOTE', '[NEWLINE]"A stream cannot rise larger than its source"[NEWLINE] - Theodore Roosevelt[NEWLINE]'),
('TXT_KEY_WONDER_PANAMA_PEDIA', 'The Panama Canal is a manmade shipping lane located on the Panama Isthmus seperating the Pacific Ocean and Carribean Sea. The idea of a canal in the location was first proposed int he sixteenth century by Charles V, Holy Roman Emperor, who asked for a link to shorten the journey between Spain and their colony of Peru. In 1698 the Kingdom of Scotland launched a project to create an overland trade route in the area, which was abandoned due to inhospitiable conditions a year later.[NEWLINE][NEWLINE]  It was not until 1855 that a link was first established, the Panama Canal Railway, as a result of the 1849 discovery of Gold in the American state of California. This railway was used extensively in the American construction of the canal from 1904 to 1914. As opposed to the French plan of constructing a flat water canal, much like that of the Suez Canal, the American design featured a series of ship locks to rise the ships over a range that caused problems for the French design. The American design proved sucessful, and was opened on August 15, 1914. Railway cars had been used to transport approximately 152,910,972 cubic metres of excevations through the construction, while it had cost 27,500 lives across the whole project.');


----------------------------------------------------
-- ROCKEFELLER - Rockefeller Center
-- Charity Foundations, John Hopkins (HOSPITAL-MEDICAL_LAB), Money, Food-Growth
-- Free Medical Lab (John Hopkins School); Culture when Purchase (see Bank); Building_GlobalYieldModifiers +10% gold; +2 Science from all Hospitals
----------------------------------------------------

UPDATE Buildings
SET FreeBuildingThisCity = 'BUILDINGCLASS_MEDICAL_LAB', SpecialistType = 'SPECIALIST_MERCHANT', GreatPeopleRateChange = 2
WHERE Type = 'BUILDING_ROCKEFELLER';

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_ROCKEFELLER', 'YIELD_CULTURE', 3);

INSERT INTO Building_YieldFromPurchase (BuildingType, YieldType, Yield) VALUES
('BUILDING_ROCKEFELLER', 'YIELD_CULTURE', 20);

--INSERT INTO Policy_BuildingClassYieldModifiers (PolicyType,BuildingClassType,YieldType,YieldMod)
--VALUES ('POLICY_FREEDOM');

INSERT INTO Building_GlobalYieldModifiers (BuildingType, YieldType, Yield) VALUES
('BUILDING_ROCKEFELLER', 'YIELD_GOLD', 10);
	
INSERT INTO Building_BuildingClassYieldChanges (BuildingType, BuildingClassType, YieldType, YieldChange) VALUES
('BUILDING_ROCKEFELLER', 'BUILDINGCLASS_HOSPITAL', 'YIELD_SCIENCE', 2);

INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) VALUES
('BUILDING_ROCKEFELLER', 'FLAVOR_CULTURE', 40),
('BUILDING_ROCKEFELLER', 'FLAVOR_GOLD', 60),
('BUILDING_ROCKEFELLER', 'FLAVOR_GROWTH', 30),
('BUILDING_ROCKEFELLER', 'FLAVOR_SCIENCE', 20);

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_BUILDING_ROCKEFELLER',     'Rockefeller Center'),
('TXT_KEY_WONDER_ROCKEFELLER_HELP',  'All Cities generate +10% [ICON_GOLD] Gold and all Hospitals +2 [ICON_RESEARCH] Science. In this City: receive a free [COLOR_POSITIVE_TEXT]Medical Lab[ENDCOLOR] and [ICON_GOLD] Gold purcheses generate +20 [ICON_CULTURE] Culture (scaling with Era).[NEWLINE][NEWLINE]Requires an improved [ICON_RES_OIL] [COLOR_CYAN]Oil[ENDCOLOR] or [ICON_RES_COAL] [COLOR_CYAN]Coal[ENDCOLOR] nearby.'),
('TXT_KEY_WONDER_ROCKEFELLER_QUOTE', '[NEWLINE]"Don''t be afraid to give up the good to go for the great"[NEWLINE] - John D. Rockefeller[NEWLINE]'),
('TXT_KEY_WONDER_ROCKEFELLER_PEDIA', 'The Rockefeller Center is a complex of fourteen buildings in New York City. It is named after the entrepreneur John D. Rockefeller, who bought the land in 1928 and began to develop it in 1930 as the sole financeur of a project which was to cost $250,000,000 at the time, as a result of the Great Depression. The construction took the entire 1930''s to build, and during which time workers on the site did not have safety harnesses, and so were subject to narrow steel girders with a large fall below. It is here that Charles Ebbet''s iconic photograph of eleven men eating lunch on a girder overlooking Manhattan was taken. [NEWLINE][NEWLINE] The Rockefeller Center is home to several iconic New York scenes. Radio City Music Hall was completed in the complex in December of 1932, and at the time was the largest theatre on Earth, larger even than those on Broadway. The name is homage to the nickname of the NBC studios, which were also located within the complex. The Rockefeller Center is also home to what has been refered to as the fourth most famous statue in America. The gilded Bronze statue of the Hellenistic titan, Prometheus, adorns the lower plaza of the Rockefeller center, adjacent to what becomes an ice rink in winter months, again a famous scene.');


----------------------------------------------------
-- SHWEDAGON - Shwedagon Pagoda / Shwedagon Zedi Daw / Great Dagon Pagoda  / Golden Pagoda
-- Free Artist Guild, Artists +33%, +1Faith; 4 slots of GWA; ? Theme=same civ => +10 Faith, +10 Cul, +5 Tourism
-- it is believed to contain relics of the four previous Buddhas of the present kalpa. 
----------------------------------------------------

UPDATE Buildings
SET GreatWorkSlotType = 'GREAT_WORK_SLOT_ART_ARTIFACT', GreatWorkCount = 4, ThemingBonusHelp = 'TXT_KEY_SHWEDAGON_THEMING_BONUS_HELP',
	SpecialistType = 'SPECIALIST_ARTIST', GreatPeopleRateChange = 1
WHERE Type = 'BUILDING_SHWEDAGON';

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_SHWEDAGON', 'YIELD_CULTURE', 2);

INSERT INTO Building_SpecificGreatPersonRateModifier (BuildingType, SpecialistType, Modifier) VALUES
('BUILDING_SHWEDAGON', 'SPECIALIST_ARTIST', 33);

INSERT INTO Building_SpecialistYieldChanges (BuildingType, SpecialistType, YieldType, Yield) VALUES
('BUILDING_SHWEDAGON', 'SPECIALIST_ARTIST', 'YIELD_FAITH', 2);

INSERT INTO Building_ThemingBonuses (BuildingType, Description, Bonus, MustBeArt, RequiresOwner, AIPriority) VALUES
('BUILDING_SHWEDAGON', 'TXT_KEY_THEMING_BONUS_SHWEDAGON', 8, 1, 1, 5);

INSERT INTO Building_ThemingYieldBonus (BuildingType, YieldType, Yield) VALUES
('BUILDING_SHWEDAGON', 'YIELD_CULTURE', 2),
('BUILDING_SHWEDAGON', 'YIELD_FAITH', 2),
('BUILDING_SHWEDAGON', 'YIELD_GOLDEN_AGE_POINTS', 2),
('BUILDING_SHWEDAGON', 'YIELD_TOURISM', 2);

INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) VALUES
('BUILDING_SHWEDAGON', 'FLAVOR_CULTURE', 50),
('BUILDING_SHWEDAGON', 'FLAVOR_GREAT_PEOPLE', 30),
('BUILDING_SHWEDAGON', 'FLAVOR_RELIGION', 40);

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_BUILDING_SHWEDAGON',     'Shwedagon Paya'),
('TXT_KEY_WONDER_SHWEDAGON_HELP',  '+2 [ICON_PEACE] Faith from Artists in all Cties. +33% faster generation of [ICON_GREAT_ARTIST] Great Artists in this City. Has 4 slots for [ICON_GREAT_WORK] Great Works of Art. Provides +2 [ICON_CULTURE] Culture, [ICON_PEACE] Faith, [ICON_GOLDEN_AGE] Golden Age Points and [ICON_TOURISM] Tourism if Themed.[NEWLINE]  Requires an improved [ICON_RES_GOLD] [COLOR_CYAN]Gold[ENDCOLOR], [ICON_RES_SILVER] [COLOR_CYAN]Silver[ENDCOLOR], [ICON_RES_GEMS] [COLOR_CYAN]Gems[ENDCOLOR] or [ICON_RES_PEARLS] [COLOR_CYAN]Pearls[ENDCOLOR] nearby.'),
('TXT_KEY_WONDER_SHWEDAGON_QUOTE', '[NEWLINE]"There was a tumult among men and spirits, the blind beheld objects, the deaf heard sounds. The earth quaked, lightning flashed, gems rained down until they were knee deep, and all trees of the Himalayas, though not in season, bore blossoms and fruit."[NEWLINE] - King Okkalapa[NEWLINE]'),
('TXT_KEY_WONDER_SHWEDAGON_PEDIA', 'Shwedagon Paya (also known as Shwedagon Pagoda or the Great Dragon Pagoda) is a large Buddhist stupa located in the Burmese city of Rangoon. It is 99 metres tall in it''s current state, and is coated with gold donated by the Burmese populus to maintain the Stupa. It is not known when the gold was put in place, although the stupa itself is said to date back over 2,500 years. Each sucessive dynasty has built upon the Stupa, until it reached the current height of 99 metres during reconstruction following an earthquake in 1768. Shwedagon Paya also features a crown of 5,448 diamonds and 2317 Rubies.'),
('TXT_KEY_THEMING_BONUS_SHWEDAGON', 'Relics of the four previous Buddhas of the present kalpa'),
('TXT_KEY_SHWEDAGON_THEMING_BONUS_HELP', 'To maximize your bonus, make sure all the Great Work Slots are all filled with Art created by you.');


----------------------------------------------------
-- SOLOMON - Solomon's Temple
-- Gives a free Synagogue. Ark of the Covenant.
----------------------------------------------------

UPDATE Buildings
SET FreeBuildingThisCity = 'BUILDINGCLASS_SYNAGOGUE', ReligiousPressureModifier = 100,
	GreatWorkSlotType = 'GREAT_WORK_SLOT_ART_ARTIFACT', GreatWorkCount = 1, FreeGreatWork = 'GREAT_WORK_ARK_COVENANT'
WHERE Type = 'BUILDING_SOLOMON';

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_SOLOMON', 'YIELD_CULTURE', 4),
('BUILDING_SOLOMON', 'YIELD_FAITH',  4);

INSERT INTO GreatWorks (Type, Description, GreatWorkClassType, EraType, Image) VALUES
('GREAT_WORK_ARK_COVENANT', 'TXT_KEY_GREAT_WORK_ARK_COVENANT', 'GREAT_WORK_ARTIFACT', 'ERA_CLASSICAL', 'VPWE_GW_Ark_Covenant.dds');

INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) VALUES
('BUILDING_NABAWI', 'FLAVOR_CULTURE', 40),
('BUILDING_NABAWI', 'FLAVOR_RELIGION', 30);

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_BUILDING_SOLOMON',     'Solomon''s Temple'),
('TXT_KEY_WONDER_SOLOMON_HELP',  'Grants a free [COLOR_POSITIVE_TEXT]Synagogue[ENDCOLOR]. Doubles religious pressure from the City. Has 1 slot for a [ICON_GREAT_WORK] Great Work of Art or Artifact which contains the [COLOR_POSITIVE_TEXT]Ark of the Covenant[ENDCOLOR].[NEWLINE][NEWLINE]Must be built in a [COLOR_CYAN]Holy City[ENDCOLOR].'),
('TXT_KEY_WONDER_SOLOMON_QUOTE', '[NEWLINE][TAB][TAB]"Even them will I bring to My holy mountain, and make joyful in My house of prayer, their burnt-offerings and their sacrifices shall be acceptable upon Mine altar, for my house shall be called a house of prayer for all peoples."[NEWLINE][TAB][TAB] - Isaiah[NEWLINE][TAB]'),
('TXT_KEY_WONDER_SOLOMON_PEDIA', 'Solomon''s Temple, also known as the First Temple, was the Holy Temple in ancient Jerusalem before its destruction by Nebuchadnezzar II. It was one of a series of structures which were located on the Temple Mount in the Old City of Jerusalem, the current site of the Dome of the Rock. These successive temples stood at this location and functioned as a site of ancient Israelite and later Jewish worship.[NEWLINE]  The Hebrew Bible reports that the First Temple was built in 957 BCE by King Solomon (reigned c. 970-c. 930 BCE). According to Deuteronomy, as the sole place of Jewish sacrifice (Deuteronomy 12), the Temple replaced the portable sanctuary (aka The Tabernacle) constructed in the Sinai Desert under the auspices of Moses, as well as local sanctuaries, and altars in the hills. This temple was however sacked a few decades later by Sheshonk I, Pharaoh of Egypt. However, according to 1 Kings 12, after the northern secession from Judah ca. 930 BCE to establish the independent kingdom of Israel, King Jeroboam built new temples at Bethel (on Israel’s southern border) and at Dan (on the northern border). At each of these shrines, he set up a golden bull calf, calling them Elohim.[NEWLINE]  Although efforts were made at partial reconstruction, it was only in 835 BCE when Jehoash, King of Judah in the second year of his reign invested considerable sums in reconstruction, only to have it stripped again for Sennacherib, King of Assyria c. 700 BCE. The First Temple was totally destroyed by the Babylonians in 586 BCE when they sacked the city.[NEWLINE]  According to the Book of Ezra, construction of the Second Temple was authorized by Cyrus the Great and began in 538 BCE, after the fall of the Babylonian Empire the year before. It was completed 23 years later, on the third day of Adar, in the sixth year of the reign of Darius the Great (12 March 515 BCE), dedicated by the Jewish governor Zerubbabel. Despite the fact that the new temple was not as extravagant or imposing as its predecessor, it still dominated the Jerusalem skyline and remained an important structure throughout the time of Persian suzerainty. The temple narrowly avoided being destroyed again in 332 BCE when the Jews refused to acknowledge the deification of Alexander the Great of Macedonia. Alexander was allegedly "turned from his anger" at the last minute by astute diplomacy and flattery. After the death of Alexander on 13 June 323 BCE, and the dismembering of his empire, the Ptolemies came to rule over Judea and the Temple. Under the Ptolemies, the Jews were given many civil liberties and lived content under their rule. However, when the Ptolemaic army was defeated at Panium by Antiochus III of the Seleucids in 198 BCE, this policy changed. Antiochus wanted to Hellenize the Jews, attempting to introduce the Greek pantheon into the temple. A rebellion ensued and was brutally crushed, but no further action by Antiochus was taken. When Antiochus died in 187 BCE at Luristan, his son Seleucus IV Philopator succeeded him. However, his policies never took effect in Judea, since he was assassinated the year after his ascension.[NEWLINE]  Antiochus IV Epiphanes succeeded his older brother to the Seleucid throne and immediately adopted his father''s previous policy of universal Hellenisation. The Jews rebelled again and Antiochus, in a rage, retaliated in force. Considering the previous episodes of discontent, the Jews became incensed when the religious observances of Sabbath and circumcision were officially outlawed. When Antiochus erected a statue of Zeus in their temple and Hellenic priests began sacrificing pigs (the usual sacrifice offered to the Greek gods in the Hellenic religion) their anger began to spiral. When a Greek official ordered a Jewish priest to perform a Hellenic sacrifice, the priest (Mattathias) killed him. In 167 BCE the Jews rose up en masse behind Mattathias and his five sons to fight and win their freedom from Seleucid authority. Mattathias'' son Judas Maccabeus, now called "The Hammer", re-dedicated the temple in 165 BCE and the Jews celebrate this event to this day as a major part of the festival of Hanukkah.[NEWLINE]  The temple was rededicated under Judas Maccabaeus in 164 BCE. During the Roman era, Pompey entered (and thereby desecrated) the Holy of Holies in 63 BCE, but left the Temple intact.[7][8][9] In 54 BCE, Crassus looted the Temple treasury, only for him to die the year after at the Battle of Carrhae against Parthia. When news of this reached the Jews, they revolted again, only to be put down in 43 BCE. Around 20 BCE, the building was renovated by Herod the Great, and became known as Herod''s Temple. During the Roman occupation of Judea, the Temple remained under control of the Jewish people. It was later destroyed by the Romans in 70 CE during the Siege of Jerusalem. During the last revolt of the Jews against the Romans in 132–135 CE, Simon bar Kokhba and Rabbi Akiva wanted to rebuild the Temple, but bar Kokhba''s revolt failed and the Jews were banned from Jerusalem (except for Tisha B''Av) by the Roman Empire. The emperor Julian failed to have the Temple rebuilt in 363 CE.[NEWLINE]  After the Muslim conquest of Jerusalem in the 7th century, Umayyad Caliph Abd al-Malik ibn Marwan ordered the construction of an Islamic shrine, the Dome of the Rock, on the site of the Temple. The shrine has stood on the mount since 691 CE; the al-Aqsa Mosque, from roughly the same period, also stands in the Temple courtyard.'),
('TXT_KEY_GREAT_WORK_ARK_COVENANT', 'Ark of the Covenant');


----------------------------------------------------
-- SOVIETS - Palace of the Soviets
-- Dictatorship of Proletariat: +75% Tourism for Civs with less Happiness, +1 Hap from Factories
-- Palace of the Soviets: Factories +3 Cul, all Great Works +1 Tourism.
-- Tourism modifier for TR is increased by 15%????
----------------------------------------------------

UPDATE Buildings
SET FreePolicies = 1, DefenseHappinessChangeGlobal = -20, SpecialistType = 'SPECIALIST_ENGINEER', GreatPeopleRateChange = 2
WHERE Type = 'BUILDING_SOVIETS';

-- if this will not work, try: GlobalGreatWorksTourismModifier
-- it may only affect this city...
INSERT INTO Building_GreatWorkYieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_SOVIETS', 'YIELD_TOURISM', 1);

INSERT INTO Building_BuildingClassYieldChanges (BuildingType, BuildingClassType, YieldType, YieldChange) VALUES
('BUILDING_SOVIETS', 'BUILDINGCLASS_FACTORY', 'YIELD_CULTURE', 3);

INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) VALUES
('BUILDING_SOVIETS', 'FLAVOR_CULTURE', 50),
('BUILDING_SOVIETS', 'FLAVOR_HAPPINESS', 30);

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_BUILDING_SOVIETS',     'Palace of the Soviets'),
('TXT_KEY_WONDER_SOVIETS_HELP',  '1 Free [COLOR_POSITIVE_TEXT]Social Policy[ENDCOLOR]. Reduces [ICON_HAPPINESS_3] Crime in all cities. All Factories generate +3 [ICON_CULTURE] Culture and Great Works +1 [ICON_TOURISM] Tourism.[NEWLINE][NEWLINE]Requires [COLOR_CYAN]Order[ENDCOLOR]. City must be built next to a [COLOR_CYAN]River[ENDCOLOR].'),
('TXT_KEY_WONDER_SOVIETS_QUOTE', '[NEWLINE]"The oppressed are allowed once every few years to decide which particular representatives of the oppressing class are to represent and repress them in parliament."[NEWLINE][NEWLINE] - Karl Marx[NEWLINE]'),
('TXT_KEY_WONDER_SOVIETS_PEDIA', 'The Palace of the Soviets was a project to construct an administrative center and a congress hall in Moscow, Russia, near the Kremlin, on the site of the demolished Cathedral of Christ the Saviour. The architectural contest for the Palace of the Soviets (1931–1933) was won by Boris Iofan''s neoclassical concept, subsequently revised by Iofan, Vladimir Shchuko and Vladimir Gelfreikh into a skyscraper. If built, it would have become the world''s tallest structure of its time. Construction started in 1937, and was terminated by the German invasion in 1941. In 1941–1942, its steel frame was disassembled for use in fortifications and bridges. Construction was never resumed. In 1958, the foundations of the Palace were converted into what would become the world''s largest open-air swimming pool, the Moskva Pool.');


----------------------------------------------------
-- SPUTNIK - The Sputnik Program
-- Spaceflight Pioneers: Gain free Great Engineer and Scientist, may procure SS parts with GEs, +100 Science when popping GP (era scaled)
-- Sputnik Program: Reduces Boredom. SS parts build +25% faster. Faster +33% GEs&GSs in the city. Faster GPs in all Cities.  Increases Influence with all City States by +40
----------------------------------------------------

UPDATE Buildings
SET FreePolicies = 1, UnculturedHappinessChangeGlobal = -20, SpaceProductionModifier = 25, GlobalGreatPeopleRateModifier = 10, SpecialistType = 'SPECIALIST_ENGINEER', GreatPeopleRateChange = 2
WHERE Type = 'BUILDING_SPUTNIK';

INSERT INTO Building_SpecificGreatPersonRateModifier (BuildingType, SpecialistType, Modifier) VALUES
('BUILDING_SPUTNIK', 'SPECIALIST_ENGINEER', 33),
('BUILDING_SPUTNIK', 'SPECIALIST_SCIENTIST', 33);

INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) VALUES
('BUILDING_SPUTNIK', 'FLAVOR_GREAT_PEOPLE', 50),
('BUILDING_SPUTNIK', 'FLAVOR_HAPPINESS', 30),
('BUILDING_SPUTNIK', 'FLAVOR_SCIENCE', 30),
('BUILDING_SPUTNIK', 'FLAVOR_SPACESHIP', 50);

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_BUILDING_SPUTNIK',     'The Sputnik Program'),
('TXT_KEY_WONDER_SPUTNIK_HELP',  '1 Free [COLOR_POSITIVE_TEXT]Social Policy[ENDCOLOR]. Reduces [ICON_HAPPINESS_3] Boredom in all cities. +33% faster generation of [ICON_GREAT_ENGINEER] Great Engineers and [ICON_GREAT_SCIENTIST] Scientists in this City and +10% faster generation of all [ICON_GREAT_PEOPLE] Great People in all Cities. +25% [ICON_PRODUCTION] Production in this City when building Spaceship Parts.[NEWLINE]  Requires [COLOR_CYAN]Order[ENDCOLOR]. City must be built on a [COLOR_CYAN]Flat[ENDCOLOR] terrain.'),
('TXT_KEY_WONDER_SPUTNIK_QUOTE', '[NEWLINE]"Beep... Beep... Beep..."[NEWLINE] - Sputnik 1[NEWLINE]'),
('TXT_KEY_WONDER_SPUTNIK_PEDIA', 'The Sputnik program was a series of robotic spacecraft missions launched by the Soviet Union. The first of these, Sputnik 1, launched the first human-made object to orbit the Earth. That launch took place on October 4, 1957 as part of the International Geophysical Year and demonstrated the viability of using artificial satellites to explore the upper atmosphere.[NEWLINE][NEWLINE]  The value of Sputnik 1 as Soviet propaganda was especially evident in the response of the American public. Sputnik crushed the American perception of the United States as the technological superpower by demonstrating that the Soviets were not the ignorant Easterners they had been perceived as prior to the launch. As a result, panic overtook the American public, which created an enormous sense of vulnerability regarding the United States'' ability to defend its territory.');


----------------------------------------------------
-- STPETERS - Papal Basilica of St. Peter in the Vatican
-- Faith from GWA. Reduces Poverty in All Cities. +1 Hap from All religious buildings.
----------------------------------------------------

UPDATE Buildings
SET PovertyHappinessChangeGlobal = -20, SpecialistType = 'SPECIALIST_ARTIST', GreatPeopleRateChange = 1
WHERE Type = 'BUILDING_STPETERS';

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_STPETERS', 'YIELD_CULTURE', 2);

INSERT INTO Building_GreatWorkYieldChanges (BuildingType, YieldType, Yield)
VALUES ('BUILDING_STPETERS', 'YIELD_FAITH', 1);

INSERT INTO Building_BuildingClassHappiness (BuildingType, BuildingClassType, Happiness)
SELECT DISTINCT 'BUILDING_STPETERS', BuildingClass, 1
FROM Buildings
WHERE Cost = -1 and FaithCost > 0 AND WonderSplashImage IS NULL;
	
INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) VALUES
('BUILDING_STPETERS', 'FLAVOR_HAPPINESS', 50),
('BUILDING_STPETERS', 'FLAVOR_RELIGION', 40);

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_BUILDING_STPETERS',     'St. Peter''s Basilica'),
('TXT_KEY_WONDER_STPETERS_HELP',  'Reduces [ICON_HAPPINESS_3] Poverty in all cities. +1 [ICON_PEACE] Faith from all [ICON_GREAT_WORK] Great Works of Art. +1 [ICON_HAPPINESS_1] Happiness from all unique Religious buildings.[NEWLINE][NEWLINE]Requires completion of [COLOR_CYAN]Fealty Branch[ENDCOLOR].'),
('TXT_KEY_WONDER_STPETERS_QUOTE', '[NEWLINE]"A rock pile ceases to be a rock pile the moment a single man contemplates it, bearing within him the image of a cathedral."[NEWLINE] - Antoine de Saint-Exupery[NEWLINE]'),
('TXT_KEY_WONDER_STPETERS_PEDIA', 'Basilica Papale di San Pietro in Vaticano, better known as St. Peter''s Basilica, is a late Renaissance church in Vatican City, with the largest interior of any Christian church in the world. The supposed burial site of the apostle Peter in 64 AD, some years later a shrine was constructed there. Replacing the shrine, construction of "old" St. Peter''s was begun by the Emperor Constantine between 319 and 333 AD.[NEWLINE][NEWLINE]  Having fallen into serious disrepair over the centuries, Pope Julius II in 1505 determined to demolish the old church and replace it with a monumental structure, a construction project that spanned the next 120 years under a succession of popes and architects. To finance the colossal project, a number of popes authorized the wholesale selling of indulgences, a practice that led in part to Martin Luther''s protestant movement.[NEWLINE][NEWLINE]  With work by some of the Renaissance''s leading figures - Michelangelo, Raphael, Bramante, Bernini and others - the church now stands as one of the great treasures of Western civilization.');


----------------------------------------------------
-- TAIPEI101 - Taipei 101
-- Starts GA. all Banks +1G and StockExch +2G;
----------------------------------------------------

UPDATE Buildings
SET GoldenAge = 1, MinorFriendshipChange = 25
WHERE Type = 'BUILDING_TAIPEI101';

INSERT INTO Building_BuildingClassYieldChanges (BuildingType, BuildingClassType, YieldType, YieldChange) VALUES
('BUILDING_TAIPEI101', 'BUILDINGCLASS_BANK',		   'YIELD_GOLD', 2),
('BUILDING_TAIPEI101', 'BUILDINGCLASS_STOCK_EXCHANGE', 'YIELD_GOLD', 2);

--INSERT INTO Building_YieldPerAlly (BuildingType, YieldType, Yield) VALUES
--('BUILDING_TAIPEI101', 'YIELD_TOURISM', 4),
--('BUILDING_TAIPEI101', 'YIELD_GOLDEN_AGE_POINTS', 4);

--INSERT INTO Building_YieldPerFriend (BuildingType, YieldType, Yield) VALUES
--('BUILDING_TAIPEI101', 'YIELD_TOURISM', 2),
--('BUILDING_TAIPEI101', 'YIELD_GOLDEN_AGE_POINTS', 2);

INSERT INTO Building_ImprovementYieldChangesGlobal (BuildingType, ImprovementType, YieldType, Yield) VALUES
('BUILDING_TAIPEI101', 'IMPROVEMENT_CUSTOMS_HOUSE',       'YIELD_GOLD', 2),
('BUILDING_TAIPEI101', 'IMPROVEMENT_CUSTOMS_HOUSE_VENICE','YIELD_GOLD', 2),
('BUILDING_TAIPEI101', 'IMPROVEMENT_TRADING_POST',        'YIELD_GOLD', 2);

INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) VALUES
('BUILDING_TAIPEI101', 'FLAVOR_GOLD', 60),
('BUILDING_TAIPEI101', 'FLAVOR_I_SEA_TRADE_ROUTE', 40),
('BUILDING_TAIPEI101', 'FLAVOR_I_TRADE_DESTINATION', 30),
('BUILDING_TAIPEI101', 'FLAVOR_I_TRADE_ORIGIN', 30);

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_BUILDING_TAIPEI101',     'Taipei 101'),
('TXT_KEY_WONDER_TAIPEI101_HELP',  'A [ICON_GOLDEN_AGE] [COLOR_POSITIVE_TEXT]Golden Age[ENDCOLOR] begins. +2 [ICON_GOLD] Gold from all Banks, Stock Exchanges, Villages, Towns and Colonias. Receive an increase of +25% [ICON_INFLUENCE] Influence with all City-States in the world.[NEWLINE][NEWLINE]City must be built on a [COLOR_CYAN]Flat[ENDCOLOR] terrain and have a [COLOR_CYAN]Jungle[ENDCOLOR] or [COLOR_CYAN]Forest[ENDCOLOR] nearby.'),
('TXT_KEY_WONDER_TAIPEI101_QUOTE', '[NEWLINE]"I am opposed to millionaires, but it would be dangerous to offer me the position."[NEWLINE] - Mark Twain[NEWLINE]'),
('TXT_KEY_WONDER_TAIPEI101_PEDIA', 'Taipei 101 is a financial tower in Taipei, the capital city of Taiwan. It was the tallest building in the world from 2004 to 2010, being surpassed by the Burj Khalifa in Dubai. Across five floors from the 87th to the 91st floors is a large turned mass damper, which stops the tower from suffering damage from amplitudinal waves caused by high winds. The tower is also designed with symbolism in mind. It is not only a large sundial with the shadow it casts, it is composed of 8 segments of 8 floors, eight being a traditional number for good luck. The design also takes into account ancient Chinese Pagoda design.');


----------------------------------------------------
-- TRAFALGAR - Trafalgar Square
-- Treaty Organization: +4 Influence per TR for CS, +4 votes
-- Trafalgar Square: All Cities CS +50%.
----------------------------------------------------

UPDATE Buildings
SET FreePolicies = 1, NumTradeRouteBonus = 1, SpecialistType = 'SPECIALIST_CIVIL_SERVANT', GreatPeopleRateChange = 2, MinorFriendshipChange = 50
WHERE Type = 'BUILDING_TRAFALGAR';

--INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
--('BUILDING_TRAFALGAR', 'YIELD_CULTURE', 2);

INSERT INTO Building_SpecificGreatPersonRateModifier (BuildingType, SpecialistType, Modifier) VALUES
('BUILDING_TRAFALGAR', 'SPECIALIST_CIVIL_SERVANT', 33);

INSERT INTO Building_YieldPerAlly (BuildingType, YieldType, Yield) VALUES
('BUILDING_TRAFALGAR', 'YIELD_CULTURE', 4),
('BUILDING_TRAFALGAR', 'YIELD_GOLDEN_AGE_POINTS', 2),
('BUILDING_TRAFALGAR', 'YIELD_SCIENCE', 4);

INSERT INTO Building_YieldPerFriend (BuildingType, YieldType, Yield) VALUES
('BUILDING_TRAFALGAR', 'YIELD_CULTURE', 2),
('BUILDING_TRAFALGAR', 'YIELD_GOLDEN_AGE_POINTS', 1),
('BUILDING_TRAFALGAR', 'YIELD_SCIENCE', 2);

INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) VALUES
('BUILDING_TRAFALGAR', 'FLAVOR_GROWTH', 30),
('BUILDING_TRAFALGAR', 'FLAVOR_CULTURE', 30),
('BUILDING_TRAFALGAR', 'FLAVOR_SCIENCE', 30);

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_BUILDING_TRAFALGAR',     'Trafalgar Square'),
('TXT_KEY_WONDER_TRAFALGAR_HELP',  '1 Free [COLOR_POSITIVE_TEXT]Social Policy[ENDCOLOR]. Receive an increase of +50% [ICON_INFLUENCE] Influence with all City-States in the world and an additional +1 [ICON_INTERNATIONAL_TRADE] Trade Route. The City receives +4 [ICON_TOURISM] Culture, +4 [ICON_RESEARCH] Science and +2 [ICON_GOLDEN_AGE] Golden Age Points from each Allied City-State and half of that from each Friendly one. +33% increased generation rate of [ICON_DIPLOMAT] Great Diplomats in the City.[NEWLINE]  Requires [COLOR_CYAN]Freedom[ENDCOLOR]. City must be built next to a [COLOR_CYAN]River[ENDCOLOR].'),
('TXT_KEY_WONDER_TRAFALGAR_QUOTE', '[NEWLINE]"Time is everything; five minutes make the difference between victory and defeat"[NEWLINE] - Lord Nelson[NEWLINE]'),
('TXT_KEY_WONDER_TRAFALGAR_PEDIA', 'Trafalgar Square is a public area located in the heart of the City of Westminster, in London, England. Redevelopment of the existing area, known as Charing Cross, began in 1820 under the guide of architect John Nash, who in turn was commisioned by King George IV, and was completed in 1845. The name commemorates the Battle of Trafalgar, a naval battle fought between England and Napoleonic France during the Napoleonic Wars. In the center of the square is Nelson''s column, a monument dedicate to Admiral Horatio Nelson, who died at the battle which was the square''s namesake. The column features four cast iron plates made from captured French guns, each depicting a famous battle in the Napoleonic Wars. The base of the column is guarded by four Lion statues.');


----------------------------------------------------
-- WHITESANDS - White Sands Missile Range
-- Grants 2 missiles in the city
-- All missiles get +2 Range
-- +25% when producing missiles and SS parts
----------------------------------------------------

-- TESTING
INSERT INTO UnitCombatInfos (Type, Description) VALUES ('UNITCOMBAT_MISSILE', 'TXT_KEY_UNITCOMBAT_MISSILE');
INSERT INTO Language_en_US (Tag, Text) VALUES ('TXT_KEY_UNITCOMBAT_MISSILE', 'Missiles');
UPDATE Units SET CombatClass = 'UNITCOMBAT_MISSILE' WHERE Type IN ('UNIT_GUIDED_MISSILE');

UPDATE Buildings
SET FreePromotion = 'PROMOTION_WHITESANDS', SpecialistType = 'SPECIALIST_SCIENTIST', GreatPeopleRateChange = 2, SpaceProductionModifier = 25
WHERE Type = 'BUILDING_WHITESANDS';

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_WHITESANDS', 'YIELD_SCIENCE', 3);

INSERT INTO Building_FreeUnits (BuildingType, UnitType, NumUnits) VALUES
('BUILDING_WHITESANDS', 'UNIT_GUIDED_MISSILE', 2);

INSERT INTO Building_UnitCombatProductionModifiers 	(BuildingType, UnitCombatType, Modifier) VALUES
('BUILDING_WHITESANDS', 'UNITCOMBAT_MISSILE', 50);

INSERT INTO UnitPromotions (Type, Description, Help, Sound, CannotBeChosen, RangeChange, PortraitIndex, IconAtlas, PediaType, PediaEntry) VALUES
('PROMOTION_WHITESANDS', 'TXT_KEY_PROMOTION_WHITESANDS', 'TXT_KEY_PROMOTION_WHITESANDS_HELP', 'AS2D_IF_LEVELUP', 1, 2, 34, 'PROMOTION_ATLAS', 'PEDIA_AIR', 'TXT_KEY_PROMOTION_WHITESANDS');

-- Cannot use this - Missiles don't have CombatClass!
INSERT INTO UnitPromotions_UnitCombats (PromotionType, UnitCombatType) VALUES
('PROMOTION_WHITESANDS', 'UNITCOMBAT_MISSILE');

INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) VALUES
('BUILDING_WHITESANDS', 'FLAVOR_OFFENSE', 50),
('BUILDING_WHITESANDS', 'FLAVOR_SCIENCE', 20),
('BUILDING_WHITESANDS', 'FLAVOR_SPACESHIP', 40);

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_BUILDING_WHITESANDS',     'White Sands Missile Range'),
('TXT_KEY_WONDER_WHITESANDS_HELP',  'Grants 2 free [COLOR_POSITIVE_TEXT]Guided Missiles[ENDCOLOR]. +25% [ICON_PRODUCTION] Production in this City when building Spaceship Parts and +50% [ICON_PRODUCTION] when building Missiles. Missile units get [COLOR_POSITIVE_TEXT]White Sands Tested[ENDCOLOR] promotion which extends +2 [ICON_RANGE_STRENGTH] Operational Range.[NEWLINE]  Requires completion of [COLOR_CYAN]Imperialism Branch[ENDCOLOR]. City must be built on or next to a [COLOR_CYAN]Desert[ENDCOLOR]. 1 [ICON_RES_OIL] [COLOR_CYAN]Oil[ENDCOLOR] is used to build the Missile Range.'),
('TXT_KEY_WONDER_WHITESANDS_QUOTE', '[NEWLINE]"What is pride? A rocket that emulates the stars"[NEWLINE] - William Wordsworth[NEWLINE]'),
('TXT_KEY_WONDER_WHITESANDS_PEDIA', 'The White Sands Missile Range is US largest military installation at almost 8300 square kilometres (3200 square miles) of New Mexico desert. The area was first designated a military site in 1941, when the Alamogordo Army Airfield was established. This site was used for the first Atomic bomb test (The Trinity test) in July 1945, by which time it had been renamed White Sands proving ground.[NEWLINE][NEWLINE]  Since then, the site has been heavily involved in experimental projects and test firings of both militaristic and exploratory projects, including captured V-2 ballistic missiles, the Apollo escape system and as a landing strip for the early Space Shuttle tests. It has been designated a National Historic Site for its role in Space Race testing, and continues to have frequent missile tests.'),
('TXT_KEY_PROMOTION_WHITESANDS',     'White Sands Tested'),
('TXT_KEY_PROMOTION_WHITESANDS_HELP',  '+2 [ICON_RANGE_STRENGTH] Operational Range');


----------------------------------------------------
-- WILLIS - Willis Tower
-- This city: +2 Production from lake tiles, +1 GMusP
-- Free Broadcast Tower and Great Musician
-- All Broadcast Towers +2 Gold
----------------------------------------------------

UPDATE Buildings
SET FreeBuildingThisCity = 'BUILDINGCLASS_BROADCAST_TOWER', SpecialistType = 'SPECIALIST_MUSICIAN', GreatPeopleRateChange = 1
WHERE Type = 'BUILDING_WILLIS';

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_WILLIS', 'YIELD_CULTURE', 3);

INSERT INTO Building_FreeUnits (BuildingType, UnitType, NumUnits) VALUES
('BUILDING_WILLIS', 'UNIT_MUSICIAN', 1);

INSERT INTO Building_BuildingClassYieldChanges (BuildingType, BuildingClassType, YieldType, YieldChange) VALUES
('BUILDING_WILLIS', 'BUILDINGCLASS_BROADCAST_TOWER', 'YIELD_GOLD', 2);

INSERT INTO Building_LakePlotYieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_WILLIS', 'YIELD_PRODUCTION', 2);

INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) VALUES
('BUILDING_WILLIS', 'FLAVOR_CULTURE', 15),
('BUILDING_WILLIS', 'FLAVOR_GOLD', 25),
('BUILDING_WILLIS', 'FLAVOR_PRODUCTION', 20);

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_BUILDING_WILLIS',     'Willis Tower'),
('TXT_KEY_WONDER_WILLIS_HELP',  'All Broadcast Towers +2 [ICON_GOLD] Gold. Grants a free [COLOR_POSITIVE_TEXT]Broadcast Tower[ENDCOLOR] and a [COLOR_POSITIVE_TEXT]Great Musician[ENDCOLOR]. +2 [ICON_PRODUCTION] Production from each Lake tile worked by the city.[NEWLINE][NEWLINE]Requires completion of [COLOR_CYAN]Industry Branch[ENDCOLOR]. City must be built near the [COLOR_CYAN]Lake[ENDCOLOR].'),
('TXT_KEY_WONDER_WILLIS_QUOTE', '[NEWLINE]"There is nothing more poetic and terrible than the skyscrapers'' battle with the heavens that cover them."[NEWLINE] - Federico Garcia Lorca[NEWLINE]'),
('TXT_KEY_WONDER_WILLIS_PEDIA', 'Willis Tower (formerly named as Sears Tower) is a 108-story, 1,451-foot (442 m) skyscraper in Chicago, Illinois. At the time of its completion in 1973, it was the tallest building in the world, surpassing the World Trade Center towers in New York, and it held this rank for nearly 25 years. Willis Tower is the second-tallest building in the United States and the eighth-tallest freestanding structure in the world. The skyscraper is one of the most popular tourist destinations in Chicago, and over one million people visit its observation deck each year. Named the Sears Tower throughout its history, in 2009 the Willis Group obtained the right to rename the building, as part of their lease on a portion of its offices. On July 16, 2009, the building was officially renamed Willis Tower.');



----------------------------------------------------
/* Flavors
FLAVOR_AIR
FLAVOR_AIRLIFT
FLAVOR_CITY_DEFENSE
FLAVOR_CULTURE
FLAVOR_DEFENSE
FLAVOR_DIPLOMACY
FLAVOR_ESPIONAGE
FLAVOR_EXPANSION
FLAVOR_GOLD
FLAVOR_GREAT_PEOPLE
FLAVOR_GROWTH
FLAVOR_HAPPINESS
FLAVOR_I_LAND_TRADE_ROUTE
FLAVOR_I_SEA_TRADE_ROUTE
FLAVOR_I_TRADE_DESTINATION
FLAVOR_I_TRADE_ORIGIN
FLAVOR_MILITARY_TRAINING
FLAVOR_MOBILE
FLAVOR_NAVAL
FLAVOR_NAVAL_GROWTH
FLAVOR_NAVAL_TILE_IMPROVEMENT
FLAVOR_OFFENSE
FLAVOR_PRODUCTION
FLAVOR_RANGED
FLAVOR_RELIGION
FLAVOR_SCIENCE
FLAVOR_SPACESHIP
FLAVOR_TILE_IMPROVEMENT
FLAVOR_WATER_CONNECTION
FLAVOR_WONDER
*/