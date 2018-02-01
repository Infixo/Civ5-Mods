----------------------------------------------------
-- Enlightenment Era (Vox Populi)
-- UNITS
-- 2018-02-01 Reworked by Infixo from EE & VP-EE mods
----------------------------------------------------



--==========================================================================================================================
-- WORLD CONGRESS
--==========================================================================================================================

INSERT INTO LeagueSpecialSessions
	(Type, Description, Help, SessionSplashImage,
	EraTrigger, ImmediateProposal, TurnsBetweenSessions, CivDelegates, HostDelegates, CityStateDelegates)
VALUES
	('LEAGUE_SPECIAL_SESSION_WORLD_ASSEMBLY', 'TXT_KEY_LEAGUE_SPECIAL_SESSION_WORLD_ASSEMBLY','TXT_KEY_LEAGUE_SPECIAL_SESSION_WORLD_ASSEMBLY_HELP','WorldCongress.dds',
	'ERA_MODERN', 'RESOLUTION_CHANGE_LEAGUE_HOST', 10, 3, 2, 1);

INSERT INTO LeagueNames (Type, NameKey)
VALUES ('LEAGUE_NAME_ASSEMBLY', 'TXT_KEY_LEAGUE_WORLD_CONGRESS_4');

UPDATE LeagueSpecialSessions SET EraTrigger = 'ERA_ENLIGHTENMENT' WHERE Type = 'LEAGUE_SPECIAL_SESSION_WELCOME_CITY_STATES';
UPDATE LeagueSpecialSessions SET EraTrigger = 'ERA_INDUSTRIAL' WHERE Type = 'LEAGUE_SPECIAL_SESSION_LEADERSHIP_COUNCIL';
UPDATE LeagueSpecialSessions SET TurnsBetweenSessions = 15 WHERE EraTrigger = 'ERA_INDUSTRIAL';
--UPDATE LeagueSpecialSessions SET TurnsBetweenSessions = 10, CivDelegates = 3 WHERE EraTrigger = 'ERA_MODERN';

