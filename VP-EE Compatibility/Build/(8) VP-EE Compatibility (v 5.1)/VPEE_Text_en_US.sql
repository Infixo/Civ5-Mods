--------------------------------------------------------------------------------------------------------------------------
-- Language_en_US
--------------------------------------------------------------------------------------------------------------------------

-- CBOEE Theatre
UPDATE Language_en_US
SET Text = 'Theatre'
WHERE Tag IN ('TXT_KEY_BUILDING_CBOEE_THEATRE');

UPDATE Language_en_US
SET Text = 'Provides [ICON_CULTURE] Culture and a literature slot.'
WHERE Tag IN ('TXT_KEY_BUILDING_CBOEE_THEATRE_HELP');

UPDATE Language_en_US
SET Text = 'The Theatre is a Renaissance-era building which increases a city''s [ICON_CULTURE] Culture. The city needs to have an Amphitheater in order to construct the Theatre. Contains 1 slots for Great Works of Writing.'
WHERE Tag IN ('TXT_KEY_BUILDING_CBOEE_THEATRE_STRATEGY');

UPDATE Language_en_US
SET Text = 'The Greeks invented theatre as it''s known in the West today. The original theatres were open-air amphitheatres often constructed on the side of a hill. The audience sat on benches cut into the hill, while the performers worked on an open stage at the foot of the hill. Over time the stages moved indoors (especially in locations with risks of lots of inclement weather). A modern theatre still has a stage and seats for the audience, but it also includes sophisticated sound and lighting equipment, an orchestra pit, and an extensive backstage area for props and scenery. Still, an ancient theatre-goer would not be totally surprised by anything found within a modern theatre (except possibly the cost of the food and drinks sold during intermission).'
WHERE Tag IN ('TXT_KEY_BUILDING_CBOEE_THEATRE_PEDIA');

-- Versailles
UPDATE Language_en_US
SET Text = 'Extends the length of [ICON_HAPPINESS_1] We Love The King Day by 50% empire-wide. 1 free [ICON_GREAT_PEOPLE] Great Writer appears near the City where the wonder was built.'
WHERE Tag = 'TXT_KEY_WONDER_EE_VERSAILLES_HELP';

-- Kronborg
UPDATE Language_en_US
SET Text = '+50 HP, +5 [ICON_STRENGTH] Defense and +1 Military Unit Supply Cap in all coastal cities, +50% production for naval units in the city where the wonder is built in. City must be built on the coast. 1 free [ICON_GREAT_PEOPLE] Great Admiral appears near the City where the wonder was built.'
WHERE Tag = 'TXT_KEY_WONDER_EE_KRONBORG_HELP';

UPDATE Language_en_US
SET Text = 'Kronborg Dummy'
WHERE Tag IN ('TXT_KEY_BUILDING_EE_KRONBORG_DUMMY_DESC');

UPDATE Language_en_US
SET Text = 'Kronborg Dummy +50HP +5DEF +1SUPCAP'
WHERE Tag IN ('TXT_KEY_BUILDING_EE_KRONBORG_DUMMY_STRATEGY');

-- Fasil Ghebbi
UPDATE Language_en_US
SET Text = 'Friendly military units within 3-tile range of Fasil Ghebbi have +25% combat strength. City gets additional +100 HP and +10 [ICON_STRENGTH] Defense. Increases the Military Unit Supply Cap by 5.'
WHERE Tag = 'TXT_KEY_WONDER_EE_FASIL_GHEBBI_HELP';

UPDATE Language_en_US
SET Text = 'Fasil Ghebbi Aura'
WHERE Tag = 'TXT_KEY_PROMOTION_EE_FASIL_GHEBBI';

UPDATE Language_en_US
SET Text = '+25% Combat Strength when in 3-tile range of Fasil Ghebbi.'
WHERE Tag = 'TXT_KEY_PROMOTION_EE_FASIL_GHEBBI_HELP';

-- Red Fort
UPDATE Language_en_US
SET Text = 'Receive a free Great Engineer and a free Bastion in the city. Provides +100 HP and +30 [ICON_STRENGTH] Defense to the city, and increases the Military Unit Supply Cap from population by 5% in all Cities.'
WHERE Tag = 'TXT_KEY_WONDER_RED_FORT_HELP';

-- Light Skirmish
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PROMOTION_CBOEE_SKIRMISH', 'Light Skirmish');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_PROMOTION_CBOEE_SKIRMISH_HELP', 'Double Movement on Hills and in Forests. Ability is lost with upgrade.');

