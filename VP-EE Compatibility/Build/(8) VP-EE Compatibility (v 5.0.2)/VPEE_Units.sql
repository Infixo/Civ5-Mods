--=====================================================
-- UNITS
--=====================================================


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
SET ObsoleteTech = 'TECH_STEAM_POWER', GoodyHutUpgradeUnitClass = 'UNITCLASS_ZEPPELIN', Combat = 20, BaseSightRange = 3
WHERE Type = 'UNIT_EE_EXPLORER';

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
	('UNIT_EE_EXPLORER', 'PROMOTION_DEFENSIVE_EMBARKATION'),
	('UNIT_EE_EXPLORER', 'PROMOTION_EMBARKED_SIGHT'),
	('UNIT_EE_EXPLORER', 'PROMOTION_SCOUT_GOODY_BONUS'),
	('UNIT_EE_EXPLORER', 'PROMOTION_RECON_EXPERIENCE'),
	('UNIT_EE_EXPLORER', 'PROMOTION_BARBARIAN_PENALTY_III');

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

-------------------------------------------------------
-- Heavy Skirmisher upgrade
-------------------------------------------------------
UPDATE Units
SET ObsoleteTech = 'TECH_METALLURGY', GoodyHutUpgradeUnitClass = 'UNITCLASS_CUIRASSIER' 
WHERE Class = 'UNITCLASS_MOUNTED_BOWMAN';

UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_CUIRASSIER'
WHERE UnitType IN (SELECT Type FROM Units WHERE Class = 'UNITCLASS_MOUNTED_BOWMAN');

-------------------------------------------------------
-- Knight upgrade (revert to original CBO)
-------------------------------------------------------
UPDATE Units
SET ObsoleteTech = 'TECH_EE_EXPLORATION', GoodyHutUpgradeUnitClass = 'UNITCLASS_LANCER' 
WHERE Class = 'UNITCLASS_KNIGHT';

UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_LANCER'
WHERE UnitType IN (SELECT Type FROM Units WHERE Class = 'UNITCLASS_KNIGHT');

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
INSERT INTO Unit_AITypes (UnitType, UnitAIType)
VALUES
	('UNIT_RUSSIAN_COSSACK', 'UNITAI_FAST_ATTACK'),
	('UNIT_RUSSIAN_COSSACK', 'UNITAI_DEFENSE');

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

UPDATE Units SET PrereqTech = 'TECH_RIFLING', ObsoleteTech = 'TECH_COMBUSTION', GoodyHutUpgradeUnitClass = 'UNITCLASS_WWI_TANK', Combat = 40, BaseLandAirDefense = 2
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
	
INSERT INTO Unit_FreePromotions (UnitType, PromotionType)
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
UPDATE Civilization_UnitClassOverrides Set UnitClassType = 'UNITCLASS_EE_LINE_INFANTRY' WHERE UnitType = 'UNIT_AMERICAN_MINUTEMAN';

UPDATE Units 
SET Class = 'UNITCLASS_EE_LINE_INFANTRY', CombatClass = 'UNITCOMBAT_GUN', GoodyHutUpgradeUnitClass = 'UNITCLASS_RIFLEMAN',
	Combat = 30, Range = 0, RangedCombat = 0, 
	PrereqTech = 'TECH_EE_FLINTLOCK', ObsoleteTech = 'TECH_REPLACEABLE_PARTS', DefaultUnitAI = 'UNITAI_DEFENSE'
WHERE Type = 'UNIT_AMERICAN_MINUTEMAN';

UPDATE Unit_ClassUpgrades SET UnitClassType = 'UNITCLASS_RIFLEMAN' WHERE UnitType = 'UNIT_AMERICAN_MINUTEMAN';

