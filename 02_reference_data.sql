/*=============================================================================
  KYC SUPERHERO WORKSHOP - STEP 2: REFERENCE DATA
  ===========================================================================
  Populate the "known entity" database that the pipeline will cross-reference
  against. This simulates:
  - Client master data (heroes we already know about)
  - Sanctions/watchlists (entities flagged for enhanced due diligence)
  
  The superhero theme makes compliance concepts tangible:
  - Tony Stark → arms dealing history (sanctions risk)
  - Hulk → property destruction (terrorism watchlist)
  - Thor → foreign PEP (Asgardian royalty)
  ===========================================================================*/

USE ROLE KYC_WORKSHOP_ROLE;
USE DATABASE KYC_SUPERHERO_DB;
USE SCHEMA RAW;
USE WAREHOUSE KYC_WORKSHOP_WH;

-- ============================================================================
-- 2.1 HEROES TABLE - Known Entities Database
-- ============================================================================
-- This represents your existing client/counterparty master data.
-- When new KYC documents arrive, we cross-reference extracted names against
-- this table to identify known entities and their risk profiles.

CREATE OR REPLACE TABLE HEROES (
  HERO_ID          INT PRIMARY KEY,
  HERO_NAME        VARCHAR(100)   NOT NULL,
  REAL_NAME        VARCHAR(100)   NOT NULL,
  ALIAS            VARCHAR(200),
  AFFILIATION      VARCHAR(100),
  RISK_LEVEL       VARCHAR(20)    NOT NULL,  -- LOW, MEDIUM, HIGH, CRITICAL
  KNOWN_ASSOCIATES ARRAY,
  POWERS           ARRAY,
  LAST_KNOWN_LOCATION VARCHAR(200),
  STATUS           VARCHAR(20),               -- ACTIVE, RETIRED, DECEASED, MISSING
  NATIONALITY      VARCHAR(100),
  DATE_OF_BIRTH    DATE,
  NOTES            VARCHAR(500)
);

INSERT INTO HEROES VALUES
(1, 'Iron Man', 'Tony Stark', 'The Merchant of Death',
 'Avengers', 'HIGH',
 ARRAY_CONSTRUCT('Pepper Potts', 'War Machine', 'Spider-Man', 'Happy Hogan'),
 ARRAY_CONSTRUCT('Genius Intellect', 'Powered Armor', 'Extreme Wealth', 'Advanced Weapons'),
 '10880 Malibu Point, Malibu, CA',
 'ACTIVE', 'American', '1970-05-29',
 'Former weapons manufacturer. Stark Industries previously on arms embargo lists. High net worth individual.'),

(2, 'Captain America', 'Steve Rogers', 'The First Avenger',
 'Avengers', 'LOW',
 ARRAY_CONSTRUCT('Bucky Barnes', 'Sam Wilson', 'Black Widow', 'Peggy Carter'),
 ARRAY_CONSTRUCT('Super Soldier Serum', 'Vibranium Shield', 'Enhanced Strength', 'Tactical Leadership'),
 'Washington DC',
 'ACTIVE', 'American', '1918-07-04',
 'US Government enhanced operative. Low risk - strong institutional ties.'),

(3, 'Black Widow', 'Natasha Romanoff', 'Natalia Alianovna Romanova',
 'Avengers', 'HIGH',
 ARRAY_CONSTRUCT('Clint Barton', 'Nick Fury', 'Yelena Belova', 'Red Guardian'),
 ARRAY_CONSTRUCT('Espionage', 'Martial Arts', 'Weapons Expert', 'Multilingual'),
 'Classified',
 'ACTIVE', 'Russian', '1984-11-22',
 'Former KGB/Red Room operative. Multiple known aliases and forged identities. Identity verification challenging.'),

