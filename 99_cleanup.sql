/*=============================================================================
  KYC SUPERHERO WORKSHOP - CLEANUP / TEARDOWN
  ===========================================================================
  Run this as ACCOUNTADMIN to completely remove all workshop objects.
  Use this to reset the environment before a fresh demo.
  
  WARNING: This drops ALL workshop data permanently!
  ===========================================================================*/

USE ROLE ACCOUNTADMIN;

-- ============================================================================
-- Drop database (removes all schemas, tables, stages, views, git repos)
-- ============================================================================
DROP DATABASE IF EXISTS KYC_SUPERHERO_DB;

-- ============================================================================
-- Drop warehouse
-- ============================================================================
DROP WAREHOUSE IF EXISTS KYC_WORKSHOP_WH;

-- ============================================================================
-- Drop API integration
-- ============================================================================
DROP INTEGRATION IF EXISTS kyc_git_integration;

-- ============================================================================
-- Drop user
-- ============================================================================
DROP USER IF EXISTS KYC_WORKSHOP_USER;

-- ============================================================================
-- Drop role (must revoke from hierarchy first)
-- ============================================================================
REVOKE ROLE KYC_WORKSHOP_ROLE FROM ROLE SYSADMIN;
DROP ROLE IF EXISTS KYC_WORKSHOP_ROLE;

SELECT 'Cleanup complete. All workshop objects removed.' AS status;