DELETE FROM Unit_AITypes WHERE UnitType = 'UNIT_AMERICAN_MINUTEMAN';
INSERT INTO Unit_AITypes (UnitType, UnitAIType) SELECT 'UNIT_AMERICAN_MINUTEMAN', 'UNITAI_EXPLORE';
INSERT INTO Unit_AITypes (UnitType, UnitAIType) SELECT 'UNIT_AMERICAN_MINUTEMAN', 'UNITAI_ATTACK';
INSERT INTO Unit_AITypes (UnitType, UnitAIType) SELECT 'UNIT_AMERICAN_MINUTEMAN', 'UNITAI_DEFENSE';

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
	('UNIT_EE_FIELD_GUN', 'PROMOTION_NAVAL_MISFIRE'),
	('UNIT_EE_FIELD_GUN', 'PROMOTION_INDIRECT_FIRE'),
	('UNIT_EE_FIELD_GUN', 'PROMOTION_COVER_1');
	
-------------------------------------------------------
-- Trireme, Carrack, Caravel
-------------------------------------------------------

-- Infixo: changed back, in Renaissance all ships could travel through ocean
DELETE FROM Unit_FreePromotions WHERE UnitType IN ('UNIT_EE_CARRACK') AND PromotionType = 'PROMOTION_OCEAN_IMPASSABLE';

UPDATE Units
SET GoodyHutUpgradeUnitClass = 'UNITCLASS_CARAVEL' 
WHERE Class = 'UNITCLASS_TRIREME';

UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_CARAVEL'
WHERE UnitType IN (SELECT Type FROM Units WHERE Class = 'UNITCLASS_TRIREME');

UPDATE Units 
-- Infixo: tweaked parameters to be aligned with other Renaissance naval units
SET PrereqTech = 'TECH_ASTRONOMY', ObsoleteTech = 'TECH_NAVIGATION', Combat = 30, Moves = 5, GoodyHutUpgradeUnitClass = 'UNITCLASS_PRIVATEER' -- Corvette
WHERE Type = 'UNIT_EE_CARRACK';

UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_PRIVATEER'
WHERE UnitType = 'UNIT_EE_CARRACK';

UPDATE Units 
-- Infixo: tweaked parameters to be aligned with other Renaissance naval units
-- SET PrereqTech = 'TECH_ASTRONOMY', GoodyHutUpgradeUnitClass = 'UNITCLASS_PRIVATEER', Combat = 26
SET PrereqTech = 'TECH_ASTRONOMY', GoodyHutUpgradeUnitClass = 'UNITCLASS_PRIVATEER', Combat = 32, Moves = '5'
WHERE Type = 'UNIT_PORTUGUESE_NAU';

UPDATE Units
SET ObsoleteTech = 'TECH_ASTRONOMY', GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_CARRACK', Combat = 24
WHERE Type = 'UNIT_CARAVEL';

-- Infixo: changed from PRIVATEER to EE_CARRACK
UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_EE_CARRACK'
WHERE UnitType = 'UNIT_CARAVEL';

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
SET GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_GALLEON', RangedCombat = 20, ObsoleteTech = 'TECH_EE_EXPLORATION'
WHERE Type = 'UNIT_GALLEASS';

UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_EE_GALLEON'
WHERE UnitType = 'UNIT_GALLEASS';

UPDATE Units
SET GoodyHutUpgradeUnitClass = 'UNITCLASS_FRIGATE', ObsoleteTech = 'TECH_EE_WARSHIPS',
	RangedCombat = 26, Combat = 16, Range = 1, CombatClass = 'UNITCOMBAT_NAVALRANGED', DefaultUnitAI = 'UNITAI_ASSAULT_SEA' 
WHERE Type = 'UNIT_EE_GALLEON';

UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_FRIGATE'
WHERE UnitType = 'UNIT_EE_GALLEON';

INSERT INTO Unit_FreePromotions (UnitType, PromotionType)
VALUES
	('UNIT_EE_GALLEON', 'PROMOTION_ONLY_DEFENSIVE'),
	('UNIT_EE_GALLEON', 'PROMOTION_CAN_MOVE_AFTER_ATTACKING');