-- Adventurer
UPDATE Language_en_US
SET Text = 'Adventurer'
WHERE Tag IN ('TXT_KEY_UNIT_EE_EXPLORER');

UPDATE Language_en_US
SET Text = 'Throughout history there are those whose thirst for adventure led them from the safe confines of civilized lands. These adventurers, frequently funded by government stipends, would then journey into the unknown, charting their progress all the way. These expeditions, and the maps they helped create, became blueprints for the conquest and domestication of the once uncharted regions of the world.'
WHERE Tag IN ('TXT_KEY_UNIT_EE_EXPLORER_PEDIA');

UPDATE Language_en_US
SET Text = 'An upgrade to the Explorer. The Adventurer has even more movement and strength, although is still quite weak.  The Adventurer excels at sea exploration, as it is able to move further while embarked.  Use it to finish meeting all the other Civilizations, or scout out locations for overseas colonies'
WHERE Tag IN ('TXT_KEY_UNIT_EE_EXPLORER_STRATEGY');

-- Museum
UPDATE Language_en_US
SET Text = 'The Museum is a mid-game building which increases the city''s [ICON_CULTURE] Culture output.  Also boosts the City''s Great Artist rate and the value of Artists'' Guilds. The city must possess either a Theatre or an Opera House in order to construct the Museum. Contains 2 slots for Great Works of Art or Artifacts.'
WHERE Tag IN ('TXT_KEY_BUILDING_MUSEUM_STRATEGY');

-- Menagerie
UPDATE Language_en_US
SET Text = 'Reduces [ICON_HAPPINESS_3] Boredom. Nearby Jungle and Forest tiles gain +1 [ICON_TOURISM] Tourism. Increases [ICON_RESEARCH] Science, [ICON_CULTURE] Culture and [ICON_GOLD] Gold.[NEWLINE][NEWLINE]City must have a Zoo.'
WHERE Tag = 'TXT_KEY_BUILDING_EE_MENAGERIE_HELP';

UPDATE Language_en_US
SET Text = 'The Menagerie reduces Boredom in a city, and produces additional Science and Culture. The city must possess a Zoo before the Menagerie can be constructed.'
WHERE Tag = 'TXT_KEY_BUILDING_EE_MENAGERIE_STRATEGY';

-- Printing Press Tech
UPDATE Language_en_US
SET Text = 'Allows you to build the [COLOR_POSITIVE_TEXT]Globe Theatre[ENDCOLOR], a building which increases [ICON_TOURISM] Tourism.'
WHERE Tag = 'TXT_KEY_TECH_PRINTING_PRESS_HELP';

-- Coffee House
UPDATE Language_en_US
SET Text = '+33% [ICON_GREAT_PEOPLE] Great People generation in this City. 10% of the City''s [ICON_CULTURE] Culture converted to [ICON_RESEARCH] Science every turn.[NEWLINE][NEWLINE]Carries over 15% of [ICON_FOOD] Food after City growth (effect stacks with Aqueduct), and reduces [ICON_HAPPINESS_3] Poverty.[NEWLINE][NEWLINE]Requires an Aqueduct in the City.'
WHERE Tag = 'TXT_KEY_BUILDING_COFFEE_HOUSE_HELP';

UPDATE Language_en_US
SET Text = 'The Coffee House is a Renaissance-era building unique to Austria, replacing the Grocer. It increases the city''s [ICON_GROWTH] Growth and speed at which [ICON_GREAT_PEOPLE] Great People are generated by 33%.'
WHERE Tag = 'TXT_KEY_BUILDING_COFFEE_HOUSE_STRATEGY';

-- Academy
UPDATE Language_en_US
SET Text = 'Reduces [ICON_HAPPINESS_3] Illiteracy. +2 [ICON_RESEARCH] Science in the the city and +1 [ICON_RESEARCH] Science for every 5 [ICON_CITIZEN] Citizens in the City. +15% [ICON_GREAT_SCIENTIST] Great Scientist Rate in the City.[NEWLINE][NEWLINE]City must not contain a Salon.'
WHERE Tag IN ('TXT_KEY_BUILDING_EE_ACADEMY_HELP');

UPDATE Language_en_US
SET Text = 'The Academy is an Enlightenment-era building which increases the [ICON_RESEARCH] Science output of a city. It may not be built in a city with an Salon, forcing cities to specialise in either Culture or Science.'
WHERE Tag IN ('TXT_KEY_BUILDING_EE_ACADEMY_STRATEGY');

