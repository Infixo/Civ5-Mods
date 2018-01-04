--=====================================================
-- UNITS
--=====================================================

-------------------------------------------------------
-- Infixo: 4 units disabled
-------------------------------------------------------
UPDATE Units
SET PrereqTech = NULL, Cost = -1, ShowInPedia = 0
WHERE Type IN ('UNIT_EE_SURVEYOR', 'UNIT_EE_CUIRASSIER', 'UNIT_EE_CRUISER', 'UNIT_ENGLISH_SHIPOFTHELINE');

DELETE FROM Unit_ClassUpgrades 
WHERE UnitType IN ('UNITCLASS_EE_SURVEYOR', 'UNITCLASS_EE_CUIRASSIER', 'UNITCLASS_EE_CRUISER', 'UNIT_ENGLISH_SHIPOFTHELINE');

DELETE FROM Unit_ClassUpgrades 
WHERE UnitClassType IN ('UNITCLASS_EE_SURVEYOR', 'UNITCLASS_EE_CUIRASSIER', 'UNITCLASS_EE_CRUISER', 'UNIT_ENGLISH_SHIPOFTHELINE');


-------------------------------------------------------
-- RER 2H
-------------------------------------------------------
UPDATE Units SET Combat = 22 WHERE Type = 'UNIT_LONGSWORDSMAN';

-------------------------------------------------------
-- Recon 
-------------------------------------------------------
UPDATE Units
SET ObsoleteTech = 'TECH_COMPASS'
WHERE Type = 'UNIT_SCOUT';

UPDATE Units
SET ObsoleteTech = 'TECH_EE_EXPLORATION', GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_EXPLORER' 
WHERE Class = 'UNITCLASS_EXPLORER';

UPDATE Units
SET ObsoleteTech = 'TECH_STEAM_POWER', GoodyHutUpgradeUnitClass = 'UNITCLASS_ZEPPELIN', Combat = 20
WHERE Type IN ('UNIT_EE_EXPLORER');

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
	('UNIT_EE_EXPLORER', 'PROMOTION_DEFENSIVE_EMBARKATION'),
	('UNIT_EE_EXPLORER', 'PROMOTION_EMBARKED_SIGHT'),
	('UNIT_EE_EXPLORER', 'PROMOTION_RECON_EXPERIENCE');

-- Infixo: Scout -> Explorer
UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_EXPLORER'
WHERE UnitType IN (SELECT Type FROM Units WHERE Class = 'UNITCLASS_SCOUT');

-- Infixo: Explorer -> Adventurer
UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_EE_EXPLORER' -- Infixo: Adventurer
WHERE UnitType IN (SELECT Type FROM Units WHERE Class = 'UNITCLASS_EXPLORER');

-- Infixo: Adventurer -> Zeppelin
-- Infixo: this row was removed when disabling Surveyor, thus INSERT
INSERT INTO Unit_ClassUpgrades (UnitType, UnitClassType)
VALUES ('UNIT_EE_EXPLORER', 'UNITCLASS_ZEPPELIN');

/*UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_ZEPPELIN'
WHERE UnitType IN (SELECT Type FROM Units WHERE Class = 'UNITCLASS_EE_EXPLORER');*/

--UPDATE Unit_ClassUpgrades
--SET UnitClassType = 'UNITCLASS_ZEPPELIN'
--WHERE UnitType = 'UNIT_EE_EXPLORER';

/*CREATE TRIGGER CBOEE_EEExplorerCheck
AFTER INSERT ON Units
WHEN 'UNITCLASS_EE_EXPLORER' = NEW.Class
BEGIN
	UPDATE Units
	SET ObsoleteTech = 'TECH_STEAM_POWER', GoodyHutUpgradeUnitClass = 'UNITCLASS_ZEPPELIN'
	WHERE Type = NEW.TYPE;
	
	UPDATE Unit_ClassUpgrades
	SET UnitClassType = 'UNITCLASS_ZEPPELIN'
	WHERE UnitType = NEW.Type;
END;*/

