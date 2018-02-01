----------------------------------------------------
-- Enlightenment Era (Vox Populi)
-- WONDERS
-- 2018-01-31 Reworked by Infixo from EE & VP-EE mods
----------------------------------------------------


--Topkapi Palace effect
/*
INSERT INTO Building_BuildingClassYieldChanges
		(BuildingType, 			BuildingClassType, 	YieldType, 		YieldChange)
SELECT 	'BUILDING_EE_TOPKAPI', 	BuildingClass,		'YIELD_FAITH', 	1
FROM Buildings WHERE Defense > 0 AND ExtraCityHitPoints > 0 AND WonderSplashImage IS NULL;
*/
/*
CREATE TRIGGER EE_Topkapi_BuildingClassYieldChanges
AFTER INSERT ON Buildings
WHEN NEW.Defense > 0 AND NEW.ExtraCityHitPoints > 0 AND NEW.WonderSplashImage IS NULL
BEGIN
	INSERT INTO Building_BuildingClassYieldChanges
			(BuildingType, 			BuildingClassType, 	YieldType, 			YieldChange)
	VALUES 	('BUILDING_EE_TOPKAPI', NEW.BuildingClass,	'YIELD_FAITH', 	1);
END;
*/
--Wat Phra Kaew effect
/*
INSERT INTO Building_BuildingClassYieldChanges
		(BuildingType, 					BuildingClassType, 	YieldType, 			YieldChange)
SELECT 	'BUILDING_EE_WAT_PHRA_KAEW', 	BuildingClass,		'YIELD_SCIENCE', 	2
FROM Buildings WHERE Cost = -1 AND FaithCost > 0 AND UnlockedByBelief = 1;
*/
/*
CREATE TRIGGER EE_WatPhraKawe_BuildingClassYieldChanges
AFTER INSERT ON Buildings
WHEN NEW.Cost = -1 AND NEW.FaithCost > 0 AND NEW.UnlockedByBelief = 1
BEGIN
	INSERT INTO Building_BuildingClassYieldChanges
			(BuildingType, 					BuildingClassType, 	YieldType, 			YieldChange)
	VALUES 	('BUILDING_EE_WAT_PHRA_KAEW', 	NEW.BuildingClass,	'YIELD_SCIENCE', 	2);
END;
*/
----------------------------------------------------
-- Generic info
----------------------------------------------------

-- World Wonders
/*
INSERT INTO BuildingClasses (Type, DefaultBuilding, Description, MaxGlobalInstances) VALUES
('BUILDINGCLASS_EE_FASIL_GHEBBI', 'BUILDING_EE_FASIL_GHEBBI', 'TXT_KEY_BUILDING_EE_FASIL_GHEBBI', 1),
('BUILDINGCLASS_EE_KRONBORG',     'BUILDING_EE_KRONBORG', 	  'TXT_KEY_BUILDING_EE_KRONBORG',     1),
('BUILDINGCLASS_EE_SMITHSONIAN',  'BUILDING_EE_SMITHSONIAN',  'TXT_KEY_BUILDING_EE_SMITHSONIAN',  1),
('BUILDINGCLASS_EE_TOPKAPI', 	  'BUILDING_EE_TOPKAPI', 	  'TXT_KEY_BUILDING_EE_TOPKAPI',      1),
('BUILDINGCLASS_EE_TORRE', 		  'BUILDING_EE_TORRE', 		  'TXT_KEY_BUILDING_EE_TORRE',        1),
('BUILDINGCLASS_EE_VERSAILLES',   'BUILDING_EE_VERSAILLES',	  'TXT_KEY_BUILDING_EE_VERSAILLES',   1),
('BUILDINGCLASS_EE_WAT_PHRA_KAEW','BUILDING_EE_WAT_PHRA_KAEW','TXT_KEY_BUILDING_EE_WAT_PHRA_KAEW',1);
*/

