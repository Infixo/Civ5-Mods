----------------------------------------------------
-- Enlightenment Era (Vox Populi)
-- UNITS
-- 2018-02-01 Reworked by Infixo from EE & VP-EE mods
----------------------------------------------------

----------------------------------------------------
-- Generic info
-- UNIT_EE_EXPLORER is Adventurer
-- UNIT_EE_SKIRMISHER is Light Infantry
----------------------------------------------------

INSERT INTO Units (Type, PrereqTech, Combat, Moves, RequiresFaithPurchaseEnabled, ObsoleteTech, CombatClass, Domain, DefaultUnitAI, AdvancedStartCost, UnitFlagIconOffset, PortraitIndex, GoodyHutUpgradeUnitClass) VALUES
('UNIT_EE_EXPLORER',       'TECH_EE_EXPLORATION',  23, 3, 1,'TECH_STEAM_POWER',    'UNITCOMBAT_RECON',      'DOMAIN_LAND','UNITAI_EXPLORE',     10, 6, 6,'UNITCLASS_ZEPPELIN'),
('UNIT_EE_FIELD_GUN',      'TECH_EE_FLINTLOCK',    17, 2, 1,'TECH_RIFLING',        'UNITCOMBAT_SIEGE',      'DOMAIN_LAND','UNITAI_CITY_BOMBARD',30, 4, 4,'UNITCLASS_FIELD_GUN'),
('UNIT_EE_LINE_INFANTRY',  'TECH_EE_FLINTLOCK',    30, 2, 1,'TECH_RIFLING',        'UNITCOMBAT_GUN',        'DOMAIN_LAND','UNITAI_DEFENSE',     30, 1, 1,'UNITCLASS_RIFLEMAN'),
('UNIT_EE_SKIRMISHER',     'TECH_EE_FORTIFICATION',21, 2, 1,'TECH_DYNAMITE',       'UNITCOMBAT_ARCHER',     'DOMAIN_LAND','UNITAI_RANGED',      30, 2, 2,'UNITCLASS_GATLINGGUN'),
('UNIT_EE_UHLAN',          'TECH_RIFLING',         40, 4, 1,'TECH_COMBUSTION',     'UNITCOMBAT_MOUNTED',    'DOMAIN_LAND','UNITAI_FAST_ATTACK', 30, 3, 3,'UNITCLASS_WWI_TANK'),
('UNIT_EE_CARRACK',        'TECH_ASTRONOMY',       30, 5, 0,'TECH_NAVIGATION',     'UNITCOMBAT_NAVALMELEE', 'DOMAIN_SEA', 'UNITAI_EXPLORE_SEA', 50, 9,19,'UNITCLASS_PRIVATEER'),
('UNIT_EE_GALLEON',        'TECH_EE_EXPLORATION',  16, 4, 0,'TECH_EE_WARSHIPS',    'UNITCOMBAT_NAVALRANGED','DOMAIN_SEA', 'UNITAI_ASSAULT_SEA', 50, 5, 5,'UNITCLASS_FRIGATE'),
('UNIT_EE_SHIP_OF_THE_LINE','TECH_EE_WARSHIPS',    40, 5, 0,'TECH_INDUSTRIALIZATION','UNITCOMBAT_NAVALMELEE','DOMAIN_SEA','UNITAI_ASSAULT_SEA', 50, 8, 9,'UNITCLASS_IRONCLAD');

UPDATE Units
SET Class = 'UNITCLASS_'||SUBSTR(Type,6), Description = 'TXT_KEY_'||Type,
	Civilopedia = 'TXT_KEY_'||Type||'_PEDIA', Strategy = 'TXT_KEY_'||Type||'_STRATEGY', Help = 'TXT_KEY_'||Type||'_HELP',
	MilitarySupport = 1, Pillage = 1, MilitaryProduction = 1, XPValueAttack = 3, XPValueDefense = 3,
	UnitArtInfo = 'ART_DEF_'||Type, UnitFlagAtlas = 'ENLIGHTENMENT_UNIT_FLAG_ATLAS', IconAtlas = 'ENLIGHTENMENT_UNIT_ATLAS'
WHERE Type IN (
'UNIT_EE_EXPLORER',
'UNIT_EE_FIELD_GUN',
'UNIT_EE_LINE_INFANTRY',
'UNIT_EE_SKIRMISHER',
'UNIT_EE_UHLAN',
'UNIT_EE_CARRACK',
'UNIT_EE_GALLEON',
'UNIT_EE_SHIP_OF_THE_LINE');

-- Exceptions
UPDATE Units SET Civilopedia = 'TXT_KEY_CIVILOPEDIA_UNITS_RENAISSANCE_SHIPOFTHELINE_TEXT' WHERE Type = 'UNIT_EE_SHIP_OF_THE_LINE';
UPDATE Units SET UnitArtInfo = 'ART_DEF_UNIT_U_SPANISH_GALLEON' WHERE Type = 'UNIT_EE_GALLEON';
UPDATE Units SET IconAtlas   = 'UNIT_ATLAS_2' WHERE Type = 'UNIT_EE_CARRACK' OR Type = 'UNIT_EE_SHIP_OF_THE_LINE';

-- Ships
UPDATE Units
SET MoveRate = 'WOODEN_BOAT', HurryCostModifier = 20, Mechanized = 1, MinAreaSize = 10
WHERE Type IN (
'UNIT_EE_CARRACK',
'UNIT_EE_GALLEON',
'UNIT_EE_SHIP_OF_THE_LINE');

INSERT INTO UnitClasses (Type, DefaultUnit, Description)
SELECT 'UNITCLASS_'||SUBSTR(Type,6), Type, 'TXT_KEY_'||Type
FROM Units
WHERE Type IN (
'UNIT_EE_EXPLORER',
'UNIT_EE_FIELD_GUN',
'UNIT_EE_LINE_INFANTRY',
'UNIT_EE_SKIRMISHER',
'UNIT_EE_UHLAN',
'UNIT_EE_CARRACK',
'UNIT_EE_GALLEON',
'UNIT_EE_SHIP_OF_THE_LINE');

----------------------------------------------------
-- Unit Lines - auto based on GoodyHutUpgradeUnitClass
----------------------------------------------------

INSERT INTO Unit_ClassUpgrades (UnitType, UnitClassType)
SELECT Type, GoodyHutUpgradeUnitClass
FROM Units
WHERE Type IN (
'UNIT_EE_EXPLORER',
'UNIT_EE_FIELD_GUN',
'UNIT_EE_LINE_INFANTRY',
'UNIT_EE_SKIRMISHER',
'UNIT_EE_UHLAN',
'UNIT_EE_CARRACK',
'UNIT_EE_GALLEON',
'UNIT_EE_SHIP_OF_THE_LINE');

----------------------------------------------------
-- Unit AI
----------------------------------------------------