/* Infixo: not necessary
CREATE TRIGGER CBOEE_ExplorerCheck
AFTER INSERT ON Units
WHEN 'UNITCLASS_EXPLORER' = NEW.Class
BEGIN
	UPDATE Units
	SET ObsoleteTech = 'TECH_EE_EXPLORATION', GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_EXPLORER'
	WHERE Type = NEW.TYPE;
	
	UPDATE Unit_ClassUpgrades
	SET UnitClassType = 'UNITCLASS_EE_EXPLORER'
	WHERE UnitType = NEW.Type;
END;
*/

-------------------------------------------------------
-- Heavy Skirmisher upgrade
-------------------------------------------------------
UPDATE Units
SET ObsoleteTech = 'TECH_METALLURGY', GoodyHutUpgradeUnitClass = 'UNITCLASS_CUIRASSIER' 
WHERE Class = 'UNITCLASS_MOUNTED_BOWMAN';

UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_CUIRASSIER'
WHERE UnitType IN (SELECT Type FROM Units WHERE Class = 'UNITCLASS_MOUNTED_BOWMAN');

/* Infixo: not necessary
CREATE TRIGGER CBOEE_MountedBowmanCheck
AFTER INSERT ON Units
WHEN 'UNITCLASS_MOUNTED_BOWMAN' = NEW.Class
BEGIN
	UPDATE Units
	SET ObsoleteTech = 'TECH_METALLURGY', GoodyHutUpgradeUnitClass = 'UNITCLASS_CUIRASSIER'
	WHERE Type = NEW.TYPE;
	
	UPDATE Unit_ClassUpgrades
	SET UnitClassType = 'UNITCLASS_CUIRASSIER'
	WHERE UnitType = NEW.Type;
END;
*/

-------------------------------------------------------
-- Knight upgrade (revert to original CBO)
-------------------------------------------------------
UPDATE Units
SET ObsoleteTech = 'TECH_EE_EXPLORATION', GoodyHutUpgradeUnitClass = 'UNITCLASS_LANCER' 
WHERE Class = 'UNITCLASS_KNIGHT';

UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_LANCER'
WHERE UnitType IN (SELECT Type FROM Units WHERE Class = 'UNITCLASS_KNIGHT');

/* Infixo: not necessary
CREATE TRIGGER CBOEE_KnightCheck
AFTER INSERT ON Units
WHEN 'UNITCLASS_KNIGHT' = NEW.Class
BEGIN
	UPDATE Units
	SET ObsoleteTech = 'TECH_EE_EXPLORATION', GoodyHutUpgradeUnitClass = 'UNITCLASS_LANCER'
	WHERE Type = NEW.TYPE;
	
	UPDATE Unit_ClassUpgrades
	SET UnitClassType = 'UNITCLASS_LANCER'
	WHERE UnitType = NEW.Type;
END;
*/

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

/* Infixo: not necessary
CREATE TRIGGER CBOEE_TercioCheck
AFTER INSERT ON Units
WHEN 'UNITCLASS_TERCIO' = NEW.Class
BEGIN
	UPDATE Units
	SET ObsoleteTech = 'TECH_EE_FLINTLOCK', GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_LINE_INFANTRY'
	WHERE Type = NEW.TYPE;
	
	UPDATE Unit_ClassUpgrades
	SET UnitClassType = 'UNITCLASS_EE_LINE_INFANTRY'
	WHERE UnitType = NEW.Type;
END;
*/

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

DELETE From Unit_FreePromotions WHERE UnitType = 'UNIT_RUSSIAN_COSSACK' AND PromotionType = 'PROMOTION_ESPRIT_DE_CORPS';
DELETE From Unit_FreePromotions WHERE UnitType = 'UNIT_RUSSIAN_COSSACK' AND PromotionType = 'PROMOTION_NAVAL_MISFIRE';
DELETE From Unit_FreePromotions WHERE UnitType = 'UNIT_RUSSIAN_COSSACK' AND PromotionType = 'PROMOTION_ONLY_DEFENSIVE';

DELETE FROM Unit_AITypes WHERE UnitType = 'UNIT_RUSSIAN_COSSACK';

