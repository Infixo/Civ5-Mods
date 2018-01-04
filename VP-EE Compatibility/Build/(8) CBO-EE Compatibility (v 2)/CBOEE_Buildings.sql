------------------------------------------------------------------------------------------------------------------------	
-- Placement in tech tree
------------------------------------------------------------------------------------------------------------------------	

-- CP disabled, duplicated with Crystal Palace from CSD
UPDATE BuildingClasses SET MaxGlobalInstances = 0, MaxTeamInstances = 0, MaxPlayerInstances = 0 WHERE Type = 'BUILDINGCLASS_EE_CRYSTAL_PALACE';
UPDATE Buildings SET Cost = -1, GreatWorkCount = -1, PrereqTech = NULL WHERE Type = 'BUILDING_EE_CRYSTAL_PALACE';

UPDATE Buildings SET PrereqTech = 'TECH_NAVIGATION' WHERE Type = 'BUILDING_EE_TORRE';
UPDATE Buildings SET PrereqTech = 'TECH_EE_MANUFACTURING' WHERE Type = 'BUILDING_EE_WEIGH_HOUSE';
UPDATE Buildings SET PrereqTech = 'TECH_EE_ROMANTICISM' WHERE Type = 'BUILDING_MUSEUM';
UPDATE Buildings SET PrereqTech = 'TECH_EE_ROMANTICISM' WHERE Type = 'BUILDING_EE_SMITHSONIAN';
UPDATE Buildings SET PrereqTech = 'TECH_EE_ROMANTICISM' WHERE Type = 'BUILDING_HERMITAGE';
UPDATE Buildings SET PrereqTech = 'TECH_EE_WARSHIPS' WHERE Type = 'BUILDING_EE_DRYDOCK';
UPDATE Buildings SET PrereqTech = 'TECH_EE_HUMANISM' WHERE Type = 'BUILDING_UFFIZI';
UPDATE Buildings SET PrereqTech = 'TECH_RIFLING' WHERE Type = 'BUILDING_ARSENAL';

------------------------------------------------------------------------------------------------------------------------	
-- Infixo: Building costs
-- CLA: 150/200, ? faith, 1 maint
-- MED: 300/350, 250 faith, 2 maint
-- REN: 500/600, 300 faith, 3 maint
-- ENL: 700/800, 350 faith, 3 maint
-- IND: 900/1000, 400 faith, 4 maint
------------------------------------------------------------------------------------------------------------------------	

-- column 6
UPDATE Buildings SET Cost = 300, GoldMaintenance = 1 WHERE Type = 'BUILDING_EE_TAVERN';

-- column 7
UPDATE Buildings SET Cost = 500, GoldMaintenance = 2 WHERE Type = 'BUILDING_THEATRE';

-- column 8
UPDATE Buildings SET Cost = 600, GoldMaintenance = 2 WHERE Type = 'BUILDING_EE_MANOR';
UPDATE Buildings SET Cost = 600, GoldMaintenance = 2 WHERE Type = 'BUILDING_EE_GALLERY';
UPDATE Buildings SET Cost = 800 WHERE Type = 'BUILDING_GRIPSHOLM';
UPDATE Buildings SET Cost = 800 WHERE Type = 'BUILDING_EE_TOPKAPI';
UPDATE Buildings SET Cost = 800 WHERE Type = 'BUILDING_EE_VERSAILLES';

-- column 9
UPDATE Buildings SET Cost = 700, GoldMaintenance = 2 WHERE Type = 'BUILDING_EE_SALON';
UPDATE Buildings SET Cost = 700, GoldMaintenance = 2 WHERE Type = 'BUILDING_EE_ACADEMY';
UPDATE Buildings SET Cost = 700, GoldMaintenance = 2 WHERE Type = 'BUILDING_EE_GUNSMITH';
UPDATE Buildings SET Cost = 900 WHERE Type = 'BUILDING_EE_WAT_PHRA_KAEW';
UPDATE Buildings SET Cost = 900 WHERE Type = 'BUILDING_EE_TORRE';

