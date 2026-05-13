/*=============================================================================
  CPR GENERIC DATA WORKSHOP - STEP 1: DATABASE & ENVIRONMENT SETUP
  ===========================================================================
  Run this ONCE as ACCOUNTADMIN to provision an isolated demo environment,
  then switches to CPR_WORKSHOP_ROLE to create the database and all tables.

  Creates:
  - Role: CPR_WORKSHOP_ROLE (owns all workshop objects)
  - Warehouse: CPR_WORKSHOP_WH (MEDIUM, auto-suspend 120s)
  - Database: GENERIC_DB
  - Schemas: PARTY_MART, CONTACT_HUB, COMPLIANCE, ANALYTICS, DOCUMENTS
  - Tables: 8 base tables (4 Party + 4 Contact)
  - Cortex AI access (SNOWFLAKE.CORTEX_USER)

  After running this script, all subsequent workshop scripts run as
  CPR_WORKSHOP_ROLE.
  ===========================================================================*/

-- ============================================================================
-- 1.1 CREATE DEDICATED ROLE (requires ACCOUNTADMIN)
-- ============================================================================

USE ROLE ACCOUNTADMIN;

CREATE ROLE IF NOT EXISTS CPR_WORKSHOP_ROLE
  COMMENT = 'Dedicated role for CPR Generic Data Workshop - owns all workshop objects';

-- Place under SYSADMIN in the role hierarchy (best practice)
GRANT ROLE CPR_WORKSHOP_ROLE TO ROLE SYSADMIN;

-- Grant to the current user so you can switch to it
GRANT ROLE CPR_WORKSHOP_ROLE TO USER NWINDRIDGE;

-- ============================================================================
-- 1.2 ACCOUNT-LEVEL PRIVILEGES
-- ============================================================================

GRANT CREATE DATABASE ON ACCOUNT TO ROLE CPR_WORKSHOP_ROLE;

-- ============================================================================
-- 1.3 CREATE & TRANSFER WAREHOUSE
-- ============================================================================

CREATE WAREHOUSE IF NOT EXISTS CPR_WORKSHOP_WH
  WAREHOUSE_SIZE = 'MEDIUM'
  AUTO_SUSPEND = 120
  AUTO_RESUME = TRUE
  COMMENT = 'Warehouse for CPR Generic Data Workshop';

GRANT OWNERSHIP ON WAREHOUSE CPR_WORKSHOP_WH TO ROLE CPR_WORKSHOP_ROLE
  REVOKE CURRENT GRANTS;

-- ============================================================================
-- 1.4 CORTEX AI ACCESS
-- ============================================================================

GRANT DATABASE ROLE SNOWFLAKE.CORTEX_USER TO ROLE CPR_WORKSHOP_ROLE;

-- ============================================================================
-- 1.5 SWITCH TO WORKSHOP ROLE
-- ============================================================================

USE ROLE CPR_WORKSHOP_ROLE;
USE WAREHOUSE CPR_WORKSHOP_WH;

-- ============================================================================
-- 1.6 DATABASE & SCHEMAS
-- ============================================================================

CREATE OR REPLACE DATABASE GENERIC_DB
  COMMENT = 'CPR Workshop: Generic party & contact data with KYC/AML analytics';

CREATE OR REPLACE SCHEMA GENERIC_DB.PARTY_MART
  COMMENT = 'Party master data: entities, locations, profiles, hierarchies';

CREATE OR REPLACE SCHEMA GENERIC_DB.CONTACT_HUB
  COMMENT = 'Contact records: individuals, addresses, emails, relationships';

CREATE OR REPLACE SCHEMA GENERIC_DB.COMPLIANCE
  COMMENT = 'Compliance views, risk scoring, screening results';

CREATE OR REPLACE SCHEMA GENERIC_DB.ANALYTICS
  COMMENT = 'Analytical outputs: dashboards, aggregations, AI-driven insights';

CREATE OR REPLACE SCHEMA GENERIC_DB.DOCUMENTS
  COMMENT = 'Document stages, registry, and processing metadata';

-- ============================================================================
-- 1.7 PARTY TABLES (GENERIC_DB.PARTY_MART)
-- ============================================================================

CREATE OR REPLACE TABLE GENERIC_DB.PARTY_MART.PARTY_MASTER_CURRENT (
    PARTY_NUMBER           VARCHAR(9)      NOT NULL DEFAULT '',
    PARTY_SYSTEM_ID        NUMBER(38,0)    NOT NULL DEFAULT 0,
    PARTY_KEY              VARCHAR(15)     NOT NULL DEFAULT '',
    RECORD_VERSION         VARCHAR(32)     NOT NULL DEFAULT '',
    SEQUENCE_TOKEN         VARCHAR(50)     NOT NULL DEFAULT '',
    ROW_CHECKSUM           VARCHAR(50)     NOT NULL DEFAULT '',
    EVENT_FLAG             VARCHAR(1)      NOT NULL DEFAULT '',
    VERSION_ID             NUMBER(38,0)    NOT NULL DEFAULT 0,
    EVENT_TS               TIMESTAMP_NTZ(6) NOT NULL,
    SOURCE_TS              TIMESTAMP_NTZ(6) NOT NULL,
    OPENED_DATE            TIMESTAMP_NTZ(6),
    CLOSED_DATE            TIMESTAMP_NTZ(6),
    SHORT_LABEL            VARCHAR(10),
    STATUS_CODE            VARCHAR(1),
    BASE_CURRENCY_CD       VARCHAR(3),
    PRIMARY KEY (PARTY_KEY)
);

