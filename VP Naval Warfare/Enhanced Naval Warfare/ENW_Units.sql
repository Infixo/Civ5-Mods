----------------------------------------------------
-- Enhanced Modern Warfare
-- Changes to existing units and integrating new units
-- Author: Infixo
-- Feb 16, 2017: Created
----------------------------------------------------

----------------------------------------------------
-- Missile Cruiser
-- Original MC gets a new model (Kirov) and a new Flag
----------------------------------------------------

UPDATE ArtDefine_UnitMemberInfos
SET Model = 'kirov.fxsxml'
WHERE Type = 'ART_DEF_UNIT_MEMBER_MISSILECRUISER';

UPDATE ArtDefine_StrategicView
SET Asset = 'SV_ENW_MissileCruiser.dds'
WHERE StrategicViewType = 'ART_DEF_UNIT_MISSILE_CRUISER';

--INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn)
--VALUES ('UNIT_MISSILE_CRUISER_EMW_FLAG_ATLAS', 32, 'UnitFlag_EMW_MissileCruiser.dds', '1', '1');

UPDATE Units
SET UnitFlagAtlas = 'FLAG_ATLAS_ENW', UnitFlagIconOffset = 3, CombatClass = 'UNITCOMBAT_NAVALRANGED',
	Combat = 55, RangedCombat = 80, Range = 2, Cost = 2800, ExtraMaintenanceCost = 2
WHERE Type = 'UNIT_MISSILE_CRUISER';

-- other gameplay changes will follow
--UPDATE Units SET Cost = 650 WHERE Type = 'UNIT_MISSILE_CRUISER';
--DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_MISSILE_CRUISER'; -- own promotion class
--INSERT INTO Unit_FreePromotions (UnitType, PromotionType) VALUES ('UNIT_MISSILE_CRUISER', 'PROMOTION_MISSILE_CRUISER');

INSERT INTO Unit_ClassUpgrades (UnitType, UnitClassType)
VALUES ('UNIT_BATTLESHIP', 'UNITCLASS_MISSILE_CRUISER');

DELETE FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_MISSILE_CRUISER';
INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType, Cost)
VALUES ('UNIT_MISSILE_CRUISER', 'RESOURCE_ALUMINUM', 1);

DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_MISSILE_CRUISER';
INSERT INTO Unit_FreePromotions	(UnitType, PromotionType)
VALUES
	('UNIT_MISSILE_CRUISER', 'PROMOTION_SEE_INVISIBLE_SUBMARINE'),
	('UNIT_MISSILE_CRUISER', 'PROMOTION_ANTI_SUBMARINE_I'),  -- 33%
	('UNIT_MISSILE_CRUISER', 'PROMOTION_INDIRECT_FIRE'),
	('UNIT_MISSILE_CRUISER', 'PROMOTION_CAN_MOVE_AFTER_ATTACKING'),
	('UNIT_MISSILE_CRUISER', 'PROMOTION_CARGO_III'),  -- NuclearSub and MisDestr has 2 cargo
	('UNIT_MISSILE_CRUISER', 'PROMOTION_INTERCEPTION_III');  -- 50%
	--('UNIT_MISSILE_CRUISER', 'PROMOTION_CARGO_EXTRA2');

-- Polynesian UA no longer applies to Missile Cruiser
DELETE FROM Trait_BuildsUnitClasses
WHERE TraitType = 'TRAIT_WAYFINDING' AND UnitClassType = 'UNITCLASS_MISSILE_CRUISER';
	
UPDATE Language_en_US
SET Text = 'Most powerful Naval Ranged unit specialized in warding off enemy aircrafts and hunting submarines. Carries 3 Missiles. Requires [ICON_RES_ALUMINUM] Aluminum to be built.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_MISSILE_CRUISER';

INSERT INTO Technology_Flavors (TechType, FlavorType, Flavor)
VALUES
	('TECH_STEALTH', 'FLAVOR_NAVAL', 10),
	('TECH_STEALTH', 'FLAVOR_NAVAL_RECON', 5);

----------------------------------------------------
-- Battleship & Cruiser
----------------------------------------------------

UPDATE Units
SET Combat = 45 -- , ObsoleteTech = 'TECH_STEALTH'
WHERE Type = 'UNIT_BATTLESHIP';
/*
DELETE FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_BATTLESHIP';
INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType, Cost)
VALUES
	('UNIT_BATTLESHIP', 'RESOURCE_OIL', 1),
	('UNIT_BATTLESHIP', 'RESOURCE_IRON', 1);
*/	
UPDATE Language_en_US
SET Text = 'Very powerful ranged Naval unit, the first one capable of indirect fire.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_BATTLESHIP';