INSERT INTO Unit_AITypes (UnitType, UnitAIType) VALUES
('UNIT_EE_EXPLORER', 'UNITAI_EXPLORE'),
('UNIT_EE_FIELD_GUN', 'UNITAI_CITY_BOMBARD'),
('UNIT_EE_FIELD_GUN', 'UNITAI_RANGED'),
('UNIT_EE_LINE_INFANTRY', 'UNITAI_ATTACK'),
('UNIT_EE_LINE_INFANTRY', 'UNITAI_DEFENSE'),
('UNIT_EE_LINE_INFANTRY', 'UNITAI_EXPLORE'),
('UNIT_EE_SKIRMISHER', 'UNITAI_RANGED'),
('UNIT_EE_UHLAN', 'UNITAI_DEFENSE'),
('UNIT_EE_UHLAN', 'UNITAI_FAST_ATTACK'),
('UNIT_EE_CARRACK', 'UNITAI_ATTACK_SEA'),
('UNIT_EE_CARRACK', 'UNITAI_RESERVE_SEA'),
('UNIT_EE_CARRACK', 'UNITAI_ESCORT_SEA'),
('UNIT_EE_CARRACK', 'UNITAI_EXPLORE_SEA'),
--('UNIT_EE_GALLEON', 'UNITAI_ATTACK_SEA'),
--('UNIT_EE_GALLEON', 'UNITAI_RESERVE_SEA'),
--('UNIT_EE_GALLEON', 'UNITAI_ESCORT_SEA'),
--('UNIT_EE_GALLEON', 'UNITAI_EXPLORE_SEA'),
('UNIT_EE_GALLEON', 'UNITAI_ASSAULT_SEA'),
('UNIT_EE_GALLEON', 'UNITAI_RESERVE_SEA'),
('UNIT_EE_GALLEON', 'UNITAI_ESCORT_SEA'),
('UNIT_EE_SHIP_OF_THE_LINE', 'UNITAI_ASSAULT_SEA'),
('UNIT_EE_SHIP_OF_THE_LINE', 'UNITAI_RESERVE_SEA'),
('UNIT_EE_SHIP_OF_THE_LINE', 'UNITAI_ESCORT_SEA');

-------------------------------------------------------
-- Spanish Galleon Model Tweaks
-------------------------------------------------------

UPDATE ArtDefine_UnitInfoMemberInfos SET NumMembers = 1 WHERE UnitInfoType = 'ART_DEF_UNIT_U_SPANISH_GALLEON';
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.16 WHERE Type = 'ART_DEF_UNIT_MEMBER_U_SPANISH_GALLEON';

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
VALUES ('ART_DEF_UNIT_U_SPANISH_GALLEON', 'Unit', 'sv_Galleon.dds');

-------------------------------------------------------
-- Adventurer (UNIT_EE_EXPLORER, upgrade from Explorer)
-------------------------------------------------------

UPDATE Units
SET ObsoleteTech = 'TECH_STEAM_POWER', BaseSightRange = 3, NoBadGoodies = 1
WHERE Type = 'UNIT_EE_EXPLORER';

--UPDATE Units
--SET NoBadGoodies = 1
--WHERE Type = 'UNITCLASS_EE_EXPLORER';

UPDATE Units
SET ObsoleteTech = 'TECH_COMPASS'
WHERE Type = 'UNIT_SCOUT';

UPDATE Units
SET ObsoleteTech = 'TECH_EE_EXPLORATION', GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_EXPLORER' 
WHERE Type = 'UNIT_EXPLORER';

INSERT INTO Unit_FreePromotions (UnitType, PromotionType) VALUES
('UNIT_EE_EXPLORER', 'PROMOTION_BARBARIAN_PENALTY_III'),
('UNIT_EE_EXPLORER', 'PROMOTION_DEFENSIVE_EMBARKATION'),
('UNIT_EE_EXPLORER', 'PROMOTION_EE_EXPLORER'), -- what is it?
('UNIT_EE_EXPLORER', 'PROMOTION_EMBARKED_SIGHT'),
('UNIT_EE_EXPLORER', 'PROMOTION_IGNORE_TERRAIN_COST'),
('UNIT_EE_EXPLORER', 'PROMOTION_RECON_EXPERIENCE'),
('UNIT_EE_EXPLORER', 'PROMOTION_SCOUT_GOODY_BONUS'),
('UNIT_EE_EXPLORER', 'PROMOTION_SCOUTING_1');

-- Infixo: Scout -> Explorer
--UPDATE Unit_ClassUpgrades
--SET UnitClassType = 'UNITCLASS_EXPLORER'
--WHERE UnitType IN (SELECT Type FROM Units WHERE Class = 'UNITCLASS_SCOUT');

-- Explorer -> Adventurer
UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_EE_EXPLORER' -- Adventurer
WHERE UnitType IN (SELECT Type FROM Units WHERE Class = 'UNITCLASS_EXPLORER');

-- Adventurer -> Zeppelin
--INSERT INTO Unit_ClassUpgrades (UnitType, UnitClassType)
--VALUES ('UNIT_EE_EXPLORER', 'UNITCLASS_ZEPPELIN');

-------------------------------------------------------
-- Heavy Skirmisher upgrade
-------------------------------------------------------
--UPDATE Units
--SET ObsoleteTech = 'TECH_METALLURGY', GoodyHutUpgradeUnitClass = 'UNITCLASS_CUIRASSIER' 
--WHERE Class = 'UNITCLASS_MOUNTED_BOWMAN';

--UPDATE Unit_ClassUpgrades
--SET UnitClassType = 'UNITCLASS_CUIRASSIER'
--WHERE UnitType IN (SELECT Type FROM Units WHERE Class = 'UNITCLASS_MOUNTED_BOWMAN');

-------------------------------------------------------
-- Knight upgrade (revert to original CBO)
-------------------------------------------------------
--UPDATE Units
--SET ObsoleteTech = 'TECH_EE_EXPLORATION', GoodyHutUpgradeUnitClass = 'UNITCLASS_LANCER' 
--WHERE Class = 'UNITCLASS_KNIGHT';

--UPDATE Unit_ClassUpgrades
--SET UnitClassType = 'UNITCLASS_LANCER'
--WHERE UnitType IN (SELECT Type FROM Units WHERE Class = 'UNITCLASS_KNIGHT');

-------------------------------------------------------
-- Tercio upgrade
-------------------------------------------------------
UPDATE Units
SET ObsoleteTech = 'TECH_EE_FLINTLOCK', GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_LINE_INFANTRY' 
WHERE Class = 'UNITCLASS_TERCIO';

UPDATE Units
SET ObsoleteTech = 'TECH_REPLACEABLE_PARTS', GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_LINE_INFANTRY'
WHERE Type = 'UNIT_FRENCH_MUSKETEER';

UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_EE_LINE_INFANTRY'
WHERE UnitType IN (SELECT Type FROM Units WHERE Class = 'UNITCLASS_TERCIO' AND Type != 'UNIT_FRENCH_MUSKETEER');

-- Swedish Carolean
UPDATE Civilization_UnitClassOverrides SET UnitClassType = 'UNITCLASS_EE_LINE_INFANTRY' WHERE  UnitType = 'UNIT_SWEDISH_CAROLEAN';

UPDATE Units
SET Class = 'UNITCLASS_EE_LINE_INFANTRY', PrereqTech = 'TECH_EE_FLINTLOCK', ObsoleteTech = 'TECH_RIFLING', GoodyHutUpgradeUnitClass = 'UNITCLASS_RIFLEMAN' -- Cost, FaithCost, RequiresFaithPurchaseEnabled
WHERE Type = 'UNIT_SWEDISH_CAROLEAN';

-------------------------------------------------------
-- Russian Cossack
-- The most popular weapons used by Cossack cavalrymen were usually sabres and long spears.
-- move Cossack into Enlightenment and make it melee
-------------------------------------------------------

UPDATE Civilization_UnitClassOverrides Set UnitClassType = 'UNITCLASS_EE_UHLAN' WHERE UnitType = 'UNIT_RUSSIAN_COSSACK';

UPDATE Units
SET Class = 'UNITCLASS_EE_UHLAN', CombatClass = 'UNITCOMBAT_MOUNTED', GoodyHutUpgradeUnitClass = 'UNITCLASS_WWI_TANK',
	Range = 0, RangedCombat = 0, Combat = 45, DefaultUnitAI = 'UNITAI_FAST_ATTACK',
	PrereqTech = 'TECH_RIFLING', ObsoleteTech = 'TECH_COMBINED_ARMS'
WHERE Type = 'UNIT_RUSSIAN_COSSACK';

