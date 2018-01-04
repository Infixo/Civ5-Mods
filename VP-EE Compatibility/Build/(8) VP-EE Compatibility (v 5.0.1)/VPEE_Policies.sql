-- Version 4.3 incorporates changes made by Aldebaran1997

--==========================================================================================================================
-- POLICY BRANCHES
--==========================================================================================================================
-- PolicyBranchTypes
--------------------------------------------------------------------------------------------------------------------------

UPDATE PolicyBranchTypes
SET EraPrereq = 'ERA_ENLIGHTENMENT'
WHERE Type IN ('POLICY_BRANCH_RATIONALISM', 'POLICY_BRANCH_EXPLORATION', 'POLICY_BRANCH_COMMERCE');

--==========================================================================================================================
-- POLICIES
--==========================================================================================================================
-- Policies
--------------------------------------------------------------------------------------------------------------------------

-- Infixo: remove due to different meaning in VP
DELETE FROM Policy_BuildingClassYieldChanges WHERE PolicyType = 'POLICY_MERCHANT_NAVY'	  AND BuildingClassType = 'BUILDINGCLASS_EE_DRYDOCK';
DELETE FROM Policy_BuildingClassYieldChanges WHERE PolicyType = 'POLICY_SOVEREIGNTY' 	  AND BuildingClassType = 'BUILDINGCLASS_EE_ACADEMY';
DELETE FROM Policy_BuildingClassYieldChanges WHERE PolicyType = 'POLICY_MERCANTILISM' 	  AND BuildingClassType = 'BUILDINGCLASS_EE_WEIGH_HOUSE';

INSERT INTO Policy_BuildingClassYieldChanges (PolicyType, BuildingClassType, YieldType, YieldChange)
VALUES
	('POLICY_CREATIVE_EXPRESSION','BUILDINGCLASS_EE_GALLERY',	 'YIELD_GOLDEN_AGE_POINTS', 2), -- Infixo
	('POLICY_MOBILIZATION', 	  'BUILDINGCLASS_EE_BASTION',	 'YIELD_SCIENCE', 3), -- ok
	('POLICY_NAVIGATION_SCHOOL',  'BUILDINGCLASS_EE_GUNSMITH',	 'YIELD_SCIENCE', 5);

INSERT INTO Policy_BuildingClassCultureChanges (PolicyType, BuildingClassType, CultureChange)
VALUES
	('POLICY_CREATIVE_EXPRESSION', 	 'BUILDINGCLASS_EE_GALLERY', 2),
	('POLICY_NAVIGATION_SCHOOL', 'BUILDINGCLASS_EE_GUNSMITH',	 2);

INSERT INTO Policy_BuildingClassYieldModifiers (PolicyType, BuildingClassType, YieldType, YieldMod)
VALUES
	('POLICY_MERCANTILISM',	'BUILDINGCLASS_EE_WEIGH_HOUSE',	'YIELD_SCIENCE', 2),
	('POLICY_MERCANTILISM',	'BUILDINGCLASS_EE_WEIGH_HOUSE',	'YIELD_CULTURE', 2),
	('POLICY_TRADE_UNIONS',	'BUILDINGCLASS_EE_CLOTH_MILL',	'YIELD_PRODUCTION', 5),
	('POLICY_TRADE_UNIONS',	'BUILDINGCLASS_EE_CLOTH_MILL',	'YIELD_GOLD', 5);

-- Ceremony +2 Hap from National Wonders	
INSERT INTO Policy_BuildingClassHappiness (PolicyType, BuildingClassType, Happiness)
VALUES ('POLICY_LEGALISM', 'BUILDINGCLASS_EE_SUMMER_PALACE', 2);

-- Humanism (Aesthetics)
--UPDATE Language_en_US
--SET Text = '[COLOR_POSITIVE_TEXT]Humanism[ENDCOLOR][NEWLINE]Amphitheaters, Opera Houses, Galleries, Museums, and Broadcast Towers produce +2 [ICON_RESEARCH] Science. All [ICON_GREAT_WORK] Great Works produce +1 [ICON_GOLD] Gold and +1 [ICON_CULTURE] Culture.'
--WHERE Tag = 'TXT_KEY_POLICY_CULTURAL_CENTERS_HELP';

-- Creative Expression (Freedom)
UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Creative Expression[ENDCOLOR]: +2 [ICON_TOURISM] Tourism from Great Works. Museums, Galleries, Broadcast Towers, Opera Houses, and Amphitheaters gain +2 [ICON_GOLDEN_AGE] Golden Age Points and [ICON_CULTURE] Culture.'
WHERE Tag = 'TXT_KEY_POLICY_CREATIVE_EXPRESSION_HELP';

-- Military-Industrial Complex
-- TXT_KEY_POLICY_MOBILIZATION_HELP - no need to change, uses "Defense Buildings" phrase

-- Division of Labor
UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Division of Labor[ENDCOLOR][NEWLINE]Windmills, Workshops, Cloth Mills, and Factories generate +5% [ICON_PRODUCTION] Production and [ICON_GOLD] Gold each. [ICON_GOLD] Gold investments in Buildings reduce their [ICON_PRODUCTION] Production cost by an additional 10%.'
WHERE Tag = 'TXT_KEY_POLICY_TRADE_UNIONS_HELP';

-- Mercantilism (Industry)
UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Mercantilism[ENDCOLOR][NEWLINE]Markets, Caravansaries, Customs Houses, Banks, Weigh Houses, and Stock Exchanges generate +2% [ICON_RESEARCH] Science and [ICON_CULTURE] Culture each. +100% [ICON_PRODUCTION] Production speed of Train Stations and Seaports.'
WHERE Tag = 'TXT_KEY_POLICY_MERCANTILISM_HELP';

-- Regimental System (Imperialism)	
UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Regimental System[ENDCOLOR][NEWLINE]Earn [ICON_GREAT_GENERAL] Great Generals and [ICON_GREAT_ADMIRAL] Great Admirals 33% more quickly. Barracks, Armories, Gunsmiths, Military Academies, Forts, and Citadels provide +5 [ICON_RESEARCH] Science and +2 [ICON_CULTURE] Culture.'
WHERE Tag = 'TXT_KEY_POLICY_NAVIGATION_SCHOOL_HELP';


--==========================================================================================================================
-- WORLD CONGRESS
--==========================================================================================================================

UPDATE LeagueSpecialSessions SET TurnsBetweenSessions = 15 					 WHERE EraTrigger = 'ERA_INDUSTRIAL';
UPDATE LeagueSpecialSessions SET TurnsBetweenSessions = 10, CivDelegates = 3 WHERE EraTrigger = 'ERA_MODERN';