INSERT INTO Buildings (Type, PrereqTech, MaxStartEra, SpecialistType, GreatPeopleRateChange, PortraitIndex) VALUES
('BUILDING_EE_FASIL_GHEBBI', 'TECH_EE_FORTIFICATION','ERA_INDUSTRIAL',   'SPECIALIST_ENGINEER', 1, 6),
('BUILDING_EE_KRONBORG',     'TECH_EE_WARSHIPS',     'ERA_INDUSTRIAL',   'SPECIALIST_MERCHANT', 1, 2),
('BUILDING_EE_SMITHSONIAN',  'TECH_EE_ROMANTICISM',  'ERA_MODERN',       'SPECIALIST_SCIENTIST',1, 4),
('BUILDING_EE_TOPKAPI',      'TECH_EE_SOVEREIGNTY',  'ERA_ENLIGHTENMENT', NULL,                 0, 0),
('BUILDING_EE_TORRE',        'TECH_NAVIGATION',      'ERA_INDUSTRIAL',   'SPECIALIST_MERCHANT', 1, 1),
('BUILDING_EE_VERSAILLES',   'TECH_EE_SOVEREIGNTY',  'ERA_ENLIGHTENMENT', NULL,                 0, 7),
('BUILDING_EE_WAT_PHRA_KAEW','TECH_EE_HUMANISM',     'ERA_INDUSTRIAL',   'SPECIALIST_SCIENTIST',1, 5);

UPDATE Buildings
SET BuildingClass = 'BUILDINGCLASS_'||SUBSTR(Type,10), Description = 'TXT_KEY_'||Type, 
	Civilopedia = 'TXT_KEY_WONDER_'||SUBSTR(Type,10)||'_PEDIA', Quote = 'TXT_KEY_WONDER_'||SUBSTR(Type,10)||'_QUOTE', Help = 'TXT_KEY_WONDER_'||SUBSTR(Type,10)||'_HELP',
	NukeImmune = 1, HurryCostModifier = -5, MinAreaSize = -1, ConquestProb = 100, IconAtlas = 'ENLIGHTENMENT_WONDER_ATLAS',
	WonderSplashImage = SUBSTR(Type,10)||'_splash.dds', WonderSplashAnchor = 'L,B', WonderSplashAudio = 'AS2D_WONDER_SPEECH_'||SUBSTR(Type,10)
WHERE Type IN (
'BUILDING_EE_FASIL_GHEBBI',
'BUILDING_EE_KRONBORG',
'BUILDING_EE_SMITHSONIAN',
'BUILDING_EE_TOPKAPI',
'BUILDING_EE_TORRE',
'BUILDING_EE_VERSAILLES',
'BUILDING_EE_WAT_PHRA_KAEW');

INSERT INTO BuildingClasses (Type, DefaultBuilding, Description, MaxGlobalInstances)
SELECT 'BUILDINGCLASS_'||SUBSTR(Type,10), Type, 'TXT_KEY_'||Type, 1
FROM Buildings
WHERE Type IN (
'BUILDING_EE_FASIL_GHEBBI',
'BUILDING_EE_KRONBORG',
'BUILDING_EE_SMITHSONIAN',
'BUILDING_EE_TOPKAPI',
'BUILDING_EE_TORRE',
'BUILDING_EE_VERSAILLES',
'BUILDING_EE_WAT_PHRA_KAEW');

INSERT INTO Civilization_BuildingClassOverrides (CivilizationType, BuildingClassType) VALUES
('CIVILIZATION_MINOR', 'BUILDINGCLASS_EE_FASIL_GHEBBI'),
('CIVILIZATION_MINOR', 'BUILDINGCLASS_EE_KRONBORG'),
('CIVILIZATION_MINOR', 'BUILDINGCLASS_EE_SMITHSONIAN'),
('CIVILIZATION_MINOR', 'BUILDINGCLASS_EE_TOPKAPI'),
('CIVILIZATION_MINOR', 'BUILDINGCLASS_EE_TORRE'),
('CIVILIZATION_MINOR', 'BUILDINGCLASS_EE_VERSAILLES'),
('CIVILIZATION_MINOR', 'BUILDINGCLASS_EE_WAT_PHRA_KAEW'),
('CIVILIZATION_BARBARIAN', 'BUILDINGCLASS_EE_FASIL_GHEBBI'),
('CIVILIZATION_BARBARIAN', 'BUILDINGCLASS_EE_KRONBORG'),
('CIVILIZATION_BARBARIAN', 'BUILDINGCLASS_EE_SMITHSONIAN'),
('CIVILIZATION_BARBARIAN', 'BUILDINGCLASS_EE_TOPKAPI'),
('CIVILIZATION_BARBARIAN', 'BUILDINGCLASS_EE_TORRE'),
('CIVILIZATION_BARBARIAN', 'BUILDINGCLASS_EE_VERSAILLES'),
('CIVILIZATION_BARBARIAN', 'BUILDINGCLASS_EE_WAT_PHRA_KAEW'),

