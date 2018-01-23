--==========================================================================================================================
-- TECHNOLOGIES
--==========================================================================================================================

UPDATE Technologies SET EmbarkedMoveChange = 0 WHERE Type = 'TECH_NAVIGATION';
UPDATE Technologies SET EmbarkedMoveChange = 1 WHERE Type = 'TECH_EE_EXPLORATION';

UPDATE Technologies SET InternationalTradeRoutesChange = 1 WHERE Type = 'TECH_EE_MANUFACTURING';
UPDATE Technologies SET InternationalTradeRoutesChange = 0 WHERE Type = 'TECH_ECONOMICS';
UPDATE Technologies SET InternationalTradeRoutesChange = 1 WHERE Type = 'TECH_EE_EXPLORATION';

DELETE FROM Tech_SpecialistYieldChanges WHERE TechType = 'TECH_NAVIGATION' AND SpecialistType = 'SPECIALIST_CIVIL_SERVANT';

INSERT INTO Tech_SpecialistYieldChanges (TechType, SpecialistType, YieldType, Yield)
VALUES
	('TECH_RAILROAD',		'SPECIALIST_MERCHANT',	'YIELD_GOLD', 1),
	('TECH_EE_FORTIFICATION','SPECIALIST_ENGINEER',	'YIELD_PRODUCTION', 1),
	('TECH_EE_HUMANISM',	'SPECIALIST_WRITER',	'YIELD_CULTURE', 1),
	('TECH_EE_ROMANTICISM', 'SPECIALIST_MUSICIAN',	'YIELD_CULTURE', 1),
	('TECH_DYNAMITE',		'SPECIALIST_SCIENTIST',	'YIELD_SCIENCE', 1),
	('TECH_EE_ROMANTICISM',	'SPECIALIST_ARTIST',	'YIELD_CULTURE', 1),
	('TECH_EE_SOVEREIGNTY',	'SPECIALIST_CIVIL_SERVANT', 'YIELD_GOLD', 1);

-- Move Coal to Manufacturing
UPDATE Resources SET TechReveal = 'TECH_EE_MANUFACTURING' WHERE Type = 'RESOURCE_COAL';
UPDATE Resources SET TechCityTrade = 'TECH_EE_MANUFACTURING' WHERE Type = 'RESOURCE_COAL';	

--==========================================================================================================================
-- Eras
--==========================================================================================================================

-- Grid X=8 (REN)
UPDATE Technologies SET Era = 'ERA_RENAISSANCE', GridX='8', GridY='3' WHERE Type = 'TECH_EE_SOVEREIGNTY';
UPDATE Technologies SET Era = 'ERA_RENAISSANCE', GridX='8', GridY='7' WHERE Type = 'TECH_EE_EXPLORATION';

-- Grid X=9 (EE)
UPDATE Technologies SET Era = 'ERA_ENLIGHTENMENT', GridX='9', GridY='2' WHERE Type = 'TECH_EE_HUMANISM';
UPDATE Technologies SET Era = 'ERA_ENLIGHTENMENT', GridX='9', GridY='4' WHERE Type = 'TECH_ECONOMICS';
/*UPDATE Technologies SET Era = 'ERA_ENLIGHTENMENT', GridX='9', GridY='5' WHERE Type = 'TECH_EE_IMPERIALISM';*/
UPDATE Technologies SET Era = 'ERA_ENLIGHTENMENT', GridX='9', GridY='6' WHERE Type = 'TECH_NAVIGATION';
UPDATE Technologies SET Era = 'ERA_ENLIGHTENMENT', GridX='9', GridY='8' WHERE Type = 'TECH_EE_FLINTLOCK';

