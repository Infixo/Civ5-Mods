--========================================================================================================================
-- TECHNOLOGIES
--========================================================================================================================

UPDATE Eras SET VassalageEnabled = 1 WHERE Type = 'ERA_MEDIEVAL';

DELETE FROM Technologies WHERE Type = 'TECH_EE_IMPERIALISM';
DELETE FROM Technologies WHERE Type = 'TECH_EE_NATURAL_HISTORY';
DELETE FROM Technologies WHERE Type = 'TECH_EE_ARMOUR_PLATING';

UPDATE Technologies SET EmbarkedMoveChange = 0 WHERE Type = 'TECH_NAVIGATION';
UPDATE Technologies SET EmbarkedMoveChange = 1 WHERE Type = 'TECH_EE_EXPLORATION';

UPDATE Technologies SET InternationalTradeRoutesChange = 1 WHERE Type = 'TECH_EE_MANUFACTURING';
UPDATE Technologies SET InternationalTradeRoutesChange = 0 WHERE Type = 'TECH_ECONOMICS';
UPDATE Technologies SET InternationalTradeRoutesChange = 1 WHERE Type = 'TECH_EE_EXPLORATION';

DELETE FROM Tech_SpecialistYieldChanges WHERE TechType = 'TECH_NAVIGATION' AND SpecialistType = 'SPECIALIST_CIVIL_SERVANT';

INSERT INTO Tech_SpecialistYieldChanges
	(TechType, SpecialistType, YieldType, Yield)
VALUES
	('TECH_EE_SOVEREIGNTY',	'SPECIALIST_MERCHANT',	'YIELD_PRODUCTION', 1),
	('TECH_EE_FORTIFICATION','SPECIALIST_ENGINEER',	'YIELD_SCIENCE', 1),
	('TECH_EE_HUMANISM',	'SPECIALIST_WRITER',	'YIELD_SCIENCE', 1),
	('TECH_EE_ROMANTICISM', 'SPECIALIST_MUSICIAN',	'YIELD_CULTURE', 1),
	('TECH_EE_FLINTLOCK',	'SPECIALIST_SCIENTIST',	'YIELD_SCIENCE', 1),
	('TECH_EE_MANUFACTURING','SPECIALIST_ARTIST',	'YIELD_PRODUCTION', 1),
	('TECH_ECONOMICS',		'SPECIALIST_CIVIL_SERVANT', 'YIELD_GOLD', 2);

-- Move Coal to Manufacturing
UPDATE Resources SET TechReveal = 'TECH_EE_MANUFACTURING' WHERE Type = 'RESOURCE_COAL';
UPDATE Resources SET TechCityTrade = 'TECH_EE_MANUFACTURING' WHERE Type = 'RESOURCE_COAL';	

------------------------
-- Eras
------------------------

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

UPDATE Technologies SET Era = 'ERA_POSTMODERN', GridX='15', GridY='1' WHERE Type = 'TECH_PENICILLIN';
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

--------------------------------------------------------------------------------------------------------------------------
-- Prereq Technologies
--------------------------------------------------------------------------------------------------------------------------

-- Grid X=8 (REN)
DELETE FROM Technology_PrereqTechs WHERE TechType = 'TECH_ARCHITECTURE';
DELETE FROM Technology_PrereqTechs WHERE TechType = 'TECH_EE_SOVEREIGNTY';
DELETE FROM Technology_PrereqTechs WHERE TechType = 'TECH_EE_EXPLORATION';

INSERT INTO Technology_PrereqTechs
	(TechType, PrereqTech)
VALUES
	('TECH_ARCHITECTURE', 'TECH_BANKING'),
	('TECH_ARCHITECTURE', 'TECH_PRINTING_PRESS'),
	('TECH_EE_SOVEREIGNTY', 'TECH_BANKING'),
	('TECH_EE_SOVEREIGNTY', 'TECH_PRINTING_PRESS'),
	('TECH_EE_SOVEREIGNTY', 'TECH_ASTRONOMY'),
	('TECH_EE_EXPLORATION', 'TECH_ASTRONOMY'),
	('TECH_EE_EXPLORATION', 'TECH_GUNPOWDER'),
	('TECH_EE_EXPLORATION', 'TECH_CHEMISTRY');

-- Grid X=9 (EE)
DELETE FROM Technology_PrereqTechs WHERE TechType IN (
	'TECH_EE_HUMANISM',
	'TECH_ECONOMICS',
	'TECH_NAVIGATION',
	'TECH_EE_FLINTLOCK',
	'TECH_EE_IMPERIALISM');
	
	
INSERT INTO Technology_PrereqTechs
	(TechType, PrereqTech)
