----------------------------------------------------
-- Vox Populi Wonders Expanded
-- Automatic changes applied to all new Wonders
-- Author: Infixo
-- Dec 9, 2017: Created
----------------------------------------------------

--------------------------------------------------------------
-- Table with new Wonder Types and (maybe) parameters for buildings
--------------------------------------------------------------
CREATE TABLE VPWEConfig (
	WType	TEXT	NOT NULL,  	-- Wonder Type
	WActive	INTEGER	NOT NULL,   -- 1 = Wonder active / 0 = Wonder not active
	WFake	INTEGER	NOT NULL,   -- 1 = Fake texts / 0 = Real texts
--	PTech	TEXT,  				-- PrereqTech
--	PCivic	TEXT,  				-- PrereqCivic
--	PDist	TEXT	NOT NULL,  	-- PrereqDistrict
--	UMain	INTEGER NOT NULL DEFAULT 0, -- Maintenance
	PRIMARY KEY (WType)
);

--------------------------------------------------------------
-- CONFIGURATION
-- Use below table to DISABLE a specific Wonder
-- Change the 1st (FIRST) number to 0 (ZERO) to disable.
-- DO NOT CHANGE 2ND NUMBER!
-- Example:
-- ('BROOKLYN',    1, 0), -- Brooklyn is ENABLED
-- ('BROOKLYN',    0, 0), -- Brooklyn is DISABLED
--------------------------------------------------------------

INSERT INTO VPWEConfig (WType, WActive, WFake)
VALUES
--('ABUSIMBEL',   1, 1), -- Abu Simbel
--('ALAMO',       1, 1), -- Alamo
('ARECIBO',     1, 0), -- Arecibo Observatory
('ANITKABIR',   1, 0), -- Anitkabir Mausoleum
--('BAMIYAN',     1, 1), -- Buddhas of Bamiyan
--('BENHADDOU',   1, 1), -- Ait Benhaddou
('BROOKLYN',    1, 0), -- Brooklyn Bridge
('CHARTRES',    1, 0), -- Chartres Cathedral
('CHEVALIERS',  1, 0), -- Krak des Chevaliers
('DAMASCUS',    1, 0), -- Forge of Damascus
--('DUOMO',       1, 1), -- Cattedrale di Santa Maria del Fiore /  Il Duomo di Firenze
('GRIPSHOLM',   1, 0), -- Gripsholm Castle
('HOLLYWOOD',   1, 0), -- Hollywood
('ITSUKUSHIMA', 1, 0), -- Itsukushima Shrine
('JUMEIRAH',    1, 0), -- Palm Jumeirah
('KARNAK',      1, 0), -- Karnak Temple
('KINKAKUJI',   1, 0), -- Kinkaku-ji / Golden Pavilion
--('LEONARDO', 1, 1), -- Leonardo's Workshop
('MALWIYA',     1, 0), -- Malwiya Minaret (Great Mosque of Samarra)
--('MARINASANDS', 1, 1), -- Marina Bay Sands
--('METEORA', 1, 1), -- Monastery of the Holy Trinity (Meteora)
('MICHEL',      1, 0), -- Mont Saint Michel
('MILLAU',      1, 0), -- Millau Viaduct
('MONTECARLO',  1, 0), -- Monte Carlo Casino, The
('NABAWI',      1, 0), -- Al-Masjid an-Nabawi (Prophet's Mosque)
('NAZCA',       1, 0), -- Nazca Lines
--('PEARLTOWER', 1, 1), -- Oriental Pearl Radio & TV Tower
--('PETRONAS',    1, 1), -- The Petronas Towers
--('RUSHMORE',    1, 1), -- Mount Rushmore
('PANAMA',      1, 0), -- Panama Canal
('ROCKEFELLER', 1, 0), -- Rockefeller Center
--('SAGRADA',     1, 1), -- Sagrada Familia
('SHWEDAGON',   1, 0), -- Shwedagon Pagoda / Shwedagon Zedi Daw / Great Dagon Pagoda  / Golden Pagoda
--('SKYTREE',     1, 1), -- Tokyo Skytree
('SOVIETS',     1, 0), -- Palace of the Soviets
('SPUTNIK',     1, 0), -- Sputnik Program, The
('STPETERS',    1, 0), -- Papal Basilica of St. Peter in the Vatican
('TAIPEI101',   1, 0), -- Taipei 101
--('TOCALI',      1, 1), -- Templo Mayor / Huey Tocali
('TRAFALGAR',   1, 0), -- Trafalgar Square
--('WARTBURG',    1, 1), -- Wartburg Castle
('WHITESANDS',  1, 0), -- White Sands Missile Range
('WILLIS',      1, 0); -- Sears / Willis Tower

-- This will disable by default all Wonders not yet programmed
UPDATE VPWEConfig SET WActive = 0 WHERE WFake = 1;

-- BuildingClasses
INSERT INTO BuildingClasses (Type, Description, DefaultBuilding, MaxGlobalInstances)
SELECT 'BUILDINGCLASS_'||WType, 'TXT_KEY_BUILDING_'||WType, 'BUILDING_'||WType, 1
FROM VPWEConfig WHERE WActive = 1;

-- Buildings
-- MinAreaSize - change to 10 for Coastal Wonders!
-- Set Cost = -1 and later apply proper value for enabled buildings
-- GreatWorkCount defaults to 0, PrereqTech defaults to NULL
INSERT INTO Buildings
      (Type,               BuildingClass,           Description,                Civilopedia,                        Help,                               Quote,                             ThemingBonusHelp, Cost, FaithCost, NukeImmune, HurryCostModifier, MinAreaSize, ConquestProb, IconAtlas,            PortraitIndex, WonderSplashImage,             WonderSplashAnchor)
SELECT 'BUILDING_'||WType, 'BUILDINGCLASS_'||WType, 'TXT_KEY_BUILDING_'||WType, 'TXT_KEY_WONDER_'||WType||'_PEDIA', 'TXT_KEY_WONDER_'||WType||'_HELP', 'TXT_KEY_WONDER_'||WType||'_QUOTE', NULL,             1,    0,         1,          -5,                -1,          100,          'ATLAS_VPWE_'||WType, 0,             'VPWE_'||WType||'_splash.dds', 'R,T'
FROM VPWEConfig WHERE WActive = 1;

-- Panama Canal is already in the game
UPDATE Buildings
SET IconAtlas = 'BW_ATLAS_2', PortraitIndex = 25, WonderSplashImage = 'WonderConceptPanamaCanal.dds'
WHERE Type = 'BUILDING_PANAMA';

-- Also, for reasons, an icon for St. Peter's Basilica is available
UPDATE Buildings
SET IconAtlas = 'EXPANSION_SCEN_WONDER_ATLAS', PortraitIndex = 6
WHERE Type = 'BUILDING_STPETERS';

-- Civilization_BuildingClassOverrides
INSERT INTO Civilization_BuildingClassOverrides (CivilizationType, BuildingClassType, BuildingType)
SELECT 'CIVILIZATION_BARBARIAN', 'BUILDINGCLASS_'||WType, NULL FROM VPWEConfig;
INSERT INTO Civilization_BuildingClassOverrides (CivilizationType, BuildingClassType, BuildingType)
SELECT 'CIVILIZATION_MINOR', 'BUILDINGCLASS_'||WType, NULL FROM VPWEConfig;

-- Building_Flavors
-- Let's start with a default 20, can change later for specific Wonders
INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor)
SELECT 'BUILDING_'||WType, 'FLAVOR_WONDER', 20
FROM VPWEConfig;