-- Grid X=10 (EE)
/*UPDATE Technologies SET Era = 'ERA_ENLIGHTENMENT', GridX='10', GridY='1' WHERE Type = 'TECH_EE_NATURAL_HISTORY';*/
UPDATE Technologies SET Era = 'ERA_ENLIGHTENMENT', GridX='10', GridY='2' WHERE Type = 'TECH_SCIENTIFIC_THEORY';
UPDATE Technologies SET Era = 'ERA_ENLIGHTENMENT', GridX='10', GridY='4' WHERE Type = 'TECH_EE_MANUFACTURING';
UPDATE Technologies SET Era = 'ERA_ENLIGHTENMENT', GridX='10', GridY='6' WHERE Type = 'TECH_EE_WARSHIPS';
UPDATE Technologies SET Era = 'ERA_ENLIGHTENMENT', GridX='10', GridY='8' WHERE Type = 'TECH_EE_FORTIFICATION';

-- Grid X=11 (IND)
UPDATE Technologies SET Era = 'ERA_INDUSTRIAL', GridX='11', GridY='2' WHERE Type = 'TECH_EE_ROMANTICISM';
UPDATE Technologies SET Era = 'ERA_INDUSTRIAL', GridX='11', GridY='4' WHERE Type = 'TECH_RAILROAD';
UPDATE Technologies SET Era = 'ERA_INDUSTRIAL', GridX='11', GridY='6' WHERE Type = 'TECH_STEAM_POWER';
UPDATE Technologies SET Era = 'ERA_INDUSTRIAL', GridX='11', GridY='8' WHERE Type = 'TECH_RIFLING';
/*UPDATE Technologies SET Era = 'ERA_INDUSTRIAL', GridX='11', GridY='7' WHERE Type = 'TECH_EE_ARMOUR_PLATING';*/

UPDATE Technologies SET Era = 'ERA_INDUSTRIAL', GridX='12', GridY='1' WHERE Type = 'TECH_ARCHAEOLOGY';
UPDATE Technologies SET Era = 'ERA_INDUSTRIAL', GridX='12', GridY='3' WHERE Type = 'TECH_FERTILIZER';
UPDATE Technologies SET Era = 'ERA_INDUSTRIAL', GridX='12', GridY='5' WHERE Type = 'TECH_INDUSTRIALIZATION';
UPDATE Technologies SET Era = 'ERA_INDUSTRIAL', GridX='12', GridY='7' WHERE Type = 'TECH_DYNAMITE';
UPDATE Technologies SET Era = 'ERA_INDUSTRIAL', GridX='12', GridY='9' WHERE Type = 'TECH_MILITARY_SCIENCE';

UPDATE Technologies SET Era = 'ERA_MODERN', GridX='13', GridY='1' WHERE Type = 'TECH_BIOLOGY';
UPDATE Technologies SET Era = 'ERA_MODERN', GridX='13', GridY='3' WHERE Type = 'TECH_ELECTRICITY';
UPDATE Technologies SET Era = 'ERA_MODERN', GridX='13', GridY='5' WHERE Type = 'TECH_CORPORATIONS';
UPDATE Technologies SET Era = 'ERA_MODERN', GridX='13', GridY='7' WHERE Type = 'TECH_REPLACEABLE_PARTS';
UPDATE Technologies SET Era = 'ERA_MODERN', GridX='13', GridY='9' WHERE Type = 'TECH_COMBUSTION';

UPDATE Technologies SET Era = 'ERA_MODERN', GridX='14', GridY='2' WHERE Type = 'TECH_PLASTICS';
UPDATE Technologies SET Era = 'ERA_MODERN', GridX='14', GridY='4' WHERE Type = 'TECH_RADIO';
UPDATE Technologies SET Era = 'ERA_MODERN', GridX='14', GridY='6' WHERE Type = 'TECH_FLIGHT';
UPDATE Technologies SET Era = 'ERA_MODERN', GridX='14', GridY='8' WHERE Type = 'TECH_BALLISTICS';