------------------------
-- Non-EE Wonders
------------------------

UPDATE Buildings SET PrereqTech = 'TECH_EE_ROMANTICISM' WHERE Type = 'BUILDING_HERMITAGE';
UPDATE Buildings SET PrereqTech = 'TECH_EE_HUMANISM' WHERE Type = 'BUILDING_UFFIZI';

UPDATE Buildings
SET FreeBuildingThisCity = 'BUILDINGCLASS_EE_BASTION' -- Bastion is closer than Arsenal
WHERE Type = 'BUILDING_RED_FORT';

------------------------
-- National Wonder: Tower of Buddhist Insence (aka Summer Palace)
------------------------

INSERT INTO Buildings
	(Type, BuildingClass, Description, Civilopedia, Strategy, Help,
	PrereqTech, NukeImmune, HurryCostModifier, MinAreaSize, IconAtlas, PortraitIndex, ArtDefineTag, FreeGreatPeople, NumCityCostMod, NeverCapture,
	MinorityHappinessChangeGlobal, NationalPopRequired, NumCityCostMod) -- Wonder unique features (Religious tension)
VALUES
	('BUILDING_EE_SUMMER_PALACE','BUILDINGCLASS_EE_SUMMER_PALACE','TXT_KEY_BUILDING_EE_SUMMER_PALACE','TXT_KEY_BUILDING_EE_SUMMER_PALACE_PEDIA','TXT_KEY_BUILDING_EE_SUMMER_PALACE_STRATEGY','TXT_KEY_BUILDING_EE_SUMMER_PALACE_HELP',
	'TECH_EE_SOVEREIGNTY', 1, -20, -1, 'ENLIGHTENMENT_WONDER_ATLAS', 8, 'ART_DEF_BUILDING_HERMITAGE', 1, 10, 1,
	-10, 35, 10);

INSERT INTO BuildingClasses (Type, DefaultBuilding, Description, MaxPlayerInstances) VALUES
('BUILDINGCLASS_EE_SUMMER_PALACE', 'BUILDING_EE_SUMMER_PALACE', 'TXT_KEY_BUILDING_EE_SUMMER_PALACE', 1);

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield)
VALUES ('BUILDING_EE_SUMMER_PALACE', 'YIELD_CULTURE', 2);

INSERT INTO Building_ClassesNeededInCity (BuildingType, BuildingClassType) VALUES
('BUILDING_EE_SUMMER_PALACE', 'BUILDINGCLASS_GARDEN'),
('BUILDING_EE_SUMMER_PALACE', 'BUILDINGCLASS_EE_MANOR');

------------------------
-- Fasil Ghebbi
------------------------
UPDATE Buildings
SET ExtraCityHitPoints = 100, Defense = 1000, CitySupplyFlat = 5
WHERE Type = 'BUILDING_EE_FASIL_GHEBBI';

-- Infixo: 33 was too strong, make it 25 but in wider range
--UPDATE UnitPromotions SET CombatPercent = 25 WHERE Type = 'PROMOTION_EE_FASIL_GHEBBI';

--DELETE FROM Building_YieldChanges
--WHERE BuildingType = 'BUILDING_EE_FASIL_GHEBBI';

------------------------
-- Kronborg
------------------------

-- Kronborg Dummy
INSERT INTO Buildings (Type, BuildingClass, Cost, Description, ArtDefineTag, MinAreaSize, IconAtlas, PortraitIndex, NeverCapture, GreatWorkCount, FaithCost, NukeImmune) VALUES
('BUILDING_EE_KRONBORG_DUMMY', 'BUILDINGCLASS_EE_KRONBORG_DUMMY', -1, 'TXT_KEY_EE_KRONBORG_DUMMY', 'NONE', -1, 'BW_ATLAS_1', 19, 1, -1, -1, 1);
INSERT INTO BuildingClasses (Type, DefaultBuilding, Description) VALUES
('BUILDINGCLASS_EE_KRONBORG_DUMMY','BUILDING_EE_KRONBORG_DUMMY','TXT_KEY_EE_KRONBORG_DUMMY');

