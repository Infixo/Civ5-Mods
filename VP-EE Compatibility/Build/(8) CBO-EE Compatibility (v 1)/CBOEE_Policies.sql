
--==========================================================================================================================
-- POLICY BRANCHES
--==========================================================================================================================
-- PolicyBranchTypes
--------------------------------------------------------------------------------------------------------------------------

UPDATE PolicyBranchTypes
SET EraPrereq = 'ERA_RENAISSANCE'
WHERE Type = 'POLICY_BRANCH_RATIONALISM';

--==========================================================================================================================
-- POLICIES
--==========================================================================================================================
-- Policies
--------------------------------------------------------------------------------------------------------------------------

-- Infixo: remove due to different meaning in VP
DELETE FROM Policy_BuildingClassYieldChanges WHERE PolicyType = 'POLICY_MERCHANT_NAVY'	  AND BuildingClassType = 'BUILDINGCLASS_EE_DRYDOCK';
DELETE FROM Policy_BuildingClassYieldChanges WHERE PolicyType = 'POLICY_SOVEREIGNTY' 	  AND BuildingClassType = 'BUILDINGCLASS_EE_ACADEMY';
DELETE FROM Policy_BuildingClassYieldChanges WHERE PolicyType = 'POLICY_CULTURAL_CENTERS' AND BuildingClassType = 'BUILDINGCLASS_EE_GALLERY';
DELETE FROM Policy_BuildingClassYieldChanges WHERE PolicyType = 'POLICY_CULTURAL_CENTERS' AND BuildingClassType = 'BUILDINGCLASS_EE_THEATRE';
DELETE FROM Policy_BuildingClassYieldChanges WHERE PolicyType = 'POLICY_MERCANTILISM' 	  AND BuildingClassType = 'BUILDINGCLASS_EE_WEIGH_HOUSE';

INSERT INTO Policy_BuildingClassYieldChanges (PolicyType, BuildingClassType, YieldType, YieldChange)
VALUES 	('POLICY_NAVAL_TRADITION',	  'BUILDINGCLASS_EE_DRYDOCK',	 'YIELD_SCIENCE', 3), -- ok
		('POLICY_CULTURAL_CENTERS',	  'BUILDINGCLASS_EE_GALLERY',	 'YIELD_SCIENCE', 3), -- Infixo: Gallery instead of Zoo
		('POLICY_CREATIVE_EXPRESSION','BUILDINGCLASS_EE_GALLERY',	 'YIELD_GOLDEN_AGE_POINTS', 2), -- Infixo
		('POLICY_MOBILIZATION', 	  'BUILDINGCLASS_EE_BASTION',	 'YIELD_SCIENCE', 3), -- ok
		('POLICY_MERCANTILISM', 	  'BUILDINGCLASS_EE_WEIGH_HOUSE','YIELD_SCIENCE', 2), -- ok
		('POLICY_NAVIGATION_SCHOOL',  'BUILDINGCLASS_EE_DRYDOCK',	 'YIELD_SCIENCE', 4);

INSERT INTO Policy_BuildingClassCultureChanges
	(PolicyType, BuildingClassType, CultureChange)
VALUES
	('POLICY_NAVAL_TRADITION', 	 'BUILDINGCLASS_EE_DRYDOCK', 	 1), -- ok
	('POLICY_MERCANTILISM', 	 'BUILDINGCLASS_EE_WEIGH_HOUSE', 2), -- ok
	('POLICY_SOCIALIST_REALISM', 'BUILDINGCLASS_EE_GALLERY', 	 2), -- ok
	('POLICY_NAVIGATION_SCHOOL', 'BUILDINGCLASS_EE_DRYDOCK',	 1); -- ok

-- Mercantilism (Industry)
UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Mercantilism[ENDCOLOR][NEWLINE] +2 [ICON_RESEARCH] Science and +2 [ICON_CULTURE] Culture from every Customs House, Bank, Weigh House and Stock Exchange. Yields from Internal [ICON_INTERNATIONAL_TRADE] Trade Routes increased by 33%.'
WHERE Tag = 'TXT_KEY_POLICY_MERCANTILISM_HELP';

-- Humanism (Aesthetics)
UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Humanism[ENDCOLOR][NEWLINE]Amphitheaters, Opera Houses, Galleries, Museums and Broadcast Towers produce +3 [ICON_RESEARCH] Science. All [ICON_GREAT_WORK] Great Works produce +1 [ICON_GOLD] Gold and +1 [ICON_CULTURE] Culture.'
WHERE Tag = 'TXT_KEY_POLICY_CULTURAL_CENTERS_HELP';

-- Socialist Realism
UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Socialist Realism[ENDCOLOR][NEWLINE]Receive a free Museum in every City. Museums and Galleries produce +2 [ICON_CULTURE] Culture.'
WHERE Tag = 'TXT_KEY_POLICY_SOCIALIST_REALISM_HELP' ;

-- Military Tradition (Imperialism)	
UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Military Tradition[ENDCOLOR][NEWLINE]Earn [ICON_GREAT_ADMIRAL] Great Admirals and [ICON_GREAT_GENERAL] Great Generals 33% more quickly. Barracks, Armories, Drydocks and Military Academies provide +3 [ICON_RESEARCH] Science and +1 [ICON_CULTURE] Culture.'
WHERE Tag = 'TXT_KEY_POLICY_NAVAL_TRADITION_HELP';

-- Regimental System (Imperialism)	
UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Regimental System[ENDCOLOR][NEWLINE]Earn [ICON_GREAT_GENERAL] Great Generals 33% more quickly. Barracks, Armories, Drydocks and Military Academies provide +4 [ICON_RESEARCH] Science and +1 [ICON_CULTURE] Culture.'
WHERE Tag = 'TXT_KEY_POLICY_NAVIGATION_SCHOOL_HELP';
--==========================================================================================================================