CREATE OR REPLACE TABLE GENERIC_DB.PARTY_MART.PARTY_LOCATION_CURRENT (
    PARTY_NUMBER           VARCHAR(9)      NOT NULL,
    PARTY_KEY              VARCHAR(15)     NOT NULL,
    LOCATION_SEQ           NUMBER(3,0)     NOT NULL,
    LOCATION_TYPE_CD       VARCHAR(2)      NOT NULL,
    LOCATION_TYPE_DESC     VARCHAR(25),
    DISPLAY_LINE_1         VARCHAR(90),
    DISPLAY_LINE_2         VARCHAR(90),
    DISPLAY_LINE_3         VARCHAR(90),
    LOCALITY               VARCHAR(20),
    REGION_CODE            VARCHAR(2),
    NATION_CODE            VARCHAR(3),
    POSTAL_CODE            VARCHAR(9),
    PRIMARY_PHONE          VARCHAR(15),
    SECONDARY_PHONE        VARCHAR(18),
    EFFECTIVE_TS           TIMESTAMP_NTZ(6)
);

CREATE OR REPLACE TABLE GENERIC_DB.PARTY_MART.PARTY_PROFILE_CURRENT (
    PARTY_PROFILE_ID       VARCHAR(20)     NOT NULL,
    RECORD_VERSION         VARCHAR(50)     NOT NULL,
    SEQUENCE_TOKEN         VARCHAR(50)     NOT NULL,
    ROW_CHECKSUM           VARCHAR(50)     NOT NULL,
    EVENT_FLAG             VARCHAR(1)      NOT NULL,
    VERSION_ID             NUMBER(38,0)    NOT NULL,
    EVENT_TS               TIMESTAMP_NTZ(6) NOT NULL,
    SOURCE_TS              TIMESTAMP_NTZ(6) NOT NULL,
    LEGAL_FORM_CD          VARCHAR(30),
    JURISDICTION_CD        VARCHAR(30),
    COUNTRY_CD             VARCHAR(2),
    BIRTH_DATE             TIMESTAMP_NTZ(6),
    PARTY_NAME             VARCHAR(200),
    CREATED_TS             TIMESTAMP_NTZ(6),
    LAST_UPDATE_TS         TIMESTAMP_NTZ(6)
);

CREATE OR REPLACE TABLE GENERIC_DB.PARTY_MART.PARTY_HIERARCHY_CURRENT (
    CHILD_PARTY_ID         VARCHAR(20)     NOT NULL,
    PARENT_PARTY_ID        VARCHAR(20),
    ROOT_PARTY_ID          VARCHAR(20),
    HIERARCHY_LEVEL        NUMBER(38,0),
    RELATION_TYPE_CD       VARCHAR(30),
    RECORD_VERSION         VARCHAR(50),
    SEQUENCE_TOKEN         VARCHAR(50),
    ROW_CHECKSUM           VARCHAR(50),
    EVENT_FLAG             VARCHAR(1),
    VERSION_ID             NUMBER(38,0),
    EVENT_TS               TIMESTAMP_NTZ(6),
    SOURCE_TS              TIMESTAMP_NTZ(6),
    EFFECTIVE_FROM_TS      TIMESTAMP_NTZ(6),
    EFFECTIVE_TO_TS        TIMESTAMP_NTZ(6),
    ACTIVE_FLAG            VARCHAR(1)
);

-- ============================================================================
-- 1.8 CONTACT TABLES (GENERIC_DB.CONTACT_HUB)
-- ============================================================================

CREATE OR REPLACE TABLE GENERIC_DB.CONTACT_HUB.CONTACT_RECORD_CURRENT (
    CONTACT_ID             VARCHAR(9)      NOT NULL,
    CONTACT_SURROGATE_UUID VARCHAR(24)     NOT NULL,
    GIVEN_NAME             VARCHAR(50),
    FAMILY_NAME            VARCHAR(50),
    DISPLAY_NAME           VARCHAR(120),
    BIRTH_DATE             TIMESTAMP_NTZ(6),
    NATION_CODE            VARCHAR(3),
    PRIMARY_LANGUAGE_CD    VARCHAR(2),
    STATUS_CODE            VARCHAR(1),
    CREATED_TS             TIMESTAMP_NTZ(6),
    LAST_UPDATE_TS         TIMESTAMP_NTZ(6),
    SOURCE_SYSTEM_CD       VARCHAR(30),
    EVENT_FLAG             VARCHAR(1),
    VERSION_ID             NUMBER(38,0),
    CONSTRAINT PK_CONTACT_RECORD_CURRENT PRIMARY KEY (CONTACT_SURROGATE_UUID)
);