-- Salon
UPDATE Language_en_US
SET Text = 'Reduces [ICON_HAPPINESS_3] Boredom. +2 [ICON_CULTURE] Culture in the the city and +1 [ICON_CULTURE] Culture for every 5 [ICON_CITIZEN] Citizens in the City. +15% [ICON_GREAT_ARTIST] Great Artist, [ICON_GREAT_MUSICIAN] Great Musician and [ICON_GREAT_WRITER] Great Writer Rate in the City.[NEWLINE][NEWLINE]City must not contain an Academy.'
WHERE Tag IN ('TXT_KEY_BUILDING_EE_SALON_HELP');

UPDATE Language_en_US
SET Text = 'The Salon is an Enlightenment-era building which increases the [ICON_CULTURE] Culture output of a city. It may not be built in a city with an Academy, forcing cities to specialise in either Culture or Science.'
WHERE Tag IN ('TXT_KEY_BUILDING_EE_SALON_STRATEGY');

-- Weigh House
UPDATE Language_en_US
SET Text = '+3 [ICON_GOLD] Gold in the the city and +1 [ICON_GOLD] Gold for every 6 [ICON_CITIZEN] Citizens in the City. Adds a Merchant Specialist.[NEWLINE][NEWLINE]City must have a Bank.'
WHERE Tag IN ('TXT_KEY_BUILDING_EE_WEIGH_HOUSE_HELP');

-- Cloth Mill
UPDATE Language_en_US
SET Text = 'Slightly increases [ICON_HAPPINESS_3] Poverty. +3 [ICON_PRODUCTION] Production in the City and +1 [ICON_PRODUCTION] Production for every 4 [ICON_CITIZEN] Citizens in the City. Each source of [ICON_RES_COTTON] Cotton, [ICON_RES_SHEEP] Sheep and [ICON_RES_SILK] Silk worked by this City produces +2 [ICON_GOLD] Gold.[NEWLINE][NEWLINE]City must be built next to a River.'
WHERE Tag = 'TXT_KEY_BUILDING_EE_CLOTH_MILL_HELP';

-- Tower of Buddhist Incense
UPDATE Language_en_US
SET Text = 'Tower of Buddhist Incense'
WHERE Tag IN ('TXT_KEY_BUILDING_EE_SUMMER_PALACE');

UPDATE Language_en_US
SET Text = 'Provides a free [ICON_GREAT_PEOPLE] Great Person of your choice near the [ICON_CAPITAL] Capital and +2 [ICON_CULTURE] Culture. Reduces [ICON_HAPPINESS_3] Religious Unrest in all cities.[NEWLINE][NEWLINE]Must have built a Manor and a Garden in the city. The [ICON_PRODUCTION] Production Cost and [ICON_CITIZEN] Population Requirements increase based on the number of cities you own.'
WHERE Tag IN ('TXT_KEY_BUILDING_EE_SUMMER_PALACE_HELP');

UPDATE Language_en_US
SET Text = 'This National Wonder provides a free [ICON_GREAT_PEOPLE] Great Person of your choice in the [ICON_CAPITAL] Capital. It also provides +2 [ICON_CULTURE] Culture. A city must have a Manor before it can construct the The Tower of Buddhist Incense.'
WHERE Tag IN ('TXT_KEY_BUILDING_EE_SUMMER_PALACE_STRATEGY');

UPDATE Language_en_US
SET Text = 'Located right in the centre of the front hill of Longevity Mountain in the Summer Palace, the tower was originally meant to be a nine-storey Buddhist pagoda built to resemble the Yellow Crane Tower. The Qianlong Emperor ordered the construction to be stopped just after the eighth storey was built. On the first day and fifteenth day of each lunar month, Empress Dowager Cixi visited the tower to offer incense and pray. [NEWLINE][NEWLINE] The Summer Palace is a complex of gardens, lakes and buildings that was constructed in Beijing under the order of the Qianlong Emperor, of the Qing Dynasty, in 1749.  The project required the creation of artificial lakes in the area, as the palace and surrounding farmland required waterworks and irrigation.  The palace’s design was based off of various aspects of China’s myths, legends, and natural and man-made wonders.  The palace fell into decline along with the Qing dynasty, and was damaged by the British and French during the Second Opium War.  After the fall of Qing, the complex fell into the possession of the former imperial family, now powerless.  It was opened to the public in 1924, after the last emperor, Puyi, was expelled.  Since 1953, the government of the People''s Republic of China have renovated the palace, which is now a World Heritage Site.'
WHERE Tag IN ('TXT_KEY_BUILDING_EE_SUMMER_PALACE_PEDIA');

-- Museum of Modern Art
UPDATE Language_en_US
SET Text = 'Museum of Modern Art'
WHERE Tag IN ('TXT_KEY_BUILDING_MOMA');