UPDATE Technologies SET Era = 'ERA_POSTMODERN', GridX='15', GridY='1' WHERE Type = 'TECH_PENICILIN';
UPDATE Technologies SET Era = 'ERA_POSTMODERN', GridX='15', GridY='3' WHERE Type = 'TECH_REFRIGERATION';
UPDATE Technologies SET Era = 'ERA_POSTMODERN', GridX='15', GridY='5' WHERE Type = 'TECH_ATOMIC_THEORY';
UPDATE Technologies SET Era = 'ERA_POSTMODERN', GridX='15', GridY='7' WHERE Type = 'TECH_ROCKETRY';
UPDATE Technologies SET Era = 'ERA_POSTMODERN', GridX='15', GridY='9' WHERE Type = 'TECH_COMBINED_ARMS';

UPDATE Technologies SET Era = 'ERA_POSTMODERN', GridX='16', GridY='2' WHERE Type = 'TECH_ELECTRONICS';
UPDATE Technologies SET Era = 'ERA_POSTMODERN', GridX='16', GridY='4' WHERE Type = 'TECH_COMPUTERS';
UPDATE Technologies SET Era = 'ERA_POSTMODERN', GridX='16', GridY='6' WHERE Type = 'TECH_NUCLEAR_FISSION';
UPDATE Technologies SET Era = 'ERA_POSTMODERN', GridX='16', GridY='8' WHERE Type = 'TECH_RADAR';

UPDATE Technologies SET Era = 'ERA_FUTURE', GridX='17', GridY='1' WHERE Type = 'TECH_ECOLOGY';
UPDATE Technologies SET Era = 'ERA_FUTURE', GridX='17', GridY='3' WHERE Type = 'TECH_TELECOM';
UPDATE Technologies SET Era = 'ERA_FUTURE', GridX='17', GridY='5' WHERE Type = 'TECH_SATELLITES';
UPDATE Technologies SET Era = 'ERA_FUTURE', GridX='17', GridY='7' WHERE Type = 'TECH_ADVANCED_BALLISTICS';
UPDATE Technologies SET Era = 'ERA_FUTURE', GridX='17', GridY='9' WHERE Type = 'TECH_MOBILE_TACTICS';

UPDATE Technologies SET Era = 'ERA_FUTURE', GridX='18', GridY='2' WHERE Type = 'TECH_ROBOTICS';
UPDATE Technologies SET Era = 'ERA_FUTURE', GridX='18', GridY='4' WHERE Type = 'TECH_INTERNET';
UPDATE Technologies SET Era = 'ERA_FUTURE', GridX='18', GridY='6' WHERE Type = 'TECH_LASERS';
UPDATE Technologies SET Era = 'ERA_FUTURE', GridX='18', GridY='8' WHERE Type = 'TECH_STEALTH';

UPDATE Technologies SET Era = 'ERA_FUTURE', GridX='19', GridY='2' WHERE Type = 'TECH_NANOTECHNOLOGY';
UPDATE Technologies SET Era = 'ERA_FUTURE', GridX='19', GridY='4' WHERE Type = 'TECH_PARTICLE_PHYSICS';
UPDATE Technologies SET Era = 'ERA_FUTURE', GridX='19', GridY='6' WHERE Type = 'TECH_GLOBALIZATION';
UPDATE Technologies SET Era = 'ERA_FUTURE', GridX='19', GridY='8' WHERE Type = 'TECH_NUCLEAR_FUSION';

UPDATE Technologies SET GridX='20', GridY='5' WHERE Type = 'TECH_FUTURE_TECH';

--==========================================================================================================================
-- Prereq Technologies
--==========================================================================================================================

-- Fixing imbalanced tech tree routes for outer techs (before Renaissance)
INSERT INTO Technology_PrereqTechs (TechType, PrereqTech)
VALUES
	('TECH_IRON_WORKING', 'TECH_THE_WHEEL'),
	('TECH_SAILING', 'TECH_THE_WHEEL'),
	('TECH_DRAMA', 'TECH_MATHEMATICS'),
	('TECH_METAL_CASTING', 'TECH_MATHEMATICS'),
	('TECH_EDUCATION', 'TECH_ENGINEERING'),
	('TECH_STEEL', 'TECH_ENGINEERING'),
	('TECH_BANKING', 'TECH_GUILDS'),
	('TECH_CHEMISTRY', 'TECH_COMPASS');