-- Infixo: same as Knight and Lancer
INSERT INTO Unit_AITypes (UnitType, UnitAIType)
VALUES
	('UNIT_RUSSIAN_COSSACK', 'UNITAI_FAST_ATTACK'),
	('UNIT_RUSSIAN_COSSACK', 'UNITAI_DEFENSE');

UPDATE Unit_ClassUpgrades SET UnitClassType = 'UNITCLASS_WWI_TANK' WHERE UnitType = 'UNIT_RUSSIAN_COSSACK';

INSERT INTO Unit_FreePromotions (UnitType, PromotionType) SELECT 'UNIT_RUSSIAN_COSSACK' , 'PROMOTION_FORMATION_1';
-- Infixo: resambles original CBO Cossack
INSERT INTO Unit_FreePromotions (UnitType, PromotionType) SELECT 'UNIT_RUSSIAN_COSSACK' , 'PROMOTION_HEAVY_CHARGE';

-------------------------------------------------------
-- Lancer & Uhlan
-------------------------------------------------------

UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_EE_UHLAN'
WHERE UnitType IN (SELECT Type FROM Units WHERE Class = 'UNITCLASS_LANCER');

UPDATE Units SET ObsoleteTech = 'TECH_RIFLING', GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_UHLAN' 
WHERE Type = 'UNIT_LANCER';

UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_WWI_TANK'
WHERE UnitType IN (SELECT Type FROM Units WHERE Class = 'UNITCLASS_EE_UHLAN');

UPDATE Units SET PrereqTech = 'TECH_RIFLING', ObsoleteTech = 'TECH_COMBUSTION', GoodyHutUpgradeUnitClass = 'UNITCLASS_WWI_TANK', Combat = 40
WHERE Type = 'UNIT_EE_UHLAN';

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
-- Conquistador
-------------------------------------------------------
UPDATE Units
SET Class = 'UNITCLASS_LANCER', PrereqTech = 'TECH_EE_EXPLORATION', ObsoleteTech = 'TECH_COMBUSTION', GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_UHLAN', Combat = 35, Range = 0
WHERE Type = 'UNIT_SPANISH_CONQUISTADOR';

UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_EE_UHLAN'
WHERE UnitType = 'UNIT_SPANISH_CONQUISTADOR';

UPDATE Civilization_UnitClassOverrides 
Set UnitClassType = 'UNITCLASS_LANCER' WHERE UnitType = 'UNIT_SPANISH_CONQUISTADOR';

-------------------------------------------------------
-- Light Infantry
-------------------------------------------------------

-- Infixo: it's archery unit, so aligned with Musketman and Gatling Gun
UPDATE Units
SET Combat = 21, RangedCombat = 35, CombatClass = 'UNITCOMBAT_ARCHER', Range = 2, GoodyHutUpgradeUnitClass ='UNITCLASS_GATLINGGUN', PrereqTech = 'TECH_EE_FORTIFICATION', ObsoleteTech = 'TECH_DYNAMITE'
WHERE Type = 'UNIT_EE_SKIRMISHER';

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
--SELECT 'PROMOTION_CBPEE_SKIRMISH', Type, 1
--FROM Features WHERE Type IN ('FEATURE_FOREST');
	
-- Infixo: fixing promotions
INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
	('UNIT_EE_SKIRMISHER', 'PROMOTION_CBOEE_SKIRMISH'),
	('UNIT_EE_SKIRMISHER', 'PROMOTION_NAVAL_MISFIRE');

-------------------------------------------------------
-- Line Infantry
-------------------------------------------------------
	
-- Infixo
INSERT INTO Unit_FreePromotions	(UnitType, PromotionType)
VALUES ('UNIT_EE_LINE_INFANTRY', 'PROMOTION_ANTI_MOUNTED_I');

-------------------------------------------------------
-- American Minuteman
-------------------------------------------------------
		
/*UPDATE Units 
SET Class = 'UNITCLASS_MUSKETMAN', PrereqTech = 'TECH_METALLURGY', ObsoleteTech = 'TECH_DYNAMITE', GoodyHutUpgradeUnitClass = 'UNITCLASS_GATLINGGUN' 
WHERE Type = 'UNIT_AMERICAN_MINUTEMAN';

UPDATE Civilization_UnitClassOverrides
SET UnitClassType = 'UNITCLASS_MUSKETMAN'
WHERE UnitType = 'UNIT_AMERICAN_MINUTEMAN';*/