UPDATE Language_en_US
SET Text = 'Museum of Modern Art'
WHERE Tag IN ('TXT_KEY_THEMING_BONUS_MOMA');

UPDATE Language_en_US
SET Text = 'The Museum of Modern Art (MoMA) is an art museum located in Midtown Manhattan in New York City, on 53rd Street between Fifth and Sixth Avenues. It has been important in developing and collecting modernist art, and is often identified as the most influential museum of modern art in the world. The museum''s collection offers an overview of modern and contemporary art, including works of architecture and design, drawing, painting, sculpture, photography, prints, illustrated books and artist''s books, film and electronic media. The Library''s holdings include approximately 300,000 books and exhibition catalogs, over 1,000 periodical titles, and over 40,000 files of ephemera about individual artists and groups. The archives holds primary source material related to the history of modern and contemporary art.'
WHERE Tag IN ('TXT_KEY_CIV5_BUILDINGS_MOMA_TEXT');

UPDATE Language_en_US
SET Text = 'Unique American replacement for the Hermitage. A city must have a Museum before it can construct the Museum of Modern Art.[NEWLINE][NEWLINE]+25% [ICON_CULTURE] Culture in the City, and 50% of the [ICON_CULTURE] Culture from Great Works, World Wonders, Natural Wonders, and Improvements is added to the [ICON_TOURISM] Tourism output of the city. Boosts [ICON_CULTURE] Culture and [ICON_RESEARCH] Science output of Museums in all Cities by +5. Contains 3 Slots for Great Works of Art or Artifacts.[NEWLINE][NEWLINE]Requires a Museum in the City. The [ICON_PRODUCTION] Production Cost and [ICON_CITIZEN] Population Requirements increase based on the number of cities you own. [NEWLINE][NEWLINE]+5 [ICON_RESEARCH] Science and +5 [ICON_CULTURE] Culture if Themed.'
WHERE Tag IN ('TXT_KEY_BUILDING_MOMA_HELP');

UPDATE Language_en_US
SET Text = 'Unique American replacement for the Hermitage. In addition to the bonuses of the Hermitage, the Museum of Modern Art boosts Culture and Tourism in the City greatly. The Museum of Modern Art also boosts the Culture and Science output of all Museums in your Empire. The Museum of Modern Art is avaialable later than the Hermitage, however, and requires a Museum instead of an Opera House. The [ICON_PRODUCTION] Production Cost and [ICON_CITIZEN] Population Requirements increase based on the number of cities you own.'
WHERE Tag IN ('TXT_KEY_BUILDING_MOMA_STRATEGY');

-- Smithsonian
UPDATE Language_en_US
SET Text = 'Reduces slightly [ICON_HAPPINESS_3] Illiteracy in all cities. Receive a free Museum and + 5 [ICON_RESEARCH] Science in the city where the wonder is built. All Galleries and Museums gain +1 [ICON_CULTURE] Culture. Contains 2 slots for Great Works of Art.[NEWLINE][NEWLINE]+3 [ICON_RESEARCH] Science and +3 [ICON_GOLD] Gold if Themed.'
WHERE Tag = 'TXT_KEY_WONDER_EE_SMITHSONIAN_HELP';

-- Wat Phra Kaew
UPDATE Language_en_US
SET Text = '+2 [ICON_RESEARCH] Science from Shrines. +3 [ICON_RESEARCH] Science from Temples. +5 [ICON_RESEARCH] Science in the City.[NEWLINE][NEWLINE]City must be built on a river.'
WHERE Tag IN ('TXT_KEY_WONDER_EE_WAT_PHRA_KAEW_HELP');

-- Topkapi Palace
UPDATE Language_en_US
SET Text = '+1 [ICON_PEACE] Faith from Defensive buildings. Does not apply to gifted ones. When Flight is researched, gains +3 [ICON_GOLD] Gold and +2 [ICON_TOURISM] Tourism.'
WHERE Tag IN ('TXT_KEY_WONDER_EE_TOPKAPI_HELP');

-- Torre del Oro
UPDATE Language_en_US
SET Text = 'Naval trade routes originating from this city have a 50% increase in range, and provide +3 [ICON_GOLD] Gold for both parties. Grants +1 [ICON_INTERNATIONAL_TRADE] Trade Route and a free Drydock.[NEWLINE][NEWLINE]City must be built on the coast.'
WHERE Tag IN ('TXT_KEY_WONDER_EE_TORRE_HELP');

-- Light Infantry
UPDATE Language_en_US
SET Text = 'Light Infantry'
WHERE Tag IN ('TXT_KEY_UNIT_EE_SKIRMISHER');