UPDATE Unit_ClassUpgrades SET UnitClassType = 'UNITCLASS_WWI_TANK' WHERE UnitType = 'UNIT_RUSSIAN_COSSACK';

DELETE From Unit_FreePromotions WHERE UnitType = 'UNIT_RUSSIAN_COSSACK' AND PromotionType = 'PROMOTION_ESPRIT_DE_CORPS';
DELETE From Unit_FreePromotions WHERE UnitType = 'UNIT_RUSSIAN_COSSACK' AND PromotionType = 'PROMOTION_NAVAL_MISFIRE';
DELETE From Unit_FreePromotions WHERE UnitType = 'UNIT_RUSSIAN_COSSACK' AND PromotionType = 'PROMOTION_ONLY_DEFENSIVE';

-- Infixo: resambles original CBO Cossack
INSERT INTO Unit_FreePromotions (UnitType, PromotionType) SELECT 'UNIT_RUSSIAN_COSSACK' , 'PROMOTION_FORMATION_1';
INSERT INTO Unit_FreePromotions (UnitType, PromotionType) SELECT 'UNIT_RUSSIAN_COSSACK' , 'PROMOTION_HEAVY_CHARGE';

-- Infixo: AI same as Knight and Lancer
DELETE FROM Unit_AITypes WHERE UnitType = 'UNIT_RUSSIAN_COSSACK';
INSERT INTO Unit_AITypes (UnitType, UnitAIType) VALUES
('UNIT_RUSSIAN_COSSACK', 'UNITAI_FAST_ATTACK'),
('UNIT_RUSSIAN_COSSACK', 'UNITAI_DEFENSE');

-------------------------------------------------------
-- Uhlan (upgrade from Lancer)
-------------------------------------------------------

UPDATE Units
SET IgnoreBuildingDefense = 1, MoveRate = 'QUADRUPED', BaseLandAirDefense = 2
WHERE Type = 'UNIT_EE_UHLAN';

-- Uhlan -> Landship
--INSERT INTO Unit_ClassUpgrades (UnitType, UnitClassType)
--VALUES ('UNIT_EE_UHLAN', 'UNITCLASS_WWI_TANK');

-- Lancer -> Uhlan
UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_EE_UHLAN'
WHERE UnitType IN (SELECT Type FROM Units WHERE Class = 'UNITCLASS_LANCER');

INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType)
VALUES ('UNIT_EE_UHLAN', 'RESOURCE_HORSE');

UPDATE Units SET ObsoleteTech = 'TECH_RIFLING', GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_UHLAN' 
WHERE Type = 'UNIT_LANCER';

--UPDATE Unit_ClassUpgrades
--SET UnitClassType = 'UNITCLASS_WWI_TANK'
--WHERE UnitType IN (SELECT Type FROM Units WHERE Class = 'UNITCLASS_EE_UHLAN');

INSERT INTO Unit_FreePromotions (UnitType, PromotionType) VALUES
('UNIT_EE_UHLAN', 'PROMOTION_NO_DEFENSIVE_BONUSES'),
('UNIT_EE_UHLAN', 'PROMOTION_CAN_MOVE_AFTER_ATTACKING'),
('UNIT_EE_UHLAN', 'PROMOTION_CITY_PENALTY'),
('UNIT_EE_UHLAN', 'PROMOTION_FORMATION_1');

-------------------------------------------------------
-- Ottoman Sipahi & Polish Winged Hussar
-- Sipahi were two types of Ottoman cavalry corps
-- The Polish Hussars or Winged Hussars, were one of the main types of the cavalry in the Polish-Lithuanian Commonwealth between the 16th and 18th centuries
-------------------------------------------------------
UPDATE Units
SET ObsoleteTech = 'TECH_COMBUSTION'
WHERE Type IN ('UNIT_OTTOMAN_SIPAHI', 'UNIT_POLISH_WINGED_HUSSAR');

UPDATE Units
SET PrereqTech = 'TECH_EE_EXPLORATION'
WHERE Type = 'UNIT_POLISH_WINGED_HUSSAR';

-------------------------------------------------------
-- Spanish Conquistador
-------------------------------------------------------
UPDATE Units
SET Class = 'UNITCLASS_LANCER', PrereqTech = 'TECH_EE_EXPLORATION', ObsoleteTech = 'TECH_COMBUSTION', GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_UHLAN', Combat = 35, Range = 0
WHERE Type = 'UNIT_SPANISH_CONQUISTADOR';

UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_EE_UHLAN'
WHERE UnitType = 'UNIT_SPANISH_CONQUISTADOR';

UPDATE Civilization_UnitClassOverrides 
Set UnitClassType = 'UNITCLASS_LANCER' WHERE UnitType = 'UNIT_SPANISH_CONQUISTADOR';

DELETE FROM Unit_AITypes WHERE UnitType = 'UNIT_SPANISH_CONQUISTADOR' AND UnitAIType = 'UNITAI_ATTACK';

-------------------------------------------------------
-- Light Infantry (upgrade from Musketman)
-------------------------------------------------------

UPDATE Units
SET RangedCombat = 35, Range = 2
WHERE Type = 'UNIT_EE_SKIRMISHER';

-- Light Infantry -> Gatling Gun
--INSERT INTO Unit_ClassUpgrades (UnitType, UnitClassType)
--VALUES ('UNIT_EE_SKIRMISHER', 'UNITCLASS_GATLINGGUN');

-- Infixo: proper upgrade for Musketman and Civs' uniques
UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_EE_SKIRMISHER'
WHERE UnitType IN (SELECT Type FROM Units WHERE Class = 'UNITCLASS_MUSKETMAN');

UPDATE Units SET ObsoleteTech = 'TECH_EE_FORTIFICATION', GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_SKIRMISHER' WHERE Type = 'UNIT_MUSKETMAN';

INSERT INTO Unit_FreePromotions (UnitType, PromotionType) VALUES
('UNIT_EE_SKIRMISHER', 'PROMOTION_CBOEE_SKIRMISH'),
('UNIT_EE_SKIRMISHER', 'PROMOTION_NAVAL_MISFIRE'),
('UNIT_EE_SKIRMISHER', 'PROMOTION_ONLY_DEFENSIVE');

-- move Gatling Gun a bit further; each Archery will be in 2nd column of an era
UPDATE Units SET PrereqTech = 'TECH_DYNAMITE' WHERE Type = 'UNIT_GATLINGGUN';

-------------------------------------------------------
-- Line Infantry
-------------------------------------------------------

UPDATE Units
SET IgnoreBuildingDefense = 1, Conscription = 5
WHERE Type = 'UNIT_EE_LINE_INFANTRY';

-- Line Infantry -> Rifleman
--INSERT INTO Unit_ClassUpgrades (UnitType, UnitClassType)
--VALUES ('UNIT_EE_LINE_INFANTRY', 'UNITCLASS_RIFLEMAN');

INSERT INTO Unit_FreePromotions	(UnitType, PromotionType)
VALUES ('UNIT_EE_LINE_INFANTRY', 'PROMOTION_ANTI_MOUNTED_I');

--UPDATE Units
--SET Class = 'UNITCLASS_EE_LINE_INFANTRY', PrereqTech = 'TECH_EE_FLINTLOCK', GoodyHutUpgradeUnitClass = 'UNITCLASS_RIFLEMAN', ObsoleteTech = 'TECH_RIFLING' -- Combat, Cost, FaithCost
--WHERE Type = 'UNIT_DANISH_SKI_INFANTRY';

-------------------------------------------------------
-- American Minuteman
-------------------------------------------------------
UPDATE Civilization_UnitClassOverrides Set UnitClassType = 'UNITCLASS_EE_LINE_INFANTRY' WHERE UnitType = 'UNIT_AMERICAN_MINUTEMAN';