-- Grid X=8 (REN)
DELETE FROM Technology_PrereqTechs WHERE TechType = 'TECH_ARCHITECTURE';
DELETE FROM Technology_PrereqTechs WHERE TechType = 'TECH_EE_SOVEREIGNTY';
DELETE FROM Technology_PrereqTechs WHERE TechType = 'TECH_EE_EXPLORATION';

INSERT INTO Technology_PrereqTechs (TechType, PrereqTech)
VALUES
	('TECH_ARCHITECTURE', 'TECH_BANKING'),
	('TECH_ARCHITECTURE', 'TECH_PRINTING_PRESS'),
	('TECH_ARCHITECTURE', 'TECH_ASTRONOMY'), -- fixing imbalanced routes
	('TECH_EE_SOVEREIGNTY', 'TECH_BANKING'),
	('TECH_EE_SOVEREIGNTY', 'TECH_PRINTING_PRESS'),
	('TECH_EE_SOVEREIGNTY', 'TECH_ASTRONOMY'),
	('TECH_EE_EXPLORATION', 'TECH_ASTRONOMY'),
	('TECH_EE_EXPLORATION', 'TECH_GUNPOWDER'),
	('TECH_EE_EXPLORATION', 'TECH_CHEMISTRY'),
	('TECH_METALLURGY', 'TECH_ASTRONOMY'); -- fixing imbalanced routes

-- Grid X=9 (EE)
DELETE FROM Technology_PrereqTechs WHERE TechType IN (
	'TECH_EE_HUMANISM',
	'TECH_ECONOMICS',
	'TECH_NAVIGATION',
	'TECH_EE_FLINTLOCK',
	'TECH_EE_IMPERIALISM');
	
	
INSERT INTO Technology_PrereqTechs (TechType, PrereqTech)
VALUES
	('TECH_EE_HUMANISM', 'TECH_ARCHITECTURE'),
	('TECH_EE_HUMANISM', 'TECH_EE_SOVEREIGNTY'),
	('TECH_EE_HUMANISM', 'TECH_GUNPOWDER'), -- for balanced route
	('TECH_ECONOMICS', 'TECH_EE_SOVEREIGNTY'),
	('TECH_ECONOMICS', 'TECH_ACOUSTICS'),
	('TECH_NAVIGATION', 'TECH_ACOUSTICS'),
	('TECH_NAVIGATION', 'TECH_EE_EXPLORATION'),
	('TECH_EE_FLINTLOCK', 'TECH_PRINTING_PRESS'), -- for balanced route
	('TECH_EE_FLINTLOCK', 'TECH_EE_EXPLORATION'),
	('TECH_EE_FLINTLOCK', 'TECH_METALLURGY');
	
-- Grid X=10 (EE)
DELETE FROM Technology_PrereqTechs WHERE TechType IN (
	'TECH_SCIENTIFIC_THEORY',
	'TECH_EE_MANUFACTURING',
	'TECH_EE_WARSHIPS',
	'TECH_EE_FORTIFICATION');

INSERT INTO Technology_PrereqTechs (TechType, PrereqTech)
VALUES
	('TECH_SCIENTIFIC_THEORY', 'TECH_EE_HUMANISM'),
	('TECH_SCIENTIFIC_THEORY', 'TECH_ECONOMICS'),
	('TECH_SCIENTIFIC_THEORY', 'TECH_NAVIGATION'),
	('TECH_EE_MANUFACTURING', 'TECH_EE_HUMANISM'),
	('TECH_EE_MANUFACTURING', 'TECH_ECONOMICS'),
	('TECH_EE_MANUFACTURING', 'TECH_NAVIGATION'),
	('TECH_EE_WARSHIPS', 'TECH_ECONOMICS'),
	('TECH_EE_WARSHIPS', 'TECH_NAVIGATION'),	
	('TECH_EE_WARSHIPS', 'TECH_EE_FLINTLOCK'),
	('TECH_EE_FORTIFICATION', 'TECH_ECONOMICS'),
	('TECH_EE_FORTIFICATION', 'TECH_NAVIGATION'),
	('TECH_EE_FORTIFICATION', 'TECH_EE_FLINTLOCK');