UPDATE Language_en_US
SET Text = 'Light Infantry act as a skirmish force stationed ahead or alongside a larger body of friendly troops to harass the enemy. In ancient and medieval warfare, skirmishers typically carried bows, javelins, or slings. Acting as light infantry with minimal armor, they could run ahead of the main battle line, release a volley, and retreat before the clash of the opposing main forces. During the Napoleonic Wars the role of the skirmisher took on new notability, attempting to disrupt enemy forces by firing into their close-packed ranks and potentially causing early casualties and breaking enemy formation. A skirmish force screening the main body of infantry became so important that eventually all the major European powers developed specialized skirmishing infantry, e.g. the German Jaeger and the French Voltigeurs. While muskets were the predominant weapon at the time, the British Army experimented with rifles, which soon became the predominant firearm. A consequence of these wars was a trend to train line troops to adopt skirmisher tactics. By the late 19th century, the concept of fighting in formation was on the wane, and the distinctions between skirmisher and heavy infantry have largely disappeared.'
WHERE Tag IN ('TXT_KEY_UNIT_EE_SKIRMISHER_PEDIA');

UPDATE Language_en_US
SET Text = 'The Light Infantry is a primary ranged unit of the Enlightenment Era.'
WHERE Tag IN ('TXT_KEY_UNIT_EE_SKIRMISHER_STRATEGY');

-- Line Infantry
UPDATE Language_en_US
SET Text = 'The standard gunpowder unit of the Enlightenment Era, upgrading from and significantly outclassing the Tercio.  The Line Infantry will form the backbone of Enlightenment armies, being used to fight other melee units and protect siege and ranged units.'
WHERE Tag IN ('TXT_KEY_UNIT_EE_LINE_INFANTRY_STRATEGY');

-- Ship of the Line (melee)
UPDATE Language_en_US
SET Text = 'Powerful Enlightenment Era naval melee Unit. Grants adjacent ships combat bonus.'
WHERE Tag IN ('TXT_KEY_UNIT_EE_SHIP_OF_THE_LINE_HELP');

UPDATE Language_en_US
SET Text = 'The Ship of the Line is a melee naval unit of the Enlightenment Era.  Unlike the Corvette, the Ship of the Line requires Iron to build and maintain.  However, a boost to combat strength and a critical boost to movement speed make it worth the price.  Use it to crush outdated fleets with superior firepower and speed.'
WHERE Tag = 'TXT_KEY_UNIT_EE_SHIP_OF_THE_LINE_STRATEGY';

-- Frigate
UPDATE Language_en_US
SET Text = 'The Frigate is an upgrade over the Galleon. It has a substantial strength bonus over the older naval unit. Unlike the Galleon, the Frigate requires Iron to build and maintain. The Frigate can clear the seas of any Caravels, Triremes, and Barbarian units still afloat.'
WHERE Tag = 'TXT_KEY_UNIT_FRIGATE_STRATEGY';

-- Galleon
UPDATE Language_en_US
SET Text = 'Renaissance Era ranged naval Unit. Can enter ocean tiles.'
WHERE Tag IN ('TXT_KEY_UNIT_EE_GALLEON_HELP');

UPDATE Language_en_US
SET Text = 'The Galleon is a Renaissance naval unit.  Upgrading from the Galleass, the Galleon is the first ranged ship to be able to enter Oceans.  Use a fleet of Galleons, supported by larger ships, to conquer overseas cities and protect your overseas holdings.'
WHERE Tag IN ('TXT_KEY_UNIT_EE_GALLEON_STRATEGY');

-- Carrack
UPDATE Language_en_US
SET Text = 'Early Renaissance era melee naval unit used to gain early naval supremacy.'
WHERE Tag IN ('TXT_KEY_UNIT_EE_CARRACK_HELP');

UPDATE Language_en_US
SET Text = 'The Carrack upgrades from the Caravel. It allows you to better secure your coastal cities from seafaring Barbarians or counterattacks from enemy Civilizations.  Its early increased combat strength means it can be used, with support, to take small cities with low Defensive Strength.'
WHERE Tag IN ('TXT_KEY_UNIT_EE_CARRACK_STRATEGY');

-- Corvette (ex. Privateer)
UPDATE Language_en_US
SET Text = 'Naval Unit that attacks as a melee unit. It is stronger and faster than the Carrack.'
WHERE Tag IN ('TXT_KEY_UNIT_PRIVATEER_STRATEGY');

