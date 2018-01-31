----------------------------------------------------
-- Enlightenment Era (Vox Populi)
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

-- World Wonders
INSERT INTO BuildingClasses (Type, DefaultBuilding, Description, MaxGlobalInstances) VALUES
('BUILDINGCLASS_EE_FASIL_GHEBBI', 'BUILDING_EE_FASIL_GHEBBI', 'TXT_KEY_BUILDING_EE_FASIL_GHEBBI', 1),
('BUILDINGCLASS_EE_KRONBORG',     'BUILDING_EE_KRONBORG', 	  'TXT_KEY_BUILDING_EE_KRONBORG',     1),
('BUILDINGCLASS_EE_SMITHSONIAN',  'BUILDING_EE_SMITHSONIAN',  'TXT_KEY_BUILDING_EE_SMITHSONIAN',  1),
('BUILDINGCLASS_EE_TOPKAPI', 	  'BUILDING_EE_TOPKAPI', 	  'TXT_KEY_BUILDING_EE_TOPKAPI',      1),
('BUILDINGCLASS_EE_TORRE', 		  'BUILDING_EE_TORRE', 		  'TXT_KEY_BUILDING_EE_TORRE',        1),
('BUILDINGCLASS_EE_VERSAILLES',   'BUILDING_EE_VERSAILLES',	  'TXT_KEY_BUILDING_EE_VERSAILLES',   1),
('BUILDINGCLASS_EE_WAT_PHRA_KAEW','BUILDING_EE_WAT_PHRA_KAEW','TXT_KEY_BUILDING_EE_WAT_PHRA_KAEW',1);

-- National Wonders
INSERT INTO BuildingClasses (Type, DefaultBuilding, Description, MaxPlayerInstances) VALUES
('BUILDINGCLASS_EE_SUMMER_PALACE', 'BUILDING_EE_SUMMER_PALACE', 'TXT_KEY_BUILDING_EE_SUMMER_PALACE', 1);
