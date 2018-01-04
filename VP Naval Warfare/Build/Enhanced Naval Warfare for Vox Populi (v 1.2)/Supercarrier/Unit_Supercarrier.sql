----------------------------------------------------
-- Enhanced Modern Warfare
-- New unit: Supercarrier
-- Author: Infixo
-- Feb 16, 2017: Created
-- Nov 30, 2017: Balance tweaks
----------------------------------------------------

----------------------------------------------------
-- ArtDef
----------------------------------------------------

INSERT INTO ArtDefine_UnitInfos (Type, DamageStates, Formation)
VALUES ('ART_DEF_UNIT_SUPERCARRIER', 3, '');

INSERT INTO ArtDefine_UnitMemberInfos (Type, Scale , Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_SUPERCARRIER', 0.115, 'Sea', 'USS_Nimitz.fxsxml', 'METAL', 'METALLRG');

INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
VALUES ('ART_DEF_UNIT_SUPERCARRIER', 'ART_DEF_UNIT_MEMBER_SUPERCARRIER', 1);

INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions, DisableActions, HasShortRangedAttack, HasLeftRightAttack, HasRefaceAfterCombat, HasIndependentWeaponFacing, RushAttackFormation)
VALUES (
	'ART_DEF_UNIT_MEMBER_SUPERCARRIER',
	'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady AttackSurfaceToAir', '',
	1, 1, 0, 1, '');

INSERT INTO ArtDefine_UnitMemberCombatWeapons
	(UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, HitEffect, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES
	('ART_DEF_UNIT_MEMBER_SUPERCARRIER', 0, 0, 'ART_DEF_VEFFECT_MECH_ROCKET_PROJECTILE', 25, 50, 5.3, 'ART_DEF_VEFFECT_GUIDED_MISSILE_IMPACT_$(TERRAIN)', 'EXPLOSIVE', 'EXPLOSION200POUND'),
	('ART_DEF_UNIT_MEMBER_SUPERCARRIER', 1, 0, 'ART_DEF_VEFFECT_MECH_ROCKET_PROJECTILE', 25, 50, 5.3, 'ART_DEF_VEFFECT_GUIDED_MISSILE_IMPACT_$(TERRAIN)', 'BULLETHC', 'BULLETHC');

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
VALUES ('ART_DEF_UNIT_SUPERCARRIER', 'Unit', 'SV_Supercarrier.dds');

----------------------------------------------------
-- Icons
----------------------------------------------------
/*
INSERT INTO IconTextureAtlases
	(Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn)
VALUES
	('UNIT_SUPERCARRIER_ICON_ATLAS', 256, 'Icon_Supercarrier256.dds', '1', '1'),
	('UNIT_SUPERCARRIER_ICON_ATLAS', 128, 'Icon_Supercarrier128.dds', '1', '1'),
	('UNIT_SUPERCARRIER_ICON_ATLAS', 80, 'Icon_Supercarrier80.dds', '1', '1'),
	('UNIT_SUPERCARRIER_ICON_ATLAS', 64, 'Icon_Supercarrier64.dds', '1', '1'),
	('UNIT_SUPERCARRIER_ICON_ATLAS', 45, 'Icon_Supercarrier45.dds', '1', '1'),
	('UNIT_SUPERCARRIER_FLAG_ATLAS', 32, 'UnitFlag_Supercarrier.dds', '1', '1');
*/
----------------------------------------------------
-- Unit
----------------------------------------------------

INSERT INTO UnitClasses (Type, Description, MaxPlayerInstances, DefaultUnit)
VALUES ('UNITCLASS_SUPERCARRIER', 'TXT_KEY_UNIT_SUPERCARRIER', 2, 'UNIT_SUPERCARRIER');

INSERT INTO Units
	(Type, Class, Domain, CombatClass, PrereqTech, DefaultUnitAI,
	Description, Civilopedia, Strategy, Help,
	Cost, FaithCost, ExtraMaintenanceCost, Combat, Moves, RangedCombat, Range, AirInterceptRange, BaseSightRange,
	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, Mechanized,
	AdvancedStartCost, MinAreaSize, XPValueAttack, XPValueDefense, MoveRate,
	BaseLandAirDefense, SpecialCargo, DomainCargo, PurchaseCooldown,
	UnitArtInfo, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
VALUES
	('UNIT_SUPERCARRIER', 'UNITCLASS_SUPERCARRIER', 'DOMAIN_SEA', 'UNITCOMBAT_CARRIER', 'TECH_ROBOTICS', 'UNITAI_CARRIER_SEA',
	'TXT_KEY_UNIT_SUPERCARRIER', 'TXT_KEY_UNIT_SUPERCARRIER_PEDIA', 'TXT_KEY_UNIT_SUPERCARRIER_STRATEGY', 'TXT_KEY_UNIT_SUPERCARRIER_HELP',
	4000, 2000, 0, 65, 6, 60, 1, 6, 3, 
	1, 1, 1, 1, 1,
	60, 20, 3, 3, 'BOAT',
	50,'SPECIALUNIT_FIGHTER', 'DOMAIN_AIR', 1,
	'ART_DEF_UNIT_SUPERCARRIER', 'FLAG_ATLAS_ENW', 5, 'ICON_ATLAS_ENW', 5);

INSERT INTO UnitGameplay2DScripts (UnitType, SelectionSound, FirstSelectionSound)
VALUES ('UNIT_SUPERCARRIER', 'AS2D_SELECT_CARRIER', 'AS2D_BIRTH_CARRIER');

INSERT INTO Unit_ClassUpgrades (UnitType, UnitClassType)
VALUES ('UNIT_CARRIER', 'UNITCLASS_SUPERCARRIER');

----------------------------------------------------
-- Promotions
----------------------------------------------------
	
INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
	('UNIT_SUPERCARRIER', 'PROMOTION_ONLY_DEFENSIVE'), -- May Not Melee Attack
	('UNIT_SUPERCARRIER', 'PROMOTION_CAN_MOVE_AFTER_ATTACKING'),
	('UNIT_SUPERCARRIER', 'PROMOTION_CARGO_II'), -- Carriers have Cargo2 promotion + 3 upgrades for Flight Deck
	('UNIT_SUPERCARRIER', 'PROMOTION_CARGO_III'),
	('UNIT_SUPERCARRIER', 'PROMOTION_INTERCEPTION_IV'),
	('UNIT_SUPERCARRIER', 'PROMOTION_AIR_RECON'),
	('UNIT_SUPERCARRIER', 'PROMOTION_SEE_INVISIBLE_SUBMARINE'),
	('UNIT_SUPERCARRIER', 'PROMOTION_ANTI_SUBMARINE_I');  -- +33%

----------------------------------------------------
-- Other features
----------------------------------------------------

INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType, Cost)
VALUES ('UNIT_SUPERCARRIER', 'RESOURCE_URANIUM', 1);

INSERT INTO Unit_BuildingClassPurchaseRequireds (UnitType, BuildingClassType)
VALUES ('UNIT_SUPERCARRIER','BUILDINGCLASS_SEAPORT');

----------------------------------------------------
-- AI
----------------------------------------------------

INSERT INTO Technology_Flavors (TechType, FlavorType, Flavor)
VALUES ('TECH_ROBOTICS', 'FLAVOR_AIR_CARRIER', 10);

INSERT INTO Unit_AITypes (UnitType, UnitAIType)
VALUES ('UNIT_SUPERCARRIER', 'UNITAI_CARRIER_SEA');

INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)
VALUES
	('UNIT_SUPERCARRIER', 'FLAVOR_AIR_CARRIER', 40),
	('UNIT_SUPERCARRIER', 'FLAVOR_NAVAL_RECON', 40);
	