-- Portugese Nau
UPDATE Language_en_US 
SET Text = 'Melee naval unit which excels at sea exploration. Has higher Combat Strength than the Carrack, and can perform an ability when adjacent to City-States to earn [ICON_GOLD] Gold and XP. May only be built by the Portuguese. [NEWLINE][NEWLINE]If possible, when a Nau sells its Exotic Cargo, a Feitoria is [COLOR_POSITIVE_TEXT]automatically created[ENDCOLOR] in its territory.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_PORTUGUESE_NAU';

UPDATE Language_en_US 
SET Text = 'This melee naval unit replaces the Carrack and is skilled at exploration. When it is in a tile next to land owned by another Civilization or City-State you are at peace with, it may perform a one-time trade mission to earn [ICON_GOLD] Gold and XP. The further the land is from your own capital, the greater the bonus, so it is best to use on distant players. Use this unit to explore the map and uncover the locations of other players.'
WHERE Tag = 'TXT_KEY_UNIT_PORTUGUESE_NAU_STRATEGY';

-- Spanish Conquistador
UPDATE Language_en_US
SET Text = 'Renaissance Era unit that specializes in scouting and colonizing overseas. Only Spain may build it. Replaces the Lancer, but is available with Exploration.'
WHERE Tag = 'TXT_KEY_CIV5_SPAIN_CONQUISTADOR_HELP';

UPDATE Language_en_US
SET Text = 'The Conquistador is a multi-purpose unit that is strong both on land and at sea. Replacing the Lancer but becoming available with Exploration instead of Metallurgy, it is an exceptional scout on land with extra visibility. It also has the ability to found new cities, but only on a foreign continent that does not contain the Spanish capital. In the water, the Conquistador has the defensive embarkation promotion that allows it to better defend itself against naval units. It also suffers no penalty when attacking cities, unlike the Lancer.'
WHERE Tag IN ('TXT_KEY_CIV5_SPAIN_CONQUISTADOR_STRATEGY');

-- Gunsmith
UPDATE Language_en_US
SET Text = 'Requires 1 [ICON_RES_IRON] Iron. +20% [ICON_PRODUCTION] Production when building Gunpowder, Armor and Siege Units which also receive additional 15 XP. Increases the Military Unit Supply Cap by 1.'
WHERE Tag IN ('TXT_KEY_BUILDING_EE_GUNSMITH_HELP');

-- Gallery
UPDATE Language_en_US
SET Text = '+1 [ICON_CULTURE] Culture for every 6 [ICON_CITIZEN] Citizens in the City. Contains one Great Work of Art slot. +15% [ICON_GREAT_ARTIST] Great Artist Rate in the City, and all Artists'' Guilds produce +1 [ICON_GOLD] Gold.'
WHERE Tag = 'TXT_KEY_BUILDING_EE_GALLERY_HELP';

-- Museum
UPDATE Language_en_US
SET Text = '+1 [ICON_CULTURE] Culture for every 4 [ICON_CITIZEN] Citizens in the City. Contains two Great Work of Art slots. +25% [ICON_GREAT_ARTIST] Great Artist Rate in the City. +5 [ICON_CULTURE] Culture if Themed.'
WHERE Tag = 'TXT_KEY_BUILDING_MUSEUM_HELP';

-- Tavern
UPDATE Language_en_US
SET Text = 'Slightly reduces [ICON_HAPPINESS_3] Boredom but increases [ICON_HAPPINESS_3] Crime. Nearby [ICON_RES_WHEAT] Wheat, [ICON_RES_DEER] Deer, [ICON_RES_FISH] Fish , [ICON_RES_WINE] Wine and [ICON_RES_BISON] Bison: +1 [ICON_FOOD] Food'
WHERE Tag = 'TXT_KEY_BUILDING_EE_TAVERN_HELP';

-- Manor
UPDATE Language_en_US
SET Text = 'Slightly reduces [ICON_HAPPINESS_3] Crime. +15% Generation of [ICON_GREAT_PEOPLE] Great People'
WHERE Tag = 'TXT_KEY_BUILDING_EE_MANOR_HELP';

UPDATE Language_en_US
SET Text = 'Slightly reduces Crime. Increases the rate at which Great People are generated in a city.'
WHERE Tag = 'TXT_KEY_BUILDING_EE_MANOR_STRATEGY';

-- Russian Cossack
UPDATE Language_en_US
SET Text = 'Only the Russians may build it. This Unit has a combat bonus when fighting enemies that have already taken damage, and is stronger than the Uhlan, which it replaces.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_COSSACK';