-- IconTextureAtlases
INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn) SELECT 'ATLAS_VPWE_'||WType, 256, 'VPWE_'||WType||'_256.dds', '1', '1' FROM VPWEConfig;
INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn) SELECT 'ATLAS_VPWE_'||WType, 128, 'VPWE_'||WType||'_128.dds', '1', '1' FROM VPWEConfig;
INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn) SELECT 'ATLAS_VPWE_'||WType,  80, 'VPWE_'||WType||'_80.dds', '1', '1' FROM VPWEConfig;
INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn) SELECT 'ATLAS_VPWE_'||WType,  64, 'VPWE_'||WType||'_64.dds', '1', '1' FROM VPWEConfig;
INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn) SELECT 'ATLAS_VPWE_'||WType,  45, 'VPWE_'||WType||'_45.dds', '1', '1' FROM VPWEConfig;

-- Fake texts; if the real ones are created, set WFake to 0 (zero)
INSERT INTO Language_en_US (Tag, Text) SELECT 'TXT_KEY_BUILDING_'||WType,         'Wonder '||WType 					    FROM VPWEConfig WHERE WFake = 1;
INSERT INTO Language_en_US (Tag, Text) SELECT 'TXT_KEY_WONDER_'||WType||'_PEDIA', 'Civilopedia text for Wonder '||WType FROM VPWEConfig WHERE WFake = 1;
INSERT INTO Language_en_US (Tag, Text) SELECT 'TXT_KEY_WONDER_'||WType||'_HELP',  'Help text for Wonder '||WType 	    FROM VPWEConfig WHERE WFake = 1;
INSERT INTO Language_en_US (Tag, Text) SELECT 'TXT_KEY_WONDER_'||WType||'_QUOTE', '[NEWLINE]Quote for Wonder '||WType 	FROM VPWEConfig WHERE WFake = 1;


--------------------------------------------------------------
-- Dummy buildings
-- HolyCity doesn't need one because it is usually 1 city; 2nd religion and 2nd Holy City might allow for 2nd Wonder
--------------------------------------------------------------

INSERT INTO VPWEConfig (WType, WActive, WFake)
VALUES
('CHARTRES_DUMMY', 2, 0), -- For Chartres Cathedral
('CHEVALIERS_DUMMY', 2, 0); -- For Krak des Chevaliers

INSERT INTO BuildingClasses (Type, Description, DefaultBuilding)
SELECT 'BUILDINGCLASS_'||WType, 'TXT_KEY_BUILDING_'||WType, 'BUILDING_'||WType
FROM VPWEConfig WHERE WActive = 2;

INSERT INTO Buildings
      (Type,               BuildingClass,           Description,                PrereqTech, Cost, FaithCost, GreatWorkCount , NukeImmune, ConquestProb)
SELECT 'BUILDING_'||WType, 'BUILDINGCLASS_'||WType, 'TXT_KEY_BUILDING_'||WType, NULL,       -1,   -1,        -1,              1,          0
FROM VPWEConfig WHERE WActive = 2;

INSERT INTO Language_en_US (Tag, Text) SELECT 'TXT_KEY_BUILDING_'||WType, WType FROM VPWEConfig WHERE WActive = 2;