UPDATE Buildings SET ExtraCityHitPoints = 0, Defense = 0, Water = 1, MinAreaSize = 10 WHERE Type = 'BUILDING_EE_KRONBORG';
UPDATE Buildings SET ExtraCityHitPoints = 50, Defense = 500, CitySupplyFlat = 1 WHERE Type = 'BUILDING_EE_KRONBORG_DUMMY';

INSERT INTO Building_UnitCombatProductionModifiers (BuildingType, UnitCombatType, Modifier) VALUES
('BUILDING_EE_KRONBORG', 'UNITCOMBAT_NAVALRANGED', 50),
('BUILDING_EE_KRONBORG', 'UNITCOMBAT_NAVALMELEE', 50),
('BUILDING_EE_KRONBORG', 'UNITCOMBAT_SUBMARINE', 50),
('BUILDING_EE_KRONBORG', 'UNITCOMBAT_CARRIER', 50);

INSERT INTO Building_FreeUnits (BuildingType, UnitType, NumUnits)
VALUES ('BUILDING_EE_KRONBORG', 'UNIT_GREAT_ADMIRAL', 1);

--DELETE FROM Building_YieldChanges
--WHERE BuildingType = 'BUILDING_EE_KRONBORG';

------------------------
-- Smithsonian
------------------------

UPDATE Buildings
SET FreeBuildingThisCity = 'BUILDINGCLASS_MUSEUM', IlliteracyHappinessChangeGlobal = -10, GreatWorkSlotType = 'GREAT_WORK_SLOT_ART_ARTIFACT', GreatWorkCount = 2, ThemingBonusHelp = 'TXT_KEY_EE_SMITHSONIAN_THEMING_BONUS_HELP'
WHERE Type = 'BUILDING_EE_SMITHSONIAN';

--DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_EE_SMITHSONIAN';
INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_EE_SMITHSONIAN', 'YIELD_SCIENCE', 5);

INSERT INTO Building_BuildingClassYieldChanges (BuildingType, BuildingClassType, YieldType, YieldChange) VALUES
('BUILDING_EE_SMITHSONIAN', 'BUILDINGCLASS_EE_GALLERY', 'YIELD_CULTURE', 1),
('BUILDING_EE_SMITHSONIAN', 'BUILDINGCLASS_MUSEUM', 'YIELD_CULTURE', 1);

INSERT INTO Building_ThemingBonuses (BuildingType, Description, Bonus, MustBeArtifact, RequiresUniquePlayers, AIPriority)
VALUES ('BUILDING_EE_SMITHSONIAN', 'TXT_KEY_THEMING_BONUS_EE_SMITHSONIAN', 3, 1, 1, 5);

INSERT INTO Building_ThemingYieldBonus (BuildingType, YieldType, Yield) VALUES
('BUILDING_EE_SMITHSONIAN', 'YIELD_SCIENCE', 3),
('BUILDING_EE_SMITHSONIAN', 'YIELD_GOLD', 3);

----------------------------------------------
-- Topkapi
-- Military buildings: Training ones (Barrack, Armory, etc.) and Defensive ones (Walls, Castle, etc.)
----------------------------------------------
-- disable trigger
/*
DROP TRIGGER EE_Topkapi_BuildingClassYieldChanges;
-- remove all old entries
DELETE FROM Building_BuildingClassYieldChanges
WHERE BuildingType = 'BUILDING_EE_TOPKAPI';
*/
-- insert fresh good entries - defensive buildings
INSERT INTO Building_BuildingClassYieldChanges
				(BuildingType, 			BuildingClassType, 	YieldType, 		YieldChange)
SELECT DISTINCT 'BUILDING_EE_TOPKAPI', 	BuildingClass,		'YIELD_FAITH', 	1
FROM Buildings WHERE Defense > 0 AND ExtraCityHitPoints > 0 AND (Cost > 0 OR FaithCost > 0) AND WonderSplashImage IS NULL;

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_EE_TOPKAPI', 'YIELD_CULTURE', 2);

-- fix: boosted a little +3G & +2T when Flight researched
UPDATE Buildings
SET EnhancedYieldTech = 'TECH_FLIGHT'
WHERE Type = 'BUILDING_EE_TOPKAPI';

INSERT INTO Building_TechEnhancedYieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_EE_TOPKAPI', 'YIELD_GOLD', 3),
('BUILDING_EE_TOPKAPI', 'YIELD_TOURISM', 2);