UPDATE Language_en_US
SET Text = 'The Cossack is the Russian unique unit, replacing the Uhlan. They are stronger than the Uhlan, and can also move after attacking. They get a combat bonus when battling damaged units. This makes Cossacks exceptionally strong at counter attacking, let the enemy chew up the front line peasants, then tear the weakened foe apart with a Cossack charge!'
WHERE Tag = 'TXT_KEY_UNIT_RUSSIAN_COSSACK_STRATEGY';

-- American Minuteman
UPDATE Language_en_US
SET Text = 'The Minuteman is the American unique unit, replacing the Line Infantry. The Minuteman can move through difficult terrain without penalty.'
WHERE Tag = 'TXT_KEY_UNIT_AMERICAN_MINUTEMAN_STRATEGY';

UPDATE Language_en_US
SET Text = 'Only the Americans may build it. This Unit may move through rough ground as though it were flat, unlike the Line Infantry which it replaces.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_MINUTEMAN'; 

-- English First Rate (ranged)
UPDATE Language_en_US
SET Text = 'First Rate'
WHERE Tag = 'TXT_KEY_UNIT_ENGLISH_SHIPOFTHELINE';

UPDATE Language_en_US
SET Text = 'Powerful Enlightenment Era naval ranged unit which boosts the defensive strength of adjacent friendly units, has increased sight range and can fire twice per turn.  Only the English may build it.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_SHIPOFTHELINE';

UPDATE Language_en_US
SET Text = 'The First Rate is England''s unique unit, replacing the Frigate.  However, it is much stronger than the unit it replaces because it can fire twice per turn.  It also provides combat boosts to nearby allied ships when defending and has increased sight range.  Use it as part of a larger fleet to greatly increase your naval firepower.'
WHERE Tag = 'TXT_KEY_UNIT_ENGLISH_SHIPOFTHELINE_STRATEGY';

-- Howitzer (CBO's Field Gun)
DELETE FROM Language_en_US WHERE Tag = 'TXT_KEY_UNIT_FIELD_GUN';
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_UNIT_FIELD_GUN', 'Howitzer');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_UNIT_FIELD_GUN_PEDIA', 'A howitzer is a type of artillery piece characterized by a relatively short barrel and the use of comparatively small propellant charges to propel projectiles over relatively high trajectories, with a steep angle of descent. Introduced to European armies in the middle of 18th century, these field howitzers were also able to fire explosive shells. In the 1860s, artillery officers discovered that rifled siege howitzers (substantially larger than field howitzers) were a more efficient means of destroying walls than smoothbore siege guns or siege mortars. The lightest of these weapons (later known as "light siege howitzers") had calibers around 150 mm and fired shells that weighed between 40 and 50 kilograms. The heaviest (later called "medium siege howitzers") had calibers between 200 mm and 220 mm and fired shells that weighed about 100 kilograms (220 pounds).');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_UNIT_FIELD_GUN_STRATEGY', 'Industrial Era artillery unit, more powerful than a Field Gun. Moves at half-speed in enemy territory.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_UNIT_FIELD_GUN_HELP', 'Industrial Era artillery unit, more powerful than a Field Gun. Moves at half-speed in enemy territory.');

-- Field Gun
UPDATE Language_en_US
SET Text = 'Enlightenment Era artillery unit. Moves at half-speed in enemy territory.'
WHERE Tag = 'TXT_KEY_UNIT_EE_FIELD_GUN_HELP';

UPDATE Language_en_US
SET Text = 'The Field Gun is the Enlightenment Era artillery unit.  While its range remains the same as the Cannon, from which it upgrades, it is much stronger. Like other siege units, it cannot see very far and must be protected. It also moves at half-speed in enemy territory, but Field Guns are essential to Enlightenment conquests.'
WHERE Tag = 'TXT_KEY_UNIT_EE_FIELD_GUN_STRATEGY';

-- Get back Zoo
UPDATE Language_en_US
SET Text = 'Zoo'
WHERE Tag = 'TXT_KEY_BUILDING_THEATRE';

UPDATE Language_en_US
SET Text = 'Reduces [ICON_HAPPINESS_3] Boredom. Grants an additional Scientist Specialist. Gain 100 [ICON_TOURISM] Tourism (scaling with Era) with all known Civilizations when completed.'
WHERE Tag = 'TXT_KEY_BUILDING_THEATRE_HELP';

UPDATE Language_en_US
SET Text = 'The Zoo reduces Boredom in a city, produces additional Culture, and boosts the Tourism value of nearby Jungle and Forest tiles. Generates a large sum of Tourism with all known Civilizations when completed.'
WHERE Tag = 'TXT_KEY_BUILDING_THEATRE_STRATEGY';