-- column 10
UPDATE Buildings SET Cost = 800, GoldMaintenance = 2 WHERE Type = 'BUILDING_EE_WEIGH_HOUSE';
UPDATE Buildings SET Cost = 800, GoldMaintenance = 3 WHERE Type = 'BUILDING_EE_CLOTH_MILL';
UPDATE Buildings SET Cost = 800, GoldMaintenance = 3 WHERE Type = 'BUILDING_EE_DRYDOCK';
UPDATE Buildings SET Cost = 800, GoldMaintenance = 3 WHERE Type = 'BUILDING_EE_BASTION';
UPDATE Buildings SET Cost = 1000 WHERE Type = 'BUILDING_EE_KRONBORG';
UPDATE Buildings SET Cost = 1000 WHERE Type = 'BUILDING_EE_FASIL_GHEBBI';

-- column 11
UPDATE Buildings SET Cost = 900, GoldMaintenance = 4 WHERE Type = 'BUILDING_EE_MENAGERIE';
UPDATE Buildings SET Cost = 1100 WHERE Type = 'BUILDING_EE_CRYSTAL_PALACE';
UPDATE Buildings SET Cost = 1100 WHERE Type = 'BUILDING_EE_SMITHSONIAN';
UPDATE Buildings SET Cost = 900 WHERE Type = 'BUILDING_MUSEUM'; -- precaution, same as VP

-- column 12
UPDATE Buildings SET Cost = 900 WHERE Type = 'BUILDING_ARSENAL'; -- precaution, same as VP


----------------------------------------------
-- Museum & Gallery change
----------------------------------------------

DELETE FROM Building_BuildingClassYieldChanges WHERE BuildingType = 'BUILDING_MUSEUM';
INSERT INTO Building_BuildingClassYieldChanges (BuildingType, BuildingClassType, YieldType, YieldChange)
VALUES ('BUILDING_EE_GALLERY', 'BUILDINGCLASS_ARTISTS_GUILD', 'YIELD_GOLD', 1);
	
-- Gallery: +10% Artists
INSERT INTO Building_SpecificGreatPersonRateModifier (BuildingType, SpecialistType, Modifier)
VALUES ('BUILDING_EE_GALLERY', 'SPECIALIST_ARTIST', 10);

UPDATE Building_YieldChanges SET Yield = 2 WHERE BuildingType = 'BUILDING_EE_GALLERY'; -- culture

UPDATE Buildings
SET Help = 'TXT_KEY_BUILDING_EE_GALLERY_HELP'
WHERE Type = 'BUILDING_EE_GALLERY';

-- Gallery: +1 cul/6 pop
INSERT INTO Building_YieldChangesPerPop (BuildingType, YieldType, Yield)
VALUES ('BUILDING_EE_GALLERY', 'YIELD_CULTURE', 17);

-- Museum: +20% Artists (for balance)
UPDATE Building_SpecificGreatPersonRateModifier
SET Modifier = 20
WHERE BuildingType = 'BUILDING_MUSEUM' AND SpecialistType = 'SPECIALIST_ARTIST';

UPDATE Building_ThemingYieldBonus
SET Yield = 5
WHERE BuildingType = 'BUILDING_MUSEUM';

-- Infixo: Gallery needed for Museum
DELETE FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_MUSEUM';
DELETE FROM Building_ClassesNeededInCityOR WHERE BuildingType = 'BUILDING_MUSEUM';
INSERT INTO Building_ClassesNeededInCity (BuildingType, BuildingClassType)
VALUES ('BUILDING_MUSEUM', 'BUILDINGCLASS_EE_GALLERY');

----------------------------------------------
-- Infixo: Get back Zoo & align with Menagerie
----------------------------------------------