UPDATE Units 
SET Class = 'UNITCLASS_EE_LINE_INFANTRY', CombatClass = 'UNITCOMBAT_GUN', GoodyHutUpgradeUnitClass = 'UNITCLASS_RIFLEMAN',
	Combat = 30, Range = 0, RangedCombat = 0, 
	PrereqTech = 'TECH_EE_FLINTLOCK', ObsoleteTech = 'TECH_REPLACEABLE_PARTS', DefaultUnitAI = 'UNITAI_DEFENSE'
WHERE Type = 'UNIT_AMERICAN_MINUTEMAN';

UPDATE Unit_ClassUpgrades SET UnitClassType = 'UNITCLASS_RIFLEMAN' WHERE UnitType = 'UNIT_AMERICAN_MINUTEMAN';

DELETE FROM Unit_AITypes WHERE UnitType = 'UNIT_AMERICAN_MINUTEMAN';
INSERT INTO Unit_AITypes (UnitType, UnitAIType) VALUES
('UNIT_AMERICAN_MINUTEMAN', 'UNITAI_EXPLORE'),
('UNIT_AMERICAN_MINUTEMAN', 'UNITAI_ATTACK'),
('UNIT_AMERICAN_MINUTEMAN', 'UNITAI_DEFENSE');

DELETE From Unit_FreePromotions WHERE UnitType = 'UNIT_AMERICAN_MINUTEMAN' AND PromotionType = 'PROMOTION_NAVAL_MISFIRE';
DELETE From Unit_FreePromotions WHERE UnitType = 'UNIT_AMERICAN_MINUTEMAN' AND PromotionType = 'PROMOTION_ONLY_DEFENSIVE';
DELETE From Unit_FreePromotions WHERE UnitType = 'UNIT_AMERICAN_MINUTEMAN' AND PromotionType = 'PROMOTION_BARRAGE_1';
INSERT INTO Unit_FreePromotions (UnitType, PromotionType) SELECT 'UNIT_AMERICAN_MINUTEMAN', 'PROMOTION_DRILL_1';

-- Polynesian UA
INSERT INTO Trait_BuildsUnitClasses	(TraitType, UnitClassType, BuildType)
VALUES
	('TRAIT_WAYFINDING', 'UNITCLASS_EE_CARRACK', 'BUILD_FISHING_BOATS'),
	('TRAIT_WAYFINDING', 'UNITCLASS_EE_SHIP_OF_THE_LINE', 'BUILD_FISHING_BOATS');

-------------------------------------------------------
-- Field Gun and Howitzer
-------------------------------------------------------

UPDATE Units
SET RangedCombat = 35, Range = 2, IgnoreBuildingDefense = 1, MoveRate = 'ARTILLERY'
WHERE Type = 'UNIT_EE_FIELD_GUN';

INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType, Cost)
VALUES ('UNIT_EE_FIELD_GUN', 'RESOURCE_IRON', 1);

UPDATE UnitClasses
SET Description = 'TXT_KEY_UNIT_FIELD_GUN'
WHERE Type = 'UNITCLASS_FIELD_GUN';

UPDATE Units
SET Description = 'TXT_KEY_UNIT_FIELD_GUN', Civilopedia = 'TXT_KEY_UNIT_FIELD_GUN_PEDIA', Strategy = 'TXT_KEY_UNIT_FIELD_GUN_STRATEGY', Help = 'TXT_KEY_UNIT_FIELD_GUN_HELP'
WHERE Type = 'UNIT_FIELD_GUN';

-- Cannon -> Field Gun
UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_EE_FIELD_GUN'
WHERE UnitType IN (SELECT Type FROM Units WHERE Class = 'UNITCLASS_CANNON');

UPDATE Units
SET ObsoleteTech = 'TECH_EE_FLINTLOCK', GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_FIELD_GUN'
WHERE Type = 'UNIT_CANNON';

-- Field Gun -> Howitzer
--UPDATE Unit_ClassUpgrades
--SET UnitClassType = 'UNITCLASS_FIELD_GUN'
--WHERE UnitType IN (SELECT Type FROM Units WHERE Class = 'UNITCLASS_EE_FIELD_GUN');
--INSERT INTO Unit_ClassUpgrades (UnitType, UnitClassType)
--VALUES ('UNIT_EE_FIELD_GUN', 'UNITCLASS_FIELD_GUN');

INSERT INTO Unit_FreePromotions (UnitType, PromotionType) VALUES
('UNIT_EE_FIELD_GUN', 'PROMOTION_CITY_SIEGE'),
('UNIT_EE_FIELD_GUN', 'PROMOTION_COVER_1'),
('UNIT_EE_FIELD_GUN', 'PROMOTION_INDIRECT_FIRE'),
('UNIT_EE_FIELD_GUN', 'PROMOTION_MUST_SET_UP'),
('UNIT_EE_FIELD_GUN', 'PROMOTION_NAVAL_MISFIRE'),
('UNIT_EE_FIELD_GUN', 'PROMOTION_NO_DEFENSIVE_BONUSES'),
('UNIT_EE_FIELD_GUN', 'PROMOTION_ONLY_DEFENSIVE'),
('UNIT_EE_FIELD_GUN', 'PROMOTION_SIEGE_INACCURACY'),
('UNIT_EE_FIELD_GUN', 'PROMOTION_SIGHT_PENALTY');

-------------------------------------------------------
-- Carrack, Portuguese Nau
-------------------------------------------------------

-- Infixo: changed back, in Renaissance all ships could travel through ocean
--DELETE FROM Unit_FreePromotions WHERE UnitType IN ('UNIT_EE_CARRACK') AND PromotionType = 'PROMOTION_OCEAN_IMPASSABLE';

--UPDATE Units 
-- Infixo: tweaked parameters to be aligned with other Renaissance naval units
--SET PrereqTech = 'TECH_ASTRONOMY', ObsoleteTech = 'TECH_NAVIGATION', Combat = 30, Moves = 5, GoodyHutUpgradeUnitClass = 'UNITCLASS_PRIVATEER' -- Corvette
--WHERE Type = 'UNIT_EE_CARRACK';

-- Carrack -> Corvette
--UPDATE Unit_ClassUpgrades
--SET UnitClassType = 'UNITCLASS_PRIVATEER'
--WHERE UnitType = 'UNIT_EE_CARRACK';
--INSERT INTO Unit_ClassUpgrades (UnitType, UnitClassType)
--VALUES ('UNIT_EE_CARRACK', 'UNITCLASS_PRIVATEER');

-- Trireme changes (obsolete?)
--UPDATE Units
--SET GoodyHutUpgradeUnitClass = 'UNITCLASS_CARAVEL' 
--WHERE Class = 'UNITCLASS_TRIREME';

--UPDATE Unit_ClassUpgrades
--SET UnitClassType = 'UNITCLASS_CARAVEL'
--WHERE UnitType IN (SELECT Type FROM Units WHERE Class = 'UNITCLASS_TRIREME');

-- Caravel changes (->Carrack)
UPDATE Units
SET ObsoleteTech = 'TECH_ASTRONOMY', GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_CARRACK', Combat = 24
WHERE Type = 'UNIT_CARAVEL';

UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_EE_CARRACK'
WHERE UnitType = 'UNIT_CARAVEL';

-- Portuguese Nau
UPDATE Civilization_UnitClassOverrides SET UnitClassType='UNITCLASS_EE_CARRACK' WHERE UnitType='UNIT_PORTUGUESE_NAU';

UPDATE Units 
SET PrereqTech = 'TECH_ASTRONOMY', GoodyHutUpgradeUnitClass = 'UNITCLASS_PRIVATEER', Combat = 32, Moves = 5, ObsoleteTech = 'TECH_EE_WARSHIPS', Class = 'UNITCLASS_EE_CARRACK'
WHERE Type = 'UNIT_PORTUGUESE_NAU';