-- Grid X=11 (IND)
DELETE FROM Technology_PrereqTechs WHERE TechType IN (
	'TECH_EE_ROMANTICISM',
	'TECH_RAILROAD',
	'TECH_STEAM_POWER',
	'TECH_RIFLING');

INSERT INTO Technology_PrereqTechs (TechType, PrereqTech)
VALUES
	('TECH_EE_ROMANTICISM', 'TECH_SCIENTIFIC_THEORY'),
	('TECH_EE_ROMANTICISM', 'TECH_EE_MANUFACTURING'),
	('TECH_EE_ROMANTICISM', 'TECH_EE_WARSHIPS'),
	('TECH_RAILROAD', 'TECH_SCIENTIFIC_THEORY'),
	('TECH_RAILROAD', 'TECH_EE_MANUFACTURING'),
	('TECH_RAILROAD', 'TECH_EE_WARSHIPS'),
	('TECH_STEAM_POWER', 'TECH_EE_MANUFACTURING'),	
	('TECH_STEAM_POWER', 'TECH_EE_WARSHIPS'),
	('TECH_STEAM_POWER', 'TECH_EE_FORTIFICATION'),
	('TECH_RIFLING', 'TECH_EE_MANUFACTURING'),
	('TECH_RIFLING', 'TECH_EE_WARSHIPS'),
	('TECH_RIFLING', 'TECH_EE_FORTIFICATION');

-- Grid X=12 (IND)
DELETE FROM Technology_PrereqTechs WHERE TechType IN (
	'TECH_ARCHAEOLOGY',
	'TECH_FERTILIZER',
	'TECH_INDUSTRIALIZATION',
	'TECH_DYNAMITE',
	'TECH_MILITARY_SCIENCE');
	
INSERT INTO Technology_PrereqTechs (TechType, PrereqTech)
VALUES
	('TECH_ARCHAEOLOGY', 'TECH_EE_ROMANTICISM'),
	('TECH_ARCHAEOLOGY', 'TECH_RAILROAD'),
	('TECH_FERTILIZER', 'TECH_EE_ROMANTICISM'),
	('TECH_FERTILIZER', 'TECH_RAILROAD'),
	('TECH_INDUSTRIALIZATION', 'TECH_RAILROAD'),
	('TECH_INDUSTRIALIZATION', 'TECH_STEAM_POWER'),
	('TECH_DYNAMITE', 'TECH_STEAM_POWER'),
	('TECH_DYNAMITE', 'TECH_RIFLING'),	
	('TECH_MILITARY_SCIENCE', 'TECH_STEAM_POWER'),
	('TECH_MILITARY_SCIENCE', 'TECH_RIFLING');

-- Grid X=13 (MOD)		
DELETE FROM Technology_PrereqTechs WHERE TechType IN (
	'TECH_BIOLOGY',
	'TECH_ELECTRICITY',
	'TECH_REPLACEABLE_PARTS',
	'TECH_COMBUSTION');
	