(4, 'Hulk', 'Bruce Banner', 'The Green Goliath',
 'Avengers', 'CRITICAL',
 ARRAY_CONSTRUCT('Betty Ross', 'Tony Stark', 'Thor', 'She-Hulk'),
 ARRAY_CONSTRUCT('Gamma Radiation', 'Superhuman Strength', 'Regeneration', 'Genius-level Physics'),
 'Unknown - frequently changes location',
 'ACTIVE', 'American', '1969-12-18',
 'Significant property destruction history. Multiple jurisdictions have outstanding warrants. Flight risk.'),

(5, 'Thor', 'Thor Odinson', 'God of Thunder',
 'Avengers', 'MEDIUM',
 ARRAY_CONSTRUCT('Loki', 'Jane Foster', 'Valkyrie', 'Heimdall'),
 ARRAY_CONSTRUCT('Mjolnir', 'Lightning Control', 'Superhuman Strength', 'Longevity'),
 'New Asgard, Tonsberg, Norway',
 'ACTIVE', 'Asgardian', '0964-01-01',
 'Foreign PEP - Crown Prince of Asgard. Extraterrestrial origin. Non-standard identification documents.'),

(6, 'Spider-Man', 'Peter Parker', 'The Web-Slinger',
 'Avengers', 'LOW',
 ARRAY_CONSTRUCT('May Parker', 'Ned Leeds', 'MJ Watson', 'Tony Stark'),
 ARRAY_CONSTRUCT('Wall-Crawling', 'Spider-Sense', 'Web-Shooting', 'Enhanced Agility'),
 'Queens, New York',
 'ACTIVE', 'American', '2001-08-10',
 'Minor when first active. Low financial footprint. Mentored by Stark.'),

(7, 'Black Panther', 'T''Challa', 'King of Wakanda',
 'Avengers', 'MEDIUM',
 ARRAY_CONSTRUCT('Shuri', 'Okoye', 'Nakia', 'M''Baku'),
 ARRAY_CONSTRUCT('Vibranium Suit', 'Enhanced Strength', 'Heart-Shaped Herb', 'Genius Intellect'),
 'Wakanda',
 'ACTIVE', 'Wakandan', '1980-04-15',
 'Foreign PEP - Head of State (Wakanda). Controls significant vibranium reserves. Dual role as monarch and operative.'),

(8, 'Scarlet Witch', 'Wanda Maximoff', 'The Scarlet Witch',
 'Avengers', 'HIGH',
 ARRAY_CONSTRUCT('Vision', 'Pietro Maximoff', 'Agatha Harkness', 'Doctor Strange'),
 ARRAY_CONSTRUCT('Reality Manipulation', 'Chaos Magic', 'Telekinesis', 'Mind Control'),
 'Westview, New Jersey',
 'ACTIVE', 'Sokovian', '1989-02-10',
 'Former HYDRA test subject. Sokovia is a collapsed state - document verification impossible. Reality-altering abilities complicate verification.'),

(9, 'Doctor Strange', 'Stephen Strange', 'Sorcerer Supreme',
 'Avengers', 'MEDIUM',
 ARRAY_CONSTRUCT('Wong', 'Christine Palmer', 'Ancient One', 'Mordo'),
 ARRAY_CONSTRUCT('Mystic Arts', 'Time Manipulation', 'Dimensional Travel', 'Medical Expertise'),
 '177A Bleecker Street, New York',
 'ACTIVE', 'American', '1975-11-18',
 'Former neurosurgeon. Significant wealth pre-injury. Now controls extraterrestrial artifacts of unknown value.'),

(10, 'Hawkeye', 'Clint Barton', 'The Marksman',
 'Avengers', 'LOW',
 ARRAY_CONSTRUCT('Laura Barton', 'Kate Bishop', 'Black Widow', 'Nick Fury'),
 ARRAY_CONSTRUCT('Expert Marksmanship', 'Tactical Expertise', 'Acrobatics', 'Weapons Mastery'),
 'Rural Missouri (farm)',
 'RETIRED', 'American', '1971-01-07',
 'Former SHIELD agent. Clean record. Family man. Low financial complexity.');


