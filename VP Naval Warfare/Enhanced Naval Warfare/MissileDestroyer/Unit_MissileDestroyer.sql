----------------------------------------------------
-- Enhanced Modern Warfare
-- New unit: Supercarrier
-- Author: Infixo
-- Feb 16, 2017: Created
----------------------------------------------------

----------------------------------------------------
-- ArtDef
----------------------------------------------------

INSERT INTO ArtDefine_UnitInfos (Type, DamageStates, Formation)
VALUES ('ART_DEF_UNIT_MISSILE_DESTROYER', 3, '');

-- uses vanilla's Missile Cruiser model
INSERT INTO ArtDefine_UnitMemberInfos (Type, Scale , Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_MISSILE_DESTROYER', 0.10, 'Sea', 'MissileCruiser.fxsxml', 'METAL', 'METALLRG');

INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
VALUES ('ART_DEF_UNIT_MISSILE_DESTROYER', 'ART_DEF_UNIT_MEMBER_MISSILE_DESTROYER', 1);

INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions, DisableActions, HasShortRangedAttack, HasLeftRightAttack, HasRefaceAfterCombat, HasIndependentWeaponFacing, RushAttackFormation)
VALUES (
	'ART_DEF_UNIT_MEMBER_MISSILE_DESTROYER',
	'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady AttackSurfaceToAir', '',
	1, 1, 0, 1, '');