UPDATE Units
SET ObsoleteTech = 'TECH_RADIO'
WHERE Type = 'UNIT_CRUISER';
/*
DELETE FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_CRUISER';
INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType, Cost)
VALUES
	('UNIT_CRUISER', 'RESOURCE_COAL', 1),
	('UNIT_CRUISER', 'RESOURCE_IRON', 1);
*/

----------------------------------------------------
-- Destroyer & Ironclad
----------------------------------------------------

-- Name change
-- Although the term "destroyer" had been used interchangeably with "torpedo boat destroyer" by navies since 1892,
-- the term "torpedo boat destroyer" had been generally shortened to simply "destroyer" by nearly all navies by the First World War.
-- So, a new unit EARLY_DESTROYER from Modern Era will be named "Destroyer", and vanilla game Destroyer
-- since it represents Atomic Era will be named "Modern Destroyer"
UPDATE Language_en_US
SET Text = 'Modern Destroyer'
WHERE Tag = 'TXT_KEY_UNIT_DESTROYER';

-- ...and we get a much better model
UPDATE ArtDefine_UnitMemberInfos
SET Model = 'Z_Class.fxsxml', Scale = 0.10
WHERE Type = 'ART_DEF_UNIT_MEMBER_DESTROYER';

--UPDATE Units
--SET ObsoleteTech = 'TECH_LASERS'
--WHERE Type = 'UNIT_DESTROYER';
/*
DELETE FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_DESTROYER';
INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType, Cost)
VALUES
	('UNIT_DESTROYER', 'RESOURCE_OIL', 1),
	('UNIT_DESTROYER', 'RESOURCE_IRON', 1);
*/

UPDATE Units
SET ObsoleteTech = 'TECH_COMBUSTION'
WHERE Type = 'UNIT_IRONCLAD';
/*
DELETE FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_IRONCLAD';
INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType, Cost)
VALUES
	('UNIT_IRONCLAD', 'RESOURCE_COAL', 1),
	('UNIT_IRONCLAD', 'RESOURCE_IRON', 1);
*/

----------------------------------------------------
-- Submarines and Carrier
----------------------------------------------------

UPDATE Units
SET Combat = 29, Moves = 4, RangedCombat = 40, Range = 1, Cost = 1200, FaithCost = 800, PrereqTech = 'TECH_ELECTRICITY', ObsoleteTech = 'TECH_PENICILIN'
WHERE Type = 'UNIT_SUBMARINE';

DELETE FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_SUBMARINE';
INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType, Cost)
VALUES ('UNIT_SUBMARINE', 'RESOURCE_OIL', 1);

UPDATE Units
SET RangedCombat = 60, PrereqTech = 'TECH_ROBOTICS', ExtraMaintenanceCost = 1 -- Cost = 2250
WHERE Type = 'UNIT_NUCLEAR_SUBMARINE';
/*
DELETE FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_NUCLEAR_SUBMARINE';
INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType, Cost)
VALUES ('UNIT_NUCLEAR_SUBMARINE', 'RESOURCE_URANIUM', 1);
*/
UPDATE Units
SET Combat = 50  -- Cannot make obsolete, not everyone will want Supercarrier, ObsoleteTech = 'TECH_ROBOTICS'
WHERE Type = 'UNIT_CARRIER';

----------------------------------------------------
-- Missiles
----------------------------------------------------

UPDATE Units
SET PrereqTech = 'TECH_ADVANCED_BALLISTICS' -- RangedCombat = 120, Cost = 1000, was TECH_ROCKETRY
WHERE Type = 'UNIT_GUIDED_MISSILE';

UPDATE ArtDefine_UnitMemberCombats
SET AttackAltitude = 90, MoveRate = 4.8
WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GUIDEDMISSILE';

UPDATE ArtDefine_UnitMemberCombatWeapons
SET WeaponTypeSoundOverrideTag = 'EXPLOSION1TON'
WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GUIDEDMISSILE';
/*
DELETE FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_GUIDED_MISSILE';
INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType, Cost)
VALUES ('UNIT_GUIDED_MISSILE', 'RESOURCE_OIL', 1);

UPDATE Language_en_US
SET Text = 'Cruise Missile'
WHERE Tag = 'TXT_KEY_UNIT_GUIDED_MISSILE';

UPDATE Language_en_US
SET Text = 'A reasonably cheap Unit that may be used once to damage enemy Units or Cities. It requires [ICON_RES_OIL] Oil to be built.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_GUIDED_MISSILE';
*/
----------------------------------------------------
-- Ship re-scaling
----------------------------------------------------

UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.095 WHERE Type = 'ART_DEF_UNIT_MEMBER_MISSILECRUISER'; -- org. 0.11
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.105 WHERE Type = 'ART_DEF_UNIT_MEMBER_IRONCLAD'; -- org. 0.12
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.075 WHERE Type = 'ART_DEF_UNIT_MEMBER_CRUISER'; -- org. 0.098
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.10  WHERE Type = 'ART_DEF_UNIT_MEMBER_BATTLESHIP'; -- org. 0.09
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.13  WHERE Type = 'ART_DEF_UNIT_MEMBER_SUBMARINE'; -- org. 0.16
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.115 WHERE Type = 'ART_DEF_UNIT_MEMBER_NUCLEARSUBMARINE'; -- org. 0.10
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.10  WHERE Type = 'ART_DEF_UNIT_MEMBER_CARRIER'; -- org. 0.09

----------------------------------------------------
-- Re-balancing aircrafts
----------------------------------------------------
/*
-- fighters
UPDATE Units SET Cost = 1000, Range = 4	WHERE Type = 'UNIT_TRIPLANE'; -- was 5
UPDATE Units SET Cost = 1700, Range = 5	WHERE Type = 'UNIT_FIGHTER'; -- was 6
UPDATE Units SET Cost = 1700, Range = 5	WHERE Type = 'UNIT_JAPANESE_ZERO'; -- was 6
UPDATE Units SET Cost = 2200, Range = 7	WHERE Type = 'UNIT_JET_FIGHTER'; -- was 8
-- fighters
UPDATE Units SET Cost = 1000, RangedCombat = 45	WHERE Type = 'UNIT_TRIPLANE'; -- was 50
UPDATE Units SET Cost = 1700, RangedCombat = 60	WHERE Type = 'UNIT_FIGHTER'; -- was 65
UPDATE Units SET Cost = 1700, RangedCombat = 65	WHERE Type = 'UNIT_JAPANESE_ZERO'; -- was 70
UPDATE Units SET Cost = 2200, RangedCombat = 75	WHERE Type = 'UNIT_JET_FIGHTER'; -- was 80
-- bombers
UPDATE Units SET Cost = 1200, Range = 6			WHERE Type = 'UNIT_WWI_BOMBER'; -- was 5
UPDATE Units SET Cost = 1900, Range = 7			WHERE Type = 'UNIT_BOMBER'; -- was 6
UPDATE Units SET Cost = 1900, Range = 9			WHERE Type = 'UNIT_AMERICAN_B17'; -- was 8
UPDATE Units SET Cost = 2700, RangedCombat = 85	WHERE Type = 'UNIT_STEALTH_BOMBER'; -- was 80
(/
*/

----------------------------------------------------
-- Vox Populi fixes - will be removed if incorporated into VP
----------------------------------------------------

-- moved Oil Reveal
UPDATE Technology_Flavors SET TechType = 'TECH_COMBUSTION' WHERE TechType = 'TECH_BIOLOGY' AND FlavorType = 'FLAVOR_AIR';
-- moved Carrier
UPDATE Technology_Flavors SET TechType = 'TECH_COMPUTERS' WHERE TechType = 'TECH_ELECTRONICS' AND FlavorType = 'FLAVOR_AIR_CARRIER';
-- moved Destroyer, leave old entry for Early Destroyer, set new entry for Destroyer
--UPDATE Technology_Flavors SET TechType = 'TECH_ROCKETRY' 	WHERE TechType = 'TECH_COMBUSTION' 	AND FlavorType = 'FLAVOR_NAVAL';
INSERT INTO Technology_Flavors (TechType, FlavorType, Flavor) VALUES ('TECH_ROCKETRY', 'FLAVOR_NAVAL', 5);
-- moved Ironclad
UPDATE Technology_Flavors SET TechType = 'TECH_INDUSTRIALIZATION' WHERE TechType = 'TECH_STEAM_POWER' AND FlavorType = 'FLAVOR_NAVAL';
-- new unit Cruiser
INSERT INTO Technology_Flavors (TechType, FlavorType, Flavor) VALUES ('TECH_DYNAMITE', 'FLAVOR_NAVAL', 10); 
INSERT INTO Technology_Flavors (TechType, FlavorType, Flavor) VALUES ('TECH_DYNAMITE', 'FLAVOR_NAVAL_RECON', 5);
-- moved Submarine (after ENW)
UPDATE Technology_Flavors SET TechType = 'TECH_ELECTRICITY' WHERE TechType = 'TECH_REFRIGERATION' AND FlavorType = 'FLAVOR_NAVAL';
-- moved NuclearSub
UPDATE Technology_Flavors SET Flavor = 10 WHERE TechType = 'TECH_ROBOTICS' AND FlavorType = 'FLAVOR_NAVAL';