-- ============================================================================
-- 2.2 WATCHLIST TABLE - Sanctions & Monitoring Lists
-- ============================================================================
-- Simulates OFAC, EU Sanctions, HMT, UN Security Council lists, plus
-- internal bank watchlists. Entities here trigger Enhanced Due Diligence.

CREATE OR REPLACE TABLE WATCHLIST (
  WATCHLIST_ID    INT PRIMARY KEY,
  ENTITY_NAME     VARCHAR(200)   NOT NULL,
  ENTITY_TYPE     VARCHAR(50),                -- INDIVIDUAL, ORGANISATION, VESSEL, ALIAS
  REASON          VARCHAR(500)   NOT NULL,
  RISK_CATEGORY   VARCHAR(50)    NOT NULL,    -- TERRORISM, MONEY_LAUNDERING, SANCTIONS, PEP, PROLIFERATION
  DATE_ADDED      DATE           NOT NULL,
  SOURCE          VARCHAR(100)   NOT NULL,
  JURISDICTION    VARCHAR(100),
  ACTIVE          BOOLEAN        DEFAULT TRUE,
  MATCH_ALIASES   ARRAY,
  NOTES           VARCHAR(500)
);

INSERT INTO WATCHLIST VALUES
(1, 'Stark Industries', 'ORGANISATION',
 'Historical arms manufacturing and weapons exports to non-allied nations',
 'SANCTIONS', '2010-03-15', 'US Treasury / OFAC', 'United States',
 TRUE, ARRAY_CONSTRUCT('Stark Enterprises', 'Stark International', 'SI Defence'),
 'Partially delisted after weapons manufacturing ceased. Monitoring continues.'),

(2, 'Hulk', 'INDIVIDUAL',
 'Repeated catastrophic property destruction across multiple jurisdictions',
 'TERRORISM', '2012-06-01', 'World Security Council', 'International',
 TRUE, ARRAY_CONSTRUCT('Bruce Banner', 'The Green Goliath', 'Joe Fixit'),
 'Harlem incident. Johannesburg incident. Estimated $3.2B in damages.'),

(3, 'Loki Laufeyson', 'INDIVIDUAL',
 'Led alien invasion of New York City. War crimes. Mass casualties.',
 'TERRORISM', '2012-05-04', 'SHIELD / UN Security Council', 'International',
 TRUE, ARRAY_CONSTRUCT('Loki Odinson', 'God of Mischief', 'D.B. Cooper'),
 'Asgardian national. Brother of Thor Odinson. Shapeshifter - identity verification extremely difficult.'),

(4, 'HYDRA', 'ORGANISATION',
 'Terrorist organisation infiltrating government institutions globally',
 'TERRORISM', '2014-04-04', 'NATO Intelligence', 'International',
 TRUE, ARRAY_CONSTRUCT('Strategic Scientific Reserve (historical)', 'The Other Side'),
 'Known to use shell companies and front organisations for funding.'),

(5, 'Sokovia', 'ORGANISATION',
 'Collapsed state - no functioning government or document authority',
 'SANCTIONS', '2015-05-01', 'EU Sanctions List', 'European Union',
 TRUE, ARRAY_CONSTRUCT('Sokovian Republic', 'Republic of Sokovia'),
 'All documents issued by Sokovia considered unverifiable. Citizens require enhanced screening.'),

(6, 'Ten Rings', 'ORGANISATION',
 'International terrorist organisation. Arms trafficking. Kidnapping.',
 'TERRORISM', '2008-05-02', 'US Treasury / CIA', 'International',
 TRUE, ARRAY_CONSTRUCT('The Mandarin', 'Ten Rings Organisation'),
 'Kidnapped Tony Stark. Connected to global arms black market.'),

