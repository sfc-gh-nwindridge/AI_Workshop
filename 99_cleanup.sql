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
DROP INTEGRATION IF EXISTS kyc_workshop_git_integration;

-- ============================================================================
-- Revoke account-level privileges and drop role
-- ============================================================================
REVOKE CREATE DATABASE ON ACCOUNT FROM ROLE KYC_WORKSHOP_ROLE;
REVOKE ROLE KYC_WORKSHOP_ROLE FROM ROLE SYSADMIN;
DROP ROLE IF EXISTS KYC_WORKSHOP_ROLE;

SELECT 'Cleanup complete. All workshop objects removed.' AS status;