UPDATE Civilization_UnitClassOverrides Set UnitClassType = 'UNITCLASS_EE_LINE_INFANTRY' WHERE UnitType = 'UNIT_AMERICAN_MINUTEMAN';

UPDATE Units 
SET Class = 'UNITCLASS_EE_LINE_INFANTRY', CombatClass = 'UNITCOMBAT_GUN', GoodyHutUpgradeUnitClass = 'UNITCLASS_RIFLEMAN',
	Combat = 30, Range = 0, RangedCombat = 0, 
	PrereqTech = 'TECH_EE_FLINTLOCK', ObsoleteTech = 'TECH_REPLACEABLE_PARTS', DefaultUnitAI = 'UNITAI_DEFENSE'
WHERE Type = 'UNIT_AMERICAN_MINUTEMAN';

DELETE FROM Unit_AITypes WHERE UnitType = 'UNIT_AMERICAN_MINUTEMAN';
INSERT INTO Unit_AITypes (UnitType, UnitAIType) SELECT 'UNIT_AMERICAN_MINUTEMAN', 'UNITAI_FAST_ATTACK';
INSERT INTO Unit_AITypes (UnitType, UnitAIType) SELECT 'UNIT_AMERICAN_MINUTEMAN', 'UNITAI_ATTACK';
INSERT INTO Unit_AITypes (UnitType, UnitAIType) SELECT 'UNIT_AMERICAN_MINUTEMAN', 'UNITAI_DEFENSE';

UPDATE Unit_ClassUpgrades SET UnitClassType = 'UNITCLASS_RIFLEMAN' WHERE UnitType = 'UNIT_AMERICAN_MINUTEMAN';

DELETE From Unit_FreePromotions WHERE UnitType = 'UNIT_AMERICAN_MINUTEMAN' AND PromotionType = 'PROMOTION_NAVAL_MISFIRE';
DELETE From Unit_FreePromotions WHERE UnitType = 'UNIT_AMERICAN_MINUTEMAN' AND PromotionType = 'PROMOTION_ONLY_DEFENSIVE';
DELETE From Unit_FreePromotions WHERE UnitType = 'UNIT_AMERICAN_MINUTEMAN' AND PromotionType = 'PROMOTION_BARRAGE_1';
INSERT INTO Unit_FreePromotions (UnitType, PromotionType) SELECT 'UNIT_AMERICAN_MINUTEMAN', 'PROMOTION_DRILL_1';

/*UPDATE Unit_FreePromotions
SET PromotionType = 'PROMOTION_DRILL_1'
WHERE UnitType = 'UNIT_AMERICAN_MINUTEMAN' AND PromotionType = 'PROMOTION_BARRAGE_1';*/

--DELETE FROM Unit_FreePromotions WHERE UnitType IN ('UNIT_AMERICAN_MINUTEMAN') AND PromotionType = 'PROMOTION_ONLY_DEFENSIVE';

-- japan UA
INSERT INTO Trait_BuildsUnitClasses	(TraitType, UnitClassType, BuildType)
VALUES				('TRAIT_FIGHT_WELL_DAMAGED', 'UNITCLASS_EE_CARRACK', 'BUILD_FISHING_BOATS');

-------------------------------------------------------
-- Field Gun and Howitzer
-------------------------------------------------------

UPDATE Units 
SET PrereqTech = 'TECH_EE_FLINTLOCK', ObsoleteTech = 'TECH_RIFLING', Combat = 18, RangedCombat = 35, GoodyHutUpgradeUnitClass = 'UNITCLASS_FIELD_GUN'
WHERE Type = 'UNIT_EE_FIELD_GUN';

INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType, Cost)
VALUES ('UNIT_EE_FIELD_GUN', 'RESOURCE_IRON', 1);

