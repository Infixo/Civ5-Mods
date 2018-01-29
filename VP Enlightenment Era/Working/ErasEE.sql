--
-- File generated with SQLiteStudio v3.1.1 on Pn sty 29 22:52:10 2018
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Eras
CREATE TABLE Eras ('ID' integer primary key autoincrement , 'Type' text  not null unique , 'Description' text , 'ShortDescription' text , 'Abbreviation' text , 'ArtPrefix' text , 'Strategy' text , 'NoGoodies' boolean default 0 , 'NoBarbUnits' boolean default 0 , 'NoReligion' boolean default 0 , 'FirstSoundtrackFirst' boolean default 0 , 'ResearchAgreementCost' integer default 0 , 'EmbarkedUnitDefense' integer default 0 , 'StartingUnitMultiplier' integer default 0 , 'StartingDefenseUnits' integer default 0 , 'StartingWorkerUnits' integer default 0 , 'StartingExploreUnits' integer default 0 , 'StartingGold' integer default 0 , 'StartingCulture' integer default 0 , 'FreePopulation' integer default 0 , 'LaterEraBuildingConstructMod' integer default 0 , 'StartPercent' integer default 0 , 'BuildingMaintenancePercent' integer default 0 , 'GrowthPercent' integer default 0 , 'TrainPercent' integer default 0 , 'ConstructPercent' integer default 0 , 'CreatePercent' integer default 0 , 'ResearchPercent' integer default 0 , 'BuildPercent' integer default 0 , 'ImprovementPercent' integer default 0 , 'GreatPeoplePercent' integer default 0 , 'CulturePercent' integer default 0 , 'TradeRouteFoodBonusTimes100' integer default 0 , 'TradeRouteProductionBonusTimes100' integer default 0 , 'EventChancePerTurn' integer default 0 , 'SpiesGrantedForPlayer' integer default 0 , 'SpiesGrantedForEveryone' integer default 0 , 'FaithCostMultiplier' integer default 0 , 'DiploEmphasisReligion' integer default 0 , 'DiploEmphasisLatePolicies' integer default 0 , 'LeaguePercent' integer default 0 , 'WarmongerPercent' integer default 0 , 'SoundtrackSpace' integer default 0 , 'CityBombardEffectTag' text , 'AudioUnitVictoryScript' text , 'AudioUnitDefeatScript' text , 'CityArtType' text , 'StartingMinorDefenseUnits' INTEGER DEFAULT 0, VassalageEnabled				boolean);
INSERT INTO Eras (ID, Type, Description, ShortDescription, Abbreviation, ArtPrefix, Strategy, NoGoodies, NoBarbUnits, NoReligion, FirstSoundtrackFirst, ResearchAgreementCost, EmbarkedUnitDefense, StartingUnitMultiplier, StartingDefenseUnits, StartingWorkerUnits, StartingExploreUnits, StartingGold, StartingCulture, FreePopulation, LaterEraBuildingConstructMod, StartPercent, BuildingMaintenancePercent, GrowthPercent, TrainPercent, ConstructPercent, CreatePercent, ResearchPercent, BuildPercent, ImprovementPercent, GreatPeoplePercent, CulturePercent, TradeRouteFoodBonusTimes100, TradeRouteProductionBonusTimes100, EventChancePerTurn, SpiesGrantedForPlayer, SpiesGrantedForEveryone, FaithCostMultiplier, DiploEmphasisReligion, DiploEmphasisLatePolicies, LeaguePercent, WarmongerPercent, SoundtrackSpace, CityBombardEffectTag, AudioUnitVictoryScript, AudioUnitDefeatScript, CityArtType, StartingMinorDefenseUnits, VassalageEnabled) VALUES (0, 'ERA_ANCIENT', 'TXT_KEY_ERA_0', 'TXT_KEY_ERA_0_SHORT', 'TXT_KEY_ERA_0_ABBREV', 'ANCIENT', 'TXT_KEY_ERA_ANCIENT_STRATEGY', 0, 0, 0, 0, 100, 3, 1, 0, 0, 1, 0, 0, 0, -2, 0, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 0, 0, 1, 0, 0, 100, 1, 0, 300, 50, 0, 'CITY_BOMBARD_EARLY', 'AS2D_VICTORY_EARLY', 'AS2D_LOSS_EARLY', NULL, 0, NULL);
INSERT INTO Eras (ID, Type, Description, ShortDescription, Abbreviation, ArtPrefix, Strategy, NoGoodies, NoBarbUnits, NoReligion, FirstSoundtrackFirst, ResearchAgreementCost, EmbarkedUnitDefense, StartingUnitMultiplier, StartingDefenseUnits, StartingWorkerUnits, StartingExploreUnits, StartingGold, StartingCulture, FreePopulation, LaterEraBuildingConstructMod, StartPercent, BuildingMaintenancePercent, GrowthPercent, TrainPercent, ConstructPercent, CreatePercent, ResearchPercent, BuildPercent, ImprovementPercent, GreatPeoplePercent, CulturePercent, TradeRouteFoodBonusTimes100, TradeRouteProductionBonusTimes100, EventChancePerTurn, SpiesGrantedForPlayer, SpiesGrantedForEveryone, FaithCostMultiplier, DiploEmphasisReligion, DiploEmphasisLatePolicies, LeaguePercent, WarmongerPercent, SoundtrackSpace, CityBombardEffectTag, AudioUnitVictoryScript, AudioUnitDefeatScript, CityArtType, StartingMinorDefenseUnits, VassalageEnabled) VALUES (1, 'ERA_CLASSICAL', 'TXT_KEY_ERA_1', 'TXT_KEY_ERA_1_SHORT', 'TXT_KEY_ERA_1_ABBREV', 'CLASSICAL', 'TXT_KEY_ERA_CLASSICAL_STRATEGY', 0, 0, 0, 0, 150, 4, 1, 1, 1, 1, 10, 100, 0, -2, 10, 100, 100, 80, 85, 85, 67, 100, 100, 100, 100, 100, 100, 2, 0, 0, 100, 3, 0, 300, 60, 400, 'CITY_BOMBARD_EARLY', 'AS2D_VICTORY_EARLY', 'AS2D_LOSS_EARLY', NULL, 0, NULL);
INSERT INTO Eras (ID, Type, Description, ShortDescription, Abbreviation, ArtPrefix, Strategy, NoGoodies, NoBarbUnits, NoReligion, FirstSoundtrackFirst, ResearchAgreementCost, EmbarkedUnitDefense, StartingUnitMultiplier, StartingDefenseUnits, StartingWorkerUnits, StartingExploreUnits, StartingGold, StartingCulture, FreePopulation, LaterEraBuildingConstructMod, StartPercent, BuildingMaintenancePercent, GrowthPercent, TrainPercent, ConstructPercent, CreatePercent, ResearchPercent, BuildPercent, ImprovementPercent, GreatPeoplePercent, CulturePercent, TradeRouteFoodBonusTimes100, TradeRouteProductionBonusTimes100, EventChancePerTurn, SpiesGrantedForPlayer, SpiesGrantedForEveryone, FaithCostMultiplier, DiploEmphasisReligion, DiploEmphasisLatePolicies, LeaguePercent, WarmongerPercent, SoundtrackSpace, CityBombardEffectTag, AudioUnitVictoryScript, AudioUnitDefeatScript, CityArtType, StartingMinorDefenseUnits, VassalageEnabled) VALUES (2, 'ERA_MEDIEVAL', 'TXT_KEY_ERA_2', 'TXT_KEY_ERA_2_SHORT', 'TXT_KEY_ERA_2_ABBREV', 'MEDIEVAL', 'TXT_KEY_ERA_MEDIEVAL_STRATEGY', 1, 0, 0, 0, 200, 6, 2, 2, 1, 1, 25, 200, 0, -2, 25, 100, 100, 67, 75, 75, 50, 100, 100, 100, 100, 200, 200, 4, 0, 0, 100, 5, 0, 300, 70, 200, 'CITY_BOMBARD_MID', 'AS2D_VICTORY_MIDDLE', 'AS2D_LOSS_MIDDLE', NULL, 1, 1);
INSERT INTO Eras (ID, Type, Description, ShortDescription, Abbreviation, ArtPrefix, Strategy, NoGoodies, NoBarbUnits, NoReligion, FirstSoundtrackFirst, ResearchAgreementCost, EmbarkedUnitDefense, StartingUnitMultiplier, StartingDefenseUnits, StartingWorkerUnits, StartingExploreUnits, StartingGold, StartingCulture, FreePopulation, LaterEraBuildingConstructMod, StartPercent, BuildingMaintenancePercent, GrowthPercent, TrainPercent, ConstructPercent, CreatePercent, ResearchPercent, BuildPercent, ImprovementPercent, GreatPeoplePercent, CulturePercent, TradeRouteFoodBonusTimes100, TradeRouteProductionBonusTimes100, EventChancePerTurn, SpiesGrantedForPlayer, SpiesGrantedForEveryone, FaithCostMultiplier, DiploEmphasisReligion, DiploEmphasisLatePolicies, LeaguePercent, WarmongerPercent, SoundtrackSpace, CityBombardEffectTag, AudioUnitVictoryScript, AudioUnitDefeatScript, CityArtType, StartingMinorDefenseUnits, VassalageEnabled) VALUES (3, 'ERA_RENAISSANCE', 'TXT_KEY_ERA_3', 'TXT_KEY_ERA_3_SHORT', 'TXT_KEY_ERA_3_ABBREV', 'RENAISSANCE', 'TXT_KEY_ERA_RENAISSANCE_STRATEGY', 1, 0, 0, 0, 250, 8, 2, 2, 1, 1, 50, 300, 1, -2, 37, 75, 90, 50, 55, 55, 33, 90, 90, 90, 90, 400, 400, 4, 0, 1, 150, 4, 0, 300, 80, 160, 'CITY_BOMBARD_MID', 'AS2D_VICTORY_MIDDLE', 'AS2D_LOSS_MIDDLE', NULL, 1, NULL);
INSERT INTO Eras (ID, Type, Description, ShortDescription, Abbreviation, ArtPrefix, Strategy, NoGoodies, NoBarbUnits, NoReligion, FirstSoundtrackFirst, ResearchAgreementCost, EmbarkedUnitDefense, StartingUnitMultiplier, StartingDefenseUnits, StartingWorkerUnits, StartingExploreUnits, StartingGold, StartingCulture, FreePopulation, LaterEraBuildingConstructMod, StartPercent, BuildingMaintenancePercent, GrowthPercent, TrainPercent, ConstructPercent, CreatePercent, ResearchPercent, BuildPercent, ImprovementPercent, GreatPeoplePercent, CulturePercent, TradeRouteFoodBonusTimes100, TradeRouteProductionBonusTimes100, EventChancePerTurn, SpiesGrantedForPlayer, SpiesGrantedForEveryone, FaithCostMultiplier, DiploEmphasisReligion, DiploEmphasisLatePolicies, LeaguePercent, WarmongerPercent, SoundtrackSpace, CityBombardEffectTag, AudioUnitVictoryScript, AudioUnitDefeatScript, CityArtType, StartingMinorDefenseUnits, VassalageEnabled) VALUES (4, 'ERA_ENLIGHTENMENT', 'TXT_KEY_ERA_4', 'TXT_KEY_ERA_4_SHORT', 'TXT_KEY_ERA_4_ABBREV', 'RENAISSANCE', 'TXT_KEY_ERA_ENLIGHTENMENT_STRATEGY', 1, 0, 0, 0, 250, 8, 2, 2, 1, 1, 50, 300, 1, -2, 37, 75, 90, 50, 55, 55, 33, 90, 90, 90, 90, 150, 150, 4, 1, 0, 150, 4, 0, 300, 90, 160, 'CITY_BOMBARD_MID', 'AS2D_VICTORY_MIDDLE', 'AS2D_LOSS_MIDDLE', NULL, 0, NULL);
INSERT INTO Eras (ID, Type, Description, ShortDescription, Abbreviation, ArtPrefix, Strategy, NoGoodies, NoBarbUnits, NoReligion, FirstSoundtrackFirst, ResearchAgreementCost, EmbarkedUnitDefense, StartingUnitMultiplier, StartingDefenseUnits, StartingWorkerUnits, StartingExploreUnits, StartingGold, StartingCulture, FreePopulation, LaterEraBuildingConstructMod, StartPercent, BuildingMaintenancePercent, GrowthPercent, TrainPercent, ConstructPercent, CreatePercent, ResearchPercent, BuildPercent, ImprovementPercent, GreatPeoplePercent, CulturePercent, TradeRouteFoodBonusTimes100, TradeRouteProductionBonusTimes100, EventChancePerTurn, SpiesGrantedForPlayer, SpiesGrantedForEveryone, FaithCostMultiplier, DiploEmphasisReligion, DiploEmphasisLatePolicies, LeaguePercent, WarmongerPercent, SoundtrackSpace, CityBombardEffectTag, AudioUnitVictoryScript, AudioUnitDefeatScript, CityArtType, StartingMinorDefenseUnits, VassalageEnabled) VALUES (5, 'ERA_INDUSTRIAL', 'TXT_KEY_ERA_5', 'TXT_KEY_ERA_5_SHORT', 'TXT_KEY_ERA_5_ABBREV', 'INDUSTRIAL', 'TXT_KEY_ERA_INDUSTRIAL_STRATEGY', 1, 1, 1, 0, 300, 10, 3, 3, 2, 2, 100, 400, 2, -2, 50, 60, 75, 33, 37, 37, 20, 80, 80, 80, 80, 600, 600, 6, 1, 0, 200, 2, 7, 200, 100, 120, 'CITY_BOMBARD_MID', 'AS2D_VICTORY_MIDDLE', 'AS2D_LOSS_MIDDLE', NULL, 1, NULL);
INSERT INTO Eras (ID, Type, Description, ShortDescription, Abbreviation, ArtPrefix, Strategy, NoGoodies, NoBarbUnits, NoReligion, FirstSoundtrackFirst, ResearchAgreementCost, EmbarkedUnitDefense, StartingUnitMultiplier, StartingDefenseUnits, StartingWorkerUnits, StartingExploreUnits, StartingGold, StartingCulture, FreePopulation, LaterEraBuildingConstructMod, StartPercent, BuildingMaintenancePercent, GrowthPercent, TrainPercent, ConstructPercent, CreatePercent, ResearchPercent, BuildPercent, ImprovementPercent, GreatPeoplePercent, CulturePercent, TradeRouteFoodBonusTimes100, TradeRouteProductionBonusTimes100, EventChancePerTurn, SpiesGrantedForPlayer, SpiesGrantedForEveryone, FaithCostMultiplier, DiploEmphasisReligion, DiploEmphasisLatePolicies, LeaguePercent, WarmongerPercent, SoundtrackSpace, CityBombardEffectTag, AudioUnitVictoryScript, AudioUnitDefeatScript, CityArtType, StartingMinorDefenseUnits, VassalageEnabled) VALUES (6, 'ERA_MODERN', 'TXT_KEY_ERA_6', 'TXT_KEY_ERA_6_SHORT', 'TXT_KEY_ERA_6_ABBREV', 'MODERN', 'TXT_KEY_ERA_MODERN_STRATEGY', 1, 1, 1, 0, 350, 13, 3, 3, 2, 2, 200, 500, 3, -2, 65, 50, 60, 25, 30, 30, 12, 70, 70, 70, 70, 800, 800, 8, 1, 0, 300, 3, 9, 200, 100, 80, 'CITY_BOMBARD_LATE', 'AS2D_VICTORY_LATE', 'AS2D_LOSS_LATE', NULL, 2, NULL);
INSERT INTO Eras (ID, Type, Description, ShortDescription, Abbreviation, ArtPrefix, Strategy, NoGoodies, NoBarbUnits, NoReligion, FirstSoundtrackFirst, ResearchAgreementCost, EmbarkedUnitDefense, StartingUnitMultiplier, StartingDefenseUnits, StartingWorkerUnits, StartingExploreUnits, StartingGold, StartingCulture, FreePopulation, LaterEraBuildingConstructMod, StartPercent, BuildingMaintenancePercent, GrowthPercent, TrainPercent, ConstructPercent, CreatePercent, ResearchPercent, BuildPercent, ImprovementPercent, GreatPeoplePercent, CulturePercent, TradeRouteFoodBonusTimes100, TradeRouteProductionBonusTimes100, EventChancePerTurn, SpiesGrantedForPlayer, SpiesGrantedForEveryone, FaithCostMultiplier, DiploEmphasisReligion, DiploEmphasisLatePolicies, LeaguePercent, WarmongerPercent, SoundtrackSpace, CityBombardEffectTag, AudioUnitVictoryScript, AudioUnitDefeatScript, CityArtType, StartingMinorDefenseUnits, VassalageEnabled) VALUES (7, 'ERA_POSTMODERN', 'TXT_KEY_ERA_7', 'TXT_KEY_ERA_7_SHORT', 'TXT_KEY_ERA_7_ABBREV', 'POSTMODERN', 'TXT_KEY_ERA_POSTMODERN_STRATEGY', 1, 1, 1, 0, 400, 16, 3, 3, 2, 2, 200, 500, 3, -2, 65, 50, 60, 25, 30, 30, 12, 70, 70, 70, 70, 1000, 1000, 8, 1, 0, 400, 2, 9, 100, 100, 80, 'CITY_BOMBARD_LATE', 'AS2D_VICTORY_LATE', 'AS2D_LOSS_LATE', NULL, 2, NULL);
INSERT INTO Eras (ID, Type, Description, ShortDescription, Abbreviation, ArtPrefix, Strategy, NoGoodies, NoBarbUnits, NoReligion, FirstSoundtrackFirst, ResearchAgreementCost, EmbarkedUnitDefense, StartingUnitMultiplier, StartingDefenseUnits, StartingWorkerUnits, StartingExploreUnits, StartingGold, StartingCulture, FreePopulation, LaterEraBuildingConstructMod, StartPercent, BuildingMaintenancePercent, GrowthPercent, TrainPercent, ConstructPercent, CreatePercent, ResearchPercent, BuildPercent, ImprovementPercent, GreatPeoplePercent, CulturePercent, TradeRouteFoodBonusTimes100, TradeRouteProductionBonusTimes100, EventChancePerTurn, SpiesGrantedForPlayer, SpiesGrantedForEveryone, FaithCostMultiplier, DiploEmphasisReligion, DiploEmphasisLatePolicies, LeaguePercent, WarmongerPercent, SoundtrackSpace, CityBombardEffectTag, AudioUnitVictoryScript, AudioUnitDefeatScript, CityArtType, StartingMinorDefenseUnits, VassalageEnabled) VALUES (8, 'ERA_FUTURE', 'TXT_KEY_ERA_8', 'TXT_KEY_ERA_8_SHORT', 'TXT_KEY_ERA_8_ABBREV', 'FUTURE', 'TXT_KEY_ERA_FUTURE_STRATEGY', 1, 1, 1, 0, 450, 20, 3, 3, 3, 2, 400, 600, 4, -2, 80, 40, 50, 18, 21, 21, 5, 60, 60, 60, 60, 1200, 1200, 10, 1, 0, 500, 1, 7, 100, 100, 40, 'CITY_BOMBARD_LATE', 'AS2D_VICTORY_LATE', 'AS2D_LOSS_LATE', NULL, 2, NULL);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;