INSERT INTO ArtDefine_UnitMemberCombatWeapons
	(UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, HitEffect, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES
	('ART_DEF_UNIT_MEMBER_MISSILE_DESTROYER', 0, 0, 'ART_DEF_VEFFECT_MECH_ROCKET_PROJECTILE', 25, 50, 5.3, 'ART_DEF_VEFFECT_GUIDED_MISSILE_IMPACT_$(TERRAIN)', 'EXPLOSIVE', 'EXPLOSION200POUND'),
	('ART_DEF_UNIT_MEMBER_MISSILE_DESTROYER', 1, 0, 'ART_DEF_VEFFECT_MECH_ROCKET_PROJECTILE', 25, 50, 5.3, 'ART_DEF_VEFFECT_GUIDED_MISSILE_IMPACT_$(TERRAIN)', 'BULLETHC', 'BULLETHC');

-- uses vanilla's Missile Cruiser SV icon
INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
VALUES ('ART_DEF_UNIT_MISSILE_DESTROYER', 'Unit', 'SV_MissileCruiser.dds');

----------------------------------------------------
-- Icons
-- uses vanilla's Missile Cruiser flag BUT new icons from shared atlas: ICON_ATLAS_EMW
----------------------------------------------------

----------------------------------------------------
-- Unit
----------------------------------------------------

INSERT INTO UnitClasses (Type, Description, MaxPlayerInstances, DefaultUnit)
VALUES ('UNITCLASS_MISSILE_DESTROYER', 'TXT_KEY_UNIT_MISSILE_DESTROYER', -1, 'UNIT_MISSILE_DESTROYER');

INSERT INTO Units
	(Type, Class, Domain, CombatClass, PrereqTech, DefaultUnitAI,
	Description, Civilopedia, Strategy, Help,
	Cost, FaithCost, ExtraMaintenanceCost, Combat, Moves, RangedCombat, Range, AirInterceptRange, BaseSightRange,
	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, Mechanized,
	AdvancedStartCost, MinAreaSize, XPValueAttack, XPValueDefense, MoveRate,
	BaseLandAirDefense, SpecialCargo, DomainCargo, PurchaseCooldown,
	UnitArtInfo, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
VALUES
	('UNIT_MISSILE_DESTROYER', 'UNITCLASS_MISSILE_DESTROYER', 'DOMAIN_SEA', 'UNITCOMBAT_NAVALMELEE', 'TECH_LASERS', 'UNITAI_ATTACK_SEA',
	'TXT_KEY_UNIT_MISSILE_DESTROYER', 'TXT_KEY_UNIT_MISSILE_DESTROYER_PEDIA', 'TXT_KEY_UNIT_MISSILE_DESTROYER_STRATEGY', 'TXT_KEY_UNIT_MISSILE_DESTROYER_HELP',
	2300, 1300, 1, 80, 6, 0, 0, 4, 2,
	1, 1, 1, 1, 1,
	60, 10, 3, 3, 'BOAT',
	40, 'SPECIALUNIT_MISSILE', 'DOMAIN_AIR', 1,
	'ART_DEF_UNIT_MISSILE_DESTROYER', 'UNIT_FLAG_ATLAS', 80, 'ICON_ATLAS_ENW', 3);

INSERT INTO UnitGameplay2DScripts (UnitType, SelectionSound, FirstSelectionSound)
VALUES ('UNIT_MISSILE_DESTROYER', 'AS2D_SELECT_BATTLESHIP', 'AS2D_BIRTH_BATTLESHIP');

DELETE FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_DESTROYER';
INSERT INTO Unit_ClassUpgrades (UnitType, UnitClassType)
VALUES ('UNIT_DESTROYER', 'UNITCLASS_MISSILE_DESTROYER');

----------------------------------------------------
-- Promotions
-- No special promos
----------------------------------------------------

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
	('UNIT_MISSILE_DESTROYER', 'PROMOTION_SEE_INVISIBLE_SUBMARINE'),
	('UNIT_MISSILE_DESTROYER', 'PROMOTION_INTERCEPTION_III'),  -- 50%
	('UNIT_MISSILE_DESTROYER', 'PROMOTION_CARGO_II'),  -- NucSub has 2, MisCruiser has 3
	('UNIT_MISSILE_DESTROYER', 'PROMOTION_ANTI_SUBMARINE_II'), -- +75%
	('UNIT_MISSILE_DESTROYER', 'PROMOTION_WITHDRAW_BEFORE_MELEE');

----------------------------------------------------
-- Other features
----------------------------------------------------

INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType, Cost)
VALUES ('UNIT_MISSILE_DESTROYER', 'RESOURCE_ALUMINUM', 1);

INSERT INTO Unit_BuildingClassPurchaseRequireds (UnitType, BuildingClassType)
VALUES ('UNIT_MISSILE_DESTROYER','BUILDINGCLASS_SEAPORT');

-- Polynesian UA
INSERT INTO Trait_BuildsUnitClasses	(TraitType, UnitClassType, BuildType)
VALUES ('TRAIT_WAYFINDING', 'UNITCLASS_MISSILE_DESTROYER', 'BUILD_FISHING_BOATS');

----------------------------------------------------
-- AI
----------------------------------------------------

INSERT INTO Technology_Flavors (TechType, FlavorType, Flavor)
VALUES ('TECH_LASERS', 'FLAVOR_NAVAL', 5);

INSERT INTO Unit_AITypes (UnitType, UnitAIType)
VALUES
	('UNIT_MISSILE_DESTROYER', 'UNITAI_ATTACK_SEA'),
	('UNIT_MISSILE_DESTROYER', 'UNITAI_RESERVE_SEA'),
	('UNIT_MISSILE_DESTROYER', 'UNITAI_ESCORT_SEA'),
	('UNIT_MISSILE_DESTROYER', 'UNITAI_EXPLORE_SEA'),
	('UNIT_MISSILE_DESTROYER', 'UNITAI_MISSILE_CARRIER_SEA');

INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)
VALUES
	('UNIT_MISSILE_DESTROYER', 'FLAVOR_NAVAL', 50),
	('UNIT_MISSILE_DESTROYER', 'FLAVOR_NAVAL_RECON', 40);

----------------------------------------------------
-- Text (en_US)
----------------------------------------------------

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_UNIT_MISSILE_DESTROYER', 'Missile Destroyer');

-- Pedia: Historical Info (bottom)
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_UNIT_MISSILE_DESTROYER_PEDIA', 'A Guided-Missile Destroyer (NATO designation "DDG") is a destroyer designed to launch guided missiles. It is usually equipped with two large missile magazines, mostly in vertical-launch cells. In addition to the missiles and guns, many are also equipped to carry out anti-submarine, anti-air, and anti-surface operations. Some contain powerful radar systems and may be adopted for use in an anti-missile or ballistic-missile defense role. This is especially true of navies that do not operate cruisers, as other vessels must be adopted to fill in the gap.');

-- Pedia: Strategy (middle)
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_UNIT_MISSILE_DESTROYER_STRATEGY', 'Missile Destroyer is a contemporary version of a Destroyer that can carry 2 Missiles and has increased air interception range. It requires [ICON_RES_ALUMINUM] Aluminum to be built. It should be used as an attack or an escort unit.');

-- Pedia: Game Info (top)
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_UNIT_MISSILE_DESTROYER_HELP', 'Missile Destroyer can carry 2 Missiles, has increased air interception range and chance, and additional attack strength against submarines. It requires [ICON_RES_ALUMINUM] Aluminum to be built.');