------------------------
-- Torre del Oro
------------------------

UPDATE Buildings
SET Water = 1, MinAreaSize = 10, TradeRouteSeaDistanceModifier = 50, TradeRouteRecipientBonus = 3, TradeRouteTargetBonus = 3, NumTradeRouteBonus = 1, FreeBuildingThisCity = 'BUILDINGCLASS_EE_DRYDOCK'
WHERE Type = 'BUILDING_EE_TORRE';
-- TradeRouteSeaGoldBonus = 200 -> +2 Gold
-- gives a free Harbor
-- TradeRouteRecipientBonus	-> incoming TR  // my gold from other TRs (ok)
-- TradeRouteTargetBonus	-> outgoing TR  // other TR owner gain (no) // other player's gain from mine TR outgoing to him

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_EE_TORRE', 'YIELD_CULTURE', 2);

--DELETE FROM Building_YieldChanges
--WHERE BuildingType = 'BUILDING_EE_TORRE' AND YieldType = 'YIELD_GOLD';

------------------------
-- Versailles
------------------------

INSERT INTO Building_FreeUnits (BuildingType, UnitType, NumUnits)
VALUES ('BUILDING_EE_VERSAILLES', 'UNIT_WRITER', 1);

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_EE_VERSAILLES', 'YIELD_CULTURE', 5);

----------------------------------------------
-- Wat Phra Kaew
----------------------------------------------

UPDATE Buildings SET River = 1 WHERE Type = 'BUILDING_EE_WAT_PHRA_KAEW';
-- disable trigger & remove all old entries
/*
DROP TRIGGER EE_WatPhraKawe_BuildingClassYieldChanges;
DELETE FROM Building_BuildingClassYieldChanges
WHERE BuildingType = 'BUILDING_EE_WAT_PHRA_KAEW';
*/
INSERT INTO Building_BuildingClassYieldChanges (BuildingType, BuildingClassType, YieldType, YieldChange) VALUES
('BUILDING_EE_WAT_PHRA_KAEW', 'BUILDINGCLASS_SHRINE', 'YIELD_SCIENCE', 1),
('BUILDING_EE_WAT_PHRA_KAEW', 'BUILDINGCLASS_TEMPLE', 'YIELD_SCIENCE', 2);
	
--DELETE FROM Building_YieldModifiers
--WHERE BuildingType = 'BUILDING_EE_WAT_PHRA_KAEW';
INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_EE_WAT_PHRA_KAEW', 'YIELD_SCIENCE', 5);

--UPDATE Building_YieldChanges
--SET Yield = 5
--WHERE BuildingType = 'BUILDING_EE_WAT_PHRA_KAEW' AND YieldType = 'YIELD_SCIENCE';


------------------------------------------------------------------------------------------------------------------------	
-- Wonder costs and requirements
------------------------------------------------------------------------------------------------------------------------	
-- Ren1: Chitzen Itza 12, Globe Theatre 11, Himeji 12, Leaning Tower 13
-- Ren2: Porcelain 11, Taj Mahal 12, Topkapi *13, Versailles *12, Sistine 11, Summer Palace 12, Red Fort 13
-- EE1: Uffizi 0, Wat Phra *14, Torre del Oro *14
-- EE2: Kronborg *15, Fasil *15
-- Ind1: Smithsonian*17, Neuschwanstein 16/18, Slater Mill 15/17, 
-- Ind2: Louvre 17/19, BigBen 0, Eiffel 17/19, Brandenburg Gate 0
-- Mod1: Statue of Liberty 20, Empire State Building 0, Motherland Calls 8, 
-- Infixo: new values as of VP907

UPDATE Buildings
SET NumPoliciesNeeded =  NumPoliciesNeeded + 1
WHERE NumPoliciesNeeded >= 14;

-- column 7 (REN1)

-- column 8 (REN2)
UPDATE Buildings SET Cost = 800, NumPoliciesNeeded = 11 WHERE Type = 'BUILDING_EE_TOPKAPI';
UPDATE Buildings SET Cost = 800, NumPoliciesNeeded = 10 WHERE Type = 'BUILDING_EE_VERSAILLES';