CREATE OR REPLACE TABLE GENERIC_DB.CONTACT_HUB.CONTACT_LOCATION_CURRENT (
    CONTACT_LOCATION_ID    NUMBER(38,0)    NOT NULL,
    CONTACT_SURROGATE_UUID VARCHAR(24)     NOT NULL,
    LOCATION_TYPE_CD       VARCHAR(30),
    DISPLAY_LINE_1         VARCHAR(90),
    DISPLAY_LINE_2         VARCHAR(90),
    LOCALITY               VARCHAR(20),
    REGION_CODE            VARCHAR(2),
    NATION_CODE            VARCHAR(3),
    POSTAL_CODE            VARCHAR(9),
    PRIMARY_FLAG           VARCHAR(1),
    EFFECTIVE_FROM_TS      TIMESTAMP_NTZ(6),
    EFFECTIVE_TO_TS        TIMESTAMP_NTZ(6),
    EVENT_FLAG             VARCHAR(1),
    VERSION_ID             NUMBER(38,0),
    CONSTRAINT FK_CONTACT_LOCATION_REF_CONTACT FOREIGN KEY (CONTACT_SURROGATE_UUID)
        REFERENCES GENERIC_DB.CONTACT_HUB.CONTACT_RECORD_CURRENT(CONTACT_SURROGATE_UUID)
);

CREATE OR REPLACE TABLE GENERIC_DB.CONTACT_HUB.CONTACT_EMAIL_CURRENT (
    EMAIL_RECORD_ID        NUMBER(38,0)    NOT NULL,
    CONTACT_SURROGATE_UUID VARCHAR(24)     NOT NULL,
    EMAIL_ADDRESS          VARCHAR(255),
    EMAIL_TYPE_CD          VARCHAR(30),
    PRIMARY_FLAG           VARCHAR(1),
    VERIFIED_FLAG          VARCHAR(1),
    VERIFIED_TS            TIMESTAMP_NTZ(6),
    EFFECTIVE_FROM_TS      TIMESTAMP_NTZ(6),
    EFFECTIVE_TO_TS        TIMESTAMP_NTZ(6),
    SOURCE_SYSTEM_CD       VARCHAR(30),
    EVENT_FLAG             VARCHAR(1),
    VERSION_ID             NUMBER(38,0),
    CREATED_TS             TIMESTAMP_NTZ(6),
    LAST_UPDATE_TS         TIMESTAMP_NTZ(6),
    CONSTRAINT FK_CONTACT_EMAIL_REF_CONTACT FOREIGN KEY (CONTACT_SURROGATE_UUID)
        REFERENCES GENERIC_DB.CONTACT_HUB.CONTACT_RECORD_CURRENT(CONTACT_SURROGATE_UUID)
);

CREATE OR REPLACE TABLE GENERIC_DB.CONTACT_HUB.CONTACT_RELATIONSHIP_CURRENT (
    RELATIONSHIP_ID        VARCHAR(9)      NOT NULL,
    CONTACT_SURROGATE_UUID VARCHAR(24)     NOT NULL,
    RELATED_CONTACT_UUID   VARCHAR(24),
    RELATIONSHIP_TYPE_CD   VARCHAR(30),
    RELATIONSHIP_ROLE_CD   VARCHAR(30),
    PRIMARY_FLAG           VARCHAR(1),
    EFFECTIVE_FROM_TS      TIMESTAMP_NTZ(6),
    EFFECTIVE_TO_TS        TIMESTAMP_NTZ(6),
    SOURCE_SYSTEM_CD       VARCHAR(30),
    EVENT_FLAG             VARCHAR(1),
    VERSION_ID             NUMBER(38,0),
    CREATED_TS             TIMESTAMP_NTZ(6),
    LAST_UPDATE_TS         TIMESTAMP_NTZ(6),
    ACTIVE_FLAG            VARCHAR(1),
    CONSTRAINT FK_CONTACT_RELATIONSHIP_REF_CONTACT FOREIGN KEY (CONTACT_SURROGATE_UUID)
        REFERENCES GENERIC_DB.CONTACT_HUB.CONTACT_RECORD_CURRENT(CONTACT_SURROGATE_UUID)
);

-- ============================================================================
-- 1.9 VERIFICATION
-- ============================================================================

-- Confirm all tables exist
SELECT TABLE_SCHEMA, TABLE_NAME, ROW_COUNT
FROM GENERIC_DB.INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_SCHEMA, TABLE_NAME;

SELECT 'Setup complete! Run 02_seed_data.sql next.' AS STATUS;