----------------------------------------------------
-- Text (en_US)
----------------------------------------------------

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_UNIT_SUPERCARRIER', 'Supercarrier');

-- Pedia: Historical Info (bottom)
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_UNIT_SUPERCARRIER_PEDIA', 'Supercarrier is an unofficial descriptive term for the largest type of aircraft carrier, typically those displacing over 70,000 tons. Supercarriers are the largest warships ever built.[NEWLINE]The Nimitz-class supercarriers are a class of ten nuclear-powered aircraft carriers in service with the United States Navy. The lead ship of the class is named for World War II United States Pacific Fleet commander Fleet Admiral Chester W. Nimitz, the U.S. Navy''s last fleet admiral. With an overall length of 1,092 ft (333 m) and full-load displacements of over 100,000 tons, they have been the largest warships built and in service, although they are being eclipsed by the upcoming Gerald R. Ford-class aircraft carriers.');

-- Pedia: Strategy (middle)
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_UNIT_SUPERCARRIER_STRATEGY', 'The Supercarrier is a specialized vessel which carries fighter airplanes, bombers (but not stealth bombers), and atomic bombs. The aircrafts it carries make it the most powerful offensive weapon afloat. Defensively, the Supercarrier is much stronger than its predecessor, but should still be escorted by destroyers and submarines. Maximum of 3 units can be built.');

-- Pedia: Game Info (top)
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_UNIT_SUPERCARRIER_HELP', 'Carries 5 aircrafts (up to 8), has air interception range increased to 6 and can detect submarines. Limited to 2 units per player. Requires [ICON_RES_URANIUM] Uranium to be built.');