UPDATE UnitClasses
SET Description = 'TXT_KEY_UNIT_FIELD_GUN'
WHERE Type = 'UNITCLASS_FIELD_GUN';

UPDATE Units
SET Description = 'TXT_KEY_UNIT_FIELD_GUN', Civilopedia = 'TXT_KEY_UNIT_FIELD_GUN_PEDIA', Strategy = 'TXT_KEY_UNIT_FIELD_GUN_STRATEGY', Help = 'TXT_KEY_UNIT_FIELD_GUN_HELP'
WHERE Type = 'UNIT_FIELD_GUN';

-- Infixo: Cannon -> Field Gun
UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_EE_FIELD_GUN'
WHERE UnitType IN (SELECT Type FROM Units WHERE Class = 'UNITCLASS_CANNON');

UPDATE Units SET ObsoleteTech = 'TECH_EE_FLINTLOCK' WHERE Class = 'UNITCLASS_CANNON';

-- Infixo: Field Gun -> Howitzer
UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_FIELD_GUN'
WHERE UnitType IN (SELECT Type FROM Units WHERE Class = 'UNITCLASS_EE_FIELD_GUN');

-- Infixo: VP promos
INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
	('UNIT_EE_FIELD_GUN', 'PROMOTION_SIEGE_INACCURACY'),
	('UNIT_EE_FIELD_GUN', 'PROMOTION_COVER_1');
	
-------------------------------------------------------
-- Ships
-------------------------------------------------------

-- Infixo: changed back, in Renaissance all ships could travel through ocean
DELETE FROM Unit_FreePromotions WHERE UnitType IN ('UNIT_EE_CARRACK') AND PromotionType = 'PROMOTION_OCEAN_IMPASSABLE';

UPDATE Units
SET GoodyHutUpgradeUnitClass = 'UNITCLASS_CARAVEL' 
WHERE Class = 'UNITCLASS_TRIREME';

UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_CARAVEL'
WHERE UnitType IN (SELECT Type FROM Units WHERE Class = 'UNITCLASS_TRIREME');

/* Infixo: not necessary
CREATE TRIGGER CBOEE_TriremeCheck
AFTER INSERT ON Units
WHEN 'UNITCLASS_TRIREME' = NEW.Class
BEGIN
	UPDATE Units
	SET GoodyHutUpgradeUnitClass = 'UNITCLASS_CARAVEL'
	WHERE Type = NEW.TYPE;
	
	UPDATE Unit_ClassUpgrades
	SET UnitClassType = 'UNITCLASS_CARAVEL'
	WHERE UnitType = NEW.Type;
END;
*/

UPDATE Units 
-- Infixo: tweaked parameters to be aligned with other Renaissance naval units
SET PrereqTech = 'TECH_ASTRONOMY', ObsoleteTech = 'TECH_NAVIGATION', Combat = 24, Moves = 5, GoodyHutUpgradeUnitClass = 'UNITCLASS_PRIVATEER' -- Corvette
WHERE Type = 'UNIT_EE_CARRACK';

UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_PRIVATEER'
WHERE UnitType IN ('UNIT_EE_CARRACK');

UPDATE Units 
-- Infixo: tweaked parameters to be aligned with other Renaissance naval units
-- SET PrereqTech = 'TECH_ASTRONOMY', GoodyHutUpgradeUnitClass = 'UNITCLASS_PRIVATEER', Combat = 26
SET PrereqTech = 'TECH_ASTRONOMY', GoodyHutUpgradeUnitClass = 'UNITCLASS_PRIVATEER', Combat = 28, Moves = '5'
WHERE Type IN ('UNIT_PORTUGUESE_NAU');

UPDATE Units
SET ObsoleteTech = 'TECH_ASTRONOMY', GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_CARRACK', Combat = 18
WHERE Type = 'UNIT_CARAVEL';

-- Infixo: changed from PRIVATEER to EE_CARRACK
UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_EE_CARRACK'
WHERE UnitType IN ('UNIT_CARAVEL');

-- Infixo: original Great Galleass is too strong
UPDATE Units
SET RangedCombat = '23', Combat = 13
WHERE Type = 'UNIT_VENETIAN_GALLEASS';