UPDATE Unit_ClassUpgrades SET UnitClassType = 'UNITCLASS_PRIVATEER' WHERE UnitType = 'UNIT_PORTUGUESE_NAU';

-- Other melee ships
UPDATE Units SET PrereqTech = 'TECH_EE_EXPLORATION' WHERE Type = 'UNIT_DUTCH_SEA_BEGGAR';

UPDATE Units SET GoodyHutUpgradeUnitClass = 'UNITCLASS_IRONCLAD' WHERE Type = 'UNIT_PRIVATEER'; -- Corvette

-------------------------------------------------------
-- English UU - classic CBP SotL
-------------------------------------------------------
UPDATE Units
SET PrereqTech = 'TECH_NAVIGATION', ObsoleteTech = 'TECH_DYNAMITE', GoodyHutUpgradeUnitClass = 'UNITCLASS_CRUISER', Civilopedia = 'TXT_KEY_UNIT_EE_ENGLISH_FIRST_RATE_PEDIA',
	Combat = 24, RangedCombat = 34, ShowInPedia = 1,
	IconAtlas = 'ENLIGHTENMENT_UNIT_ATLAS', PortraitIndex = 8
WHERE Type = 'UNIT_ENGLISH_SHIPOFTHELINE';

UPDATE Civilization_UnitClassOverrides
SET UnitClassType = 'UNITCLASS_FRIGATE', UnitType = 'UNIT_ENGLISH_SHIPOFTHELINE'
WHERE CivilizationType = 'CIVILIZATION_ENGLAND' AND UnitClassType = 'UNITCLASS_EE_SHIP_OF_THE_LINE';

INSERT INTO Unit_FreePromotions (UnitType, PromotionType)
VALUES ('UNIT_ENGLISH_SHIPOFTHELINE', 'PROMOTION_EE_FIRST_RATE');
	
-------------------------------------------------------
-- Galleon, Frigate and ranged ships
-------------------------------------------------------

UPDATE Units
SET RangedCombat = 26, Range = 1
WHERE Type = 'UNIT_EE_GALLEON';

-- Galleon -> Frigate
--UPDATE Unit_ClassUpgrades
--SET UnitClassType = 'UNITCLASS_FRIGATE'
--WHERE UnitType = 'UNIT_EE_GALLEON';
--INSERT INTO Unit_ClassUpgrades (UnitType, UnitClassType)
--VALUES ('UNIT_EE_GALLEON', 'UNITCLASS_FRIGATE');

INSERT INTO Unit_FreePromotions (UnitType, PromotionType) VALUES
('UNIT_EE_GALLEON', 'PROMOTION_ONLY_DEFENSIVE'),
('UNIT_EE_GALLEON', 'PROMOTION_CAN_MOVE_AFTER_ATTACKING');

--DELETE FROM Unit_AITypes WHERE UnitType = 'UNIT_EE_GALLEON';
--INSERT INTO Unit_AITypes (UnitType, UnitAIType) VALUES
--('UNIT_EE_GALLEON', 'UNITAI_ASSAULT_SEA'),
--('UNIT_EE_GALLEON', 'UNITAI_RESERVE_SEA'),
--('UNIT_EE_GALLEON', 'UNITAI_ESCORT_SEA');

-- Galleass changes
UPDATE Units
SET GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_GALLEON', RangedCombat = 20, ObsoleteTech = 'TECH_EE_EXPLORATION'
WHERE Type = 'UNIT_GALLEASS';

UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_EE_GALLEON'
WHERE UnitType = 'UNIT_GALLEASS';

-- Great Galleass changes
UPDATE Units
SET RangedCombat = 23, Combat = 13
WHERE Type = 'UNIT_VENETIAN_GALLEASS';

UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_EE_GALLEON'
WHERE UnitType = 'UNIT_VENETIAN_GALLEASS';

-- Frigate changes
UPDATE Units
SET GoodyHutUpgradeUnitClass = 'UNITCLASS_CRUISER', PrereqTech = 'TECH_EE_WARSHIPS', ObsoleteTech = 'TECH_DYNAMITE'
WHERE Type = 'UNIT_FRIGATE';

--UPDATE Unit_ClassUpgrades
--SET UnitClassType = 'UNITCLASS_CRUISER'
--WHERE UnitType = 'UNIT_FRIGATE';

-- Infixo: fixing resource requirements
-- VP removed Iron req from Ships before Industrial Era
-- INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType, Cost)
-- VALUES ('UNIT_FRIGATE', 'RESOURCE_IRON', 1);

UPDATE Units
SET IconAtlas = 'ENLIGHTENMENT_UNIT_ATLAS', PortraitIndex = 7
WHERE Type = 'UNIT_CRUISER';

-------------------------------------------------------
-- Ship of the Line - new strong naval melee unit
-------------------------------------------------------

--UPDATE Units
--SET ObsoleteTech = 'TECH_INDUSTRIALIZATION', Combat = 40, GoodyHutUpgradeUnitClass = 'UNITCLASS_IRONCLAD'
--WHERE Type = 'UNIT_EE_SHIP_OF_THE_LINE';

-- SotL -> Ironclad
--INSERT INTO Unit_ClassUpgrades (UnitType, UnitClassType)
--VALUES ('UNIT_EE_SHIP_OF_THE_LINE', 'UNITCLASS_IRONCLAD');

INSERT INTO Unit_FreePromotions (UnitType, PromotionType) VALUES
('UNIT_EE_SHIP_OF_THE_LINE', 'PROMOTION_EE_FIRST_RATE'),
('UNIT_EE_SHIP_OF_THE_LINE', 'PROMOTION_EXTRA_SIGHT_I');
	
-- Infixo: VP removed Iron req from ships before Industrial Era
--DELETE FROM Unit_ResourceQuantityRequirements
--WHERE UnitType = 'UNIT_EE_SHIP_OF_THE_LINE';

-------------------------------------------------------
-- Align flavors
-------------------------------------------------------

INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor) VALUES
('UNIT_EE_EXPLORER',  'FLAVOR_RECON',   7),
('UNIT_EE_FIELD_GUN', 'FLAVOR_OFFENSE', 5),
('UNIT_EE_FIELD_GUN', 'FLAVOR_DEFENSE', 3),
('UNIT_EE_FIELD_GUN', 'FLAVOR_RANGED', 11),
('UNIT_EE_LINE_INFANTRY','FLAVOR_OFFENSE', 13),
('UNIT_EE_LINE_INFANTRY','FLAVOR_DEFENSE', 10),
('UNIT_EE_SKIRMISHER','FLAVOR_OFFENSE', 2),
('UNIT_EE_SKIRMISHER','FLAVOR_DEFENSE', 2),
('UNIT_EE_SKIRMISHER','FLAVOR_RANGED',  6),
('UNIT_EE_UHLAN',     'FLAVOR_OFFENSE', 9),
('UNIT_EE_UHLAN',     'FLAVOR_DEFENSE', 3),
('UNIT_EE_UHLAN',     'FLAVOR_MOBILE',  7),
('UNIT_EE_CARRACK',   'FLAVOR_NAVAL',  20),
('UNIT_EE_CARRACK',   'FLAVOR_NAVAL_RECON', 25),
('UNIT_EE_GALLEON',   'FLAVOR_NAVAL',  25),
('UNIT_EE_GALLEON',   'FLAVOR_NAVAL_RECON', 13),
('UNIT_EE_SHIP_OF_THE_LINE','FLAVOR_NAVAL', 25),
('UNIT_EE_SHIP_OF_THE_LINE','FLAVOR_NAVAL_RECON', 25);