UPDATE Building_ClassesNeededInCity SET BuildingClassType = 'BUILDINGCLASS_CIRCUS' WHERE BuildingType = 'BUILDING_THEATRE';
UPDATE Building_ClassesNeededInCity SET BuildingClassType = 'BUILDINGCLASS_THEATRE' WHERE BuildingType = 'BUILDING_EE_MENAGERIE';

UPDATE Buildings
SET Happiness = 0, PrereqTech = 'TECH_PRINTING_PRESS', UnculturedHappinessChange = '-30', GreatWorkSlotType = NULL, GreatWorkCount = 0, IconAtlas = 'EXPANSION2_BUILDING_ATLAS2', PortraitIndex = 0
WHERE Type = 'BUILDING_THEATRE';

UPDATE Buildings 
SET Help = 'TXT_KEY_BUILDING_THEATRE_HELP'
WHERE Type = 'BUILDING_THEATRE';

UPDATE Buildings
SET SpecialistType = 'SPECIALIST_SCIENTIST', SpecialistCount = '1', Happiness = '0', UnculturedHappinessChange = '-30'
WHERE Type = 'BUILDING_EE_MENAGERIE';

DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_THEATRE';
INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield)
VALUES
	('BUILDING_EE_MENAGERIE', 'YIELD_SCIENCE', 3),
	('BUILDING_EE_MENAGERIE', 'YIELD_CULTURE', 2),
	('BUILDING_THEATRE', 'YIELD_CULTURE', 2);

----------------------------------------------
-- Coffee House
----------------------------------------------

UPDATE Buildings
SET BuildingClass = 'BUILDINGCLASS_GROCER', PrereqTech = 'TECH_CHEMISTRY', GoldMaintenance = 3, CultureRateModifier = 0, SpecialistCount = 1
WHERE Type = 'BUILDING_COFFEE_HOUSE';

UPDATE Building_YieldChanges
SET Yield = '3', YieldType = 'YIELD_FOOD'
WHERE BuildingType = 'BUILDING_COFFEE_HOUSE';

UPDATE Buildings
SET PovertyHappinessChange = '-20'
WHERE Type = 'BUILDING_COFFEE_HOUSE';

UPDATE Building_Flavors
SET FlavorType = 'FLAVOR_GROWTH'
WHERE BuildingType = 'BUILDING_COFFEE_HOUSE';


UPDATE Buildings
SET IconAtlas = 'COMMUNITY_ATLAS', PortraitIndex = 20
WHERE Type = 'BUILDING_MOMA';

UPDATE Buildings
SET IconAtlas = 'EECBO_ICON_ATLAS', PortraitIndex = 0
WHERE Type = 'BUILDING_MAUSOLEUM';

----------------------------------------------
-- Academy, Salon and Weigh House
-- Science: Palace 1/3, Public School 1/2, Skola 1/1
-- Culture: Gallery 1/6, Museum 1/4, BrTow 1/5
-- Gold: PaperMaker 1/4, StockExch 1/2
----------------------------------------------

-- remove yield % changes
DELETE FROM Building_YieldModifiers
WHERE BuildingType IN ('BUILDING_EE_ACADEMY', 'BUILDING_EE_WEIGH_HOUSE');
-- culture is stored in different place
UPDATE Buildings SET CultureRateModifier = 0 WHERE Type = 'BUILDING_EE_SALON';

UPDATE Building_YieldChanges SET Yield = 2 WHERE BuildingType = 'BUILDING_EE_ACADEMY'; -- science
UPDATE Building_YieldChanges SET Yield = 2 WHERE BuildingType = 'BUILDING_EE_SALON'; -- culture
UPDATE Building_YieldChanges SET Yield = 3 WHERE BuildingType = 'BUILDING_EE_WEIGH_HOUSE';

INSERT INTO Building_YieldChangesPerPop (BuildingType, YieldType, Yield)
VALUES
	('BUILDING_EE_ACADEMY', 'YIELD_SCIENCE', 20), -- 1/5 pop
	('BUILDING_EE_SALON', 'YIELD_CULTURE', 17),  -- 1/6 pop
	('BUILDING_EE_WEIGH_HOUSE', 'YIELD_GOLD', 25);  -- 1/4 pop

