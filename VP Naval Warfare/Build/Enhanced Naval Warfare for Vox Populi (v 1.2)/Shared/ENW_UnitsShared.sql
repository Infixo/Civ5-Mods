----------------------------------------------------
-- Shared objects
-- Author: Infixo
-- Feb 16, 2017: Created
-- Nov 30, 2017: added extra cargo +2
----------------------------------------------------

----------------------------------------------------
-- Icons
----------------------------------------------------

INSERT INTO IconTextureAtlases
	(Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn)
VALUES
	('ICON_ATLAS_ENW', 256, 'ENW_IconAtlas256.dds', '4', '4'),
	('ICON_ATLAS_ENW', 128, 'ENW_IconAtlas128.dds', '4', '4'),
	('ICON_ATLAS_ENW',  80, 'ENW_IconAtlas80.dds',  '4', '4'),
	('ICON_ATLAS_ENW',  64, 'ENW_IconAtlas64.dds',  '4', '4'),
	('ICON_ATLAS_ENW',  45, 'ENW_IconAtlas45.dds',  '4', '4'),
	('FLAG_ATLAS_ENW',  32, 'ENW_UnitFlagAtlas.dds', '8', '2');
	
	-- t.b.d.
	--('EMW_FLAG_ATLAS', 32, 'Art/UnitFlag_Supercarrier.dds', '1', '1');

	
----------------------------------------------------
-- Special cargo promotions
----------------------------------------------------
/*
INSERT INTO UnitPromotions (
	Type, Description, Help, Sound,
	IconAtlas, PortraitIndex, PediaType, PediaEntry,
	CannotBeChosen, CargoChange)
VALUES
	('PROMOTION_CARGO_EXTRA2', 'TXT_KEY_PROMOTION_CARGO_EXTRA2', 'TXT_KEY_PROMOTION_CARGO_EXTRA2_HELP', 'AS2D_IF_LEVELUP',
	'ABILITY_ATLAS', 59, 'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_CARGO_EXTRA2_PEDIA',
	1, 2),
	('PROMOTION_CARGO_EXTRA4', 'TXT_KEY_PROMOTION_CARGO_EXTRA4', 'TXT_KEY_PROMOTION_CARGO_EXTRA4_HELP', 'AS2D_IF_LEVELUP',
	'ABILITY_ATLAS', 59, 'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_CARGO_EXTRA4_PEDIA',
	1, 4),
	('PROMOTION_CARGO_EXTRA6', 'TXT_KEY_PROMOTION_CARGO_EXTRA6', 'TXT_KEY_PROMOTION_CARGO_EXTRA6_HELP', 'AS2D_IF_LEVELUP',
	'ABILITY_ATLAS', 59, 'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_CARGO_EXTRA6_PEDIA',
	1, 6);
	
-- Visible in tooltips
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PROMOTION_CARGO_EXTRA2', '+2 Cargo');
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PROMOTION_CARGO_EXTRA4', '+4 Cargo');
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PROMOTION_CARGO_EXTRA6', '+6 Cargo');

-- Description in Pedia and 2nd row in tooltips
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PROMOTION_CARGO_EXTRA2_HELP', 'Can Carry Additional 2 Cargo');
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PROMOTION_CARGO_EXTRA4_HELP', 'Can Carry Additional 4 Cargo');
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PROMOTION_CARGO_EXTRA6_HELP', 'Can Carry Additional 6 Cargo');

-- Promotion name visible only in the list on the left side
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PROMOTION_CARGO_EXTRA2_PEDIA', 'Extra 2 Cargo');
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PROMOTION_CARGO_EXTRA4_PEDIA', 'Extra 4 Cargo');
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PROMOTION_CARGO_EXTRA6_PEDIA', 'Extra 6 Cargo');
*/