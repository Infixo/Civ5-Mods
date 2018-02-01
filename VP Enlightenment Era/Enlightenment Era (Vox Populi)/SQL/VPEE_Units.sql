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



--=====================================================
-- UNITS
--=====================================================

--UPDATE Units
--SET PrereqTech = null
--WHERE Type = 'UNIT_ENGLISH_SHIPOFTHELINE';

INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType,						TileType,			Asset) 
VALUES	('ART_DEF_UNIT_U_SPANISH_GALLEON',			'Unit',				'sv_Galleon.dds');

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
SET ObsoleteTech = 'TECH_REPLACEABLE_PARTS'
WHERE Type IN ('UNIT_FRENCH_MUSKETEER', 'UNIT_SWEDISH_CAROLEAN');

UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_EE_LINE_INFANTRY'
WHERE UnitType IN (SELECT Type FROM Units WHERE Class = 'UNITCLASS_TERCIO' AND Type != 'UNIT_FRENCH_MUSKETEER');

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

UPDATE Units SET ObsoleteTech = 'TECH_EE_FORTIFICATION' WHERE Type = 'UNIT_MUSKETMAN';

-- A new promotion: Light Skirmish
INSERT INTO UnitPromotions(Type, Description, Help, Sound, CannotBeChosen, PortraitIndex, IconAtlas, PediaType, PediaEntry, HillsDoubleMove, LostWithUpgrade)
VALUES ('PROMOTION_CBOEE_SKIRMISH', 'TXT_KEY_PROMOTION_CBOEE_SKIRMISH', 'TXT_KEY_PROMOTION_CBOEE_SKIRMISH_HELP', 'AS2D_IF_LEVELUP', 1, 59, 'PROMOTION_ATLAS', 'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_CBOEE_SKIRMISH', 1, 1);

INSERT INTO UnitPromotions_Features(PromotionType, FeatureType, DoubleMove)
VALUES ('PROMOTION_CBOEE_SKIRMISH', 'FEATURE_FOREST', 1);
	
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

UPDATE Units SET ObsoleteTech = 'TECH_EE_FLINTLOCK' WHERE Class = 'UNITCLASS_CANNON';

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
-- Trireme, Carrack, Caravel
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

-- Other melee ships
UPDATE Units 
SET PrereqTech = 'TECH_ASTRONOMY', GoodyHutUpgradeUnitClass = 'UNITCLASS_PRIVATEER', Combat = 32, Moves = 5
WHERE Type = 'UNIT_PORTUGUESE_NAU';

UPDATE Units
SET PrereqTech = 'TECH_EE_EXPLORATION'
WHERE Type = 'UNIT_DUTCH_SEA_BEGGAR';

UPDATE Units
SET GoodyHutUpgradeUnitClass = 'UNITCLASS_IRONCLAD'
WHERE Type = 'UNIT_PRIVATEER'; -- Corvette

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