VALUES
	('TECH_EE_HUMANISM', 'TECH_ARCHITECTURE'),
	('TECH_EE_HUMANISM', 'TECH_EE_SOVEREIGNTY'),
	('TECH_ECONOMICS', 'TECH_EE_SOVEREIGNTY'),
	('TECH_ECONOMICS', 'TECH_ACOUSTICS'),
	('TECH_NAVIGATION', 'TECH_ACOUSTICS'),
	('TECH_NAVIGATION', 'TECH_EE_EXPLORATION'),
	('TECH_EE_FLINTLOCK', 'TECH_EE_EXPLORATION'),
	('TECH_EE_FLINTLOCK', 'TECH_METALLURGY');
	
-- Grid X=10 (EE)
DELETE FROM Technology_PrereqTechs WHERE TechType IN (
	'TECH_SCIENTIFIC_THEORY',
	'TECH_EE_MANUFACTURING',
	'TECH_EE_WARSHIPS',
	'TECH_EE_FORTIFICATION');

INSERT INTO Technology_PrereqTechs
	(TechType, PrereqTech)
VALUES
	('TECH_SCIENTIFIC_THEORY', 'TECH_EE_HUMANISM'),
	('TECH_SCIENTIFIC_THEORY', 'TECH_ECONOMICS'),
	('TECH_EE_MANUFACTURING', 'TECH_EE_HUMANISM'),
	('TECH_EE_MANUFACTURING', 'TECH_ECONOMICS'),
	('TECH_EE_MANUFACTURING', 'TECH_NAVIGATION'),
	('TECH_EE_WARSHIPS', 'TECH_ECONOMICS'),
	('TECH_EE_WARSHIPS', 'TECH_NAVIGATION'),	
	('TECH_EE_WARSHIPS', 'TECH_EE_FLINTLOCK'),
	('TECH_EE_FORTIFICATION', 'TECH_NAVIGATION'),
	('TECH_EE_FORTIFICATION', 'TECH_EE_FLINTLOCK');

-- Grid X=11 (IND)
DELETE FROM Technology_PrereqTechs WHERE TechType IN (
	'TECH_EE_ROMANTICISM',
	'TECH_RAILROAD',
	'TECH_STEAM_POWER',
	'TECH_RIFLING');

INSERT INTO Technology_PrereqTechs
		(TechType, PrereqTech)
VALUES
	('TECH_EE_ROMANTICISM', 'TECH_SCIENTIFIC_THEORY'),
	('TECH_EE_ROMANTICISM', 'TECH_EE_MANUFACTURING'),
	('TECH_RAILROAD', 'TECH_SCIENTIFIC_THEORY'),
	('TECH_RAILROAD', 'TECH_EE_MANUFACTURING'),
	('TECH_RAILROAD', 'TECH_EE_WARSHIPS'),
	('TECH_STEAM_POWER', 'TECH_EE_MANUFACTURING'),	
	('TECH_STEAM_POWER', 'TECH_EE_WARSHIPS'),
	('TECH_STEAM_POWER', 'TECH_EE_FORTIFICATION'),
	('TECH_RIFLING', 'TECH_EE_WARSHIPS'),
	('TECH_RIFLING', 'TECH_EE_FORTIFICATION');

-- Grid X=12 (IND)
DELETE FROM Technology_PrereqTechs WHERE TechType IN (
	'TECH_ARCHAEOLOGY',
	'TECH_FERTILIZER',
	'TECH_INDUSTRIALIZATION',
	'TECH_DYNAMITE',
	'TECH_MILITARY_SCIENCE');
	
INSERT INTO Technology_PrereqTechs
		(TechType, PrereqTech)
VALUES
	('TECH_ARCHAEOLOGY', 'TECH_EE_ROMANTICISM'),
	('TECH_FERTILIZER', 'TECH_EE_ROMANTICISM'),
	('TECH_FERTILIZER', 'TECH_RAILROAD'),
	('TECH_INDUSTRIALIZATION', 'TECH_RAILROAD'),
	('TECH_INDUSTRIALIZATION', 'TECH_STEAM_POWER'),
	('TECH_DYNAMITE', 'TECH_STEAM_POWER'),
	('TECH_DYNAMITE', 'TECH_RIFLING'),	
	('TECH_MILITARY_SCIENCE', 'TECH_RIFLING');

-- Grid X=13 (MOD)		
DELETE FROM Technology_PrereqTechs WHERE TechType IN (
	'TECH_BIOLOGY',
	'TECH_ELECTRICITY',
	'TECH_REPLACEABLE_PARTS',
	'TECH_COMBUSTION');
	
INSERT INTO Technology_PrereqTechs
	(TechType, PrereqTech)
