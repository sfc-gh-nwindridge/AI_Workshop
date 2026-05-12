-- ============================================================
-- Generic / anonymised DDL sample
-- Derived from a2_contacts_ddl_*.sql (structure only — names changed)
-- Scope: 4 "Party" (A2-equivalent) + 4 "Contact" (Contacts-equivalent) tables
-- Column types preserved; identifiers and table names fully renamed.
-- ============================================================

-- ------------------------------------------------------------
-- Scope: PARTY  (GENERIC_DB.PARTY_MART)
-- ------------------------------------------------------------

-- >>> GENERIC_DB.PARTY_MART.PARTY_MASTER_CURRENT
create or replace TABLE GENERIC_DB.PARTY_MART.PARTY_MASTER_CURRENT (
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
    primary key (PARTY_KEY)
);

-- >>> GENERIC_DB.PARTY_MART.PARTY_LOCATION_CURRENT
create or replace TABLE GENERIC_DB.PARTY_MART.PARTY_LOCATION_CURRENT (
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

-- >>> GENERIC_DB.PARTY_MART.PARTY_PROFILE_CURRENT
create or replace TABLE GENERIC_DB.PARTY_MART.PARTY_PROFILE_CURRENT (
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

-- >>> GENERIC_DB.PARTY_MART.PARTY_HIERARCHY_CURRENT
create or replace TABLE GENERIC_DB.PARTY_MART.PARTY_HIERARCHY_CURRENT (
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

-- ------------------------------------------------------------
-- Scope: CONTACT  (GENERIC_DB.CONTACT_HUB)
-- ------------------------------------------------------------

-- >>> GENERIC_DB.CONTACT_HUB.CONTACT_RECORD_CURRENT
create or replace TABLE GENERIC_DB.CONTACT_HUB.CONTACT_RECORD_CURRENT (
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
    constraint PK_CONTACT_RECORD_CURRENT primary key (CONTACT_SURROGATE_UUID)
);

-- >>> GENERIC_DB.CONTACT_HUB.CONTACT_LOCATION_CURRENT
create or replace TABLE GENERIC_DB.CONTACT_HUB.CONTACT_LOCATION_CURRENT (
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
    constraint FK_CONTACT_LOCATION_REF_CONTACT foreign key (CONTACT_SURROGATE_UUID) references GENERIC_DB.CONTACT_HUB.CONTACT_RECORD_CURRENT(CONTACT_SURROGATE_UUID)
);

-- >>> GENERIC_DB.CONTACT_HUB.CONTACT_EMAIL_CURRENT
create or replace TABLE GENERIC_DB.CONTACT_HUB.CONTACT_EMAIL_CURRENT (
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
    constraint FK_CONTACT_EMAIL_REF_CONTACT foreign key (CONTACT_SURROGATE_UUID) references GENERIC_DB.CONTACT_HUB.CONTACT_RECORD_CURRENT(CONTACT_SURROGATE_UUID)
);

-- >>> GENERIC_DB.CONTACT_HUB.CONTACT_RELATIONSHIP_CURRENT
create or replace TABLE GENERIC_DB.CONTACT_HUB.CONTACT_RELATIONSHIP_CURRENT (
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
    constraint FK_CONTACT_RELATIONSHIP_REF_CONTACT foreign key (CONTACT_SURROGATE_UUID) references GENERIC_DB.CONTACT_HUB.CONTACT_RECORD_CURRENT(CONTACT_SURROGATE_UUID)
);
