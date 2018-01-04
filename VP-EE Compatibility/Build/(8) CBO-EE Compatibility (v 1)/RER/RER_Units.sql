/*INSERT INTO Units 
(Class, Type, PrereqTech, Combat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, 
Description, Civilopedia, Strategy, Help, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, GoodyHutUpgradeUnitClass, AdvancedStartCost, 
XPValueAttack, XPValueDefense, Conscription, UnitArtInfo, UnitFlagIconOffset, IconAtlas, PortraitIndex)
VALUES ('UNITCLASS_2HANDER','UNIT_2HANDER','TECH_GUNPOWDER',23,140, 260, 1, 2, 'UNITCOMBAT_MELEE', 'DOMAIN_LAND','UNITAI_ATTACK','TXT_KEY_UNIT_2HANDER',
'TXT_KEY_CIV5_2HANDER_TEXT','TXT_KEY_UNIT_2HANDER_STRATEGY','TXT_KEY_UNIT_HELP_2HANDER',1,1,1, 'TECH_EE_FLINTLOCK','UNITCLASS_EE_LINE_INFANTRY',25,
3,3,3,'ART_DEF_UNIT_2HANDER', 33, 'RER_UNITS_ATLAS', 0);*/

INSERT OR REPLACE INTO UnitPromotions 
			(Type, 								Description, 				Help, 							Sound, 				CannotBeChosen, UpgradeDiscount,	TradeMissionInfluenceModifier,	TradeMissionGoldModifier,	AttackMod,	DefenseMod,	LostWithUpgrade,	PortraitIndex, 	IconAtlas, 						PediaType, 			PediaEntry)
VALUES		('PROMOTION_2HANDER', 	'TXT_KEY_PROMOTION_2HANDER',		'TXT_KEY_PROMOTION_2HANDER_HELP', 	'AS2D_IF_LEVELUP', 	1, 				0,					0,								0,							0, 			0, 			0,					59, 			'ABILITY_ATLAS', 				'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_2HANDER');

INSERT OR REPLACE INTO UnitPromotions_UnitClasses
		(PromotionType,					UnitClassType,			Attack)
VALUES	('PROMOTION_2HANDER', 'UNITCLASS_PIKEMAN',	50),
		('PROMOTION_2HANDER', 'UNITCLASS_SPEARMAN',	50),
		('PROMOTION_2HANDER', 'UNITCLASS_LANDSKNECHT',	50),
		('PROMOTION_2HANDER', 'UNITCLASS_TERCIO',		50);
		
--==========================================================================================================================
-- UnitClasses
--==========================================================================================================================
INSERT INTO UnitClasses 	
			(Type, 					DefaultUnit, 					Description)
VALUES		('UNITCLASS_2HANDER', 	'UNIT_2HANDER', 	'TXT_KEY_UNIT_2HANDER');

UPDATE Units
SET ObsoleteTech = 'TECH_CHEMISTRY', GoodyHutUpgradeUnitClass = 'UNITCLASS_2HANDER'
WHERE Type = 'UNIT_LONGSWORDSMAN';

/*UPDATE Unit_ClassUpgrades
SET UnitClassType= 'UNITCLASS_2HANDER' 
WHERE UnitType='UNIT_LONGSWORDSMAN';*/

UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_2HANDER'
WHERE UnitType IN (SELECT Type FROM Units WHERE Class = 'UNITCLASS_LONGSWORDSMAN' AND Type != 'UNIT_JAPANESE_SAMURAI');

--Trigger
CREATE TRIGGER C15_LongswordsmanCheck
AFTER INSERT ON Units
WHEN 'UNITCLASS_LONGSWORDSMAN' = NEW.Class
BEGIN
	UPDATE Units
	SET ObsoleteTech = 'TECH_CHEMISTRY', GoodyHutUpgradeUnitClass = 'UNITCLASS_2HANDER'
	WHERE Type = NEW.TYPE;
	
	UPDATE Unit_ClassUpgrades
	SET UnitClassType = 'UNIT_RER_2HANDER'
	WHERE UnitType = NEW.Type;
END;
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		('UNIT_2HANDER'), SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_SWORDSMAN');

--==========================================================================================================================
-- ArtDefine_StrategicView
--==========================================================================================================================	
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 			TileType,	Asset)
VALUES		('ART_DEF_UNIT_2HANDER', 		'Unit', 	'2HANDER_SV.dds');

UPDATE ArtDefine_StrategicView
SET Asset = 'Landsknecht_SV.dds'
WHERE StrategicViewType = 'ART_DEF_UNIT_U_GERMAN_LANDSKNECHT';
--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================			
INSERT INTO ArtDefine_UnitInfos 
			(Type, 							DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_2HANDER'),		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_LONGSWORDSMAN');

--==========================================================================================================================
-- ArtDefine_UnitInfoMemberInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,							UnitMemberInfoType,			NumMembers)
SELECT		('ART_DEF_UNIT_2HANDER'),		('ART_DEF_UNIT_MEMBER_2HANDER'),	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_LONGSWORDSMAN');

--==========================================================================================================================
-- ArtDefine_UnitMemberCombats
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,							EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_2HANDER'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_LONGSWORDSMAN');

--==========================================================================================================================
-- ArtDefine_UnitMemberCombatWeapons
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_2HANDER'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, ('METAL'), ('SWORD')
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_LONGSWORDSMAN');

--==========================================================================================================================
-- ArtDefine_UnitMemberInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 										Scale,  ZOffset, Domain, Model, 			MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_2HANDER'),	Scale,	ZOffset, Domain, ('2hswordsman_black.fxsxml'),	('ARMOR'), ('ARMOR')
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_LONGSWORDSMAN');

--==========================================================================================================================
-- IconTextureAtlasesa
--==========================================================================================================================
INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES		('RER_UNITS_ATLAS', 				256, 		'RER_UNITS_atlas_256.dds',			2, 				1),
			('RER_UNITS_ATLAS', 				128, 		'RER_UNITS_atlas_128.dds',			2, 				1),
			('RER_UNITS_ATLAS', 				80, 		'RER_UNITS_atlas_80.dds',				2, 				1),
			('RER_UNITS_ATLAS', 				64, 		'RER_UNITS_atlas_64.dds',				2, 				1),
			('RER_UNITS_ATLAS', 				45, 		'RER_UNITS_atlas_45.dds',				2, 				1),
			('RER_UNIT_FLAG_LANDSKNECHT_ATLAS', 	32, 	'Landsknecht_Flag.dds',		            1, 				1);
			
UPDATE Units 	
SET 	UnitFlagIconOffset = 0, 	UnitFlagAtlas = 'RER_UNIT_FLAG_LANDSKNECHT_ATLAS'
WHERE Type = 'UNIT_GERMAN_LANDSKNECHT';
--==========================================================================================================================
--==========================================================================================================================

UPDATE ArtDefine_UnitMemberInfos
SET Model = 'TER_PIKE_piquero.fxsxml'
WHERE Type = 'ART_DEF_UNIT_MEMBER_U_SPANISH_TERCIO_PIQUERO' ;

UPDATE ArtDefine_UnitMemberInfos
SET Model = 'RER_PIKE.fxsxml'
WHERE Type = 'ART_DEF_UNIT_MEMBER_PIKEMAN' ;

UPDATE Units
SET PortraitIndex = 1, IconAtlas = 'RER_UNITS_ATLAS'
WHERE Type = 'UNIT_CUIRASSIER';