INSERT INTO Technology_PrereqTechs (TechType, PrereqTech)
VALUES
	('TECH_BIOLOGY', 'TECH_ARCHAEOLOGY'),
	('TECH_BIOLOGY', 'TECH_FERTILIZER'),
	('TECH_BIOLOGY', 'TECH_INDUSTRIALIZATION'), -- for balanced route
	('TECH_ELECTRICITY', 'TECH_ARCHAEOLOGY'),
	('TECH_ELECTRICITY', 'TECH_FERTILIZER'),
	('TECH_ELECTRICITY', 'TECH_INDUSTRIALIZATION'),
	('TECH_REPLACEABLE_PARTS', 'TECH_INDUSTRIALIZATION'),
	('TECH_REPLACEABLE_PARTS', 'TECH_DYNAMITE'),	
	('TECH_REPLACEABLE_PARTS', 'TECH_MILITARY_SCIENCE'),
	('TECH_COMBUSTION', 'TECH_INDUSTRIALIZATION'), -- for balanced route
	('TECH_COMBUSTION', 'TECH_DYNAMITE'),
	('TECH_COMBUSTION', 'TECH_MILITARY_SCIENCE');

-- Fixing imbalanced tech tree routes for outer techs (Atomic and Information)
INSERT INTO Technology_PrereqTechs (TechType, PrereqTech)
VALUES
	('TECH_PENICILIN', 'TECH_RADIO'),
	('TECH_COMBINED_ARMS', 'TECH_FLIGHT'),
	('TECH_ECOLOGY', 'TECH_COMPUTERS'),
	('TECH_MOBILE_TACTICS', 'TECH_NUCLEAR_FISSION');

--==========================================================================================================================
-- Flavors
--==========================================================================================================================

INSERT INTO Technology_Flavors (TechType, FlavorType, Flavor)
VALUES
	('TECH_EE_EXPLORATION', 'FLAVOR_RECON', 10),
	('TECH_EE_EXPLORATION', 'FLAVOR_NAVAL_RECON', 10),
	('TECH_EE_EXPLORATION', 'FLAVOR_GOLD', 5),
	('TECH_EE_EXPLORATION', 'FLAVOR_WATER_CONNECTION', 10),
	('TECH_EE_FLINTLOCK', 'FLAVOR_SCIENCE', 8),
	('TECH_EE_FLINTLOCK', 'FLAVOR_DEFENSE', 10),
	('TECH_EE_FLINTLOCK', 'FLAVOR_OFFENSE', 10),
	('TECH_EE_FLINTLOCK', 'FLAVOR_MILITARY_TRAINING', 3),
	('TECH_EE_FLINTLOCK', 'FLAVOR_RANGED', 15),
	('TECH_EE_FORTIFICATION', 'FLAVOR_WONDER', 2),
	('TECH_EE_FORTIFICATION', 'FLAVOR_CITY_DEFENSE', 5),
	('TECH_EE_FORTIFICATION', 'FLAVOR_SCIENCE', 5),
	('TECH_EE_FORTIFICATION', 'FLAVOR_RANGED', 8),
	('TECH_EE_HUMANISM', 'FLAVOR_SCIENCE', 10),
	('TECH_EE_HUMANISM', 'FLAVOR_WONDER', 4),
	('TECH_EE_HUMANISM', 'FLAVOR_CULTURE', 10),
	('TECH_EE_MANUFACTURING', 'FLAVOR_EXPANSION', 5),
	('TECH_EE_MANUFACTURING', 'FLAVOR_GROWTH', 10),
	('TECH_EE_MANUFACTURING', 'FLAVOR_PRODUCTION', 10),
	('TECH_EE_MANUFACTURING', 'FLAVOR_TILE_IMPROVEMENT', 2),
	('TECH_EE_ROMANTICISM', 'FLAVOR_CULTURE', 15),
	('TECH_EE_ROMANTICISM', 'FLAVOR_GOLD', 4),
	('TECH_EE_ROMANTICISM', 'FLAVOR_WONDER', 2),
	('TECH_EE_ROMANTICISM', 'FLAVOR_GROWTH', 2),
	('TECH_EE_SOVEREIGNTY', 'FLAVOR_DIPLOMACY', 4),
	('TECH_EE_SOVEREIGNTY', 'FLAVOR_GREAT_PEOPLE', 3),
	('TECH_EE_SOVEREIGNTY', 'FLAVOR_PRODUCTION', 3),
	('TECH_EE_SOVEREIGNTY', 'FLAVOR_WONDER', 5),
	('TECH_EE_WARSHIPS', 'FLAVOR_NAVAL', 15),
	('TECH_EE_WARSHIPS', 'FLAVOR_MILITARY_TRAINING', 3),
	('TECH_EE_WARSHIPS', 'FLAVOR_NAVAL_RECON', 5),
	('TECH_EE_WARSHIPS', 'FLAVOR_CITY_DEFENSE', 5),
	('TECH_EE_WARSHIPS', 'FLAVOR_WONDER', 2),
	('TECH_EE_WARSHIPS', 'FLAVOR_NAVAL_GROWTH', 5);