UPDATE Buildings
SET SpecialistType = 'SPECIALIST_MERCHANT' , SpecialistCount = 1 
WHERE Type = 'BUILDING_EE_WEIGH_HOUSE';

----------------------------------------------
-- Defensive buildings
-- Bastion needs more since it's far from Castle
-- Lower other defensive buildings for balance
----------------------------------------------

UPDATE Buildings SET Defense = 1500, ExtraCityHitPoints = 150 WHERE Type = 'BUILDING_EE_BASTION';
UPDATE Buildings SET Defense = 1000, ExtraCityHitPoints = 100 WHERE Type = 'BUILDING_ARSENAL';
UPDATE Buildings SET Defense = 2000, ExtraCityHitPoints = 150 WHERE Type = 'BUILDING_MILITARY_BASE';

----------------------------------------------
-- Tavern
----------------------------------------------
UPDATE Buildings
SET Happiness = 0, UnculturedHappinessChange = '-10'
WHERE Type = 'BUILDING_EE_TAVERN';

INSERT INTO Building_BuildingClassLocalYieldChanges
	(BuildingType, BuildingClassType, YieldType, YieldChange)
VALUES
	('BUILDING_EE_TAVERN', 'BUILDINGCLASS_MARKET', 'YIELD_SCIENCE', 1),
	('BUILDING_EE_TAVERN', 'BUILDINGCLASS_CARAVANSARY', 'YIELD_SCIENCE', 1),
	('BUILDING_EE_TAVERN', 'BUILDINGCLASS_HARBOR', 'YIELD_SCIENCE', 1),
	('BUILDING_EE_TAVERN', 'BUILDINGCLASS_MINT', 'YIELD_SCIENCE', 1),
	('BUILDING_EE_TAVERN', 'BUILDINGCLASS_LIGHTHOUSE', 'YIELD_SCIENCE', 1);
	
INSERT INTO Building_ResourceYieldChanges
	(BuildingType, ResourceType, YieldType, Yield)
VALUES
	('BUILDING_EE_TAVERN', 'RESOURCE_WHEAT', 'YIELD_FOOD', 1);

----------------------------------------------
-- Gunsmith, Manor, Drydock
----------------------------------------------
UPDATE Building_UnitCombatProductionModifiers SET Modifier = 20 WHERE BuildingType = 'BUILDING_EE_GUNSMITH';
INSERT INTO Building_UnitCombatFreeExperiences (BuildingType, UnitCombatType, Experience) VALUES ('BUILDING_EE_GUNSMITH', 'UNITCOMBAT_GUN', 15);

UPDATE Buildings
SET GreatPeopleRateModifier = 15
WHERE Type = 'BUILDING_EE_MANOR';

UPDATE Building_ClassesNeededInCity SET BuildingClassType = 'BUILDINGCLASS_HARBOR' WHERE BuildingType = 'BUILDING_EE_DRYDOCK';
UPDATE Buildings SET SpecialistType = 'SPECIALIST_ENGINEER' , SpecialistCount = 1 WHERE Type = 'BUILDING_EE_DRYDOCK';

----------------------------------------------
-- Infixo BUILDING_EE_WAT_PHRA_KAEW clean-up
----------------------------------------------
-- disable trigger
DROP TRIGGER EE_WatPhraKawe_BuildingClassYieldChanges;
-- remove all old entries
DELETE FROM Building_BuildingClassYieldChanges
WHERE BuildingType = 'BUILDING_EE_WAT_PHRA_KAEW';
-- insert fresh good entries - building one can normally build
INSERT INTO Building_BuildingClassYieldChanges
				(BuildingType, 					BuildingClassType, 	YieldType, 			YieldChange)
