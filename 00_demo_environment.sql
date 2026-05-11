/*=============================================================================
  KYC SUPERHERO WORKSHOP - STEP 0: DEMO ENVIRONMENT SETUP
  ===========================================================================
  Run this ONCE as ACCOUNTADMIN to provision an isolated demo environment.
  
  After running this script, all subsequent workshop scripts run as
  KYC_WORKSHOP_ROLE — which only sees the workshop database and warehouse.
  This keeps your demo clean with no other objects visible.
  
  Creates:
  - Role: KYC_WORKSHOP_ROLE (owns all workshop objects)
  - User: KYC_WORKSHOP_USER (logs in with only workshop objects visible)
  - Warehouse: KYC_WORKSHOP_WH (owned by the role)
  - API Integration for Git (requires ACCOUNTADMIN, usage granted to role)
  ===========================================================================*/

-- ============================================================================
-- 0.1 CREATE DEDICATED ROLE
-- ============================================================================

USE ROLE ACCOUNTADMIN;

CREATE ROLE IF NOT EXISTS KYC_WORKSHOP_ROLE
  COMMENT = 'Dedicated role for KYC Superhero AI Workshop - owns all workshop objects';

-- Place under SYSADMIN in the role hierarchy (best practice)
GRANT ROLE KYC_WORKSHOP_ROLE TO ROLE SYSADMIN;

-- Grant to your current admin user so you can switch to it
GRANT ROLE KYC_WORKSHOP_ROLE TO USER CURRENT_USER;

-- ============================================================================
-- 0.2 CREATE & TRANSFER WAREHOUSE
-- ============================================================================

CREATE WAREHOUSE IF NOT EXISTS KYC_WORKSHOP_WH
  WAREHOUSE_SIZE = 'MEDIUM'
  AUTO_SUSPEND = 120
  AUTO_RESUME = TRUE
  COMMENT = 'Warehouse for KYC Superhero AI Workshop';

GRANT OWNERSHIP ON WAREHOUSE KYC_WORKSHOP_WH TO ROLE KYC_WORKSHOP_ROLE
  REVOKE CURRENT GRANTS;

-- ============================================================================
-- 0.3 CREATE & TRANSFER DATABASE
-- ============================================================================

CREATE DATABASE IF NOT EXISTS KYC_SUPERHERO_DB
  COMMENT = 'AI Workshop: KYC Superhero Document Processing with Maker/Checker Architecture';

GRANT OWNERSHIP ON DATABASE KYC_SUPERHERO_DB TO ROLE KYC_WORKSHOP_ROLE
  REVOKE CURRENT GRANTS;

-- Transfer ownership of the PUBLIC schema (created automatically)
GRANT OWNERSHIP ON SCHEMA KYC_SUPERHERO_DB.PUBLIC TO ROLE KYC_WORKSHOP_ROLE
  REVOKE CURRENT GRANTS;

-- ============================================================================
-- 0.4 CORTEX AI ACCESS
-- ============================================================================
-- Grant the CORTEX_USER database role so AI_EXTRACT and AI_COMPLETE work

GRANT DATABASE ROLE SNOWFLAKE.CORTEX_USER TO ROLE KYC_WORKSHOP_ROLE;

-- ============================================================================
-- 0.5 GIT INTEGRATION
-- ============================================================================
-- API integrations require ACCOUNTADMIN to create, but we grant usage to the role

CREATE OR REPLACE API INTEGRATION kyc_git_integration
  API_PROVIDER = git_https_api
  API_ALLOWED_PREFIXES = ('https://github.com/jumoral/snowflake_ai_innovation_day')
  ENABLED = TRUE;

GRANT USAGE ON INTEGRATION kyc_git_integration TO ROLE KYC_WORKSHOP_ROLE;

-- ============================================================================
-- 0.6 CREATE DEMO USER
-- ============================================================================
-- This user sees ONLY the workshop objects when logged in.
-- Change the password before your demo!

CREATE USER IF NOT EXISTS KYC_WORKSHOP_USER
  PASSWORD = 'WorkshopDemo123!'
  DEFAULT_ROLE = 'KYC_WORKSHOP_ROLE'
  DEFAULT_WAREHOUSE = 'KYC_WORKSHOP_WH'
  DEFAULT_NAMESPACE = 'KYC_SUPERHERO_DB.RAW'
  MUST_CHANGE_PASSWORD = FALSE
  COMMENT = 'Demo user for KYC Superhero AI Workshop';

GRANT ROLE KYC_WORKSHOP_ROLE TO USER KYC_WORKSHOP_USER;

-- ============================================================================
-- 0.7 VERIFICATION
-- ============================================================================
-- Switch to the new role and confirm isolation

USE ROLE KYC_WORKSHOP_ROLE;
USE WAREHOUSE KYC_WORKSHOP_WH;

-- Should show ONLY KYC_SUPERHERO_DB
SHOW DATABASES;

-- Should show ONLY KYC_WORKSHOP_WH
SHOW WAREHOUSES;

SELECT 'Environment ready! Run 01_setup.sql next.' AS status;