VALUES
	('TECH_BIOLOGY', 'TECH_ARCHAEOLOGY'),
	('TECH_BIOLOGY', 'TECH_FERTILIZER'),
	('TECH_ELECTRICITY', 'TECH_ARCHAEOLOGY'),
	('TECH_ELECTRICITY', 'TECH_FERTILIZER'),
	('TECH_ELECTRICITY', 'TECH_INDUSTRIALIZATION'),
	('TECH_REPLACEABLE_PARTS', 'TECH_INDUSTRIALIZATION'),
	('TECH_REPLACEABLE_PARTS', 'TECH_DYNAMITE'),	
	('TECH_REPLACEABLE_PARTS', 'TECH_MILITARY_SCIENCE'),
	('TECH_COMBUSTION', 'TECH_DYNAMITE'),
	('TECH_COMBUSTION', 'TECH_MILITARY_SCIENCE');


--==========================================================================================================================
-- Costs
--==========================================================================================================================

/* Infixo: original costs		
-- Change Tech Costs (from CEP):

UPDATE Technologies SET Cost =     60 WHERE GridX =  1; --35
UPDATE Technologies SET Cost =     80 WHERE GridX =  2; --55
UPDATE Technologies SET Cost =    125 WHERE GridX =  3; --105
UPDATE Technologies SET Cost =    225 WHERE GridX =  4; --175
UPDATE Technologies SET Cost =    350 WHERE GridX =  5; --275
UPDATE Technologies SET Cost =    550 WHERE GridX =  6; --485
UPDATE Technologies SET Cost =   1000 WHERE GridX =  7; --780
UPDATE Technologies SET Cost =   1500 WHERE GridX =  8; --1150
UPDATE Technologies SET Cost =   2000 WHERE GridX =  9; --1600 	Enlightenment Era
UPDATE Technologies SET Cost =   2500 WHERE GridX = 10; --2350	EE
UPDATE Technologies SET Cost =   4000 WHERE GridX = 11; --3100	Industrail
UPDATE Technologies SET Cost =   5500 WHERE GridX = 12; --4100
UPDATE Technologies SET Cost =   6800 WHERE GridX = 13; --5100	Modern
UPDATE Technologies SET Cost =   8200 WHERE GridX = 14; --6400
UPDATE Technologies SET Cost =  10000 WHERE GridX = 15; --7700	Atomic
UPDATE Technologies SET Cost =  11500 WHERE GridX = 16; --8800
UPDATE Technologies SET Cost =  13000 WHERE GridX = 17; --9500	Information
UPDATE Technologies SET Cost =  15000 WHERE GridX = 18; 
UPDATE Technologies SET Cost =  16000 WHERE GridX = 19;
UPDATE Technologies SET Cost =  16500 WHERE GridX = 20; -- 	Future Tech
*/
-- Infixo: new costs
UPDATE Technologies SET Cost =    50 WHERE GridX =  1; --35		Ancient: 75 turns
UPDATE Technologies SET Cost =    80 WHERE GridX =  2; --55
UPDATE Technologies SET Cost =   130 WHERE GridX =  3; --105	Classical: 60 turns
UPDATE Technologies SET Cost =   220 WHERE GridX =  4; --175
UPDATE Technologies SET Cost =   350 WHERE GridX =  5; --275	Medieval: 55 turns
UPDATE Technologies SET Cost =   500 WHERE GridX =  6; --485
UPDATE Technologies SET Cost =   800 WHERE GridX =  7; --780	Renaissance: 55 turns
UPDATE Technologies SET Cost =  1100 WHERE GridX =  8; --1150
UPDATE Technologies SET Cost =  1500 WHERE GridX =  9; --1600 	Enlightenment: 35 turns
UPDATE Technologies SET Cost =  1800 WHERE GridX = 10; --2350	
UPDATE Technologies SET Cost =  3000 WHERE GridX = 11; --3100	Industrial: 50 turns
UPDATE Technologies SET Cost =  4000 WHERE GridX = 12; --4100
UPDATE Technologies SET Cost =  5000 WHERE GridX = 13; --5100	Modern: 40 turns
UPDATE Technologies SET Cost =  6000 WHERE GridX = 14; --6400
UPDATE Technologies SET Cost =  8000 WHERE GridX = 15; --7700	Atomic: 50 turns
UPDATE Technologies SET Cost = 10000 WHERE GridX = 16; --8800
UPDATE Technologies SET Cost = 12000 WHERE GridX = 17; --9500	Information: 70 turns
UPDATE Technologies SET Cost = 14000 WHERE GridX = 18; 
UPDATE Technologies SET Cost = 16000 WHERE GridX = 19;
UPDATE Technologies SET Cost = 20000 WHERE GridX = 20; --		Future: 10 turns