SELECT DISTINCT 'BUILDING_EE_WAT_PHRA_KAEW', 	BuildingClass,		'YIELD_SCIENCE', 	2
FROM Buildings
WHERE BuildingClass IN ('BUILDINGCLASS_SHRINE', 'BUILDINGCLASS_TEMPLE');
-- insert fresh good entries - unlockable via policies
INSERT INTO Building_BuildingClassYieldChanges
		(BuildingType, 					BuildingClassType, 	YieldType, 			YieldChange)
SELECT 	'BUILDING_EE_WAT_PHRA_KAEW', 	BuildingClass,		'YIELD_SCIENCE', 	2
FROM Buildings WHERE Cost = -1 AND FaithCost > 0 AND UnlockedByBelief = 1;

----------------------------------------------
-- Infixo BUILDING_EE_TOPKAPI clean-up
-- Military buildings: Training ones (Barrack, Armory, etc.) and Defensive ones (Walls, Castle, etc.)
----------------------------------------------
-- disable trigger
DROP TRIGGER EE_Topkapi_BuildingClassYieldChanges;
-- remove all old entries
DELETE FROM Building_BuildingClassYieldChanges
WHERE BuildingType = 'BUILDING_EE_TOPKAPI';
-- insert fresh good entries - defensive buildings
INSERT INTO Building_BuildingClassYieldChanges
				(BuildingType, 			BuildingClassType, 	YieldType, 		YieldChange)
SELECT DISTINCT 'BUILDING_EE_TOPKAPI', 	BuildingClass,		'YIELD_FAITH', 	1
FROM Buildings WHERE Defense > 0 AND ExtraCityHitPoints > 0 AND (Cost > 0 OR FaithCost > 0) AND WonderSplashImage IS NULL;

------------------------
-- Flavors
------------------------
INSERT INTO Building_Flavors
		(BuildingType, FlavorType, Flavor)
VALUES	('BUILDING_EE_VERSAILLES', 'FLAVOR_CULTURE', 25),
		('BUILDING_EE_VERSAILLES', 'FLAVOR_WONDER', 25),
		('BUILDING_EE_SUMMER_PALACE', 'FLAVOR_WONDER', 25),
		('BUILDING_EE_SUMMER_PALACE', 'FLAVOR_GREAT_PEOPLE', 15),
		('BUILDING_EE_FASIL_GHEBBI', 'FLAVOR_WONDER', 25),
		('BUILDING_EE_FASIL_GHEBBI', 'FLAVOR_DEFENSE', 25);
		
UPDATE Building_Flavors
SET Flavor = 25
WHERE BuildingType = 'BUILDING_EE_KRONBORG' AND FlavorType = 'FLAVOR_DEFENSE';

------------------------
-- Wonders
------------------------

DELETE FROM Building_YieldModifiers
WHERE BuildingType = 'BUILDING_EE_WAT_PHRA_KAEW';

UPDATE Buildings
SET FreeBuildingThisCity = 'BUILDINGCLASS_EE_ACADEMY'
WHERE Type IN ('BUILDING_EE_SMITHSONIAN');

UPDATE Buildings
SET HurryCostModifier = -5
WHERE Type = 'BUILDING_GRIPSHOLM';

------------------------
-- Versailles
------------------------
UPDATE Buildings
SET GreatPeopleRateChange = 0, GoldenAge = 1
WHERE Type = 'BUILDING_EE_VERSAILLES';

INSERT INTO Building_FreeUnits (BuildingType, UnitType, NumUnits)
VALUES ('BUILDING_EE_VERSAILLES', 'UNIT_WRITER', 1);

------------------------
-- Fasil Ghebbi
------------------------
UPDATE Buildings
SET ExtraCityHitPoints = 100, Defense = 1000
WHERE Type = 'BUILDING_EE_FASIL_GHEBBI';

-- Infixo: 33 was too strong, make it 25 but in wider range
UPDATE UnitPromotions SET CombatPercent = 25 WHERE Type = 'PROMOTION_EE_FASIL_GHEBBI';