-- Bastion
UPDATE Language_en_US
SET Text = '+150 HP and +15 [ICON_STRENGTH] Defense in the City. Increases the Military Unit Supply Cap from Population in the City by 5%.[NEWLINE][NEWLINE]City must have a Castle.'
WHERE Tag = 'TXT_KEY_BUILDING_EE_BASTION_HELP';

-- Ostrog
UPDATE Language_en_US
SET Text = '+1 [ICON_PRODUCTION] Production and [ICON_GOLD] Gold to Camps, Mines, and Lumbermills. Decreases tile [ICON_CULTURE] Culture and [ICON_GOLD] Gold cost in the City by 50%. Enemy land Units must expend 1 extra [ICON_MOVES] movement per Tile if they move into a Tile worked by this City.[NEWLINE][NEWLINE]+150 HP and +15 [ICON_STRENGTH] Defense in the City. Military Units supplied by this City''s population increased by 10%.'
WHERE Tag = 'TXT_KEY_BUILDING_KREPOST_HELP';

-- Arsenal
UPDATE Language_en_US
SET Text = '+100 HP and +10 [ICON_STRENGTH] Defense in the city. Increases the Military Unit Supply Cap from Population in the City by 5%.[NEWLINE][NEWLINE]City must have a Bastion.'
WHERE Tag = 'TXT_KEY_BUILDING_ARSENAL_HELP';

UPDATE Language_en_US
SET Text = 'The Arsenal is an Industrial-era military building that increases city''s Defense Strength and Hit Points, making it more difficult to capture. Increases number of Military Units supplied by this City''s population. The city must possess a Bastion before it can construct an Arsenal.'
WHERE Tag = 'TXT_KEY_BUILDING_ARSENAL_STRATEGY';

-- Military Base
UPDATE Language_en_US
SET Text = '+20% [ICON_PRODUCTION] Production of Air units. Garrisoned units receive an additional 10 Health when healing in this city. +150 HP and +20 [ICON_STRENGTH] Defense in the city. Increases the Military Unit Supply Cap from Population in the City by 5%.[NEWLINE][NEWLINE]City must have an Arsenal.'
WHERE Tag = 'TXT_KEY_BUILDING_MILITARY_BASE_HELP';

UPDATE Language_en_US
SET Text = 'The Military Base is a late-game building which greatly increases city''s Defensive Strength and Hit Points. Garrisoned units receive an additional 10 Health when healing in this city. Increases number of Military Units supplied by this City''s population. The city must possess an Arsenal before a Military Base may be constructed.'
WHERE Tag = 'TXT_KEY_BUILDING_MILITARY_BASE_STRATEGY';

-- Seaport
UPDATE Language_en_US
SET Text = 'Requires 1 [ICON_RES_COAL] Coal. +200 Hit Points in the City. +25% [ICON_PRODUCTION] Production in City. +1 [ICON_PRODUCTION] Production and +1 [ICON_GOLD] Gold from all Ocean and Coastal tiles. +2 [ICON_PRODUCTION] Production and [ICON_GOLD] Gold from Sea Resources worked by this City. Increases the Military Unit Supply Cap from Population in the City by 10%.[NEWLINE][NEWLINE]City must be built on the coast, and cannot have a Train Station in the City.'
WHERE Tag = 'TXT_KEY_BUILDING_SEAPORT_HELP';

-- Drydock
UPDATE Language_en_US
SET Text = 'Naval units trained in this city have +15% [ICON_STRENGTH] Combat Strength. Increases the Military Unit Supply Cap from Population in the City by 5%. Increases City Hit Points by 100.[NEWLINE][NEWLINE]City must contain a Harbor.'
WHERE Tag = 'TXT_KEY_BUILDING_EE_DRYDOCK_HELP';

UPDATE Language_en_US
SET Text = 'The Drydock is a late Enlightenment Era building which increases the combat strength of naval units which are trained in the city. Increases the Military Unit Supply Cap from Population in the City and City Hit Points. In order to build a Drydock, the city must first contain a Harbor.'
WHERE Tag = 'TXT_KEY_BUILDING_EE_DRYDOCK_STRATEGY';

-- Minefield
UPDATE Language_en_US
SET Text = 'Requires 1 [ICON_RES_IRON] Iron. Enemy Naval Units and Embarked Units must expend 1 extra [ICON_MOVES] movement per Tile if they move into a Tile worked by this City. Increases City Defense by 15 and City Hit Points by 250.[NEWLINE][NEWLINE]City must be built on the coast.'
WHERE Tag = 'TXT_KEY_BUILDING_MINEFIELD_HELP';