--==========================================================================================================================
-- Costs
--==========================================================================================================================

UPDATE Technologies SET Cost =    55 WHERE GridX =  1; --60/35		Ancient: 75 turns
UPDATE Technologies SET Cost =    90 WHERE GridX =  2; --80/55
UPDATE Technologies SET Cost =   130 WHERE GridX =  3; --125/105	Classical: 60 turns
UPDATE Technologies SET Cost =   220 WHERE GridX =  4; --225/175
UPDATE Technologies SET Cost =   350 WHERE GridX =  5; --350/275	Medieval: 55 turns
UPDATE Technologies SET Cost =   600 WHERE GridX =  6; --550/485
UPDATE Technologies SET Cost =  1000 WHERE GridX =  7; --1000/780	Renaissance: 55 turns
UPDATE Technologies SET Cost =  1200 WHERE GridX =  8; --1500/1150
UPDATE Technologies SET Cost =  1500 WHERE GridX =  9; --n/a		Enlightenment: 40 turns
UPDATE Technologies SET Cost =  1800 WHERE GridX = 10; --n/a
UPDATE Technologies SET Cost =  2500 WHERE GridX = 11; --2500/1600	Industrial: 45 turns
UPDATE Technologies SET Cost =  4000 WHERE GridX = 12; --3500/2350
UPDATE Technologies SET Cost =  5000 WHERE GridX = 13; --5500/3100	Modern: 45 turns
UPDATE Technologies SET Cost =  6500 WHERE GridX = 14; --6000/4100
UPDATE Technologies SET Cost =  8000 WHERE GridX = 15; --6500/5100	Atomic: 45 turns
UPDATE Technologies SET Cost = 10000 WHERE GridX = 16; --7500/6400
UPDATE Technologies SET Cost = 12000 WHERE GridX = 17; --8500/7700	Information: 60 turns
UPDATE Technologies SET Cost = 14000 WHERE GridX = 18; --9500/8800
UPDATE Technologies SET Cost = 16000 WHERE GridX = 19; --10000/9500
UPDATE Technologies SET Cost = 20000 WHERE GridX = 20; --11000	Future: 20 turns

--==========================================================================================================================
-- Remove not used Techs
--==========================================================================================================================

DELETE FROM Technologies
WHERE Type IN ('TECH_EE_IMPERIALISM', 'TECH_EE_NATURAL_HISTORY', 'TECH_EE_ARMOUR_PLATING');
CREATE TABLE IDRemapper (ID INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT);
INSERT INTO IDRemapper (Type) SELECT Type FROM Technologies ORDER BY ID;
UPDATE Technologies SET ID = (SELECT IDRemapper.ID-1 FROM IDRemapper WHERE Technologies.Type = IDRemapper.Type);
DROP TABLE IDRemapper;
UPDATE sqlite_sequence
SET seq = (SELECT COUNT(ID) FROM Technologies)-1
WHERE name = 'Technologies';

--==========================================================================================================================
-- Technical Fix for IconHookup error - icon index:	13	icon size:	45	atlas:	TECH_ATLAS_2	image control:	TechIcon
--==========================================================================================================================
UPDATE IconTextureAtlases
SET Atlas = 'TECH_ATLAS_DLC_07'
WHERE Atlas = 'TECH_ATLAS_2' AND Filename = 'TechnologyAtlas45_DLC_07.dds'