(7, 'Wanda Maximoff', 'INDIVIDUAL',
 'HYDRA-enhanced operative. Westview incident - unlawful detention of civilians.',
 'TERRORISM', '2021-11-05', 'FBI / SWORD', 'United States',
 TRUE, ARRAY_CONSTRUCT('Scarlet Witch', 'Wanda Django Maximoff'),
 'Reality-altering abilities. Former HYDRA volunteer. Sokovian national (unverifiable documents).'),

(8, 'Oscorp Industries', 'ORGANISATION',
 'Illegal genetic experimentation. Corporate fraud. Market manipulation.',
 'MONEY_LAUNDERING', '2018-07-20', 'SEC / DOJ', 'United States',
 TRUE, ARRAY_CONSTRUCT('Oscorp', 'Norman Osborn Enterprises'),
 'CEO Norman Osborn has known association with Spider-Man adversaries.'),

(9, 'Wakanda Royal Family', 'ORGANISATION',
 'Foreign PEP - controls estimated $10T vibranium reserves. No extradition treaty.',
 'PEP', '2018-02-16', 'HM Treasury / FATF', 'United Kingdom',
 TRUE, ARRAY_CONSTRUCT('House of Bashenga', 'Black Panther Clan', 'Golden Tribe'),
 'Recently revealed hidden technological civilisation. Full extent of assets unknown.'),

(10, 'Red Room', 'ORGANISATION',
 'Soviet/Russian covert assassination programme. Human trafficking.',
 'TERRORISM', '1991-12-25', 'MI6 / CIA', 'Russia',
 TRUE, ARRAY_CONSTRUCT('Black Widow Programme', 'Department X'),
 'Natasha Romanoff is a known graduate. Programme believed dissolved but unconfirmed.'),

(11, 'Merchant of Death', 'INDIVIDUAL',
 'Historic alias for Tony Stark during weapons manufacturing era.',
 'SANCTIONS', '2008-01-01', 'Interpol', 'International',
 FALSE, ARRAY_CONSTRUCT('Tony Stark', 'Anthony Edward Stark'),
 'Delisted 2010 following cessation of weapons manufacturing. Alias remains on monitoring list.'),

(12, 'Winter Soldier', 'INDIVIDUAL',
 'Brainwashed assassin. Multiple political assassinations over 70 years.',
 'TERRORISM', '2014-04-04', 'CIA / Interpol', 'International',
 TRUE, ARRAY_CONSTRUCT('Bucky Barnes', 'James Buchanan Barnes', 'Asset'),
 'Known associate of Captain America. Pardoned by Wakanda but remains on external watchlists.');


-- ============================================================================
-- 2.3 VERIFICATION QUERIES
-- ============================================================================

-- Verify hero data loaded
SELECT HERO_ID, HERO_NAME, REAL_NAME, RISK_LEVEL, STATUS 
FROM HEROES ORDER BY HERO_ID;

-- Verify watchlist loaded
SELECT WATCHLIST_ID, ENTITY_NAME, RISK_CATEGORY, SOURCE, ACTIVE 
FROM WATCHLIST ORDER BY WATCHLIST_ID;

-- Preview: Which heroes would trigger watchlist matches?
SELECT 
  h.HERO_NAME,
  h.REAL_NAME,
  h.RISK_LEVEL,
  w.ENTITY_NAME AS watchlist_entity,
  w.RISK_CATEGORY,
  w.REASON
FROM HEROES h
JOIN WATCHLIST w 
  ON LOWER(h.REAL_NAME) ILIKE '%' || LOWER(w.ENTITY_NAME) || '%'
  OR LOWER(h.HERO_NAME) ILIKE '%' || LOWER(w.ENTITY_NAME) || '%'
  OR LOWER(h.ALIAS) ILIKE '%' || LOWER(w.ENTITY_NAME) || '%'
WHERE w.ACTIVE = TRUE
ORDER BY h.HERO_ID;