--UPDATE Unit_Flavors SET Flavor =  5 WHERE UnitType = 'UNIT_EE_FIELD_GUN' AND FlavorType = 'FLAVOR_OFFENSE';
--UPDATE Unit_Flavors SET Flavor = 13 WHERE UnitType = 'UNIT_EE_LINE_INFANTRY' AND FlavorType = 'FLAVOR_OFFENSE';

--UPDATE Unit_Flavors SET Flavor = 20 WHERE UnitType = 'UNIT_EE_CARRACK' AND FlavorType = 'FLAVOR_NAVAL';
--UPDATE Unit_Flavors SET Flavor = 25 WHERE UnitType = 'UNIT_EE_CARRACK' AND FlavorType = 'FLAVOR_NAVAL_RECON';

--UPDATE Unit_Flavors SET Flavor = 25 WHERE UnitType = 'UNIT_EE_GALLEON' AND FlavorType = 'FLAVOR_NAVAL';
--UPDATE Unit_Flavors SET Flavor = 13 WHERE UnitType = 'UNIT_EE_GALLEON' AND FlavorType = 'FLAVOR_NAVAL_RECON';

--UPDATE Unit_Flavors SET Flavor = 25 WHERE UnitType = 'UNIT_EE_SHIP_OF_THE_LINE' AND FlavorType = 'FLAVOR_NAVAL';
--UPDATE Unit_Flavors SET Flavor = 25 WHERE UnitType = 'UNIT_EE_SHIP_OF_THE_LINE' AND FlavorType = 'FLAVOR_NAVAL_RECON';

-------------------------------------------------------
-- Align unit costs and make gold purchases available
-- Guidelines: Cost is 300-450, FaithCost is 250
-- VP 2/27 guidelines
-- MED:(135)160-200, 300 faith
-- REN:     300-375, 400 faith
-- ENL: 400-550, 500 faith
-- IND: 600-900, 600 faith
-- MOD: 800-1300, 700 faith
-------------------------------------------------------

-- Allow for Faith purchases
INSERT INTO Belief_EraFaithUnitPurchase (BeliefType, EraType)
VALUES ('BELIEF_HEATHEN_CONVERSION', 'ERA_ENLIGHTENMENT');

-- Renaissance
UPDATE Units SET Cost = 300, FaithCost = 400 WHERE Type = 'UNIT_EE_EXPLORER'; -- Renaissance
UPDATE Units SET Cost = 300, FaithCost = 400 WHERE Type = 'UNIT_2HANDER'; -- Renaissance
UPDATE Units SET Cost = 350, FaithCost = 450 WHERE Type = 'UNIT_EE_CARRACK'; -- Renaissance, takes place of PRIVATEER
UPDATE Units SET Cost = 375, FaithCost = 450 WHERE Type = 'UNIT_EE_GALLEON'; -- Renaissance, takes place of FRIGATE
UPDATE Units SET Cost = 350, FaithCost = 400 WHERE Type = 'UNIT_SPANISH_CONQUISTADOR'; -- replaces LANCER (originally KNIGHT)
-- Enlightenment
UPDATE Units SET Cost = 400, FaithCost = 500 WHERE Type = 'UNIT_EE_LINE_INFANTRY';
UPDATE Units SET Cost = 400, FaithCost = 500 WHERE Type = 'UNIT_AMERICAN_MINUTEMAN'; -- replaces EE_LINE_INF(originally MUSKETMAN)
UPDATE Units SET Cost = 450, FaithCost = 500 WHERE Type = 'UNIT_EE_SKIRMISHER';
UPDATE Units SET Cost = 450, FaithCost = 500 WHERE Type = 'UNIT_EE_FIELD_GUN';
UPDATE Units SET Cost = 450, FaithCost = 550 WHERE Type = 'UNIT_PRIVATEER'; -- (350p)
UPDATE Units SET Cost = 500, FaithCost = 550 WHERE Type = 'UNIT_FRIGATE'; -- (375p)
UPDATE Units SET Cost = 550, FaithCost = 550 WHERE Type = 'UNIT_ENGLISH_SHIPOFTHELINE'; -- (375p) replaces FRIGATE
UPDATE Units SET Cost = 550, FaithCost = 550 WHERE Type = 'UNIT_EE_SHIP_OF_THE_LINE';
-- Industrial
UPDATE Units SET Cost = 700, FaithCost = 600 WHERE Type = 'UNIT_EE_UHLAN';
UPDATE Units SET Cost = 700, FaithCost = 600 WHERE Type = 'UNIT_RUSSIAN_COSSACK'; -- replaces EE_UHLAN

INSERT INTO Unit_BuildingClassPurchaseRequireds (UnitType, BuildingClassType) VALUES
('UNIT_2HANDER','BUILDINGCLASS_ARMORY'),
('UNIT_EE_CARRACK','BUILDINGCLASS_HARBOR'),
('UNIT_EE_GALLEON','BUILDINGCLASS_HARBOR'),
('UNIT_EE_SHIP_OF_THE_LINE','BUILDINGCLASS_HARBOR'),
('UNIT_EE_LINE_INFANTRY','BUILDINGCLASS_ARMORY'),
('UNIT_EE_FIELD_GUN','BUILDINGCLASS_ARMORY'),
('UNIT_EE_EXPLORER','BUILDINGCLASS_ARMORY'),
('UNIT_EE_SKIRMISHER','BUILDINGCLASS_STABLE'),
('UNIT_EE_SKIRMISHER','BUILDINGCLASS_ARMORY'),
('UNIT_EE_UHLAN','BUILDINGCLASS_STABLE'),
('UNIT_EE_UHLAN','BUILDINGCLASS_ARMORY');

-------------------------------------------------------
-- Add new EE buildings as required for purchases in 2 next Eras
-- Gunsmith: for all UNITCOMBAT_GUN, UNITCOMBAT_ARMOR, UNITCOMBAT_SIEGE units
-- Drydock: for all DOMAIN_SEA units
-------------------------------------------------------

insert into Unit_BuildingClassPurchaseRequireds (UnitType, BuildingClassType)
	select Type, 'BUILDINGCLASS_EE_DRYDOCK'
	from Units
	where Domain = 'DOMAIN_SEA' and PrereqTech in(
		select Type
		from Technologies
		where Era in ('ERA_INDUSTRIAL', 'ERA_MODERN', 'ERA_POSTMODERN', 'ERA_FUTURE'));

insert into Unit_BuildingClassPurchaseRequireds (UnitType, BuildingClassType)
	select Type, 'BUILDINGCLASS_EE_GUNSMITH'
	from Units
	where (CombatClass = 'UNITCOMBAT_ARMOR' or CombatClass = 'UNITCOMBAT_GUN' or CombatClass = 'UNITCOMBAT_SIEGE') and PrereqTech in(
		select Type
		from Technologies
		where Era in ('ERA_INDUSTRIAL', 'ERA_MODERN'));

-------------------------------------------------------
-- Sounds
-------------------------------------------------------

INSERT INTO UnitGameplay2DScripts (UnitType, SelectionSound, FirstSelectionSound) VALUES
('UNIT_EE_EXPLORER',     'AS2D_SELECT_SCOUT',     'AS2D_BIRTH_SCOUT'),
('UNIT_EE_FIELD_GUN',    'AS2D_SELECT_CANNON',    'AS2D_BIRTH_CANNON'),
('UNIT_EE_LINE_INFANTRY','AS2D_SELECT_MUSKETMAN', 'AS2D_BIRTH_MUSKETMAN'),
('UNIT_EE_SKIRMISHER',   'AS2D_SELECT_CROSSBOWMAN','AS2D_BIRTH_CROSSBOWMAN'),
('UNIT_EE_UHLAN',        'AS2D_SELECT_CAVALRY',   'AS2D_BIRTH_CAVALRY'),
('UNIT_EE_CARRACK',      'AS2D_SELECT_CARAVEL',   'AS2D_BIRTH_CARAVEL'),
('UNIT_EE_GALLEON',      'AS2D_SELECT_FRIGATE',   'AS2D_BIRTH_FRIGATE'),
('UNIT_EE_SHIP_OF_THE_LINE','AS2D_SELECT_CARAVEL','AS2D_BIRTH_CARAVEL');


