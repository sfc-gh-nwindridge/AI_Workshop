/*=============================================================================
  KYC SUPERHERO WORKSHOP - STEP 1: ENVIRONMENT SETUP
  ===========================================================================
  This script sets up the complete environment for the KYC Superhero 
  Document Processing pipeline, including:
  - Database and schemas (RAW, DOCUMENTS, CURATED, ANALYTICS)
  - Virtual warehouse for processing
  - Git integration to pull superhero documents
  - Internal stages for document processing
  ===========================================================================*/

-- ============================================================================
-- 1.1 ROLE & WAREHOUSE
-- ============================================================================

USE ROLE ACCOUNTADMIN;

CREATE OR REPLACE WAREHOUSE KYC_WORKSHOP_WH
  WAREHOUSE_SIZE = 'MEDIUM'
  AUTO_SUSPEND = 120
  AUTO_RESUME = TRUE
  COMMENT = 'Warehouse for KYC Superhero AI Workshop';

USE WAREHOUSE KYC_WORKSHOP_WH;

-- ============================================================================
-- 1.2 DATABASE & SCHEMAS
-- ============================================================================

CREATE OR REPLACE DATABASE KYC_SUPERHERO_DB 
  COMMENT = 'AI Workshop: KYC Superhero Document Processing with Maker/Checker Architecture';

-- Raw reference data (known heroes, watchlists, sanctions)
CREATE OR REPLACE SCHEMA KYC_SUPERHERO_DB.RAW 
  COMMENT = 'Reference data: known heroes, watchlists, sanctions lists';

-- Document storage and processing stages
CREATE OR REPLACE SCHEMA KYC_SUPERHERO_DB.DOCUMENTS 
  COMMENT = 'Document stages, registry, and processing metadata';

-- Extracted and cross-referenced data (Maker + Checker outputs)
CREATE OR REPLACE SCHEMA KYC_SUPERHERO_DB.CURATED 
  COMMENT = 'Extracted entities, cross-references, and checker validations';

-- Final analytics: EDD flags, risk scores, dashboards
CREATE OR REPLACE SCHEMA KYC_SUPERHERO_DB.ANALYTICS 
  COMMENT = 'EDD assessments, risk scoring, maker/checker dashboard';

-- ============================================================================
-- 1.3 GIT INTEGRATION
-- ============================================================================
-- The superhero documents (ID cards + KYC forms) are hosted on GitHub.
-- We use Snowflake's Git integration to bring them into a repository stage.

CREATE OR REPLACE API INTEGRATION kyc_git_integration
  API_PROVIDER = git_https_api
  API_ALLOWED_PREFIXES = ('https://github.com/jumoral/snowflake_ai_innovation_day')
  ENABLED = TRUE;

CREATE OR REPLACE GIT REPOSITORY KYC_SUPERHERO_DB.DOCUMENTS.SUPERHERO_REPO
  API_INTEGRATION = kyc_git_integration
  ORIGIN = 'https://github.com/jumoral/snowflake_ai_innovation_day.git';

-- Fetch latest from remote
ALTER GIT REPOSITORY KYC_SUPERHERO_DB.DOCUMENTS.SUPERHERO_REPO FETCH;

-- Verify the files are accessible
ls @KYC_SUPERHERO_DB.DOCUMENTS.SUPERHERO_REPO/branches/main/resources/;

-- ============================================================================
-- 1.4 INTERNAL STAGES FOR DOCUMENT PROCESSING
-- ============================================================================
-- Cortex AI functions require files on internal stages with SSE encryption
-- and directory tables enabled.

USE SCHEMA KYC_SUPERHERO_DB.DOCUMENTS;

CREATE OR REPLACE STAGE ID_DOCUMENTS
  DIRECTORY = (ENABLE = TRUE)
  ENCRYPTION = (TYPE = 'SNOWFLAKE_SSE')
  COMMENT = 'Superhero ID card images (PNG)';

CREATE OR REPLACE STAGE KYC_FORMS
  DIRECTORY = (ENABLE = TRUE)
  ENCRYPTION = (TYPE = 'SNOWFLAKE_SSE')
  COMMENT = 'KYC application form PDFs';

-- ============================================================================
-- 1.5 COPY DOCUMENTS FROM GIT REPO TO INTERNAL STAGES
-- ============================================================================

COPY FILES 
  INTO @KYC_SUPERHERO_DB.DOCUMENTS.ID_DOCUMENTS
  FROM @KYC_SUPERHERO_DB.DOCUMENTS.SUPERHERO_REPO/branches/main/resources/
  PATTERN = '.*ID.*\.png';

COPY FILES 
  INTO @KYC_SUPERHERO_DB.DOCUMENTS.KYC_FORMS
  FROM @KYC_SUPERHERO_DB.DOCUMENTS.SUPERHERO_REPO/branches/main/resources/
  PATTERN = '.*KYC.*\.pdf';

-- Verify files are staged
ls @KYC_SUPERHERO_DB.DOCUMENTS.ID_DOCUMENTS;
ls @KYC_SUPERHERO_DB.DOCUMENTS.KYC_FORMS;

-- Refresh directory tables so we can query them
ALTER STAGE KYC_SUPERHERO_DB.DOCUMENTS.ID_DOCUMENTS REFRESH;
ALTER STAGE KYC_SUPERHERO_DB.DOCUMENTS.KYC_FORMS REFRESH;

-- Quick check: list staged files via directory table
SELECT RELATIVE_PATH, SIZE, LAST_MODIFIED 
FROM DIRECTORY(@KYC_SUPERHERO_DB.DOCUMENTS.ID_DOCUMENTS)
ORDER BY RELATIVE_PATH;

SELECT RELATIVE_PATH, SIZE, LAST_MODIFIED 
FROM DIRECTORY(@KYC_SUPERHERO_DB.DOCUMENTS.KYC_FORMS)
ORDER BY RELATIVE_PATH;