------------------------
-- Kronborg
------------------------
UPDATE Building_UnitCombatProductionModifiers
SET Modifier = 50
WHERE BuildingType = 'BUILDING_EE_KRONBORG';

UPDATE Buildings SET ExtraCityHitPoints = 0, Defense = 0 WHERE Type = 'BUILDING_EE_KRONBORG';
UPDATE Buildings SET ExtraCityHitPoints = 50, Defense = 500 WHERE Type = 'BUILDING_EE_KRONBORG_DUMMY';

INSERT INTO Building_FreeUnits (BuildingType, UnitType, NumUnits)
VALUES ('BUILDING_EE_KRONBORG', 'UNIT_GREAT_ADMIRAL', 1);

DELETE FROM Building_YieldChanges
WHERE BuildingType = 'BUILDING_EE_KRONBORG';

------------------------
-- Torre del Oro
------------------------
UPDATE Buildings
SET TradeRouteSeaDistanceModifier = 50, TradeRouteRecipientBonus = 3, TradeRouteTargetBonus = 3, NumTradeRouteBonus = 1
WHERE Type = 'BUILDING_EE_TORRE';

DELETE FROM Building_YieldChanges
WHERE BuildingType = 'BUILDING_EE_TORRE' AND YieldType = 'YIELD_GOLD';

------------------------
-- Tower of Buddhist Insence (aka Summer Palace)
------------------------
UPDATE Buildings
SET MinorityHappinessChangeGlobal = '-10'
WHERE Type = 'BUILDING_EE_SUMMER_PALACE';

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield)
VALUES ('BUILDING_EE_SUMMER_PALACE', 'YIELD_CULTURE', 2);

------------------------
-- Wonder Requirements
------------------------
UPDATE Buildings
SET NumPoliciesNeeded =  NumPoliciesNeeded + 2
WHERE NumPoliciesNeeded >= 15;

-- Ren1: Chitzen Itza 12, Globe Theatre 11, Himeji 12, Leaning Tower 13
-- Ren2: Porcelain 11, Taj Mahal 12, Gripsholm *12, Topkapi *13, Versailles *12, Sistine 11, Summer Palace 12, Red Fort 13
-- EE1: Uffizi 0, Wat Phra *14, Torre del Oro *14
-- EE2: Kronborg *15, Fasil *15
-- Ind1: Smithsonian*17, Neuschwanstein 16/18, Slater Mill 15/17, 
-- Ind2: Louvre 17/19, BigBen 0, Eiffel 17/19, Brandenburg Gate 0
-- Mod1: Statue of Liberty 20, Empire State Building 0, Motherland Calls 8, 

UPDATE Buildings SET NumPoliciesNeeded = '12' WHERE Type IN ('BUILDING_GRIPSHOLM', 'BUILDING_EE_VERSAILLES');
UPDATE Buildings SET NumPoliciesNeeded = '13' WHERE Type IN ('BUILDING_EE_TOPKAPI');
UPDATE Buildings SET NumPoliciesNeeded = '14' WHERE Type IN ('BUILDING_EE_WAT_PHRA_KAEW', 'BUILDING_EE_TORRE');
UPDATE Buildings SET NumPoliciesNeeded = '15' WHERE Type IN ('BUILDING_EE_FASIL_GHEBBI', 'BUILDING_EE_KRONBORG');
UPDATE Buildings SET NumPoliciesNeeded = '17' WHERE Type IN ('BUILDING_EE_SMITHSONIAN', 'BUILDING_EE_CRYSTAL_PALACE');

-- Tower of Buddhist Incense
UPDATE Buildings
SET NationalPopRequired = '38', NumCityCostMod = '10'
WHERE Type = 'BUILDING_EE_SUMMER_PALACE';

DELETE FROM Building_PrereqBuildingClasses
WHERE BuildingType = 'BUILDING_EE_SUMMER_PALACE'; 