-- column 9 (EE1)
UPDATE Buildings SET Cost = 1000, NumPoliciesNeeded = 12 WHERE Type = 'BUILDING_EE_WAT_PHRA_KAEW';
UPDATE Buildings SET Cost = 1000, NumPoliciesNeeded = 12 WHERE Type = 'BUILDING_EE_TORRE';

-- column 10 (EE2)
UPDATE Buildings SET Cost = 1150, NumPoliciesNeeded = 13 WHERE Type = 'BUILDING_EE_KRONBORG';
UPDATE Buildings SET Cost = 1150, NumPoliciesNeeded = 13 WHERE Type = 'BUILDING_EE_FASIL_GHEBBI';

-- column 11 (IND1)
UPDATE Buildings SET Cost = 1400, NumPoliciesNeeded = 14 WHERE Type = 'BUILDING_EE_SMITHSONIAN';

-- column 12 (IND2)


------------------------
-- Flavors
------------------------

INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor)
SELECT Type, 'FLAVOR_WONDER', 30
FROM Buildings
WHERE Type IN (
'BUILDING_EE_FASIL_GHEBBI',
'BUILDING_EE_KRONBORG',
'BUILDING_EE_SMITHSONIAN',
'BUILDING_EE_TOPKAPI',
'BUILDING_EE_TORRE',
'BUILDING_EE_VERSAILLES',
'BUILDING_EE_WAT_PHRA_KAEW');

--DELETE FROM Building_Flavors WHERE BuildingType = 'BUILDING_EE_TORRE' AND FlavorType = 'FLAVOR_GREAT_PEOPLE'; -- now its Trade Route & Gold
--DELETE FROM Building_Flavors WHERE BuildingType = 'BUILDING_EE_TOPKAPI' AND FlavorType = 'FLAVOR_GOLD'; -- now its Faith
--DELETE FROM Building_Flavors WHERE BuildingType = 'BUILDING_EE_KRONBORG' AND FlavorType = 'FLAVOR_GOLD'; -- now its Defense & Naval

--UPDATE Building_Flavors SET Flavor = 25 WHERE BuildingType = 'BUILDING_EE_KRONBORG' AND FlavorType = 'FLAVOR_DEFENSE';

INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) VALUES
('BUILDING_EE_FASIL_GHEBBI', 'FLAVOR_WONDER', 25),
('BUILDING_EE_FASIL_GHEBBI', 'FLAVOR_DEFENSE', 25),
('BUILDING_EE_FASIL_GHEBBI', 'FLAVOR_CITY_DEFENSE', 30),
('BUILDING_EE_KRONBORG', 'FLAVOR_DEFENSE', 25),
('BUILDING_EE_KRONBORG', 'FLAVOR_CITY_DEFENSE', 15),
('BUILDING_EE_KRONBORG', 'FLAVOR_NAVAL', 40), -- production
('BUILDING_EE_KRONBORG', 'FLAVOR_GREAT_PEOPLE', 15), -- GA
('BUILDING_EE_SMITHSONIAN', 'FLAVOR_CULTURE', 30),
('BUILDING_EE_TOPKAPI', 'FLAVOR_RELIGION', 40), -- faith
('BUILDING_EE_TORRE', 'FLAVOR_GOLD', 30),
('BUILDING_EE_TORRE', 'FLAVOR_I_SEA_TRADE_ROUTE', 20), -- range
('BUILDING_EE_TORRE', 'FLAVOR_I_TRADE_DESTINATION', 20), -- gold
('BUILDING_EE_TORRE', 'FLAVOR_I_TRADE_ORIGIN', 20), -- gold
('BUILDING_EE_VERSAILLES', 'FLAVOR_CULTURE', 25),
('BUILDING_EE_VERSAILLES', 'FLAVOR_WONDER', 25),
('BUILDING_EE_VERSAILLES', 'FLAVOR_EXPANSION', 5),
('BUILDING_EE_VERSAILLES', 'FLAVOR_GREAT_PEOPLE', 15),
('BUILDING_EE_WAT_PHRA_KAEW', 'FLAVOR_SCIENCE', 25),
-- Tower of Buddhist Incense
('BUILDING_EE_SUMMER_PALACE', 'FLAVOR_WONDER', 25),
('BUILDING_EE_SUMMER_PALACE', 'FLAVOR_GREAT_PEOPLE', 15),
('BUILDING_EE_SUMMER_PALACE', 'FLAVOR_RELIGION', 15); -- religious unrest
