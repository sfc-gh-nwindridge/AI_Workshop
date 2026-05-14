/*=============================================================================
  KYC SUPERHERO WORKSHOP - STEP 0: DEMO ENVIRONMENT SETUP
  ===========================================================================
  Run this ONCE as ACCOUNTADMIN to provision an isolated demo environment.
  
  After running this script, all subsequent workshop scripts (01-05) run as
  KYC_WORKSHOP_ROLE — which only sees the workshop database and warehouse.
  This keeps your demo clean with no other account objects visible.
  
  Creates:
  - Role: KYC_WORKSHOP_ROLE (owns all workshop objects)
  - Warehouse: KYC_WORKSHOP_WH (owned by the role)
  - API Integration for Git (covers source data + your own workshop repo)
  - Cortex AI access (AI_EXTRACT, AI_COMPLETE)
  ===========================================================================*/

USE ROLE ACCOUNTADMIN;

-- ============================================================================
-- 0.1 CREATE DEDICATED ROLE
-- ============================================================================

CREATE ROLE IF NOT EXISTS KYC_WORKSHOP_ROLE
  COMMENT = 'Dedicated role for KYC Superhero AI Workshop - owns all workshop objects';

-- Place under SYSADMIN in the role hierarchy (best practice)
GRANT ROLE KYC_WORKSHOP_ROLE TO ROLE SYSADMIN;

-- Grant to your admin user so you can switch to it
-- Replace 'NWINDRIDGE' with your username if different
GRANT ROLE KYC_WORKSHOP_ROLE TO USER NWINDRIDGE;

-- ============================================================================
-- 0.2 ACCOUNT-LEVEL PRIVILEGES
-- ============================================================================
-- The role needs CREATE DATABASE to set up the workshop database

GRANT CREATE DATABASE ON ACCOUNT TO ROLE KYC_WORKSHOP_ROLE;

-- ============================================================================
-- 0.3 CREATE & TRANSFER WAREHOUSE
-- ============================================================================

CREATE WAREHOUSE IF NOT EXISTS KYC_WORKSHOP_WH
  WAREHOUSE_SIZE = 'MEDIUM'
  AUTO_SUSPEND = 120
  AUTO_RESUME = TRUE
  COMMENT = 'Warehouse for KYC Superhero AI Workshop';

GRANT OWNERSHIP ON WAREHOUSE KYC_WORKSHOP_WH TO ROLE KYC_WORKSHOP_ROLE
  REVOKE CURRENT GRANTS;

-- ============================================================================
-- 0.4 CORTEX AI ACCESS
-- ============================================================================
-- Grant the CORTEX_USER database role so AI_EXTRACT and AI_COMPLETE work

GRANT DATABASE ROLE SNOWFLAKE.CORTEX_USER TO ROLE KYC_WORKSHOP_ROLE;

-- ============================================================================
-- 0.5 GIT INTEGRATION
-- ============================================================================
-- API integrations require ACCOUNTADMIN to create.
-- This single integration covers:
--   1. The source data repo (superhero documents)
--   2. Your own workshop repo (for Git workspace in Snowsight)
--
-- ALLOWED_AUTHENTICATION_SECRETS = ALL permits the role to use any secret
-- for Git authentication (needed for private repos / Git workspaces).

CREATE OR REPLACE API INTEGRATION kyc_workshop_git_integration
  API_PROVIDER = git_https_api
  API_ALLOWED_PREFIXES = (
    'https://github.com/sfc-gh-nwindridge'
  )
  ALLOWED_AUTHENTICATION_SECRETS = ALL
  ENABLED = TRUE;

GRANT USAGE ON INTEGRATION kyc_workshop_git_integration TO ROLE KYC_WORKSHOP_ROLE;

-- ============================================================================
-- 0.6 VERIFICATION
-- ============================================================================
-- Switch to the new role and confirm isolation

USE ROLE KYC_WORKSHOP_ROLE;
USE WAREHOUSE KYC_WORKSHOP_WH;

-- Should show ONLY KYC_WORKSHOP_WH
SHOW WAREHOUSES;

SELECT 'Environment ready! Switch to KYC_WORKSHOP_ROLE and run 01_setup.sql next.' AS status;