----------------------------------------------------
-- Text (en_US)
----------------------------------------------------

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_UNIT_EE_CARRACK', 'Carrack'),
('TXT_KEY_UNIT_EE_CARRACK_HELP', 'Medieval era melee naval unit used to gain early naval supremacy.'),
('TXT_KEY_UNIT_EE_CARRACK_PEDIA', 'Developed by the Genoese Republic for commercial purposes, a carrack is three- or four-masted sailing vessel. Utilized by Spain and Portugal for oceanic travel and exploration, the carrack was one of the most influential ship designs in history. Large and roomy to carry cargo across vast distances, they were used heavily across the Atlantic and Indian oceans, carrying new found wealth and resources back to the great cities of Europe. One of the most famous ships to go down a history, the Santa Maria, was a carrack that carried Columbus and his crew to discover the new world. Another famous ship of this design belongs to Vasco Da Gama, the Portuguese explorer who circumnavigated Africa, discovering a new route to spices of India. The end of the carrack came at the hands of the galleon. Developed from the carrack, the first galleons became a reality in the mid 16th century, though the carrack would persist for several more decades.'),
('TXT_KEY_UNIT_EE_CARRACK_STRATEGY', 'The Carrack upgrades from the Trireme. It still cannot enter ocean tiles.  However, it is significantly stronger, allowing you to better secure your coastal cities from seafaring Barbarians or counterattacks from enemy Civilizations.  Its early increased combat strength means it can be used, with support, to take small cities with low Defensive Strength.'),
('TXT_KEY_UNIT_EE_CRUISER', 'Cruiser'),
('TXT_KEY_UNIT_EE_CRUISER_HELP', 'Extremely powerful Industrial Era ranged naval Unit used to wrest control of the seas.'),
('TXT_KEY_UNIT_EE_CRUISER_STRATEGY', 'A technological bridge between the Frigate and the Battleship, Cruisers move at the same speed as its predecessor but boasts a much stronger Combat Strength.  The Cruiser easily outguns an outdated navy, even without any added maneuverability.'),
('TXT_KEY_UNIT_EE_CRUISER_PEDIA', 'The word cruiser was applied originally to frigates of the sailing era, which, being smaller and faster than ships of the line, cruised the seas scouting for enemy fleets and hunting enemy convoys. As the designation for a specific type of warship, cruiser did not become current until about 1880, when navies had settled on iron-hulled ships powered either by a combination of sail and steam or solely by steam. Cruiser, then, became the standard designation for a large surface warship built for high speed and great cruising radius, capable of not only defending its own fleet and coastlines but also threatening those of the enemy. By about 1900, cruisers were of two principal kinds: protected cruisers had steel armour plating only on their decks, while armoured cruisers also had armour extending down the sides of the hull. Though smaller than battleships, cruisers were powerful warships because of their great speed and relatively big guns.'),
('TXT_KEY_UNIT_EE_CUIRASSIER', 'Cuirassier'),
('TXT_KEY_UNIT_EE_CUIRASSIER_HELP', 'Fast Enlightenment Era mounted Unit.  Vulnerable to Lancers and Uhlans.'),
('TXT_KEY_UNIT_EE_CUIRASSIER_PEDIA', 'Cuirassiers were European cavalry rigged with firearms and a cuirass, which was the name of their armour. A cuirass is a single or multiple pieces of metal which usually covered the front of the torso. About the middle of the century, the breastplate of the cuirass was made in two parts; the lower adjusted to overlap the upper, held together with a strap or sliding rivet in order to add flexibility to the advantages plate armour had over mail.Primarily fielded in the 15th century, the Cuirassier grew to a heightened prominence during the Napoleonic wars, where it was heavily recruited and equipped with swords as their primary weapon. Cuirassiers continued to be employed into the early ravages of the Great War and continue their ceremonial use as regiments to this day.'),
('TXT_KEY_UNIT_EE_CUIRASSIER_STRATEGY', 'The Enlightenment Era cavalry unit, the Cuirassier has an increased strength over the medieval Knight while moving at the same speed.  It is vulnerable to anti-mounted units such as Lancers and Uhlans.'),
('TXT_KEY_UNIT_EE_EXPLORER', 'Explorer'),
('TXT_KEY_UNIT_EE_EXPLORER_HELP', 'Recon unit. Can see further and has additional movement while embarked.'),
('TXT_KEY_UNIT_EE_EXPLORER_PEDIA', 'Throughout history there are those whose thirst for adventure led them from the safe confines of civilized lands. These explorers, frequently funded by government stipends, would then journey into the unknown, charting their progress all the way. These expeditions, and the maps they helped create, became blueprints for the conquest and domestication of the once uncharted regions of the world.'),
('TXT_KEY_UNIT_EE_EXPLORER_STRATEGY', 'An upgrade to the Scout.  The Explorer has even more movement and strength, although is still quite weak.  The Explorer excels at sea exploration, as it is able to move further while embarked.  Use it to finish meeting all the other Civilizations, or scout out locations for overseas colonies.'),
('TXT_KEY_UNIT_EE_FIELD_GUN', 'Field Gun'),
('TXT_KEY_UNIT_EE_FIELD_GUN_HELP', 'Enlightenment Era artillery unit.  Must set up before firing.'),
('TXT_KEY_UNIT_EE_FIELD_GUN_PEDIA', 'A field gun is a piece of light artillery that can be easily moved around the battlefield. During his wars in Europe, Napoleon used field guns to great effect. His employment of very large wheels allowed his guns to be quickly moved in the midst of battle, meaning enemy formations could be easily broken up. This strategy gradually became obsolete, however, as the development of road and rail, and the changing nature of the battlefield, allowed for most kinds of artillery to be moved at respectable speed.[NEWLINE][NEWLINE]By the beginning of the Second World War, the term "field gun" had come to mean any long-range artillery piece that fired at a low angle. However, because of the demand for artillery which could fire at both long-range and a high angle during the later stages of World War II, field guns became largely supplanted by howitzers, and today the term sees no widespread application.'),
('TXT_KEY_UNIT_EE_FIELD_GUN_STRATEGY', 'The Field Gun is the Enlightenment Era artillery unit.  While its range remains the same as the Cannon, from which it upgrades, it is much stronger.  Like other siege units, it cannot see very far and must be protected.  It also must expend movement to set up – but Field Guns are essential to Enlightenment conquests.'),
('TXT_KEY_UNIT_EE_ENGLISH_FIRST_RATE', 'First Rate'),
('TXT_KEY_UNIT_EE_ENGLISH_FIRST_RATE_HELP', 'Powerful Enlightenment Era naval melee unit which boosts the defensive strength of adjacent friendly units.  Only the English may build it.'),
('TXT_KEY_UNIT_EE_ENGLISH_FIRST_RATE_PEDIA', '“First-rate” is the classification used for the largest ships of the line maintained by the British Royal Navy.  Throughout the existence of the rating system, the threshold armament and crew for a ship to be considered first-rate changed.  However, it was established in the early 1700s that a first-rate ship loaded for wartime carried at least 100 guns.  First-rates were very expensive, heavy and slow in exchange for their massive firepower.  As a result, few were maintained at any given time, and they often served as flagships.  HMS Victory, Admrial Nelson’s famous flagship from the Battle of Trafalgar, is the only surviving first-rate.'),
('TXT_KEY_UNIT_EE_ENGLISH_FIRST_RATE_STRATEGY', 'The First Rate is England’s unique unit, replacing the Ship of the Line.  Like the Ship of the Line, it is a strong melee ship.  However, it is even stronger than the unit it replaces.  It also provides combat boosts to nearby allied ships when defending.  Use it as part of a larger fleet to greatly increase your naval firepower.'),
('TXT_KEY_UNIT_EE_GALLEON', 'Galleon'),
('TXT_KEY_UNIT_EE_GALLEON_HELP', 'Renaissance Era melee naval Unit.  Can enter ocean tiles.'),
('TXT_KEY_UNIT_EE_GALLEON_PEDIA', 'A galleon is the design of a multi-story sailing vessel attributed to the Venetians. Employed extensively in the fleets of Spain and other European states to further their naval militaristic interests, the galleon were formidable warships that weighed up to 2000 metric tonnes. The galleon was powered entirely by wind, using sails carried on three or four masts, with a lateen sail continuing to be used on the last (usually third and fourth) masts. They were used in both military and trade applications, most famously in the Spanish treasure fleet, and the Manila Galleons. Demoting the carrack to be used just for cargo, these vessels became the forefront of European armadas and went on to colonize the world.'),
('TXT_KEY_UNIT_EE_GALLEON_STRATEGY', 'The Galleon is a Renaissance naval unit.  Upgrading from the Carrack, the Galleon is the first melee ship to be able to enter Oceans.  Use a fleet of Galleons, supported by larger ships, to conquer overseas cities and protect your overseas holdings.'),
('TXT_KEY_UNIT_EE_LINE_INFANTRY', 'Line Infantry'),
('TXT_KEY_UNIT_EE_LINE_INFANTRY_HELP', 'Basic front-line infantry unit of the Enlightenment Era.'),
('TXT_KEY_UNIT_EE_LINE_INFANTRY_PEDIA', 'With the massive proliferation of guns from the middle of the 17th century, the battlefield became dominated by linear tactics, according to which infantry were arranged into long thin lines and fired volleys. A line consisted of 2, 3, or 4 ranks of soldiers. The relatively short range at which smooth bore muskets could accurately hit a target, added to the slow reload, meant that massed formation firing was essential for maximizing enemy casualties. The line was considered the fundamental battle formation as it allowed for the largest deployment of firepower. In the years following the Napoleonic Wars, line infantry continued to be deployed as the main battle force, while light infantry provided fire support and covered the movement of units. With the invention of new weaponry, the concept of line infantry began to wane; men walking in formation line-abreast became far too easy a target. The growing accuracy and rate of fire of rifles, together with the invention of the gatling gun and machine gun, meant that close order line infantry would suffer huge losses before being able to close with their foe. With the turn of the 20th Century, this slowly led to infantry increasingly adopting skirmisher style light infantry tactics in battle, while retaining line infantry drills for training.'),
('TXT_KEY_UNIT_EE_LINE_INFANTRY_STRATEGY', 'The standard gunpowder unit of the Enlightenment Era, upgrading from and significantly outclassing the Musketman.  The Line Infantry will form the backbone of Enlightenment armies, being used to fight other melee units and protect siege and ranged units.'),
('TXT_KEY_UNIT_EE_SKIRMISHER', 'Skirmisher'),
('TXT_KEY_UNIT_EE_SKIRMISHER_HELP', 'Primary ranged unit of the Enlightenment era which must be adjacent to attack.'),
('TXT_KEY_UNIT_EE_SKIRMISHER_PEDIA', 'Skirmishers are light infantry or cavalry soldiers stationed ahead or alongside a larger body of friendly troops to harass the enemy. In ancient and medieval warfare, skirmishers typically carried bows, javelins, or slings. Acting as light infantry with minimal armor, they could run ahead of the main battle line, release a volley, and retreat before the clash of the opposing main forces. During the Napoleonic Wars the role of the skirmisher took on new notability, attempting to disrupt enemy forces by firing into their close-packed ranks and potentially causing early casualties and breaking enemy formation. A skirmish force screening the main body of infantry became so important that eventually all the major European powers developed specialized skirmishing infantry, e.g. the German Jäger and the French Voltigeurs. While muskets were the predominant weapon at the time, the British Army experimented with rifles, which soon became the predominant firearm. A consequence of these wars was a trend to train line troops to adopt skirmisher tactics. By the late 19th century, the concept of fighting in formation was on the wane, and the distinctions between skirmisher and heavy infantry have largely disappeared.'),
('TXT_KEY_UNIT_EE_SKIRMISHER_STRATEGY', 'The Skirmisher is the first gunpowder based ranged unit of the game. While its range decreases to just one, the melee strength of the unit remains the same, allowing it to defend just as well as it attacks while suffering no damage when attacking.'),
('TXT_KEY_UNIT_EE_SHIP_OF_THE_LINE', 'Ship of the Line'),
('TXT_KEY_UNIT_EE_SHIP_OF_THE_LINE_HELP', 'Powerful Enlightenment Era naval ranged Unit.'),
('TXT_KEY_UNIT_EE_SHIP_OF_THE_LINE_STRATEGY', 'The Ship of the Line is a melee naval unit of the Enlightenment Era.  Unlike the Galleon, from which it upgrades, the Ship of the Line requires Iron to build and maintain.  However, a boost to combat strength and a critical boost to movement speed make it worth the price.  Use it to crush outdated fleets with superior firepower and speed.'),
('TXT_KEY_UNIT_EE_SURVEYOR', 'Surveyor'),
('TXT_KEY_UNIT_EE_SURVEYOR_HELP', 'Late game scouting unit which can enter enemy territory and cover land quickly.'),
('TXT_KEY_UNIT_EE_SURVEYOR_PEDIA', 'As the Industrial Revolution powered forward, exploration of the world took on a much more scientific slant.  The purpose of exploration changed from the Renaissance ideal of bringing back treasure and trade routes, to a desire to understand the world and its flora and fauna.  This served a practical purpose as well – a more urbanized and mechanized society required formal planning of spaces, in order to more efficiently build infrastructure and settlements.'),
('TXT_KEY_UNIT_EE_SURVEYOR_STRATEGY', 'The Surveyor is a recon unit that upgrades from the Explorer.  It is stronger and faster still than the Explorer, although it is vulnerable alone.  The Surveyor may enter rival territory without an Open Borders agreement.'),
('TXT_KEY_UNIT_EE_UHLAN', 'Uhlan'),
('TXT_KEY_UNIT_EE_UHLAN_HELP', 'Mid game light cavalry unit good against other mounted units.'),
('TXT_KEY_UNIT_EE_UHLAN_PEDIA', 'The Uhlan was a Polish light cavalry unit armed with lances, sabres, and pistols which came to frequent the armies of 18th and 19th century Russia, Prussia, and Austria. Descendents of the Tartar settlers of Lithuania, the first Uhlan regiment was created by the Polish-Lithuanian Commonwealth in the early 1700s. Swift and unobstructed by the cumbersome armor which had previously dominated mounted warfare, the Uhlan quickly grew in popular use for their versatility and speed; able to conduct reconnaissance, skirmishes, or to head-on charges. Today, a ceremonial regiment of Uhlans is retained by the Polish Armed Forces.'),
('TXT_KEY_UNIT_EE_UHLAN_STRATEGY', 'The anti-cavalry movement unit of the Industrial Era, the Uhlan upgrades from the Lancer and fulfills largely the same role as its Renaissance predecessor.  Use it to directly counter the fast cavalry that enemies harass your invading armies with');