UPDATE Units
SET GoodyHutUpgradeUnitClass = 'UNITCLASS_FRIGATE', ObsoleteTech = 'TECH_EE_WARSHIPS', RangedCombat = 25, Combat = 15
WHERE Type = 'UNIT_EE_GALLEON';

-------------------------------------------------------
-- English First Rate
-- Infixo: First Rate is classic CBP SotL
-------------------------------------------------------
UPDATE Units
SET GoodyHutUpgradeUnitClass = 'UNITCLASS_CRUISER', ObsoleteTech = 'TECH_DYNAMITE', 
	RangedCombat = 30, Range = 2, Combat = 22, Moves = 4, XPValueAttack = 3,
	Class = 'UNITCLASS_FRIGATE', CombatClass = 'UNITCOMBAT_NAVALRANGED', DefaultUnitAI = 'UNITAI_ASSAULT_SEA',
	PrereqTech = 'TECH_NAVIGATION', UnitFlagIconOffset = '52'
WHERE Type = 'UNIT_EE_ENGLISH_FIRST_RATE';

-- Infixo: now replaces Frigate for England
UPDATE Civilization_UnitClassOverrides
SET UnitClassType = 'UNITCLASS_FRIGATE'
WHERE CivilizationType = 'CIVILIZATION_ENGLAND' AND UnitType = 'UNIT_EE_ENGLISH_FIRST_RATE';

-- Infixo: First Rate is Ranged now
UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_CRUISER'
WHERE UnitType IN ('UNIT_EE_ENGLISH_FIRST_RATE');

-------------------------------------------------------
-- Galleon, Frigate and ranged ships
-------------------------------------------------------

UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_FRIGATE'
WHERE UnitType IN ('UNIT_EE_GALLEON');

-- Infixo
UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_EE_GALLEON'
WHERE UnitType IN ('UNIT_VENETIAN_GALLEASS');

UPDATE Units
SET IconAtlas = 'ENLIGHTENMENT_UNIT_ATLAS', PortraitIndex = 7
WHERE Type = 'UNIT_CRUISER';

UPDATE Units
SET GoodyHutUpgradeUnitClass = 'UNITCLASS_CRUISER', PrereqTech = 'TECH_EE_WARSHIPS', ObsoleteTech = 'TECH_DYNAMITE'
WHERE Type = 'UNIT_FRIGATE';

UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_CRUISER'
WHERE UnitType IN ('UNIT_FRIGATE');

UPDATE Units
SET GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_GALLEON', RangedCombat = 20, ObsoleteTech = 'TECH_EE_EXPLORATION'
WHERE Type = 'UNIT_GALLEASS';

UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_EE_GALLEON'
WHERE UnitType IN ('UNIT_GALLEASS');

UPDATE Units
SET ObsoleteTech = 'TECH_INDUSTRIALIZATION', Combat = 35
WHERE Type = 'UNIT_EE_SHIP_OF_THE_LINE';

/*UPDATE Units
SET GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_SHIP_OF_THE_LINE'
WHERE Type = 'UNIT_PRIVATEER'; -- Corvette

UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_EE_SHIP_OF_THE_LINE'
WHERE UnitType IN ('UNIT_PRIVATEER');
*/

UPDATE Units
SET PrereqTech = 'TECH_EE_EXPLORATION'
WHERE Type = 'UNIT_DUTCH_SEA_BEGGAR';

DELETE FROM Unit_AITypes WHERE UnitType = 'UNIT_EE_GALLEON';

INSERT INTO Unit_AITypes (UnitType, UnitAIType) 
VALUES 	('UNIT_EE_GALLEON', 'UNITAI_ASSAULT_SEA'),
		('UNIT_EE_GALLEON', 'UNITAI_RESERVE_SEA'),
		('UNIT_EE_GALLEON', 'UNITAI_ESCORT_SEA');

UPDATE Units SET Range = 2, DefaultUnitAI = 'UNITAI_ASSAULT_SEA' 
WHERE Type = 'UNIT_EE_GALLEON';