DELETE FROM Unit_AITypes WHERE UnitType = 'UNIT_EE_GALLEON';
INSERT INTO Unit_AITypes (UnitType, UnitAIType) 
VALUES
	('UNIT_EE_GALLEON', 'UNITAI_ASSAULT_SEA'),
	('UNIT_EE_GALLEON', 'UNITAI_RESERVE_SEA'),
	('UNIT_EE_GALLEON', 'UNITAI_ESCORT_SEA');

-- Infixo: original Great Galleass is too strong
UPDATE Units
SET RangedCombat = 23, Combat = 13
WHERE Type = 'UNIT_VENETIAN_GALLEASS';

UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_EE_GALLEON'
WHERE UnitType = 'UNIT_VENETIAN_GALLEASS';

UPDATE Units
SET GoodyHutUpgradeUnitClass = 'UNITCLASS_CRUISER', PrereqTech = 'TECH_EE_WARSHIPS', ObsoleteTech = 'TECH_DYNAMITE'
WHERE Type = 'UNIT_FRIGATE';

UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_CRUISER'
WHERE UnitType = 'UNIT_FRIGATE';

-- Infixo: fixing resource requirements
-- VP removed Iron req from Ships before Industrial Era
-- INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType, Cost)
-- VALUES ('UNIT_FRIGATE', 'RESOURCE_IRON', 1);

UPDATE Units
SET IconAtlas = 'ENLIGHTENMENT_UNIT_ATLAS', PortraitIndex = 7
WHERE Type = 'UNIT_CRUISER';

-------------------------------------------------------
-- Ship of the Line
-------------------------------------------------------

UPDATE Units
SET ObsoleteTech = 'TECH_INDUSTRIALIZATION', Combat = 40, GoodyHutUpgradeUnitClass = 'UNITCLASS_IRONCLAD'
WHERE Type = 'UNIT_EE_SHIP_OF_THE_LINE';

INSERT INTO Unit_FreePromotions (UnitType, PromotionType)
VALUES
	('UNIT_EE_SHIP_OF_THE_LINE', 'PROMOTION_EE_FIRST_RATE'),
	('UNIT_EE_SHIP_OF_THE_LINE', 'PROMOTION_EXTRA_SIGHT_I');
	
-- Infixo: VP removed Iron req from ships before Industrial Era
DELETE FROM Unit_ResourceQuantityRequirements
WHERE UnitType = 'UNIT_EE_SHIP_OF_THE_LINE';

-------------------------------------------------------
-- Align flavors
-------------------------------------------------------

UPDATE Unit_Flavors SET Flavor =  5 WHERE UnitType = 'UNIT_EE_FIELD_GUN' AND FlavorType = 'FLAVOR_OFFENSE';
UPDATE Unit_Flavors SET Flavor = 13 WHERE UnitType = 'UNIT_EE_LINE_INFANTRY' AND FlavorType = 'FLAVOR_OFFENSE';

UPDATE Unit_Flavors SET Flavor = 20 WHERE UnitType = 'UNIT_EE_CARRACK' AND FlavorType = 'FLAVOR_NAVAL';
UPDATE Unit_Flavors SET Flavor = 25 WHERE UnitType = 'UNIT_EE_CARRACK' AND FlavorType = 'FLAVOR_NAVAL_RECON';

UPDATE Unit_Flavors SET Flavor = 25 WHERE UnitType = 'UNIT_EE_GALLEON' AND FlavorType = 'FLAVOR_NAVAL';
UPDATE Unit_Flavors SET Flavor = 13 WHERE UnitType = 'UNIT_EE_GALLEON' AND FlavorType = 'FLAVOR_NAVAL_RECON';

UPDATE Unit_Flavors SET Flavor = 25 WHERE UnitType = 'UNIT_EE_SHIP_OF_THE_LINE' AND FlavorType = 'FLAVOR_NAVAL';
UPDATE Unit_Flavors SET Flavor = 25 WHERE UnitType = 'UNIT_EE_SHIP_OF_THE_LINE' AND FlavorType = 'FLAVOR_NAVAL_RECON';

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

		
-------------------------------------------------------
-- Clean-up after 4 not used units
-------------------------------------------------------

-- deleting from UnitClasses
DELETE FROM UnitClasses
WHERE Type IN ('UNITCLASS_EE_SURVEYOR', 'UNITCLASS_EE_CUIRASSIER', 'UNITCLASS_EE_CRUISER', 'UNITCLASS_EE_ENGLISH_FIRST_RATE');
CREATE TABLE IDRemapper (ID INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT);
INSERT INTO IDRemapper (Type) SELECT Type FROM UnitClasses ORDER BY ID;
UPDATE UnitClasses SET ID = (SELECT IDRemapper.ID-1 FROM IDRemapper WHERE UnitClasses.Type = IDRemapper.Type);
DROP TABLE IDRemapper;
UPDATE sqlite_sequence
SET seq = (SELECT COUNT(ID) FROM UnitClasses)-1
WHERE name = 'UnitClasses';

-- delete from Units
DELETE FROM Units
WHERE Type IN ('UNIT_EE_SURVEYOR', 'UNIT_EE_CUIRASSIER', 'UNIT_EE_CRUISER', 'UNIT_EE_ENGLISH_FIRST_RATE');
CREATE TABLE IDRemapper (ID INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT);
INSERT INTO IDRemapper (Type) SELECT Type FROM Units ORDER BY ID;
UPDATE Units SET ID = (SELECT IDRemapper.ID-1 FROM IDRemapper WHERE Units.Type = IDRemapper.Type);
DROP TABLE IDRemapper;
UPDATE sqlite_sequence
SET seq = (SELECT COUNT(ID) FROM Units)-1
WHERE name = 'Units';

DELETE FROM Unit_ClassUpgrades 
WHERE UnitClassType IN ('UNITCLASS_EE_SURVEYOR', 'UNITCLASS_EE_CUIRASSIER', 'UNITCLASS_EE_CRUISER', 'UNITCLASS_EE_ENGLISH_FIRST_RATE');

DELETE FROM Unit_ClassUpgrades 
WHERE UnitType IN ('UNIT_EE_SURVEYOR', 'UNIT_EE_CUIRASSIER', 'UNIT_EE_CRUISER', 'UNIT_EE_ENGLISH_FIRST_RATE');

DELETE FROM Unit_FreePromotions
WHERE UnitType IN ('UNIT_EE_SURVEYOR', 'UNIT_EE_CUIRASSIER', 'UNIT_EE_CRUISER', 'UNIT_EE_ENGLISH_FIRST_RATE');

DELETE FROM Unit_AITypes
WHERE UnitType IN ('UNIT_EE_SURVEYOR', 'UNIT_EE_CUIRASSIER', 'UNIT_EE_CRUISER', 'UNIT_EE_ENGLISH_FIRST_RATE');

DELETE FROM Unit_Flavors
WHERE UnitType IN ('UNIT_EE_SURVEYOR', 'UNIT_EE_CUIRASSIER', 'UNIT_EE_CRUISER', 'UNIT_EE_ENGLISH_FIRST_RATE');

DELETE FROM Unit_ResourceQuantityRequirements
WHERE UnitType IN ('UNIT_EE_SURVEYOR', 'UNIT_EE_CUIRASSIER', 'UNIT_EE_CRUISER', 'UNIT_EE_ENGLISH_FIRST_RATE');

DELETE FROM Unit_BuildingClassPurchaseRequireds
WHERE UnitType IN ('UNIT_EE_SURVEYOR', 'UNIT_EE_CUIRASSIER', 'UNIT_EE_CRUISER', 'UNIT_EE_ENGLISH_FIRST_RATE');

DELETE FROM UnitGameplay2DScripts
WHERE UnitType IN ('UNIT_EE_SURVEYOR', 'UNIT_EE_CUIRASSIER', 'UNIT_EE_CRUISER', 'UNIT_EE_ENGLISH_FIRST_RATE');