UPDATE Units SET CombatClass = 'UNITCOMBAT_NAVALRANGED' WHERE Type = 'UNIT_EE_GALLEON';

-- Infixo: fixing promotions
INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
	('UNIT_EE_GALLEON', 'PROMOTION_ONLY_DEFENSIVE'),
	('UNIT_EE_SHIP_OF_THE_LINE', 'PROMOTION_EE_FIRST_RATE'),
	('UNIT_EE_SHIP_OF_THE_LINE', 'PROMOTION_EXTRA_SIGHT_I'),
	('UNIT_EE_ENGLISH_FIRST_RATE', 'PROMOTION_LOGISTICS');

-- Infixo: fixing resource requirements
INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType, Cost)
VALUES ('UNIT_FRIGATE', 'RESOURCE_IRON', 1);
	
-------------------------------------------------------
-- Align unit costs and make gold purchases available
-- Guidelines: Cost is 300-450, FaithCost is 250
-------------------------------------------------------

UPDATE Units SET Cost = 250, FaithCost = 250 WHERE Type = 'UNIT_EE_EXPLORER'; -- Renaissance
UPDATE Units SET Cost = 300, FaithCost = 250 WHERE Type = 'UNIT_SPANISH_CONQUISTADOR'; -- replaces LANCER (originally MUSKETMAN)
UPDATE Units SET Cost = 450, FaithCost = 250 WHERE Type = 'UNIT_EE_UHLAN';
UPDATE Units SET Cost = 450, FaithCost = 250 WHERE Type = 'UNIT_RUSSIAN_COSSACK'; -- replaces EE_UHLAN
UPDATE Units SET Cost = 375, FaithCost = 250 WHERE Type = 'UNIT_EE_SKIRMISHER';
UPDATE Units SET Cost = 325, FaithCost = 250 WHERE Type = 'UNIT_EE_LINE_INFANTRY';
UPDATE Units SET Cost = 325, FaithCost = 250 WHERE Type = 'UNIT_AMERICAN_MINUTEMAN'; -- replaces EE_LINE_INF(originally MUSKETMAN)
UPDATE Units SET Cost = 375, FaithCost = 250 WHERE Type = 'UNIT_EE_FIELD_GUN';
UPDATE Units SET Cost = 220, FaithCost =   0 WHERE Type = 'UNIT_EE_CARRACK'; -- Renaissance
UPDATE Units SET Cost = 250, FaithCost =   0 WHERE Type = 'UNIT_EE_GALLEON'; -- Renaissance
UPDATE Units SET Cost = 375, FaithCost =   0 WHERE Type = 'UNIT_EE_ENGLISH_FIRST_RATE'; -- replaces FRIGATE (325p)
UPDATE Units SET Cost = 400, FaithCost =   0 WHERE Type = 'UNIT_EE_SHIP_OF_THE_LINE';
UPDATE Units SET Cost = 425, FaithCost =   0 WHERE Type = 'UNIT_FRIGATE';

INSERT INTO Unit_BuildingClassPurchaseRequireds (UnitType, BuildingClassType)
VALUES
	('UNIT_2HANDER','BUILDINGCLASS_ARMORY'),
	('UNIT_EE_CARRACK','BUILDINGCLASS_HARBOR'),
	('UNIT_EE_GALLEON','BUILDINGCLASS_HARBOR'),
	('UNIT_EE_SHIP_OF_THE_LINE','BUILDINGCLASS_HARBOR'),
	('UNIT_EE_ENGLISH_FIRST_RATE','BUILDINGCLASS_HARBOR'),
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
		where Era in ('ERA_INDUSTRIAL', 'ERA_MODERN'));

insert into Unit_BuildingClassPurchaseRequireds (UnitType, BuildingClassType)
	select Type, 'BUILDINGCLASS_EE_GUNSMITH'
	from Units
	where (CombatClass = 'UNITCOMBAT_ARMOR' or CombatClass = 'UNITCOMBAT_GUN' or CombatClass = 'UNITCOMBAT_SIEGE') and PrereqTech in(
		select Type
		from Technologies
		where Era in ('ERA_INDUSTRIAL', 'ERA_MODERN'));
