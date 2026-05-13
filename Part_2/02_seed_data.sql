/*=============================================================================
  CPR GENERIC DATA WORKSHOP - STEP 2: SEED DATA
  ===========================================================================
  Populates all 8 base tables with realistic dummy data for 50 corporate
  entities and 100 individual contacts across multiple jurisdictions.

  Party Keys:   PTY-000001 through PTY-000050
  Contact UUIDs: CON-000000000000000001 through CON-000000000000000100

  Prerequisites: Run 01_setup.sql
  Run as: CPR_WORKSHOP_ROLE
  ===========================================================================*/

-- ============================================================================
-- 2.0 ROLE & WAREHOUSE
-- ============================================================================

USE ROLE CPR_WORKSHOP_ROLE;
USE WAREHOUSE CPR_WORKSHOP_WH;

-- ============================================================================
-- 2.1 PARTY_MASTER_CURRENT — 50 corporate entities
-- ============================================================================

INSERT INTO GENERIC_DB.PARTY_MART.PARTY_MASTER_CURRENT
    (PARTY_NUMBER, PARTY_SYSTEM_ID, PARTY_KEY, RECORD_VERSION, SEQUENCE_TOKEN,
     ROW_CHECKSUM, EVENT_FLAG, VERSION_ID, EVENT_TS, SOURCE_TS,
     OPENED_DATE, CLOSED_DATE, SHORT_LABEL, STATUS_CODE, BASE_CURRENCY_CD)
VALUES
    -- US entities (1-20)
    ('P00000001',1001,'PTY-000001','v1','SEQ-001','CHK-001','I',1,'2023-06-15 10:00:00','2023-06-15 09:55:00','2018-03-12 00:00:00',NULL,'MCP','A','USD'),
    ('P00000002',1002,'PTY-000002','v1','SEQ-002','CHK-002','I',1,'2022-11-20 14:30:00','2022-11-20 14:25:00','2016-07-01 00:00:00',NULL,'BSV','A','USD'),
    ('P00000003',1003,'PTY-000003','v1','SEQ-003','CHK-003','I',1,'2021-08-10 09:00:00','2021-08-10 08:55:00','2019-01-15 00:00:00',NULL,'HWM','A','USD'),
    ('P00000004',1004,'PTY-000004','v1','SEQ-004','CHK-004','I',1,'2023-02-28 11:00:00','2023-02-28 10:55:00','2020-05-20 00:00:00',NULL,'SCI','A','USD'),
    ('P00000005',1005,'PTY-000005','v1','SEQ-005','CHK-005','I',1,'2024-01-10 16:00:00','2024-01-10 15:55:00','2017-09-01 00:00:00',NULL,'LFG','A','USD'),
    ('P00000006',1006,'PTY-000006','v1','SEQ-006','CHK-006','I',1,'2022-05-14 08:30:00','2022-05-14 08:25:00','2015-11-10 00:00:00',NULL,'CPM','A','USD'),
    ('P00000007',1007,'PTY-000007','v1','SEQ-007','CHK-007','I',1,'2023-09-22 13:15:00','2023-09-22 13:10:00','2021-02-28 00:00:00',NULL,'ATL','A','USD'),
    ('P00000008',1008,'PTY-000008','v1','SEQ-008','CHK-008','I',1,'2021-12-01 10:45:00','2021-12-01 10:40:00','2019-06-15 00:00:00',NULL,'NIG','A','USD'),
    ('P00000009',1009,'PTY-000009','v1','SEQ-009','CHK-009','I',1,'2024-03-18 09:00:00','2024-03-18 08:55:00','2022-01-05 00:00:00',NULL,'RVR','A','USD'),
    ('P00000010',1010,'PTY-000010','v1','SEQ-010','CHK-010','I',1,'2020-07-25 14:00:00','2020-07-25 13:55:00','2016-04-20 00:00:00',NULL,'PNX','A','USD'),
    ('P00000011',1011,'PTY-000011','v1','SEQ-011','CHK-011','I',1,'2023-04-05 11:30:00','2023-04-05 11:25:00','2020-08-01 00:00:00',NULL,'FHI','A','USD'),
    ('P00000012',1012,'PTY-000012','v1','SEQ-012','CHK-012','I',1,'2022-08-17 15:00:00','2022-08-17 14:55:00','2018-12-10 00:00:00',NULL,'WPC','A','USD'),
    ('P00000013',1013,'PTY-000013','v1','SEQ-013','CHK-013','I',1,'2024-06-30 10:00:00','2024-06-30 09:55:00','2023-03-01 00:00:00',NULL,'ESI','A','USD'),
    ('P00000014',1014,'PTY-000014','v1','SEQ-014','CHK-014','I',1,'2021-03-12 08:00:00','2021-03-12 07:55:00','2017-05-15 00:00:00',NULL,'GMG','A','USD'),
    ('P00000015',1015,'PTY-000015','v1','SEQ-015','CHK-015','U',2,'2024-08-20 09:00:00','2024-08-20 08:55:00','2016-01-20 00:00:00',NULL,'CVF','S','USD'),
    ('P00000016',1016,'PTY-000016','v1','SEQ-016','CHK-016','I',1,'2023-01-08 12:00:00','2023-01-08 11:55:00','2021-07-01 00:00:00',NULL,'TGS','A','USD'),
    ('P00000017',1017,'PTY-000017','v1','SEQ-017','CHK-017','I',1,'2022-10-03 14:30:00','2022-10-03 14:25:00','2019-10-10 00:00:00',NULL,'APF','A','USD'),
    ('P00000018',1018,'PTY-000018','v1','SEQ-018','CHK-018','U',2,'2024-02-14 16:00:00','2024-02-14 15:55:00','2018-06-01 00:00:00','2024-01-31 00:00:00','IVS','C','USD'),
    ('P00000019',1019,'PTY-000019','v1','SEQ-019','CHK-019','I',1,'2023-07-19 10:30:00','2023-07-19 10:25:00','2022-04-15 00:00:00',NULL,'NWC','A','USD'),
    ('P00000020',1020,'PTY-000020','v1','SEQ-020','CHK-020','I',1,'2021-11-30 09:00:00','2021-11-30 08:55:00','2017-02-28 00:00:00',NULL,'SIL','A','USD'),
    -- UK entities (21-30)
    ('P00000021',1021,'PTY-000021','v1','SEQ-021','CHK-021','I',1,'2022-04-10 09:00:00','2022-04-10 08:55:00','2016-09-15 00:00:00',NULL,'KAP','A','GBP'),
    ('P00000022',1022,'PTY-000022','v1','SEQ-022','CHK-022','I',1,'2023-08-05 11:00:00','2023-08-05 10:55:00','2019-03-01 00:00:00',NULL,'OFH','A','GBP'),
    ('P00000023',1023,'PTY-000023','v1','SEQ-023','CHK-023','I',1,'2021-06-20 14:00:00','2021-06-20 13:55:00','2015-12-10 00:00:00',NULL,'BTI','A','GBP'),
    ('P00000024',1024,'PTY-000024','v1','SEQ-024','CHK-024','I',1,'2024-05-15 10:30:00','2024-05-15 10:25:00','2022-06-01 00:00:00',NULL,'LMG','A','GBP'),
    ('P00000025',1025,'PTY-000025','v1','SEQ-025','CHK-025','U',2,'2024-09-01 08:00:00','2024-09-01 07:55:00','2018-08-20 00:00:00',NULL,'STC','S','GBP'),
    ('P00000026',1026,'PTY-000026','v1','SEQ-026','CHK-026','I',1,'2022-12-11 13:00:00','2022-12-11 12:55:00','2020-01-15 00:00:00',NULL,'RYL','A','GBP'),
    ('P00000027',1027,'PTY-000027','v1','SEQ-027','CHK-027','I',1,'2023-03-28 15:30:00','2023-03-28 15:25:00','2021-04-01 00:00:00',NULL,'ECI','A','GBP'),
    ('P00000028',1028,'PTY-000028','v1','SEQ-028','CHK-028','U',2,'2024-04-10 09:00:00','2024-04-10 08:55:00','2017-11-05 00:00:00','2024-03-15 00:00:00','NCL','C','GBP'),
    ('P00000029',1029,'PTY-000029','v1','SEQ-029','CHK-029','I',1,'2023-11-14 11:00:00','2023-11-14 10:55:00','2022-09-01 00:00:00',NULL,'HRZ','A','GBP'),
    ('P00000030',1030,'PTY-000030','v1','SEQ-030','CHK-030','I',1,'2021-09-07 10:00:00','2021-09-07 09:55:00','2016-05-20 00:00:00',NULL,'CWM','A','GBP'),
    -- DE entities (31-35)
    ('P00000031',1031,'PTY-000031','v1','SEQ-031','CHK-031','I',1,'2022-07-18 09:00:00','2022-07-18 08:55:00','2017-04-01 00:00:00',NULL,'OHG','A','EUR'),
    ('P00000032',1032,'PTY-000032','v1','SEQ-032','CHK-032','I',1,'2023-05-22 14:00:00','2023-05-22 13:55:00','2020-10-15 00:00:00',NULL,'RFD','A','EUR'),
    ('P00000033',1033,'PTY-000033','v1','SEQ-033','CHK-033','I',1,'2024-02-05 10:30:00','2024-02-05 10:25:00','2022-07-01 00:00:00',NULL,'BGI','A','EUR'),
    ('P00000034',1034,'PTY-000034','v1','SEQ-034','CHK-034','U',2,'2024-10-01 08:00:00','2024-10-01 07:55:00','2019-02-10 00:00:00',NULL,'MWB','S','EUR'),
    ('P00000035',1035,'PTY-000035','v1','SEQ-035','CHK-035','I',1,'2021-10-30 13:00:00','2021-10-30 12:55:00','2018-05-01 00:00:00',NULL,'HFS','A','EUR'),
    -- SG entities (36-40)
    ('P00000036',1036,'PTY-000036','v1','SEQ-036','CHK-036','I',1,'2022-09-12 09:00:00','2022-09-12 08:55:00','2019-08-15 00:00:00',NULL,'PRT','A','SGD'),
    ('P00000037',1037,'PTY-000037','v1','SEQ-037','CHK-037','I',1,'2023-12-01 11:30:00','2023-12-01 11:25:00','2021-11-01 00:00:00',NULL,'APC','A','SGD'),
    ('P00000038',1038,'PTY-000038','v1','SEQ-038','CHK-038','U',2,'2024-07-15 10:00:00','2024-07-15 09:55:00','2020-03-20 00:00:00',NULL,'TES','S','SGD'),
    ('P00000039',1039,'PTY-000039','v1','SEQ-039','CHK-039','I',1,'2022-03-25 14:00:00','2022-03-25 13:55:00','2018-09-01 00:00:00',NULL,'LWA','A','SGD'),
    ('P00000040',1040,'PTY-000040','v1','SEQ-040','CHK-040','I',1,'2024-01-20 09:30:00','2024-01-20 09:25:00','2023-05-01 00:00:00',NULL,'SVC','A','SGD'),
    -- KY entities (41-43)
    ('P00000041',1041,'PTY-000041','v1','SEQ-041','CHK-041','I',1,'2023-10-08 10:00:00','2023-10-08 09:55:00','2021-06-15 00:00:00',NULL,'CSV','A','USD'),
    ('P00000042',1042,'PTY-000042','v1','SEQ-042','CHK-042','U',2,'2024-05-20 16:00:00','2024-05-20 15:55:00','2019-12-01 00:00:00','2024-04-30 00:00:00','OIS','C','USD'),
    ('P00000043',1043,'PTY-000043','v1','SEQ-043','CHK-043','I',1,'2022-06-14 11:00:00','2022-06-14 10:55:00','2020-09-01 00:00:00',NULL,'CIF','A','USD'),
    -- BVI entities (44-45)
    ('P00000044',1044,'PTY-000044','v1','SEQ-044','CHK-044','U',2,'2024-11-01 08:00:00','2024-11-01 07:55:00','2018-01-10 00:00:00',NULL,'GGH','S','USD'),
    ('P00000045',1045,'PTY-000045','v1','SEQ-045','CHK-045','U',2,'2024-06-10 09:00:00','2024-06-10 08:55:00','2017-07-20 00:00:00','2024-05-31 00:00:00','TPL','C','USD'),
    -- CH entities (46-48)
    ('P00000046',1046,'PTY-000046','v1','SEQ-046','CHK-046','I',1,'2022-01-18 10:00:00','2022-01-18 09:55:00','2016-10-01 00:00:00',NULL,'AWM','A','CHF'),
    ('P00000047',1047,'PTY-000047','v1','SEQ-047','CHK-047','I',1,'2023-06-28 14:30:00','2023-06-28 14:25:00','2021-03-15 00:00:00',NULL,'ZFP','A','CHF'),
    ('P00000048',1048,'PTY-000048','v1','SEQ-048','CHK-048','I',1,'2024-08-05 11:00:00','2024-08-05 10:55:00','2023-01-01 00:00:00',NULL,'HIG','A','CHF'),
    -- HK entities (49-50)
    ('P00000049',1049,'PTY-000049','v1','SEQ-049','CHK-049','I',1,'2022-02-14 09:30:00','2022-02-14 09:25:00','2019-05-01 00:00:00',NULL,'DGC','A','HKD'),
    ('P00000050',1050,'PTY-000050','v1','SEQ-050','CHK-050','U',2,'2024-12-01 10:00:00','2024-12-01 09:55:00','2020-11-15 00:00:00','2024-11-30 00:00:00','EBF','C','HKD');

-- ============================================================================
-- 2.2 PARTY_PROFILE_CURRENT — 50 profiles (one per party)
-- ============================================================================

INSERT INTO GENERIC_DB.PARTY_MART.PARTY_PROFILE_CURRENT
    (PARTY_PROFILE_ID, RECORD_VERSION, SEQUENCE_TOKEN, ROW_CHECKSUM,
     EVENT_FLAG, VERSION_ID, EVENT_TS, SOURCE_TS,
     LEGAL_FORM_CD, JURISDICTION_CD, COUNTRY_CD, BIRTH_DATE,
     PARTY_NAME, CREATED_TS, LAST_UPDATE_TS)
VALUES
    -- US entities
    ('PPR-000001','v1','SEQ-P001','CHK-P001','I',1,'2023-06-15 10:00:00','2023-06-15 09:55:00','LLC','Delaware','US',NULL,'Meridian Capital Partners LLC','2018-03-12 00:00:00','2023-06-15 10:00:00'),
    ('PPR-000002','v1','SEQ-P002','CHK-P002','I',1,'2022-11-20 14:30:00','2022-11-20 14:25:00','LLC','Delaware','US',NULL,'BlueStar Ventures LLC','2016-07-01 00:00:00','2022-11-20 14:30:00'),
    ('PPR-000003','v1','SEQ-P003','CHK-P003','I',1,'2021-08-10 09:00:00','2021-08-10 08:55:00','LLC','New York','US',NULL,'Horizon Wealth Management LLC','2019-01-15 00:00:00','2021-08-10 09:00:00'),
    ('PPR-000004','v1','SEQ-P004','CHK-P004','I',1,'2023-02-28 11:00:00','2023-02-28 10:55:00','LLC','California','US',NULL,'Summit Capital Investments LLC','2020-05-20 00:00:00','2023-02-28 11:00:00'),
    ('PPR-000005','v1','SEQ-P005','CHK-P005','I',1,'2024-01-10 16:00:00','2024-01-10 15:55:00','LLC','Delaware','US',NULL,'Liberty Financial Group LLC','2017-09-01 00:00:00','2024-01-10 16:00:00'),
    ('PPR-000006','v1','SEQ-P006','CHK-P006','I',1,'2022-05-14 08:30:00','2022-05-14 08:25:00','LLC','Connecticut','US',NULL,'Crosspoint Management LLC','2015-11-10 00:00:00','2022-05-14 08:30:00'),
    ('PPR-000007','v1','SEQ-P007','CHK-P007','I',1,'2023-09-22 13:15:00','2023-09-22 13:10:00','LLC','Massachusetts','US',NULL,'Atlantic Partners LLC','2021-02-28 00:00:00','2023-09-22 13:15:00'),
    ('PPR-000008','v1','SEQ-P008','CHK-P008','I',1,'2021-12-01 10:45:00','2021-12-01 10:40:00','LLC','Illinois','US',NULL,'Nordic Investment Group LLC','2019-06-15 00:00:00','2021-12-01 10:45:00'),
    ('PPR-000009','v1','SEQ-P009','CHK-P009','I',1,'2024-03-18 09:00:00','2024-03-18 08:55:00','LLC','Texas','US',NULL,'Riverstone Capital LLC','2022-01-05 00:00:00','2024-03-18 09:00:00'),
    ('PPR-000010','v1','SEQ-P010','CHK-P010','I',1,'2020-07-25 14:00:00','2020-07-25 13:55:00','LLC','Delaware','US',NULL,'Phoenix Global Advisors LLC','2016-04-20 00:00:00','2020-07-25 14:00:00'),
    ('PPR-000011','v1','SEQ-P011','CHK-P011','I',1,'2023-04-05 11:30:00','2023-04-05 11:25:00','LLC','Florida','US',NULL,'Falcon Holdings Inc','2020-08-01 00:00:00','2023-04-05 11:30:00'),
    ('PPR-000012','v1','SEQ-P012','CHK-P012','I',1,'2022-08-17 15:00:00','2022-08-17 14:55:00','LLC','Delaware','US',NULL,'Westport Capital LLC','2018-12-10 00:00:00','2022-08-17 15:00:00'),
    ('PPR-000013','v1','SEQ-P013','CHK-P013','I',1,'2024-06-30 10:00:00','2024-06-30 09:55:00','LLC','Nevada','US',NULL,'Emerald Solutions Inc','2023-03-01 00:00:00','2024-06-30 10:00:00'),
    ('PPR-000014','v1','SEQ-P014','CHK-P014','I',1,'2021-03-12 08:00:00','2021-03-12 07:55:00','LLC','Delaware','US',NULL,'Granite Mountain Group LLC','2017-05-15 00:00:00','2021-03-12 08:00:00'),
    ('PPR-000015','v1','SEQ-P015','CHK-P015','U',2,'2024-08-20 09:00:00','2024-08-20 08:55:00','LLC','New York','US',NULL,'Cypress Venture Fund LLC','2016-01-20 00:00:00','2024-08-20 09:00:00'),
    ('PPR-000016','v1','SEQ-P016','CHK-P016','I',1,'2023-01-08 12:00:00','2023-01-08 11:55:00','LLC','Delaware','US',NULL,'Trigon Strategic LLC','2021-07-01 00:00:00','2023-01-08 12:00:00'),
    ('PPR-000017','v1','SEQ-P017','CHK-P017','I',1,'2022-10-03 14:30:00','2022-10-03 14:25:00','LLC','Pennsylvania','US',NULL,'Apex Funding LLC','2019-10-10 00:00:00','2022-10-03 14:30:00'),
    ('PPR-000018','v1','SEQ-P018','CHK-P018','U',2,'2024-02-14 16:00:00','2024-02-14 15:55:00','LLC','Delaware','US',NULL,'Ironvale Securities LLC','2018-06-01 00:00:00','2024-02-14 16:00:00'),
    ('PPR-000019','v1','SEQ-P019','CHK-P019','I',1,'2023-07-19 10:30:00','2023-07-19 10:25:00','LLC','Virginia','US',NULL,'Northwind Capital LLC','2022-04-15 00:00:00','2023-07-19 10:30:00'),
    ('PPR-000020','v1','SEQ-P020','CHK-P020','I',1,'2021-11-30 09:00:00','2021-11-30 08:55:00','LLC','Delaware','US',NULL,'Silverline Investments LLC','2017-02-28 00:00:00','2021-11-30 09:00:00'),
    -- UK entities
    ('PPR-000021','v1','SEQ-P021','CHK-P021','I',1,'2022-04-10 09:00:00','2022-04-10 08:55:00','PLC','England and Wales','GB',NULL,'Kensington Advisory PLC','2016-09-15 00:00:00','2022-04-10 09:00:00'),
    ('PPR-000022','v1','SEQ-P022','CHK-P022','I',1,'2023-08-05 11:00:00','2023-08-05 10:55:00','LIMITED','England and Wales','GB',NULL,'Oceanic Freight Holdings Ltd','2019-03-01 00:00:00','2023-08-05 11:00:00'),
    ('PPR-000023','v1','SEQ-P023','CHK-P023','I',1,'2021-06-20 14:00:00','2021-06-20 13:55:00','LIMITED','Scotland','GB',NULL,'Britannia Trust Industries Ltd','2015-12-10 00:00:00','2021-06-20 14:00:00'),
    ('PPR-000024','v1','SEQ-P024','CHK-P024','I',1,'2024-05-15 10:30:00','2024-05-15 10:25:00','LIMITED','England and Wales','GB',NULL,'Lockwood Management Group Ltd','2022-06-01 00:00:00','2024-05-15 10:30:00'),
    ('PPR-000025','v1','SEQ-P025','CHK-P025','U',2,'2024-09-01 08:00:00','2024-09-01 07:55:00','PLC','England and Wales','GB',NULL,'Sterling Trade Corporation PLC','2018-08-20 00:00:00','2024-09-01 08:00:00'),
    ('PPR-000026','v1','SEQ-P026','CHK-P026','I',1,'2022-12-11 13:00:00','2022-12-11 12:55:00','LIMITED','England and Wales','GB',NULL,'Royal Exchange Capital Ltd','2020-01-15 00:00:00','2022-12-11 13:00:00'),
    ('PPR-000027','v1','SEQ-P027','CHK-P027','I',1,'2023-03-28 15:30:00','2023-03-28 15:25:00','LIMITED','Northern Ireland','GB',NULL,'Emerald Coast Investments Ltd','2021-04-01 00:00:00','2023-03-28 15:30:00'),
    ('PPR-000028','v1','SEQ-P028','CHK-P028','U',2,'2024-04-10 09:00:00','2024-04-10 08:55:00','LIMITED','England and Wales','GB',NULL,'Newcastle Commodities Ltd','2017-11-05 00:00:00','2024-04-10 09:00:00'),
    ('PPR-000029','v1','SEQ-P029','CHK-P029','I',1,'2023-11-14 11:00:00','2023-11-14 10:55:00','LIMITED','England and Wales','GB',NULL,'Horizon Risk Partners Ltd','2022-09-01 00:00:00','2023-11-14 11:00:00'),
    ('PPR-000030','v1','SEQ-P030','CHK-P030','I',1,'2021-09-07 10:00:00','2021-09-07 09:55:00','LIMITED','England and Wales','GB',NULL,'Commonwealth Wealth Managers Ltd','2016-05-20 00:00:00','2021-09-07 10:00:00'),
    -- DE entities
    ('PPR-000031','v1','SEQ-P031','CHK-P031','I',1,'2022-07-18 09:00:00','2022-07-18 08:55:00','GMBH','Frankfurt','DE',NULL,'Orion Holdings GmbH','2017-04-01 00:00:00','2022-07-18 09:00:00'),
    ('PPR-000032','v1','SEQ-P032','CHK-P032','I',1,'2023-05-22 14:00:00','2023-05-22 13:55:00','GMBH','Munich','DE',NULL,'Rhein-Finanz Dienste GmbH','2020-10-15 00:00:00','2023-05-22 14:00:00'),
    ('PPR-000033','v1','SEQ-P033','CHK-P033','I',1,'2024-02-05 10:30:00','2024-02-05 10:25:00','GMBH','Berlin','DE',NULL,'Berliner Grundstueck Invest GmbH','2022-07-01 00:00:00','2024-02-05 10:30:00'),
    ('PPR-000034','v1','SEQ-P034','CHK-P034','U',2,'2024-10-01 08:00:00','2024-10-01 07:55:00','GMBH','Hamburg','DE',NULL,'Mittelstand Werke Beteiligungs GmbH','2019-02-10 00:00:00','2024-10-01 08:00:00'),
    ('PPR-000035','v1','SEQ-P035','CHK-P035','I',1,'2021-10-30 13:00:00','2021-10-30 12:55:00','AG','Frankfurt','DE',NULL,'Hanseatische Finanz Services AG','2018-05-01 00:00:00','2021-10-30 13:00:00'),
    -- SG entities
    ('PPR-000036','v1','SEQ-P036','CHK-P036','I',1,'2022-09-12 09:00:00','2022-09-12 08:55:00','PTE_LTD','Singapore','SG',NULL,'Pacific Rim Trading Pte Ltd','2019-08-15 00:00:00','2022-09-12 09:00:00'),
    ('PPR-000037','v1','SEQ-P037','CHK-P037','I',1,'2023-12-01 11:30:00','2023-12-01 11:25:00','PTE_LTD','Singapore','SG',NULL,'Asia Pacific Commodities Pte Ltd','2021-11-01 00:00:00','2023-12-01 11:30:00'),
    ('PPR-000038','v1','SEQ-P038','CHK-P038','U',2,'2024-07-15 10:00:00','2024-07-15 09:55:00','PTE_LTD','Singapore','SG',NULL,'Temasek Enterprise Solutions Pte Ltd','2020-03-20 00:00:00','2024-07-15 10:00:00'),
    ('PPR-000039','v1','SEQ-P039','CHK-P039','I',1,'2022-03-25 14:00:00','2022-03-25 13:55:00','PTE_LTD','Singapore','SG',NULL,'Lion Wealth Asia Pte Ltd','2018-09-01 00:00:00','2022-03-25 14:00:00'),
    ('PPR-000040','v1','SEQ-P040','CHK-P040','I',1,'2024-01-20 09:30:00','2024-01-20 09:25:00','PTE_LTD','Singapore','SG',NULL,'Singapore Venture Capital Pte Ltd','2023-05-01 00:00:00','2024-01-20 09:30:00'),
    -- KY entities
    ('PPR-000041','v1','SEQ-P041','CHK-P041','I',1,'2023-10-08 10:00:00','2023-10-08 09:55:00','LIMITED','Cayman Islands','KY',NULL,'Cayman Special Vehicles Ltd','2021-06-15 00:00:00','2023-10-08 10:00:00'),
    ('PPR-000042','v1','SEQ-P042','CHK-P042','U',2,'2024-05-20 16:00:00','2024-05-20 15:55:00','LIMITED','Cayman Islands','KY',NULL,'Offshore Investment Solutions Ltd','2019-12-01 00:00:00','2024-05-20 16:00:00'),
    ('PPR-000043','v1','SEQ-P043','CHK-P043','I',1,'2022-06-14 11:00:00','2022-06-14 10:55:00','LIMITED','Cayman Islands','KY',NULL,'Caribbean Investment Fund Ltd','2020-09-01 00:00:00','2022-06-14 11:00:00'),
    -- BVI entities
    ('PPR-000044','v1','SEQ-P044','CHK-P044','U',2,'2024-11-01 08:00:00','2024-11-01 07:55:00','LIMITED','British Virgin Islands','VG',NULL,'Global Gateway Holdings Ltd','2018-01-10 00:00:00','2024-11-01 08:00:00'),
    ('PPR-000045','v1','SEQ-P045','CHK-P045','U',2,'2024-06-10 09:00:00','2024-06-10 08:55:00','LIMITED','British Virgin Islands','VG',NULL,'Trident Pacific Ltd','2017-07-20 00:00:00','2024-06-10 09:00:00'),
    -- CH entities
    ('PPR-000046','v1','SEQ-P046','CHK-P046','I',1,'2022-01-18 10:00:00','2022-01-18 09:55:00','AG','Zurich','CH',NULL,'Alpine Wealth Management AG','2016-10-01 00:00:00','2022-01-18 10:00:00'),
    ('PPR-000047','v1','SEQ-P047','CHK-P047','I',1,'2023-06-28 14:30:00','2023-06-28 14:25:00','AG','Geneva','CH',NULL,'Zurich Finance Partners AG','2021-03-15 00:00:00','2023-06-28 14:30:00'),
    ('PPR-000048','v1','SEQ-P048','CHK-P048','I',1,'2024-08-05 11:00:00','2024-08-05 10:55:00','SARL','Lugano','CH',NULL,'Helvetia Investment Group Sarl','2023-01-01 00:00:00','2024-08-05 11:00:00'),
    -- HK entities
    ('PPR-000049','v1','SEQ-P049','CHK-P049','I',1,'2022-02-14 09:30:00','2022-02-14 09:25:00','LIMITED','Hong Kong','HK',NULL,'Dragon Gate Capital Ltd','2019-05-01 00:00:00','2022-02-14 09:30:00'),
    ('PPR-000050','v1','SEQ-P050','CHK-P050','U',2,'2024-12-01 10:00:00','2024-12-01 09:55:00','FOUNDATION','Hong Kong','HK',NULL,'Emerald Bay Foundation','2020-11-15 00:00:00','2024-12-01 10:00:00');

-- ============================================================================
-- 2.3 PARTY_LOCATION_CURRENT — 60 addresses (1-2 per party)
-- ============================================================================

INSERT INTO GENERIC_DB.PARTY_MART.PARTY_LOCATION_CURRENT
    (PARTY_NUMBER, PARTY_KEY, LOCATION_SEQ, LOCATION_TYPE_CD, LOCATION_TYPE_DESC,
     DISPLAY_LINE_1, DISPLAY_LINE_2, DISPLAY_LINE_3, LOCALITY,
     REGION_CODE, NATION_CODE, POSTAL_CODE, PRIMARY_PHONE, SECONDARY_PHONE, EFFECTIVE_TS)
VALUES
    -- US registered addresses
    ('P00000001','PTY-000001',1,'RG','Registered Office','1209 Orange Street','Corporation Trust Center',NULL,'Wilmington','DE','USA','19801','+1-302-555-0101',NULL,'2018-03-12 00:00:00'),
    ('P00000001','PTY-000001',2,'TR','Trading Address','245 Park Avenue','Floor 38',NULL,'New York','NY','USA','10167','+1-212-555-0102',NULL,'2018-03-12 00:00:00'),
    ('P00000002','PTY-000002',1,'RG','Registered Office','2711 Centerville Road','Suite 400',NULL,'Wilmington','DE','USA','19808','+1-302-555-0201',NULL,'2016-07-01 00:00:00'),
    ('P00000003','PTY-000003',1,'RG','Registered Office','599 Lexington Avenue','Floor 20',NULL,'New York','NY','USA','10022','+1-212-555-0301',NULL,'2019-01-15 00:00:00'),
    ('P00000004','PTY-000004',1,'RG','Registered Office','555 California Street','Suite 3200',NULL,'San Francisco','CA','USA','94104','+1-415-555-0401',NULL,'2020-05-20 00:00:00'),
    ('P00000005','PTY-000005',1,'RG','Registered Office','1209 Orange Street','Suite 200',NULL,'Wilmington','DE','USA','19801','+1-302-555-0501',NULL,'2017-09-01 00:00:00'),
    ('P00000005','PTY-000005',2,'TR','Trading Address','One International Place','Suite 2600',NULL,'Boston','MA','USA','02110','+1-617-555-0502',NULL,'2017-09-01 00:00:00'),
    ('P00000006','PTY-000006',1,'RG','Registered Office','281 Tresser Boulevard','Suite 1200',NULL,'Stamford','CT','USA','06901','+1-203-555-0601',NULL,'2015-11-10 00:00:00'),
    ('P00000007','PTY-000007',1,'RG','Registered Office','100 Federal Street','Floor 36',NULL,'Boston','MA','USA','02110','+1-617-555-0701',NULL,'2021-02-28 00:00:00'),
    ('P00000008','PTY-000008',1,'RG','Registered Office','233 South Wacker Drive','Suite 8400',NULL,'Chicago','IL','USA','60606','+1-312-555-0801',NULL,'2019-06-15 00:00:00'),
    ('P00000009','PTY-000009',1,'RG','Registered Office','2000 McKinney Avenue','Suite 1500',NULL,'Dallas','TX','USA','75201','+1-214-555-0901',NULL,'2022-01-05 00:00:00'),
    ('P00000010','PTY-000010',1,'RG','Registered Office','1209 Orange Street','Suite 600',NULL,'Wilmington','DE','USA','19801','+1-302-555-1001',NULL,'2016-04-20 00:00:00'),
    ('P00000011','PTY-000011',1,'RG','Registered Office','200 South Biscayne Blvd','Suite 3800',NULL,'Miami','FL','USA','33131','+1-305-555-1101',NULL,'2020-08-01 00:00:00'),
    ('P00000012','PTY-000012',1,'RG','Registered Office','1209 Orange Street','Suite 100',NULL,'Wilmington','DE','USA','19801','+1-302-555-1201',NULL,'2018-12-10 00:00:00'),
    ('P00000013','PTY-000013',1,'RG','Registered Office','3773 Howard Hughes Pkwy','Suite 300',NULL,'Las Vegas','NV','USA','89169','+1-702-555-1301',NULL,'2023-03-01 00:00:00'),
    ('P00000014','PTY-000014',1,'RG','Registered Office','1209 Orange Street','Suite 800',NULL,'Wilmington','DE','USA','19801','+1-302-555-1401',NULL,'2017-05-15 00:00:00'),
    ('P00000015','PTY-000015',1,'RG','Registered Office','599 Lexington Avenue','Floor 12',NULL,'New York','NY','USA','10022','+1-212-555-1501',NULL,'2016-01-20 00:00:00'),
    ('P00000016','PTY-000016',1,'RG','Registered Office','1209 Orange Street','Suite 300',NULL,'Wilmington','DE','USA','19801','+1-302-555-1601',NULL,'2021-07-01 00:00:00'),
    ('P00000017','PTY-000017',1,'RG','Registered Office','1600 Market Street','Suite 3600',NULL,'Philadelphia','PA','USA','19103','+1-215-555-1701',NULL,'2019-10-10 00:00:00'),
    ('P00000018','PTY-000018',1,'RG','Registered Office','1209 Orange Street','Suite 500',NULL,'Wilmington','DE','USA','19801','+1-302-555-1801',NULL,'2018-06-01 00:00:00'),
    ('P00000019','PTY-000019',1,'RG','Registered Office','8000 Towers Crescent Drive','Suite 1350',NULL,'Tysons Corner','VA','USA','22182','+1-703-555-1901',NULL,'2022-04-15 00:00:00'),
    ('P00000020','PTY-000020',1,'RG','Registered Office','1209 Orange Street','Suite 700',NULL,'Wilmington','DE','USA','19801','+1-302-555-2001',NULL,'2017-02-28 00:00:00'),
    -- UK addresses
    ('P00000021','PTY-000021',1,'RG','Registered Office','1 Knightsbridge','5th Floor',NULL,'London','LN','GBR','SW1X7LY','+44-20-7555-2101',NULL,'2016-09-15 00:00:00'),
    ('P00000022','PTY-000022',1,'RG','Registered Office','30 St Mary Axe','Level 28',NULL,'London','LN','GBR','EC3A8BF','+44-20-7555-2201',NULL,'2019-03-01 00:00:00'),
    ('P00000022','PTY-000022',2,'TR','Trading Address','Felixstowe Port','Dock Gate 2',NULL,'Felixstowe','SK','GBR','IP118SY','+44-1394-555-220',NULL,'2019-03-01 00:00:00'),
    ('P00000023','PTY-000023',1,'RG','Registered Office','1 George Square',NULL,NULL,'Edinburgh','ED','GBR','EH2 2LL','+44-131-555-2301',NULL,'2015-12-10 00:00:00'),
    ('P00000024','PTY-000024',1,'RG','Registered Office','20 Fenchurch Street','Level 14',NULL,'London','LN','GBR','EC3M3BY','+44-20-7555-2401',NULL,'2022-06-01 00:00:00'),
    ('P00000025','PTY-000025',1,'RG','Registered Office','55 Baker Street','3rd Floor',NULL,'London','LN','GBR','W1U8EW','+44-20-7555-2501',NULL,'2018-08-20 00:00:00'),
    ('P00000026','PTY-000026',1,'RG','Registered Office','25 Cabot Square','Level 20',NULL,'London','LN','GBR','E14 4QA','+44-20-7555-2601',NULL,'2020-01-15 00:00:00'),
    ('P00000027','PTY-000027',1,'RG','Registered Office','22 Great Victoria St',NULL,NULL,'Belfast','AN','GBR','BT2 7BA','+44-28-9555-2701',NULL,'2021-04-01 00:00:00'),
    ('P00000028','PTY-000028',1,'RG','Registered Office','One Snowhill','Level 8',NULL,'Birmingham','WM','GBR','B4 6GH','+44-121-555-2801',NULL,'2017-11-05 00:00:00'),
    ('P00000029','PTY-000029',1,'RG','Registered Office','99 Bishopsgate','Level 26',NULL,'London','LN','GBR','EC2M3XD','+44-20-7555-2901',NULL,'2022-09-01 00:00:00'),
    ('P00000030','PTY-000030',1,'RG','Registered Office','10 Paternoster Square','Level 5',NULL,'London','LN','GBR','EC4M7LS','+44-20-7555-3001',NULL,'2016-05-20 00:00:00'),
    -- DE addresses
    ('P00000031','PTY-000031',1,'RG','Registered Office','Bockenheimer Landstr 2-4',NULL,NULL,'Frankfurt','HE','DEU','60306','+49-69-555-3101',NULL,'2017-04-01 00:00:00'),
    ('P00000032','PTY-000032',1,'RG','Registered Office','Maximilianstrasse 35',NULL,NULL,'Munich','BY','DEU','80539','+49-89-555-3201',NULL,'2020-10-15 00:00:00'),
    ('P00000033','PTY-000033',1,'RG','Registered Office','Friedrichstrasse 191',NULL,NULL,'Berlin','BE','DEU','10117','+49-30-555-3301',NULL,'2022-07-01 00:00:00'),
    ('P00000034','PTY-000034',1,'RG','Registered Office','Jungfernstieg 30',NULL,NULL,'Hamburg','HH','DEU','20354','+49-40-555-3401',NULL,'2019-02-10 00:00:00'),
    ('P00000035','PTY-000035',1,'RG','Registered Office','Neue Mainzer Str 52-58',NULL,NULL,'Frankfurt','HE','DEU','60311','+49-69-555-3501',NULL,'2018-05-01 00:00:00'),
    -- SG addresses
    ('P00000036','PTY-000036',1,'RG','Registered Office','1 Raffles Place','#44-01 Tower 1',NULL,'Singapore','SG','SGP','048616','+65-6555-3601',NULL,'2019-08-15 00:00:00'),
    ('P00000037','PTY-000037',1,'RG','Registered Office','8 Marina View','#35-06 Asia Square',NULL,'Singapore','SG','SGP','018960','+65-6555-3701',NULL,'2021-11-01 00:00:00'),
    ('P00000038','PTY-000038',1,'RG','Registered Office','10 Collyer Quay','#10-01 Ocean Financial',NULL,'Singapore','SG','SGP','049315','+65-6555-3801',NULL,'2020-03-20 00:00:00'),
    ('P00000039','PTY-000039',1,'RG','Registered Office','6 Battery Road','#23-01',NULL,'Singapore','SG','SGP','049909','+65-6555-3901',NULL,'2018-09-01 00:00:00'),
    ('P00000040','PTY-000040',1,'RG','Registered Office','80 Robinson Road','#02-00',NULL,'Singapore','SG','SGP','068898','+65-6555-4001',NULL,'2023-05-01 00:00:00'),
    -- KY addresses
    ('P00000041','PTY-000041',1,'RG','Registered Office','PO Box 309','Ugland House',NULL,'George Town','GC','CYM','KY1-110','+1-345-555-4101',NULL,'2021-06-15 00:00:00'),
    ('P00000042','PTY-000042',1,'RG','Registered Office','PO Box 1348','Camana Bay',NULL,'George Town','GC','CYM','KY1-110','+1-345-555-4201',NULL,'2019-12-01 00:00:00'),
    ('P00000043','PTY-000043',1,'RG','Registered Office','PO Box 500','Harbour Place',NULL,'George Town','GC','CYM','KY1-110','+1-345-555-4301',NULL,'2020-09-01 00:00:00'),
    -- BVI addresses
    ('P00000044','PTY-000044',1,'RG','Registered Office','Craigmuir Chambers','PO Box 71',NULL,'Road Town','VG','VGB','VG1110','+1-284-555-4401',NULL,'2018-01-10 00:00:00'),
    ('P00000045','PTY-000045',1,'RG','Registered Office','Trident Chambers','PO Box 146',NULL,'Road Town','VG','VGB','VG1110','+1-284-555-4501',NULL,'2017-07-20 00:00:00'),
    -- CH addresses
    ('P00000046','PTY-000046',1,'RG','Registered Office','Bahnhofstrasse 36',NULL,NULL,'Zurich','ZH','CHE','8001','+41-44-555-4601',NULL,'2016-10-01 00:00:00'),
    ('P00000046','PTY-000046',2,'TR','Trading Address','Paradeplatz 8','3. OG',NULL,'Zurich','ZH','CHE','8001','+41-44-555-4602',NULL,'2016-10-01 00:00:00'),
    ('P00000047','PTY-000047',1,'RG','Registered Office','Rue du Rhone 14',NULL,NULL,'Geneva','GE','CHE','1204','+41-22-555-4701',NULL,'2021-03-15 00:00:00'),
    ('P00000048','PTY-000048',1,'RG','Registered Office','Via Nassa 46',NULL,NULL,'Lugano','TI','CHE','6900','+41-91-555-4801',NULL,'2023-01-01 00:00:00'),
    -- HK addresses
    ('P00000049','PTY-000049',1,'RG','Registered Office','Two IFC','88 Finance Street',NULL,'Central','HK','HKG','999077','+852-555-4901',NULL,'2019-05-01 00:00:00'),
    ('P00000049','PTY-000049',2,'TR','Trading Address','18 Harbour Road','Wanchai Tower',NULL,'Wan Chai','HK','HKG','999077','+852-555-4902',NULL,'2019-05-01 00:00:00'),
    ('P00000050','PTY-000050',1,'RG','Registered Office','1 Queens Road Central','Level 15',NULL,'Central','HK','HKG','999077','+852-555-5001',NULL,'2020-11-15 00:00:00');

-- ============================================================================
-- 2.4 PARTY_HIERARCHY_CURRENT — 30 rows across 5 corporate groups
-- ============================================================================
--   Group 1: Meridian (PTY-000001 root -> PTY-000005, PTY-000006 -> PTY-000012)
--   Group 2: Pacific Rim (PTY-000036 root -> PTY-000037, PTY-000039 -> PTY-000040, PTY-000041)
--   Group 3: Orion (PTY-000031 root -> PTY-000032, PTY-000033)
--   Group 4: BlueStar (PTY-000002 root -> PTY-000009, PTY-000016 -> PTY-000019)
--   Group 5: Dragon Gate (PTY-000049 root -> PTY-000050, PTY-000038)

INSERT INTO GENERIC_DB.PARTY_MART.PARTY_HIERARCHY_CURRENT
    (CHILD_PARTY_ID, PARENT_PARTY_ID, ROOT_PARTY_ID, HIERARCHY_LEVEL,
     RELATION_TYPE_CD, RECORD_VERSION, SEQUENCE_TOKEN, ROW_CHECKSUM,
     EVENT_FLAG, VERSION_ID, EVENT_TS, SOURCE_TS,
     EFFECTIVE_FROM_TS, EFFECTIVE_TO_TS, ACTIVE_FLAG)
VALUES
    -- Group 1: Meridian Capital Partners (PTY-000001 = root, 3 levels)
    ('PTY-000001',NULL,'PTY-000001',1,'ULTIMATE_PARENT','v1','SEQ-H001','CHK-H001','I',1,'2023-06-15 10:00:00','2023-06-15 09:55:00','2018-03-12 00:00:00',NULL,'Y'),
    ('PTY-000005','PTY-000001','PTY-000001',2,'SUBSIDIARY','v1','SEQ-H002','CHK-H002','I',1,'2023-06-15 10:00:00','2023-06-15 09:55:00','2018-03-12 00:00:00',NULL,'Y'),
    ('PTY-000006','PTY-000001','PTY-000001',2,'SUBSIDIARY','v1','SEQ-H003','CHK-H003','I',1,'2022-05-14 08:30:00','2022-05-14 08:25:00','2018-03-12 00:00:00',NULL,'Y'),
    ('PTY-000012','PTY-000006','PTY-000001',3,'SUBSIDIARY','v1','SEQ-H004','CHK-H004','I',1,'2022-08-17 15:00:00','2022-08-17 14:55:00','2018-12-10 00:00:00',NULL,'Y'),
    -- Group 2: Pacific Rim Trading (PTY-000036 = root, 3 levels)
    ('PTY-000036',NULL,'PTY-000036',1,'ULTIMATE_PARENT','v1','SEQ-H005','CHK-H005','I',1,'2022-09-12 09:00:00','2022-09-12 08:55:00','2019-08-15 00:00:00',NULL,'Y'),
    ('PTY-000037','PTY-000036','PTY-000036',2,'SUBSIDIARY','v1','SEQ-H006','CHK-H006','I',1,'2023-12-01 11:30:00','2023-12-01 11:25:00','2021-11-01 00:00:00',NULL,'Y'),
    ('PTY-000039','PTY-000036','PTY-000036',2,'SUBSIDIARY','v1','SEQ-H007','CHK-H007','I',1,'2022-03-25 14:00:00','2022-03-25 13:55:00','2019-08-15 00:00:00',NULL,'Y'),
    ('PTY-000040','PTY-000037','PTY-000036',3,'SUBSIDIARY','v1','SEQ-H008','CHK-H008','I',1,'2024-01-20 09:30:00','2024-01-20 09:25:00','2023-05-01 00:00:00',NULL,'Y'),
    ('PTY-000041','PTY-000039','PTY-000036',3,'SUBSIDIARY','v1','SEQ-H009','CHK-H009','I',1,'2023-10-08 10:00:00','2023-10-08 09:55:00','2021-06-15 00:00:00',NULL,'Y'),
    -- Group 3: Orion Holdings (PTY-000031 = root, 2 levels)
    ('PTY-000031',NULL,'PTY-000031',1,'ULTIMATE_PARENT','v1','SEQ-H010','CHK-H010','I',1,'2022-07-18 09:00:00','2022-07-18 08:55:00','2017-04-01 00:00:00',NULL,'Y'),
    ('PTY-000032','PTY-000031','PTY-000031',2,'SUBSIDIARY','v1','SEQ-H011','CHK-H011','I',1,'2023-05-22 14:00:00','2023-05-22 13:55:00','2020-10-15 00:00:00',NULL,'Y'),
    ('PTY-000033','PTY-000031','PTY-000031',2,'SUBSIDIARY','v1','SEQ-H012','CHK-H012','I',1,'2024-02-05 10:30:00','2024-02-05 10:25:00','2022-07-01 00:00:00',NULL,'Y'),
    -- Group 4: BlueStar Ventures (PTY-000002 = root, 3 levels)
    ('PTY-000002',NULL,'PTY-000002',1,'ULTIMATE_PARENT','v1','SEQ-H013','CHK-H013','I',1,'2022-11-20 14:30:00','2022-11-20 14:25:00','2016-07-01 00:00:00',NULL,'Y'),
    ('PTY-000009','PTY-000002','PTY-000002',2,'SUBSIDIARY','v1','SEQ-H014','CHK-H014','I',1,'2024-03-18 09:00:00','2024-03-18 08:55:00','2022-01-05 00:00:00',NULL,'Y'),
    ('PTY-000016','PTY-000002','PTY-000002',2,'SUBSIDIARY','v1','SEQ-H015','CHK-H015','I',1,'2023-01-08 12:00:00','2023-01-08 11:55:00','2021-07-01 00:00:00',NULL,'Y'),
    ('PTY-000019','PTY-000016','PTY-000002',3,'SUBSIDIARY','v1','SEQ-H016','CHK-H016','I',1,'2023-07-19 10:30:00','2023-07-19 10:25:00','2022-04-15 00:00:00',NULL,'Y'),
    -- Group 5: Dragon Gate Capital (PTY-000049 = root, 2 levels)
    ('PTY-000049',NULL,'PTY-000049',1,'ULTIMATE_PARENT','v1','SEQ-H017','CHK-H017','I',1,'2022-02-14 09:30:00','2022-02-14 09:25:00','2019-05-01 00:00:00',NULL,'Y'),
    ('PTY-000050','PTY-000049','PTY-000049',2,'SUBSIDIARY','v1','SEQ-H018','CHK-H018','I',1,'2024-12-01 10:00:00','2024-12-01 09:55:00','2020-11-15 00:00:00',NULL,'Y'),
    ('PTY-000038','PTY-000049','PTY-000049',2,'SUBSIDIARY','v1','SEQ-H019','CHK-H019','I',1,'2024-07-15 10:00:00','2024-07-15 09:55:00','2020-03-20 00:00:00',NULL,'Y'),
    -- Standalone entities (self-referencing root entries)
    ('PTY-000003',NULL,'PTY-000003',1,'STANDALONE','v1','SEQ-H020','CHK-H020','I',1,'2021-08-10 09:00:00','2021-08-10 08:55:00','2019-01-15 00:00:00',NULL,'Y'),
    ('PTY-000004',NULL,'PTY-000004',1,'STANDALONE','v1','SEQ-H021','CHK-H021','I',1,'2023-02-28 11:00:00','2023-02-28 10:55:00','2020-05-20 00:00:00',NULL,'Y'),
    ('PTY-000007',NULL,'PTY-000007',1,'STANDALONE','v1','SEQ-H022','CHK-H022','I',1,'2023-09-22 13:15:00','2023-09-22 13:10:00','2021-02-28 00:00:00',NULL,'Y'),
    ('PTY-000008',NULL,'PTY-000008',1,'STANDALONE','v1','SEQ-H023','CHK-H023','I',1,'2021-12-01 10:45:00','2021-12-01 10:40:00','2019-06-15 00:00:00',NULL,'Y'),
    ('PTY-000010',NULL,'PTY-000010',1,'STANDALONE','v1','SEQ-H024','CHK-H024','I',1,'2020-07-25 14:00:00','2020-07-25 13:55:00','2016-04-20 00:00:00',NULL,'Y'),
    ('PTY-000011',NULL,'PTY-000011',1,'STANDALONE','v1','SEQ-H025','CHK-H025','I',1,'2023-04-05 11:30:00','2023-04-05 11:25:00','2020-08-01 00:00:00',NULL,'Y'),
    ('PTY-000021',NULL,'PTY-000021',1,'STANDALONE','v1','SEQ-H026','CHK-H026','I',1,'2022-04-10 09:00:00','2022-04-10 08:55:00','2016-09-15 00:00:00',NULL,'Y'),
    ('PTY-000046',NULL,'PTY-000046',1,'STANDALONE','v1','SEQ-H027','CHK-H027','I',1,'2022-01-18 10:00:00','2022-01-18 09:55:00','2016-10-01 00:00:00',NULL,'Y'),
    ('PTY-000047',NULL,'PTY-000047',1,'STANDALONE','v1','SEQ-H028','CHK-H028','I',1,'2023-06-28 14:30:00','2023-06-28 14:25:00','2021-03-15 00:00:00',NULL,'Y'),
    ('PTY-000044',NULL,'PTY-000044',1,'STANDALONE','v1','SEQ-H029','CHK-H029','I',1,'2024-11-01 08:00:00','2024-11-01 07:55:00','2018-01-10 00:00:00',NULL,'Y'),
    ('PTY-000045',NULL,'PTY-000045',1,'STANDALONE','v1','SEQ-H030','CHK-H030','I',1,'2024-06-10 09:00:00','2024-06-10 08:55:00','2017-07-20 00:00:00',NULL,'Y');

-- ============================================================================
-- 2.5 CONTACT_RECORD_CURRENT — 100 individual contacts
-- ============================================================================

INSERT INTO GENERIC_DB.CONTACT_HUB.CONTACT_RECORD_CURRENT
    (CONTACT_ID, CONTACT_SURROGATE_UUID, GIVEN_NAME, FAMILY_NAME, DISPLAY_NAME,
     BIRTH_DATE, NATION_CODE, PRIMARY_LANGUAGE_CD, STATUS_CODE,
     CREATED_TS, LAST_UPDATE_TS, SOURCE_SYSTEM_CD, EVENT_FLAG, VERSION_ID)
VALUES
    -- US contacts (1-30)
    ('C00000001','CON-000000000000000001','James','Richardson','James Richardson','1975-04-12 00:00:00','USA','EN','A','2020-01-15 09:00:00','2023-06-15 10:00:00','CRM','I',1),
    ('C00000002','CON-000000000000000002','Sarah','Mitchell','Sarah Mitchell','1982-08-23 00:00:00','USA','EN','A','2019-06-20 10:00:00','2023-01-10 14:00:00','CRM','I',1),
    ('C00000003','CON-000000000000000003','Robert','Chen','Robert Chen','1970-11-05 00:00:00','USA','EN','A','2018-03-01 08:00:00','2022-11-20 14:30:00','ONBOARDING','I',1),
    ('C00000004','CON-000000000000000004','Emily','Vargas','Emily Vargas','1988-02-14 00:00:00','USA','EN','A','2021-05-10 11:00:00','2024-01-10 16:00:00','CRM','I',1),
    ('C00000005','CON-000000000000000005','Michael','Thompson','Michael Thompson','1965-07-30 00:00:00','USA','EN','A','2017-09-01 09:00:00','2023-04-05 11:30:00','KYC_SYSTEM','I',1),
    ('C00000006','CON-000000000000000006','Jennifer','Walsh','Jennifer Walsh','1978-12-18 00:00:00','USA','EN','A','2020-08-15 10:00:00','2023-09-22 13:15:00','CRM','I',1),
    ('C00000007','CON-000000000000000007','David','Kowalski','David Kowalski','1973-03-22 00:00:00','USA','EN','A','2019-01-20 08:30:00','2022-05-14 08:30:00','ONBOARDING','I',1),
    ('C00000008','CON-000000000000000008','Patricia','Hernandez','Patricia Hernandez','1985-09-07 00:00:00','USA','EN','A','2022-02-01 09:00:00','2024-03-18 09:00:00','CRM','I',1),
    ('C00000009','CON-000000000000000009','William','O''Brien','William O''Brien','1968-06-25 00:00:00','USA','EN','A','2018-07-10 10:30:00','2021-12-01 10:45:00','KYC_SYSTEM','I',1),
    ('C00000010','CON-000000000000000010','Margaret','Sullivan','Margaret Sullivan','1980-01-15 00:00:00','USA','EN','A','2020-04-20 11:00:00','2023-02-28 11:00:00','CRM','I',1),
    ('C00000011','CON-000000000000000011','Christopher','Park','Christopher Park','1977-05-08 00:00:00','USA','EN','A','2019-11-05 08:00:00','2022-10-03 14:30:00','ONBOARDING','I',1),
    ('C00000012','CON-000000000000000012','Lisa','Nakamura','Lisa Nakamura','1990-10-30 00:00:00','USA','EN','A','2023-01-15 09:30:00','2024-06-30 10:00:00','CRM','I',1),
    ('C00000013','CON-000000000000000013','Daniel','Foster','Daniel Foster','1972-08-19 00:00:00','USA','EN','A','2017-05-01 10:00:00','2021-03-12 08:00:00','KYC_SYSTEM','I',1),
    ('C00000014','CON-000000000000000014','Karen','Reynolds','Karen Reynolds','1983-04-02 00:00:00','USA','EN','I','2020-09-10 11:00:00','2024-08-20 09:00:00','CRM','U',2),
    ('C00000015','CON-000000000000000015','Steven','Morales','Steven Morales','1969-12-11 00:00:00','USA','EN','A','2018-12-01 08:30:00','2022-08-17 15:00:00','ONBOARDING','I',1),
    ('C00000016','CON-000000000000000016','Nancy','Kim','Nancy Kim','1987-06-28 00:00:00','USA','EN','A','2021-07-20 09:00:00','2024-02-14 16:00:00','CRM','I',1),
    ('C00000017','CON-000000000000000017','Andrew','Patel','Andrew Patel','1974-09-15 00:00:00','USA','EN','A','2019-03-15 10:30:00','2023-07-19 10:30:00','KYC_SYSTEM','I',1),
    ('C00000018','CON-000000000000000018','Elizabeth','Cooper','Elizabeth Cooper','1981-02-03 00:00:00','USA','EN','A','2020-06-01 08:00:00','2023-01-08 12:00:00','CRM','I',1),
    ('C00000019','CON-000000000000000019','Mark','Gonzalez','Mark Gonzalez','1976-11-20 00:00:00','USA','EN','D','2018-04-10 11:00:00','2024-01-10 16:00:00','ONBOARDING','U',2),
    ('C00000020','CON-000000000000000020','Sandra','Wright','Sandra Wright','1984-07-07 00:00:00','USA','EN','A','2022-01-05 09:30:00','2024-03-18 09:00:00','CRM','I',1),
    ('C00000021','CON-000000000000000021','Thomas','Baker','Thomas Baker','1971-03-14 00:00:00','USA','EN','A','2017-02-28 10:00:00','2021-11-30 09:00:00','KYC_SYSTEM','I',1),
    ('C00000022','CON-000000000000000022','Dorothy','Reed','Dorothy Reed','1986-08-22 00:00:00','USA','EN','A','2021-04-15 08:30:00','2023-04-05 11:30:00','CRM','I',1),
    ('C00000023','CON-000000000000000023','Richard','Hayes','Richard Hayes','1967-01-09 00:00:00','USA','EN','I','2019-08-20 09:00:00','2024-06-30 10:00:00','MANUAL','U',2),
    ('C00000024','CON-000000000000000024','Ashley','Turner','Ashley Turner','1992-05-16 00:00:00','USA','EN','A','2023-03-01 10:00:00','2024-08-05 11:00:00','CRM','I',1),
    ('C00000025','CON-000000000000000025','Joseph','Murphy','Joseph Murphy','1979-10-28 00:00:00','USA','EN','A','2020-02-10 11:30:00','2023-06-15 10:00:00','ONBOARDING','I',1),
    ('C00000026','CON-000000000000000026','Donna','Ross','Donna Ross','1975-12-04 00:00:00','USA','EN','A','2018-09-15 08:00:00','2022-11-20 14:30:00','KYC_SYSTEM','I',1),
    ('C00000027','CON-000000000000000027','Charles','Price','Charles Price','1970-06-17 00:00:00','USA','EN','A','2019-05-01 09:30:00','2023-02-28 11:00:00','CRM','I',1),
    ('C00000028','CON-000000000000000028','Stephanie','Bell','Stephanie Bell','1989-03-25 00:00:00','USA','EN','A','2022-06-15 10:00:00','2024-01-10 16:00:00','CRM','I',1),
    ('C00000029','CON-000000000000000029','Paul','Howard','Paul Howard','1966-09-12 00:00:00','USA','EN','I','2017-11-20 11:00:00','2023-09-22 13:15:00','MANUAL','U',2),
    ('C00000030','CON-000000000000000030','Rachel','Campbell','Rachel Campbell','1991-01-30 00:00:00','USA','EN','A','2023-05-10 08:30:00','2024-05-15 10:30:00','CRM','I',1),
    -- UK contacts (31-50)
    ('C00000031','CON-000000000000000031','Oliver','Whitfield','Oliver Whitfield','1976-04-18 00:00:00','GBR','EN','A','2019-09-01 09:00:00','2022-04-10 09:00:00','CRM','I',1),
    ('C00000032','CON-000000000000000032','Charlotte','Pemberton','Charlotte Pemberton','1983-11-22 00:00:00','GBR','EN','A','2020-03-15 10:30:00','2023-08-05 11:00:00','ONBOARDING','I',1),
    ('C00000033','CON-000000000000000033','George','Ashworth','George Ashworth','1968-07-03 00:00:00','GBR','EN','A','2018-01-10 08:00:00','2021-06-20 14:00:00','KYC_SYSTEM','I',1),
    ('C00000034','CON-000000000000000034','Victoria','Sinclair','Victoria Sinclair','1985-02-28 00:00:00','GBR','EN','A','2022-06-01 09:30:00','2024-05-15 10:30:00','CRM','I',1),
    ('C00000035','CON-000000000000000035','Edward','Cartwright','Edward Cartwright','1973-09-14 00:00:00','GBR','EN','A','2018-08-20 10:00:00','2023-03-28 15:30:00','ONBOARDING','I',1),
    ('C00000036','CON-000000000000000036','Isabella','Thornton','Isabella Thornton','1980-06-09 00:00:00','GBR','EN','A','2020-01-15 11:00:00','2022-12-11 13:00:00','CRM','I',1),
    ('C00000037','CON-000000000000000037','Henry','Blackwood','Henry Blackwood','1971-12-25 00:00:00','GBR','EN','A','2019-04-01 08:30:00','2023-11-14 11:00:00','KYC_SYSTEM','I',1),
    ('C00000038','CON-000000000000000038','Sophia','Langley','Sophia Langley','1988-05-15 00:00:00','GBR','EN','I','2021-09-01 09:00:00','2024-04-10 09:00:00','CRM','U',2),
    ('C00000039','CON-000000000000000039','William','Hartley','William Hartley','1965-10-08 00:00:00','GBR','EN','A','2017-11-05 10:30:00','2021-09-07 10:00:00','ONBOARDING','I',1),
    ('C00000040','CON-000000000000000040','Amelia','Prescott','Amelia Prescott','1982-03-12 00:00:00','GBR','EN','A','2022-09-01 08:00:00','2024-09-01 08:00:00','CRM','I',1),
    ('C00000041','CON-000000000000000041','James','Crawford','James Crawford','1977-08-20 00:00:00','GBR','EN','A','2020-05-10 09:30:00','2023-08-05 11:00:00','KYC_SYSTEM','I',1),
    ('C00000042','CON-000000000000000042','Emma','Worthington','Emma Worthington','1990-01-05 00:00:00','GBR','EN','A','2023-01-15 10:00:00','2024-05-15 10:30:00','CRM','I',1),
    ('C00000043','CON-000000000000000043','Alexander','Drummond','Alexander Drummond','1974-06-30 00:00:00','GBR','EN','I','2018-12-10 11:00:00','2024-04-10 09:00:00','MANUAL','U',2),
    ('C00000044','CON-000000000000000044','Florence','Davenport','Florence Davenport','1987-11-17 00:00:00','GBR','EN','A','2021-04-01 08:30:00','2023-03-28 15:30:00','CRM','I',1),
    ('C00000045','CON-000000000000000045','Frederick','Montague','Frederick Montague','1969-04-24 00:00:00','GBR','EN','A','2019-06-15 09:00:00','2022-04-10 09:00:00','ONBOARDING','I',1),
    ('C00000046','CON-000000000000000046','Harriet','Foxley','Harriet Foxley','1984-08-06 00:00:00','GBR','EN','A','2022-01-10 10:30:00','2024-09-01 08:00:00','CRM','I',1),
    ('C00000047','CON-000000000000000047','Benjamin','Stirling','Benjamin Stirling','1972-02-19 00:00:00','GBR','EN','D','2017-03-20 08:00:00','2023-11-14 11:00:00','KYC_SYSTEM','U',2),
    ('C00000048','CON-000000000000000048','Olivia','Hadley','Olivia Hadley','1993-07-11 00:00:00','GBR','EN','A','2023-06-01 09:30:00','2024-05-15 10:30:00','CRM','I',1),
    ('C00000049','CON-000000000000000049','Arthur','Pennington','Arthur Pennington','1966-12-03 00:00:00','GBR','EN','A','2018-05-01 10:00:00','2021-06-20 14:00:00','ONBOARDING','I',1),
    ('C00000050','CON-000000000000000050','Grace','Ellsworth','Grace Ellsworth','1981-09-27 00:00:00','GBR','EN','A','2020-11-15 11:00:00','2023-08-05 11:00:00','CRM','I',1),
    -- DE contacts (51-60)
    ('C00000051','CON-000000000000000051','Markus','Schneider','Markus Schneider','1975-03-08 00:00:00','DEU','DE','A','2019-04-01 09:00:00','2022-07-18 09:00:00','CRM','I',1),
    ('C00000052','CON-000000000000000052','Katrin','Bauer','Katrin Bauer','1982-10-14 00:00:00','DEU','DE','A','2020-10-15 10:30:00','2023-05-22 14:00:00','ONBOARDING','I',1),
    ('C00000053','CON-000000000000000053','Stefan','Richter','Stefan Richter','1970-06-22 00:00:00','DEU','DE','A','2018-05-01 08:00:00','2021-10-30 13:00:00','KYC_SYSTEM','I',1),
    ('C00000054','CON-000000000000000054','Claudia','Weber','Claudia Weber','1986-01-19 00:00:00','DEU','DE','A','2022-07-01 09:30:00','2024-02-05 10:30:00','CRM','I',1),
    ('C00000055','CON-000000000000000055','Andreas','Hoffmann','Andreas Hoffmann','1973-08-05 00:00:00','DEU','DE','A','2019-02-10 10:00:00','2024-10-01 08:00:00','ONBOARDING','I',1),
    ('C00000056','CON-000000000000000056','Sabine','Fischer','Sabine Fischer','1979-12-30 00:00:00','DEU','DE','I','2020-03-20 11:00:00','2024-02-05 10:30:00','CRM','U',2),
    ('C00000057','CON-000000000000000057','Thomas','Muller','Thomas Muller','1968-04-17 00:00:00','DEU','DE','A','2017-08-01 08:30:00','2022-07-18 09:00:00','KYC_SYSTEM','I',1),
    ('C00000058','CON-000000000000000058','Petra','Braun','Petra Braun','1985-07-23 00:00:00','DEU','DE','A','2021-01-15 09:00:00','2023-05-22 14:00:00','CRM','I',1),
    ('C00000059','CON-000000000000000059','Wolfgang','Klein','Wolfgang Klein','1971-11-08 00:00:00','DEU','DE','A','2018-09-10 10:30:00','2024-10-01 08:00:00','ONBOARDING','I',1),
    ('C00000060','CON-000000000000000060','Heike','Zimmermann','Heike Zimmermann','1983-05-26 00:00:00','DEU','DE','A','2022-04-01 08:00:00','2024-02-05 10:30:00','CRM','I',1),
    -- SG contacts (61-75)
    ('C00000061','CON-000000000000000061','Wei Lin','Tan','Wei Lin Tan','1978-02-10 00:00:00','SGP','EN','A','2019-08-15 09:00:00','2022-09-12 09:00:00','CRM','I',1),
    ('C00000062','CON-000000000000000062','Mei Ling','Lim','Mei Ling Lim','1984-09-28 00:00:00','SGP','EN','A','2021-11-01 10:30:00','2023-12-01 11:30:00','ONBOARDING','I',1),
    ('C00000063','CON-000000000000000063','Cheng Wei','Ng','Cheng Wei Ng','1972-05-15 00:00:00','SGP','EN','A','2018-09-01 08:00:00','2022-03-25 14:00:00','KYC_SYSTEM','I',1),
    ('C00000064','CON-000000000000000064','Hui Wen','Ong','Hui Wen Ong','1989-11-03 00:00:00','SGP','EN','A','2023-05-01 09:30:00','2024-01-20 09:30:00','CRM','I',1),
    ('C00000065','CON-000000000000000065','Jian Hong','Chua','Jian Hong Chua','1976-07-20 00:00:00','SGP','EN','A','2020-03-20 10:00:00','2024-07-15 10:00:00','ONBOARDING','I',1),
    ('C00000066','CON-000000000000000066','Shu Ting','Goh','Shu Ting Goh','1981-04-14 00:00:00','SGP','EN','A','2019-12-10 11:00:00','2022-09-12 09:00:00','CRM','I',1),
    ('C00000067','CON-000000000000000067','Kah Heng','Wong','Kah Heng Wong','1970-10-01 00:00:00','SGP','EN','I','2018-01-15 08:30:00','2024-07-15 10:00:00','KYC_SYSTEM','U',2),
    ('C00000068','CON-000000000000000068','Yi Xuan','Teo','Yi Xuan Teo','1987-03-18 00:00:00','SGP','EN','A','2021-06-01 09:00:00','2023-12-01 11:30:00','CRM','I',1),
    ('C00000069','CON-000000000000000069','Zhi Ming','Lee','Zhi Ming Lee','1974-08-27 00:00:00','SGP','EN','A','2019-04-20 10:30:00','2022-03-25 14:00:00','ONBOARDING','I',1),
    ('C00000070','CON-000000000000000070','Xin Yi','Ho','Xin Yi Ho','1992-01-12 00:00:00','SGP','EN','A','2023-02-01 08:00:00','2024-01-20 09:30:00','CRM','I',1),
    ('C00000071','CON-000000000000000071','Boon Kiat','Koh','Boon Kiat Koh','1969-06-05 00:00:00','SGP','EN','A','2018-06-15 09:30:00','2022-09-12 09:00:00','KYC_SYSTEM','I',1),
    ('C00000072','CON-000000000000000072','Li Hua','Chan','Li Hua Chan','1980-12-20 00:00:00','SGP','EN','A','2020-09-01 10:00:00','2024-07-15 10:00:00','CRM','I',1),
    ('C00000073','CON-000000000000000073','Hock Seng','Yeo','Hock Seng Yeo','1977-03-30 00:00:00','SGP','EN','D','2019-01-10 11:00:00','2023-12-01 11:30:00','MANUAL','U',2),
    ('C00000074','CON-000000000000000074','Pei Shan','Low','Pei Shan Low','1991-08-08 00:00:00','SGP','EN','A','2023-07-01 08:30:00','2024-01-20 09:30:00','CRM','I',1),
    ('C00000075','CON-000000000000000075','Jun Wei','Sim','Jun Wei Sim','1975-05-22 00:00:00','SGP','EN','A','2020-01-20 09:00:00','2022-03-25 14:00:00','ONBOARDING','I',1),
    -- CH contacts (76-82)
    ('C00000076','CON-000000000000000076','Lukas','Brunner','Lukas Brunner','1974-09-03 00:00:00','CHE','DE','A','2018-10-01 09:00:00','2022-01-18 10:00:00','CRM','I',1),
    ('C00000077','CON-000000000000000077','Anna','Keller','Anna Keller','1983-02-17 00:00:00','CHE','DE','A','2021-03-15 10:30:00','2023-06-28 14:30:00','ONBOARDING','I',1),
    ('C00000078','CON-000000000000000078','Marco','Berger','Marco Berger','1971-07-25 00:00:00','CHE','DE','A','2019-06-01 08:00:00','2022-01-18 10:00:00','KYC_SYSTEM','I',1),
    ('C00000079','CON-000000000000000079','Sophie','Moser','Sophie Moser','1988-11-10 00:00:00','CHE','FR','A','2023-01-01 09:30:00','2024-08-05 11:00:00','CRM','I',1),
    ('C00000080','CON-000000000000000080','Reto','Steiner','Reto Steiner','1969-04-08 00:00:00','CHE','DE','A','2018-03-10 10:00:00','2023-06-28 14:30:00','ONBOARDING','I',1),
    ('C00000081','CON-000000000000000081','Elena','Favre','Elena Favre','1986-06-14 00:00:00','CHE','FR','I','2021-08-01 11:00:00','2024-08-05 11:00:00','CRM','U',2),
    ('C00000082','CON-000000000000000082','Pierre','Dubois','Pierre Dubois','1977-12-01 00:00:00','CHE','FR','A','2019-09-15 08:30:00','2022-01-18 10:00:00','KYC_SYSTEM','I',1),
    -- HK contacts (83-90)
    ('C00000083','CON-000000000000000083','Wing Kei','Chan','Wing Kei Chan','1976-03-15 00:00:00','HKG','EN','A','2019-05-01 09:00:00','2022-02-14 09:30:00','CRM','I',1),
    ('C00000084','CON-000000000000000084','Mei Yan','Leung','Mei Yan Leung','1984-10-20 00:00:00','HKG','EN','A','2020-11-15 10:30:00','2024-12-01 10:00:00','ONBOARDING','I',1),
    ('C00000085','CON-000000000000000085','Ka Lok','Lau','Ka Lok Lau','1972-06-08 00:00:00','HKG','EN','A','2018-08-20 08:00:00','2022-02-14 09:30:00','KYC_SYSTEM','I',1),
    ('C00000086','CON-000000000000000086','Hoi Man','Cheung','Hoi Man Cheung','1989-01-25 00:00:00','HKG','EN','A','2022-04-01 09:30:00','2024-12-01 10:00:00','CRM','I',1),
    ('C00000087','CON-000000000000000087','Siu Wai','Tsang','Siu Wai Tsang','1975-08-12 00:00:00','HKG','EN','A','2019-09-10 10:00:00','2022-02-14 09:30:00','ONBOARDING','I',1),
    ('C00000088','CON-000000000000000088','Yuk Ling','Kwok','Yuk Ling Kwok','1981-05-30 00:00:00','HKG','EN','D','2020-02-15 11:00:00','2024-12-01 10:00:00','CRM','U',2),
    ('C00000089','CON-000000000000000089','Pak Ho','Fung','Pak Ho Fung','1970-11-18 00:00:00','HKG','EN','A','2018-12-01 08:30:00','2022-02-14 09:30:00','KYC_SYSTEM','I',1),
    ('C00000090','CON-000000000000000090','Sze Man','Ip','Sze Man Ip','1993-04-03 00:00:00','HKG','EN','A','2023-08-01 09:00:00','2024-12-01 10:00:00','CRM','I',1),
    -- KY/BVI contacts (91-95)
    ('C00000091','CON-000000000000000091','Nicholas','Cavendish','Nicholas Cavendish','1973-07-22 00:00:00','GBR','EN','A','2021-06-15 09:00:00','2023-10-08 10:00:00','CRM','I',1),
    ('C00000092','CON-000000000000000092','Helena','Thornberry','Helena Thornberry','1980-02-14 00:00:00','GBR','EN','A','2019-12-01 10:30:00','2024-05-20 16:00:00','ONBOARDING','I',1),
    ('C00000093','CON-000000000000000093','Marcus','Blackwell','Marcus Blackwell','1968-09-05 00:00:00','USA','EN','A','2020-09-01 08:00:00','2022-06-14 11:00:00','KYC_SYSTEM','I',1),
    ('C00000094','CON-000000000000000094','Catherine','Lloyd','Catherine Lloyd','1985-04-18 00:00:00','GBR','EN','I','2018-01-10 09:30:00','2024-11-01 08:00:00','CRM','U',2),
    ('C00000095','CON-000000000000000095','Philip','Ashcroft','Philip Ashcroft','1971-11-30 00:00:00','GBR','EN','A','2017-07-20 10:00:00','2024-06-10 09:00:00','ONBOARDING','I',1),
    -- Additional multi-jurisdiction contacts (96-100)
    ('C00000096','CON-000000000000000096','Hans','Gruber','Hans Gruber','1974-01-12 00:00:00','DEU','DE','A','2019-07-01 09:00:00','2022-07-18 09:00:00','KYC_SYSTEM','I',1),
    ('C00000097','CON-000000000000000097','Yuki','Tanaka','Yuki Tanaka','1986-10-05 00:00:00','SGP','EN','A','2021-02-15 10:30:00','2023-12-01 11:30:00','CRM','I',1),
    ('C00000098','CON-000000000000000098','Priya','Sharma','Priya Sharma','1979-06-18 00:00:00','SGP','EN','I','2020-05-10 08:00:00','2024-07-15 10:00:00','ONBOARDING','U',2),
    ('C00000099','CON-000000000000000099','Francois','Leroy','Francois Leroy','1970-03-27 00:00:00','CHE','FR','A','2018-11-01 09:30:00','2023-06-28 14:30:00','KYC_SYSTEM','I',1),
    ('C00000100','CON-000000000000000100','Ingrid','Svensson','Ingrid Svensson','1982-08-15 00:00:00','GBR','EN','A','2022-03-01 10:00:00','2024-09-01 08:00:00','CRM','I',1);

-- ============================================================================
-- 2.6 CONTACT_LOCATION_CURRENT — 120 contact addresses
-- ============================================================================

INSERT INTO GENERIC_DB.CONTACT_HUB.CONTACT_LOCATION_CURRENT
    (CONTACT_LOCATION_ID, CONTACT_SURROGATE_UUID, LOCATION_TYPE_CD,
     DISPLAY_LINE_1, DISPLAY_LINE_2, LOCALITY, REGION_CODE, NATION_CODE,
     POSTAL_CODE, PRIMARY_FLAG, EFFECTIVE_FROM_TS, EFFECTIVE_TO_TS, EVENT_FLAG, VERSION_ID)
VALUES
    -- US contact locations (contacts 1-30, ~40 rows with some having 2 addresses)
    (1,'CON-000000000000000001','RESIDENTIAL','412 Oak Hill Drive',NULL,'Greenwich','CT','USA','06830','Y','2020-01-15 09:00:00',NULL,'I',1),
    (2,'CON-000000000000000001','BUSINESS','245 Park Avenue, Floor 38',NULL,'New York','NY','USA','10167','N','2020-01-15 09:00:00',NULL,'I',1),
    (3,'CON-000000000000000002','RESIDENTIAL','88 Riverside Boulevard','Apt 22C','New York','NY','USA','10069','Y','2019-06-20 10:00:00',NULL,'I',1),
    (4,'CON-000000000000000003','RESIDENTIAL','1520 Beacon Street',NULL,'Brookline','MA','USA','02446','Y','2018-03-01 08:00:00',NULL,'I',1),
    (5,'CON-000000000000000003','BUSINESS','2711 Centerville Road, Suite 400',NULL,'Wilmington','DE','USA','19808','N','2018-03-01 08:00:00',NULL,'I',1),
    (6,'CON-000000000000000004','RESIDENTIAL','2045 Pacific Heights Blvd',NULL,'San Francisco','CA','USA','94115','Y','2021-05-10 11:00:00',NULL,'I',1),
    (7,'CON-000000000000000005','RESIDENTIAL','790 Lakeshore Drive',NULL,'Chicago','IL','USA','60611','Y','2017-09-01 09:00:00',NULL,'I',1),
    (8,'CON-000000000000000006','RESIDENTIAL','315 Commonwealth Avenue',NULL,'Boston','MA','USA','02115','Y','2020-08-15 10:00:00',NULL,'I',1),
    (9,'CON-000000000000000007','RESIDENTIAL','4210 Cedar Lane',NULL,'Stamford','CT','USA','06905','Y','2019-01-20 08:30:00',NULL,'I',1),
    (10,'CON-000000000000000008','RESIDENTIAL','1875 Preston Road','Suite 1200','Dallas','TX','USA','75252','Y','2022-02-01 09:00:00',NULL,'I',1),
    (11,'CON-000000000000000009','RESIDENTIAL','602 Maple Court',NULL,'Winnetka','IL','USA','60093','Y','2018-07-10 10:30:00',NULL,'I',1),
    (12,'CON-000000000000000010','RESIDENTIAL','935 Fifth Avenue','Apt 14B','New York','NY','USA','10021','Y','2020-04-20 11:00:00',NULL,'I',1),
    (13,'CON-000000000000000011','RESIDENTIAL','2280 Wilshire Boulevard',NULL,'Los Angeles','CA','USA','90057','Y','2019-11-05 08:00:00',NULL,'I',1),
    (14,'CON-000000000000000012','RESIDENTIAL','445 Marina Blvd','Unit 8','San Francisco','CA','USA','94123','Y','2023-01-15 09:30:00',NULL,'I',1),
    (15,'CON-000000000000000013','RESIDENTIAL','1100 South Ocean Blvd',NULL,'Palm Beach','FL','USA','33480','Y','2017-05-01 10:00:00',NULL,'I',1),
    (16,'CON-000000000000000014','RESIDENTIAL','720 Park Avenue','Apt 9A','New York','NY','USA','10021','Y','2020-09-10 11:00:00',NULL,'I',1),
    (17,'CON-000000000000000015','RESIDENTIAL','560 Elm Street',NULL,'Westport','CT','USA','06880','Y','2018-12-01 08:30:00',NULL,'I',1),
    (18,'CON-000000000000000016','RESIDENTIAL','1833 R Street NW',NULL,'Washington','DC','USA','20009','Y','2021-07-20 09:00:00',NULL,'I',1),
    (19,'CON-000000000000000017','RESIDENTIAL','422 Spruce Hill Road',NULL,'Radnor','PA','USA','19087','Y','2019-03-15 10:30:00',NULL,'I',1),
    (20,'CON-000000000000000018','RESIDENTIAL','3050 K Street NW','Apt 502','Washington','DC','USA','20007','Y','2020-06-01 08:00:00',NULL,'I',1),
    (21,'CON-000000000000000019','RESIDENTIAL','1425 Brickell Avenue','Unit 3201','Miami','FL','USA','33131','Y','2018-04-10 11:00:00',NULL,'I',1),
    (22,'CON-000000000000000020','RESIDENTIAL','890 Main Street',NULL,'Dallas','TX','USA','75202','Y','2022-01-05 09:30:00',NULL,'I',1),
    (23,'CON-000000000000000021','RESIDENTIAL','275 Hickory Lane',NULL,'Darien','CT','USA','06820','Y','2017-02-28 10:00:00',NULL,'I',1),
    (24,'CON-000000000000000022','RESIDENTIAL','1600 Collins Avenue','Unit 1805','Miami Beach','FL','USA','33139','Y','2021-04-15 08:30:00',NULL,'I',1),
    (25,'CON-000000000000000023','RESIDENTIAL','95 Prospect Street',NULL,'Princeton','NJ','USA','08540','Y','2019-08-20 09:00:00',NULL,'I',1),
    (26,'CON-000000000000000024','RESIDENTIAL','2200 Pacific Coast Hwy','Apt 12','Malibu','CA','USA','90265','Y','2023-03-01 10:00:00',NULL,'I',1),
    (27,'CON-000000000000000025','RESIDENTIAL','815 Peachtree Street','Unit 1402','Atlanta','GA','USA','30308','Y','2020-02-10 11:30:00',NULL,'I',1),
    (28,'CON-000000000000000026','RESIDENTIAL','340 Briar Hill Road',NULL,'Short Hills','NJ','USA','07078','Y','2018-09-15 08:00:00',NULL,'I',1),
    (29,'CON-000000000000000027','RESIDENTIAL','505 Sansome Street','Apt 1501','San Francisco','CA','USA','94111','Y','2019-05-01 09:30:00',NULL,'I',1),
    (30,'CON-000000000000000028','RESIDENTIAL','1220 Biscayne Blvd','Suite PH-1','Miami','FL','USA','33132','Y','2022-06-15 10:00:00',NULL,'I',1),
    (31,'CON-000000000000000029','RESIDENTIAL','48 Meadow Lane',NULL,'Scarsdale','NY','USA','10583','Y','2017-11-20 11:00:00',NULL,'I',1),
    (32,'CON-000000000000000030','RESIDENTIAL','775 Boylston Street','Apt 8E','Boston','MA','USA','02116','Y','2023-05-10 08:30:00',NULL,'I',1),
    -- UK contact locations (contacts 31-50, ~28 rows)
    (33,'CON-000000000000000031','RESIDENTIAL','14 Chester Square',NULL,'London','LN','GBR','SW1W9HH','Y','2019-09-01 09:00:00',NULL,'I',1),
    (34,'CON-000000000000000031','BUSINESS','1 Knightsbridge, 5th Floor',NULL,'London','LN','GBR','SW1X7LY','N','2019-09-01 09:00:00',NULL,'I',1),
    (35,'CON-000000000000000032','RESIDENTIAL','8 Cadogan Place',NULL,'London','LN','GBR','SW1X9PU','Y','2020-03-15 10:30:00',NULL,'I',1),
    (36,'CON-000000000000000033','RESIDENTIAL','22 Moray Place',NULL,'Edinburgh','ED','GBR','EH3 6BQ','Y','2018-01-10 08:00:00',NULL,'I',1),
    (37,'CON-000000000000000034','RESIDENTIAL','45 Holland Park Avenue',NULL,'London','LN','GBR','W114UA','Y','2022-06-01 09:30:00',NULL,'I',1),
    (38,'CON-000000000000000035','RESIDENTIAL','6 The Circus',NULL,'Bath','BA','GBR','BA1 2ET','Y','2018-08-20 10:00:00',NULL,'I',1),
    (39,'CON-000000000000000036','RESIDENTIAL','31 Eaton Terrace',NULL,'London','LN','GBR','SW1W8TZ','Y','2020-01-15 11:00:00',NULL,'I',1),
    (40,'CON-000000000000000037','RESIDENTIAL','12 Royal Crescent',NULL,'London','LN','GBR','W118SL','Y','2019-04-01 08:30:00',NULL,'I',1),
    (41,'CON-000000000000000038','RESIDENTIAL','7 Pont Street',NULL,'London','LN','GBR','SW1X0BD','Y','2021-09-01 09:00:00',NULL,'I',1),
    (42,'CON-000000000000000039','RESIDENTIAL','19 Park Crescent',NULL,'London','LN','GBR','W1B1PF','Y','2017-11-05 10:30:00',NULL,'I',1),
    (43,'CON-000000000000000040','RESIDENTIAL','55 Ladbroke Grove',NULL,'London','LN','GBR','W112PD','Y','2022-09-01 08:00:00',NULL,'I',1),
    (44,'CON-000000000000000040','CORRESPONDENCE','PO Box 1234',NULL,'London','LN','GBR','EC1A1BB','N','2022-09-01 08:00:00',NULL,'I',1),
    (45,'CON-000000000000000041','RESIDENTIAL','28 Belgrave Square',NULL,'London','LN','GBR','SW1X8QS','Y','2020-05-10 09:30:00',NULL,'I',1),
    (46,'CON-000000000000000042','RESIDENTIAL','3 Montpelier Row',NULL,'London','LN','GBR','SE30RL','Y','2023-01-15 10:00:00',NULL,'I',1),
    (47,'CON-000000000000000043','RESIDENTIAL','41 Queen Anne St',NULL,'London','LN','GBR','W1G9JB','Y','2018-12-10 11:00:00',NULL,'I',1),
    (48,'CON-000000000000000044','RESIDENTIAL','9 Lansdowne Road',NULL,'Bath','BA','GBR','BA1 5DX','Y','2021-04-01 08:30:00',NULL,'I',1),
    (49,'CON-000000000000000045','RESIDENTIAL','15 Albany Road',NULL,'London','LN','GBR','SE5 0AB','Y','2019-06-15 09:00:00',NULL,'I',1),
    (50,'CON-000000000000000046','RESIDENTIAL','27 Thurloe Place',NULL,'London','LN','GBR','SW72HQ','Y','2022-01-10 10:30:00',NULL,'I',1),
    (51,'CON-000000000000000047','RESIDENTIAL','5 Cheyne Walk',NULL,'London','LN','GBR','SW35QL','Y','2017-03-20 08:00:00',NULL,'I',1),
    (52,'CON-000000000000000048','RESIDENTIAL','63 Kensington Church St',NULL,'London','LN','GBR','W84BA','Y','2023-06-01 09:30:00',NULL,'I',1),
    (53,'CON-000000000000000049','RESIDENTIAL','2 Charlotte Square',NULL,'Edinburgh','ED','GBR','EH2 4DR','Y','2018-05-01 10:00:00',NULL,'I',1),
    (54,'CON-000000000000000050','RESIDENTIAL','18 Beaufort Gardens',NULL,'London','LN','GBR','SW3 1PS','Y','2020-11-15 11:00:00',NULL,'I',1),
    -- DE contact locations (contacts 51-60, 12 rows)
    (55,'CON-000000000000000051','RESIDENTIAL','Goethestrasse 42',NULL,'Frankfurt','HE','DEU','60313','Y','2019-04-01 09:00:00',NULL,'I',1),
    (56,'CON-000000000000000051','BUSINESS','Bockenheimer Landstr 2-4',NULL,'Frankfurt','HE','DEU','60306','N','2019-04-01 09:00:00',NULL,'I',1),
    (57,'CON-000000000000000052','RESIDENTIAL','Leopoldstrasse 78',NULL,'Munich','BY','DEU','80802','Y','2020-10-15 10:30:00',NULL,'I',1),
    (58,'CON-000000000000000053','RESIDENTIAL','Bergmannstrasse 15',NULL,'Frankfurt','HE','DEU','60316','Y','2018-05-01 08:00:00',NULL,'I',1),
    (59,'CON-000000000000000054','RESIDENTIAL','Unter den Linden 52',NULL,'Berlin','BE','DEU','10117','Y','2022-07-01 09:30:00',NULL,'I',1),
    (60,'CON-000000000000000055','RESIDENTIAL','Eppendorfer Baum 18',NULL,'Hamburg','HH','DEU','20249','Y','2019-02-10 10:00:00',NULL,'I',1),
    (61,'CON-000000000000000056','RESIDENTIAL','Schillerstrasse 33',NULL,'Munich','BY','DEU','80336','Y','2020-03-20 11:00:00',NULL,'I',1),
    (62,'CON-000000000000000057','RESIDENTIAL','Zeil 88',NULL,'Frankfurt','HE','DEU','60313','Y','2017-08-01 08:30:00',NULL,'I',1),
    (63,'CON-000000000000000058','RESIDENTIAL','Prinzregentenplatz 9',NULL,'Munich','BY','DEU','81675','Y','2021-01-15 09:00:00',NULL,'I',1),
    (64,'CON-000000000000000059','RESIDENTIAL','Alsterchaussee 12',NULL,'Hamburg','HH','DEU','20149','Y','2018-09-10 10:30:00',NULL,'I',1),
    (65,'CON-000000000000000060','RESIDENTIAL','Charlottenstrasse 55',NULL,'Berlin','BE','DEU','10117','Y','2022-04-01 08:00:00',NULL,'I',1),
    (66,'CON-000000000000000060','CORRESPONDENCE','Friedrichstrasse 191',NULL,'Berlin','BE','DEU','10117','N','2022-04-01 08:00:00',NULL,'I',1),
    -- SG contact locations (contacts 61-75, 18 rows)
    (67,'CON-000000000000000061','RESIDENTIAL','12 Nassim Road',NULL,'Singapore','SG','SGP','258370','Y','2019-08-15 09:00:00',NULL,'I',1),
    (68,'CON-000000000000000061','BUSINESS','1 Raffles Place, #44-01',NULL,'Singapore','SG','SGP','048616','N','2019-08-15 09:00:00',NULL,'I',1),
    (69,'CON-000000000000000062','RESIDENTIAL','88 Orchard Boulevard','#08-12','Singapore','SG','SGP','248841','Y','2021-11-01 10:30:00',NULL,'I',1),
    (70,'CON-000000000000000063','RESIDENTIAL','5 Cluny Hill',NULL,'Singapore','SG','SGP','259597','Y','2018-09-01 08:00:00',NULL,'I',1),
    (71,'CON-000000000000000064','RESIDENTIAL','3 Keppel Bay View','#22-05','Singapore','SG','SGP','098403','Y','2023-05-01 09:30:00',NULL,'I',1),
    (72,'CON-000000000000000065','RESIDENTIAL','18 Bukit Timah Road','#15-08','Singapore','SG','SGP','229845','Y','2020-03-20 10:00:00',NULL,'I',1),
    (73,'CON-000000000000000066','RESIDENTIAL','45 Robertson Quay','#06-03','Singapore','SG','SGP','238236','Y','2019-12-10 11:00:00',NULL,'I',1),
    (74,'CON-000000000000000067','RESIDENTIAL','8 Sentosa Cove','Villa 12','Singapore','SG','SGP','098133','Y','2018-01-15 08:30:00',NULL,'I',1),
    (75,'CON-000000000000000068','RESIDENTIAL','22 Tanjong Pagar Road','#18-02','Singapore','SG','SGP','088444','Y','2021-06-01 09:00:00',NULL,'I',1),
    (76,'CON-000000000000000069','RESIDENTIAL','6 Dalvey Road',NULL,'Singapore','SG','SGP','259523','Y','2019-04-20 10:30:00',NULL,'I',1),
    (77,'CON-000000000000000070','RESIDENTIAL','100 Pasir Panjang Road','#04-15','Singapore','SG','SGP','118524','Y','2023-02-01 08:00:00',NULL,'I',1),
    (78,'CON-000000000000000071','RESIDENTIAL','32 Holland Road',NULL,'Singapore','SG','SGP','258850','Y','2018-06-15 09:30:00',NULL,'I',1),
    (79,'CON-000000000000000072','RESIDENTIAL','15 Marina Boulevard','#28-10','Singapore','SG','SGP','018981','Y','2020-09-01 10:00:00',NULL,'I',1),
    (80,'CON-000000000000000073','RESIDENTIAL','9 Ridley Park',NULL,'Singapore','SG','SGP','248473','Y','2019-01-10 11:00:00',NULL,'I',1),
    (81,'CON-000000000000000074','RESIDENTIAL','55 Newton Road','#12-06','Singapore','SG','SGP','307987','Y','2023-07-01 08:30:00',NULL,'I',1),
    (82,'CON-000000000000000075','RESIDENTIAL','2 Peck Seah Street','#19-03','Singapore','SG','SGP','079305','Y','2020-01-20 09:00:00',NULL,'I',1),
    -- CH contact locations (contacts 76-82, 9 rows)
    (83,'CON-000000000000000076','RESIDENTIAL','Seestrasse 120',NULL,'Zurich','ZH','CHE','8002','Y','2018-10-01 09:00:00',NULL,'I',1),
    (84,'CON-000000000000000076','BUSINESS','Bahnhofstrasse 36',NULL,'Zurich','ZH','CHE','8001','N','2018-10-01 09:00:00',NULL,'I',1),
    (85,'CON-000000000000000077','RESIDENTIAL','Haldenstrasse 8',NULL,'Zurich','ZH','CHE','8006','Y','2021-03-15 10:30:00',NULL,'I',1),
    (86,'CON-000000000000000078','RESIDENTIAL','Mythenquai 22',NULL,'Zurich','ZH','CHE','8002','Y','2019-06-01 08:00:00',NULL,'I',1),
    (87,'CON-000000000000000079','RESIDENTIAL','Rue de la Croix-Rouge 4',NULL,'Geneva','GE','CHE','1204','Y','2023-01-01 09:30:00',NULL,'I',1),
    (88,'CON-000000000000000080','RESIDENTIAL','Alpenstrasse 15',NULL,'Zurich','ZH','CHE','8038','Y','2018-03-10 10:00:00',NULL,'I',1),
    (89,'CON-000000000000000081','RESIDENTIAL','Quai du Mont-Blanc 9',NULL,'Geneva','GE','CHE','1201','Y','2021-08-01 11:00:00',NULL,'I',1),
    (90,'CON-000000000000000082','RESIDENTIAL','Rue du Marche 17',NULL,'Geneva','GE','CHE','1204','Y','2019-09-15 08:30:00',NULL,'I',1),
    -- HK contact locations (contacts 83-90, 10 rows)
    (91,'CON-000000000000000083','RESIDENTIAL','22 Peak Road','The Peak',NULL,'HK','HKG','999077','Y','2019-05-01 09:00:00',NULL,'I',1),
    (92,'CON-000000000000000083','BUSINESS','Two IFC, 88 Finance Street',NULL,'Central','HK','HKG','999077','N','2019-05-01 09:00:00',NULL,'I',1),
    (93,'CON-000000000000000084','RESIDENTIAL','8 Repulse Bay Road','Apt 15A',NULL,'HK','HKG','999077','Y','2020-11-15 10:30:00',NULL,'I',1),
    (94,'CON-000000000000000085','RESIDENTIAL','15 Magazine Gap Road',NULL,NULL,'HK','HKG','999077','Y','2018-08-20 08:00:00',NULL,'I',1),
    (95,'CON-000000000000000086','RESIDENTIAL','5 Tai Tam Road','Block A',NULL,'HK','HKG','999077','Y','2022-04-01 09:30:00',NULL,'I',1),
    (96,'CON-000000000000000087','RESIDENTIAL','10 Stubbs Road','Apt 28B',NULL,'HK','HKG','999077','Y','2019-09-10 10:00:00',NULL,'I',1),
    (97,'CON-000000000000000088','RESIDENTIAL','32 Shouson Hill Rd',NULL,NULL,'HK','HKG','999077','Y','2020-02-15 11:00:00',NULL,'I',1),
    (98,'CON-000000000000000089','RESIDENTIAL','6 Bowen Road','Flat C',NULL,'HK','HKG','999077','Y','2018-12-01 08:30:00',NULL,'I',1),
    (99,'CON-000000000000000090','RESIDENTIAL','18 Conduit Road','#8A',NULL,'HK','HKG','999077','Y','2023-08-01 09:00:00',NULL,'I',1),
    -- KY/BVI/multi contacts (91-100, 12 rows)
    (100,'CON-000000000000000091','RESIDENTIAL','PO Box 309','Ugland House',NULL,'GC','CYM','KY1-110','Y','2021-06-15 09:00:00',NULL,'I',1),
    (101,'CON-000000000000000091','BUSINESS','33 Cabot Square','Level 12','London','LN','GBR','E14 4QS','N','2021-06-15 09:00:00',NULL,'I',1),
    (102,'CON-000000000000000092','RESIDENTIAL','West Bay Road','Villa 22',NULL,'GC','CYM','KY1-110','Y','2019-12-01 10:30:00',NULL,'I',1),
    (103,'CON-000000000000000093','RESIDENTIAL','Seven Mile Beach','Condo 8A',NULL,'GC','CYM','KY1-110','Y','2020-09-01 08:00:00',NULL,'I',1),
    (104,'CON-000000000000000094','RESIDENTIAL','Road Town','Wickhams Cay II',NULL,'VG','VGB','VG1110','Y','2018-01-10 09:30:00',NULL,'I',1),
    (105,'CON-000000000000000095','RESIDENTIAL','Frenchmans Cay',NULL,NULL,'VG','VGB','VG1130','Y','2017-07-20 10:00:00',NULL,'I',1),
    (106,'CON-000000000000000096','RESIDENTIAL','Koenigsallee 60',NULL,'Dusseldorf','NW','DEU','40212','Y','2019-07-01 09:00:00',NULL,'I',1),
    (107,'CON-000000000000000097','RESIDENTIAL','50 Shenton Way','#25-08','Singapore','SG','SGP','068882','Y','2021-02-15 10:30:00',NULL,'I',1),
    (108,'CON-000000000000000098','RESIDENTIAL','30 Balmoral Road','#16-04','Singapore','SG','SGP','259804','Y','2020-05-10 08:00:00',NULL,'I',1),
    (109,'CON-000000000000000099','RESIDENTIAL','Place du Bourg-de-Four 3',NULL,'Geneva','GE','CHE','1204','Y','2018-11-01 09:30:00',NULL,'I',1),
    (110,'CON-000000000000000100','RESIDENTIAL','82 Gloucester Place',NULL,'London','LN','GBR','W1U6HP','Y','2022-03-01 10:00:00',NULL,'I',1),
    -- Extra addresses to reach ~120
    (111,'CON-000000000000000002','BUSINESS','1209 Orange Street, Suite 200',NULL,'Wilmington','DE','USA','19801','N','2019-06-20 10:00:00',NULL,'I',1),
    (112,'CON-000000000000000005','BUSINESS','233 South Wacker Drive',NULL,'Chicago','IL','USA','60606','N','2017-09-01 09:00:00',NULL,'I',1),
    (113,'CON-000000000000000010','BUSINESS','555 California Street',NULL,'San Francisco','CA','USA','94104','N','2020-04-20 11:00:00',NULL,'I',1),
    (114,'CON-000000000000000032','BUSINESS','30 St Mary Axe, Level 28',NULL,'London','LN','GBR','EC3A8BF','N','2020-03-15 10:30:00',NULL,'I',1),
    (115,'CON-000000000000000052','BUSINESS','Maximilianstrasse 35',NULL,'Munich','BY','DEU','80539','N','2020-10-15 10:30:00',NULL,'I',1),
    (116,'CON-000000000000000062','BUSINESS','8 Marina View, #35-06',NULL,'Singapore','SG','SGP','018960','N','2021-11-01 10:30:00',NULL,'I',1),
    (117,'CON-000000000000000084','BUSINESS','1 Queens Road Central, L15',NULL,'Central','HK','HKG','999077','N','2020-11-15 10:30:00',NULL,'I',1),
    (118,'CON-000000000000000035','BUSINESS','55 Baker Street, 3rd Floor',NULL,'London','LN','GBR','W1U8EW','N','2018-08-20 10:00:00',NULL,'I',1),
    (119,'CON-000000000000000077','BUSINESS','Rue du Rhone 14',NULL,'Geneva','GE','CHE','1204','N','2021-03-15 10:30:00',NULL,'I',1),
    (120,'CON-000000000000000065','BUSINESS','10 Collyer Quay, #10-01',NULL,'Singapore','SG','SGP','049315','N','2020-03-20 10:00:00',NULL,'I',1);

-- ============================================================================
-- 2.7 CONTACT_EMAIL_CURRENT — 150 email addresses
-- ============================================================================

INSERT INTO GENERIC_DB.CONTACT_HUB.CONTACT_EMAIL_CURRENT
    (EMAIL_RECORD_ID, CONTACT_SURROGATE_UUID, EMAIL_ADDRESS, EMAIL_TYPE_CD,
     PRIMARY_FLAG, VERIFIED_FLAG, VERIFIED_TS, EFFECTIVE_FROM_TS, EFFECTIVE_TO_TS,
     SOURCE_SYSTEM_CD, EVENT_FLAG, VERSION_ID, CREATED_TS, LAST_UPDATE_TS)
VALUES
    -- US contacts: work + personal emails
    (1,'CON-000000000000000001','james.richardson@meridiancap.com','WORK','Y','Y','2020-01-20 10:00:00','2020-01-15 09:00:00',NULL,'CRM','I',1,'2020-01-15 09:00:00','2023-06-15 10:00:00'),
    (2,'CON-000000000000000001','j.richardson@gmail.com','PERSONAL','N','Y','2020-01-20 10:00:00','2020-01-15 09:00:00',NULL,'CRM','I',1,'2020-01-15 09:00:00','2023-06-15 10:00:00'),
    (3,'CON-000000000000000002','sarah.mitchell@meridiancap.com','WORK','Y','Y','2019-06-25 09:00:00','2019-06-20 10:00:00',NULL,'CRM','I',1,'2019-06-20 10:00:00','2023-01-10 14:00:00'),
    (4,'CON-000000000000000003','robert.chen@bluestarventures.com','WORK','Y','Y','2018-03-05 11:00:00','2018-03-01 08:00:00',NULL,'ONBOARDING','I',1,'2018-03-01 08:00:00','2022-11-20 14:30:00'),
    (5,'CON-000000000000000003','rchen1970@yahoo.com','PERSONAL','N','N',NULL,'2018-03-01 08:00:00',NULL,'ONBOARDING','I',1,'2018-03-01 08:00:00','2022-11-20 14:30:00'),
    (6,'CON-000000000000000004','emily.vargas@summitcapital.com','WORK','Y','Y','2021-05-15 14:00:00','2021-05-10 11:00:00',NULL,'CRM','I',1,'2021-05-10 11:00:00','2024-01-10 16:00:00'),
    (7,'CON-000000000000000005','michael.thompson@nordicinvest.com','WORK','Y','Y','2017-09-05 10:00:00','2017-09-01 09:00:00',NULL,'KYC_SYSTEM','I',1,'2017-09-01 09:00:00','2023-04-05 11:30:00'),
    (8,'CON-000000000000000006','jennifer.walsh@atlanticpartners.com','WORK','Y','Y','2020-08-20 09:00:00','2020-08-15 10:00:00',NULL,'CRM','I',1,'2020-08-15 10:00:00','2023-09-22 13:15:00'),
    (9,'CON-000000000000000007','david.kowalski@crosspointmgmt.com','WORK','Y','Y','2019-01-25 10:00:00','2019-01-20 08:30:00',NULL,'ONBOARDING','I',1,'2019-01-20 08:30:00','2022-05-14 08:30:00'),
    (10,'CON-000000000000000008','patricia.hernandez@riverstonecap.com','WORK','Y','Y','2022-02-05 11:00:00','2022-02-01 09:00:00',NULL,'CRM','I',1,'2022-02-01 09:00:00','2024-03-18 09:00:00'),
    (11,'CON-000000000000000009','william.obrien@nordicinvest.com','WORK','Y','Y','2018-07-15 09:00:00','2018-07-10 10:30:00',NULL,'KYC_SYSTEM','I',1,'2018-07-10 10:30:00','2021-12-01 10:45:00'),
    (12,'CON-000000000000000010','margaret.sullivan@summitcapital.com','WORK','Y','Y','2020-04-25 10:00:00','2020-04-20 11:00:00',NULL,'CRM','I',1,'2020-04-20 11:00:00','2023-02-28 11:00:00'),
    (13,'CON-000000000000000011','christopher.park@apexfunding.com','WORK','Y','Y','2019-11-10 09:00:00','2019-11-05 08:00:00',NULL,'ONBOARDING','I',1,'2019-11-05 08:00:00','2022-10-03 14:30:00'),
    (14,'CON-000000000000000012','lisa.nakamura@emeraldsolutions.com','WORK','Y','Y','2023-01-20 11:00:00','2023-01-15 09:30:00',NULL,'CRM','I',1,'2023-01-15 09:30:00','2024-06-30 10:00:00'),
    (15,'CON-000000000000000013','daniel.foster@granitemountain.com','WORK','Y','Y','2017-05-05 10:00:00','2017-05-01 10:00:00',NULL,'KYC_SYSTEM','I',1,'2017-05-01 10:00:00','2021-03-12 08:00:00'),
    (16,'CON-000000000000000014','karen.reynolds@cypressfund.com','WORK','Y','N',NULL,'2020-09-10 11:00:00',NULL,'CRM','I',1,'2020-09-10 11:00:00','2024-08-20 09:00:00'),
    (17,'CON-000000000000000015','steven.morales@westportcap.com','WORK','Y','Y','2018-12-05 09:00:00','2018-12-01 08:30:00',NULL,'ONBOARDING','I',1,'2018-12-01 08:30:00','2022-08-17 15:00:00'),
    (18,'CON-000000000000000016','nancy.kim@trigonstrategic.com','WORK','Y','Y','2021-07-25 10:00:00','2021-07-20 09:00:00',NULL,'CRM','I',1,'2021-07-20 09:00:00','2024-02-14 16:00:00'),
    (19,'CON-000000000000000017','andrew.patel@northwindcap.com','WORK','Y','Y','2019-03-20 09:00:00','2019-03-15 10:30:00',NULL,'KYC_SYSTEM','I',1,'2019-03-15 10:30:00','2023-07-19 10:30:00'),
    (20,'CON-000000000000000018','elizabeth.cooper@trigonstrategic.com','WORK','Y','Y','2020-06-05 10:00:00','2020-06-01 08:00:00',NULL,'CRM','I',1,'2020-06-01 08:00:00','2023-01-08 12:00:00'),
    (21,'CON-000000000000000019','mark.gonzalez@falconholdings.com','WORK','Y','N',NULL,'2018-04-10 11:00:00',NULL,'ONBOARDING','I',1,'2018-04-10 11:00:00','2024-01-10 16:00:00'),
    (22,'CON-000000000000000020','sandra.wright@riverstonecap.com','WORK','Y','Y','2022-01-10 09:00:00','2022-01-05 09:30:00',NULL,'CRM','I',1,'2022-01-05 09:30:00','2024-03-18 09:00:00'),
    (23,'CON-000000000000000021','thomas.baker@silverlineinv.com','WORK','Y','Y','2017-03-05 10:00:00','2017-02-28 10:00:00',NULL,'KYC_SYSTEM','I',1,'2017-02-28 10:00:00','2021-11-30 09:00:00'),
    (24,'CON-000000000000000022','dorothy.reed@falconholdings.com','WORK','Y','Y','2021-04-20 09:00:00','2021-04-15 08:30:00',NULL,'CRM','I',1,'2021-04-15 08:30:00','2023-04-05 11:30:00'),
    (25,'CON-000000000000000023','richard.hayes@phoenixglobal.com','WORK','Y','N',NULL,'2019-08-20 09:00:00',NULL,'MANUAL','I',1,'2019-08-20 09:00:00','2024-06-30 10:00:00'),
    (26,'CON-000000000000000024','ashley.turner@emeraldsolutions.com','WORK','Y','Y','2023-03-05 11:00:00','2023-03-01 10:00:00',NULL,'CRM','I',1,'2023-03-01 10:00:00','2024-08-05 11:00:00'),
    (27,'CON-000000000000000025','joseph.murphy@meridiancap.com','WORK','Y','Y','2020-02-15 10:00:00','2020-02-10 11:30:00',NULL,'ONBOARDING','I',1,'2020-02-10 11:30:00','2023-06-15 10:00:00'),
    (28,'CON-000000000000000026','donna.ross@bluestarventures.com','WORK','Y','Y','2018-09-20 09:00:00','2018-09-15 08:00:00',NULL,'KYC_SYSTEM','I',1,'2018-09-15 08:00:00','2022-11-20 14:30:00'),
    (29,'CON-000000000000000027','charles.price@summitcapital.com','WORK','Y','Y','2019-05-05 10:00:00','2019-05-01 09:30:00',NULL,'CRM','I',1,'2019-05-01 09:30:00','2023-02-28 11:00:00'),
    (30,'CON-000000000000000028','stephanie.bell@libertyfin.com','WORK','Y','Y','2022-06-20 09:00:00','2022-06-15 10:00:00',NULL,'CRM','I',1,'2022-06-15 10:00:00','2024-01-10 16:00:00'),
    (31,'CON-000000000000000029','paul.howard@atlanticpartners.com','WORK','Y','N',NULL,'2017-11-20 11:00:00',NULL,'MANUAL','I',1,'2017-11-20 11:00:00','2023-09-22 13:15:00'),
    (32,'CON-000000000000000030','rachel.campbell@lockwoodmgmt.co.uk','WORK','Y','Y','2023-05-15 10:00:00','2023-05-10 08:30:00',NULL,'CRM','I',1,'2023-05-10 08:30:00','2024-05-15 10:30:00'),
    -- Personal emails for some US contacts
    (33,'CON-000000000000000004','evargas88@gmail.com','PERSONAL','N','Y','2021-05-15 14:00:00','2021-05-10 11:00:00',NULL,'CRM','I',1,'2021-05-10 11:00:00','2024-01-10 16:00:00'),
    (34,'CON-000000000000000007','dkowalski@outlook.com','PERSONAL','N','N',NULL,'2019-01-20 08:30:00',NULL,'ONBOARDING','I',1,'2019-01-20 08:30:00','2022-05-14 08:30:00'),
    (35,'CON-000000000000000010','msullivan80@gmail.com','PERSONAL','N','Y','2020-04-25 10:00:00','2020-04-20 11:00:00',NULL,'CRM','I',1,'2020-04-20 11:00:00','2023-02-28 11:00:00'),
    (36,'CON-000000000000000015','stevenm69@hotmail.com','PERSONAL','N','N',NULL,'2018-12-01 08:30:00',NULL,'ONBOARDING','I',1,'2018-12-01 08:30:00','2022-08-17 15:00:00'),
    (37,'CON-000000000000000020','sandra.w@gmail.com','PERSONAL','N','Y','2022-01-10 09:00:00','2022-01-05 09:30:00',NULL,'CRM','I',1,'2022-01-05 09:30:00','2024-03-18 09:00:00'),
    -- UK contacts: work + personal emails
    (38,'CON-000000000000000031','oliver.whitfield@kensingtonadv.co.uk','WORK','Y','Y','2019-09-05 10:00:00','2019-09-01 09:00:00',NULL,'CRM','I',1,'2019-09-01 09:00:00','2022-04-10 09:00:00'),
    (39,'CON-000000000000000032','charlotte.pemberton@oceanicfreight.co.uk','WORK','Y','Y','2020-03-20 09:00:00','2020-03-15 10:30:00',NULL,'ONBOARDING','I',1,'2020-03-15 10:30:00','2023-08-05 11:00:00'),
    (40,'CON-000000000000000033','george.ashworth@britanniatrust.co.uk','WORK','Y','Y','2018-01-15 10:00:00','2018-01-10 08:00:00',NULL,'KYC_SYSTEM','I',1,'2018-01-10 08:00:00','2021-06-20 14:00:00'),
    (41,'CON-000000000000000034','victoria.sinclair@lockwoodmgmt.co.uk','WORK','Y','Y','2022-06-05 11:00:00','2022-06-01 09:30:00',NULL,'CRM','I',1,'2022-06-01 09:30:00','2024-05-15 10:30:00'),
    (42,'CON-000000000000000035','edward.cartwright@sterlingtrade.co.uk','WORK','Y','Y','2018-08-25 09:00:00','2018-08-20 10:00:00',NULL,'ONBOARDING','I',1,'2018-08-20 10:00:00','2023-03-28 15:30:00'),
    (43,'CON-000000000000000036','isabella.thornton@royalexchange.co.uk','WORK','Y','Y','2020-01-20 10:00:00','2020-01-15 11:00:00',NULL,'CRM','I',1,'2020-01-15 11:00:00','2022-12-11 13:00:00'),
    (44,'CON-000000000000000037','henry.blackwood@emeraldcoast.co.uk','WORK','Y','Y','2019-04-05 09:00:00','2019-04-01 08:30:00',NULL,'KYC_SYSTEM','I',1,'2019-04-01 08:30:00','2023-11-14 11:00:00'),
    (45,'CON-000000000000000038','sophia.langley@newcastlecomm.co.uk','WORK','Y','N',NULL,'2021-09-01 09:00:00',NULL,'CRM','I',1,'2021-09-01 09:00:00','2024-04-10 09:00:00'),
    (46,'CON-000000000000000039','william.hartley@cwmanagers.co.uk','WORK','Y','Y','2017-11-10 10:00:00','2017-11-05 10:30:00',NULL,'ONBOARDING','I',1,'2017-11-05 10:30:00','2021-09-07 10:00:00'),
    (47,'CON-000000000000000040','amelia.prescott@sterlingtrade.co.uk','WORK','Y','Y','2022-09-05 09:00:00','2022-09-01 08:00:00',NULL,'CRM','I',1,'2022-09-01 08:00:00','2024-09-01 08:00:00'),
    (48,'CON-000000000000000041','james.crawford@oceanicfreight.co.uk','WORK','Y','Y','2020-05-15 10:00:00','2020-05-10 09:30:00',NULL,'KYC_SYSTEM','I',1,'2020-05-10 09:30:00','2023-08-05 11:00:00'),
    (49,'CON-000000000000000042','emma.worthington@lockwoodmgmt.co.uk','WORK','Y','Y','2023-01-20 09:00:00','2023-01-15 10:00:00',NULL,'CRM','I',1,'2023-01-15 10:00:00','2024-05-15 10:30:00'),
    (50,'CON-000000000000000043','alexander.drummond@newcastlecomm.co.uk','WORK','Y','N',NULL,'2018-12-10 11:00:00',NULL,'MANUAL','I',1,'2018-12-10 11:00:00','2024-04-10 09:00:00'),
    (51,'CON-000000000000000044','florence.davenport@emeraldcoast.co.uk','WORK','Y','Y','2021-04-05 10:00:00','2021-04-01 08:30:00',NULL,'CRM','I',1,'2021-04-01 08:30:00','2023-03-28 15:30:00'),
    (52,'CON-000000000000000045','frederick.montague@kensingtonadv.co.uk','WORK','Y','Y','2019-06-20 09:00:00','2019-06-15 09:00:00',NULL,'ONBOARDING','I',1,'2019-06-15 09:00:00','2022-04-10 09:00:00'),
    (53,'CON-000000000000000046','harriet.foxley@sterlingtrade.co.uk','WORK','Y','Y','2022-01-15 10:00:00','2022-01-10 10:30:00',NULL,'CRM','I',1,'2022-01-10 10:30:00','2024-09-01 08:00:00'),
    (54,'CON-000000000000000047','benjamin.stirling@horizonrisk.co.uk','WORK','Y','N',NULL,'2017-03-20 08:00:00',NULL,'KYC_SYSTEM','I',1,'2017-03-20 08:00:00','2023-11-14 11:00:00'),
    (55,'CON-000000000000000048','olivia.hadley@lockwoodmgmt.co.uk','WORK','Y','Y','2023-06-05 10:00:00','2023-06-01 09:30:00',NULL,'CRM','I',1,'2023-06-01 09:30:00','2024-05-15 10:30:00'),
    (56,'CON-000000000000000049','arthur.pennington@britanniatrust.co.uk','WORK','Y','Y','2018-05-05 09:00:00','2018-05-01 10:00:00',NULL,'ONBOARDING','I',1,'2018-05-01 10:00:00','2021-06-20 14:00:00'),
    (57,'CON-000000000000000050','grace.ellsworth@oceanicfreight.co.uk','WORK','Y','Y','2020-11-20 10:00:00','2020-11-15 11:00:00',NULL,'CRM','I',1,'2020-11-15 11:00:00','2023-08-05 11:00:00'),
    -- Personal UK emails
    (58,'CON-000000000000000031','owhitfield@btinternet.com','PERSONAL','N','Y','2019-09-05 10:00:00','2019-09-01 09:00:00',NULL,'CRM','I',1,'2019-09-01 09:00:00','2022-04-10 09:00:00'),
    (59,'CON-000000000000000034','v.sinclair@gmail.com','PERSONAL','N','N',NULL,'2022-06-01 09:30:00',NULL,'CRM','I',1,'2022-06-01 09:30:00','2024-05-15 10:30:00'),
    (60,'CON-000000000000000040','amelia.p@outlook.com','PERSONAL','N','Y','2022-09-05 09:00:00','2022-09-01 08:00:00',NULL,'CRM','I',1,'2022-09-01 08:00:00','2024-09-01 08:00:00'),
    (61,'CON-000000000000000046','hfoxley84@gmail.com','PERSONAL','N','N',NULL,'2022-01-10 10:30:00',NULL,'CRM','I',1,'2022-01-10 10:30:00','2024-09-01 08:00:00'),
    -- DE contacts: work + personal emails
    (62,'CON-000000000000000051','markus.schneider@orionholdings.de','WORK','Y','Y','2019-04-05 10:00:00','2019-04-01 09:00:00',NULL,'CRM','I',1,'2019-04-01 09:00:00','2022-07-18 09:00:00'),
    (63,'CON-000000000000000052','katrin.bauer@rheinfinanz.de','WORK','Y','Y','2020-10-20 09:00:00','2020-10-15 10:30:00',NULL,'ONBOARDING','I',1,'2020-10-15 10:30:00','2023-05-22 14:00:00'),
    (64,'CON-000000000000000053','stefan.richter@hanseatische-fs.de','WORK','Y','Y','2018-05-05 10:00:00','2018-05-01 08:00:00',NULL,'KYC_SYSTEM','I',1,'2018-05-01 08:00:00','2021-10-30 13:00:00'),
    (65,'CON-000000000000000054','claudia.weber@berliner-gi.de','WORK','Y','Y','2022-07-05 11:00:00','2022-07-01 09:30:00',NULL,'CRM','I',1,'2022-07-01 09:30:00','2024-02-05 10:30:00'),
    (66,'CON-000000000000000055','andreas.hoffmann@mittelstandwerke.de','WORK','Y','Y','2019-02-15 09:00:00','2019-02-10 10:00:00',NULL,'ONBOARDING','I',1,'2019-02-10 10:00:00','2024-10-01 08:00:00'),
    (67,'CON-000000000000000056','sabine.fischer@rheinfinanz.de','WORK','Y','N',NULL,'2020-03-20 11:00:00',NULL,'CRM','I',1,'2020-03-20 11:00:00','2024-02-05 10:30:00'),
    (68,'CON-000000000000000057','thomas.muller@orionholdings.de','WORK','Y','Y','2017-08-05 10:00:00','2017-08-01 08:30:00',NULL,'KYC_SYSTEM','I',1,'2017-08-01 08:30:00','2022-07-18 09:00:00'),
    (69,'CON-000000000000000058','petra.braun@rheinfinanz.de','WORK','Y','Y','2021-01-20 09:00:00','2021-01-15 09:00:00',NULL,'CRM','I',1,'2021-01-15 09:00:00','2023-05-22 14:00:00'),
    (70,'CON-000000000000000059','wolfgang.klein@mittelstandwerke.de','WORK','Y','Y','2018-09-15 10:00:00','2018-09-10 10:30:00',NULL,'ONBOARDING','I',1,'2018-09-10 10:30:00','2024-10-01 08:00:00'),
    (71,'CON-000000000000000060','heike.zimmermann@berliner-gi.de','WORK','Y','Y','2022-04-05 09:00:00','2022-04-01 08:00:00',NULL,'CRM','I',1,'2022-04-01 08:00:00','2024-02-05 10:30:00'),
    (72,'CON-000000000000000051','m.schneider@web.de','PERSONAL','N','N',NULL,'2019-04-01 09:00:00',NULL,'CRM','I',1,'2019-04-01 09:00:00','2022-07-18 09:00:00'),
    (73,'CON-000000000000000055','a.hoffmann@gmx.de','PERSONAL','N','Y','2019-02-15 09:00:00','2019-02-10 10:00:00',NULL,'ONBOARDING','I',1,'2019-02-10 10:00:00','2024-10-01 08:00:00'),
    -- SG contacts: work + personal emails
    (74,'CON-000000000000000061','weilin.tan@pacificrimtrading.sg','WORK','Y','Y','2019-08-20 09:00:00','2019-08-15 09:00:00',NULL,'CRM','I',1,'2019-08-15 09:00:00','2022-09-12 09:00:00'),
    (75,'CON-000000000000000062','meiling.lim@asiapacificcommodities.sg','WORK','Y','Y','2021-11-05 10:00:00','2021-11-01 10:30:00',NULL,'ONBOARDING','I',1,'2021-11-01 10:30:00','2023-12-01 11:30:00'),
    (76,'CON-000000000000000063','chengwei.ng@lionwealthasia.sg','WORK','Y','Y','2018-09-05 09:00:00','2018-09-01 08:00:00',NULL,'KYC_SYSTEM','I',1,'2018-09-01 08:00:00','2022-03-25 14:00:00'),
    (77,'CON-000000000000000064','huiwen.ong@sgventurecapital.sg','WORK','Y','Y','2023-05-05 10:00:00','2023-05-01 09:30:00',NULL,'CRM','I',1,'2023-05-01 09:30:00','2024-01-20 09:30:00'),
    (78,'CON-000000000000000065','jianhong.chua@temasekenterprise.sg','WORK','Y','Y','2020-03-25 09:00:00','2020-03-20 10:00:00',NULL,'ONBOARDING','I',1,'2020-03-20 10:00:00','2024-07-15 10:00:00'),
    (79,'CON-000000000000000066','shuting.goh@pacificrimtrading.sg','WORK','Y','Y','2019-12-15 10:00:00','2019-12-10 11:00:00',NULL,'CRM','I',1,'2019-12-10 11:00:00','2022-09-12 09:00:00'),
    (80,'CON-000000000000000067','kahheng.wong@temasekenterprise.sg','WORK','Y','N',NULL,'2018-01-15 08:30:00',NULL,'KYC_SYSTEM','I',1,'2018-01-15 08:30:00','2024-07-15 10:00:00'),
    (81,'CON-000000000000000068','yixuan.teo@asiapacificcommodities.sg','WORK','Y','Y','2021-06-05 10:00:00','2021-06-01 09:00:00',NULL,'CRM','I',1,'2021-06-01 09:00:00','2023-12-01 11:30:00'),
    (82,'CON-000000000000000069','zhiming.lee@lionwealthasia.sg','WORK','Y','Y','2019-04-25 09:00:00','2019-04-20 10:30:00',NULL,'ONBOARDING','I',1,'2019-04-20 10:30:00','2022-03-25 14:00:00'),
    (83,'CON-000000000000000070','xinyi.ho@sgventurecapital.sg','WORK','Y','Y','2023-02-05 10:00:00','2023-02-01 08:00:00',NULL,'CRM','I',1,'2023-02-01 08:00:00','2024-01-20 09:30:00'),
    (84,'CON-000000000000000071','boonkiat.koh@pacificrimtrading.sg','WORK','Y','Y','2018-06-20 09:00:00','2018-06-15 09:30:00',NULL,'KYC_SYSTEM','I',1,'2018-06-15 09:30:00','2022-09-12 09:00:00'),
    (85,'CON-000000000000000072','lihua.chan@temasekenterprise.sg','WORK','Y','Y','2020-09-05 10:00:00','2020-09-01 10:00:00',NULL,'CRM','I',1,'2020-09-01 10:00:00','2024-07-15 10:00:00'),
    (86,'CON-000000000000000073','hockseng.yeo@lionwealthasia.sg','WORK','Y','N',NULL,'2019-01-10 11:00:00',NULL,'MANUAL','I',1,'2019-01-10 11:00:00','2023-12-01 11:30:00'),
    (87,'CON-000000000000000074','peishan.low@sgventurecapital.sg','WORK','Y','Y','2023-07-05 09:00:00','2023-07-01 08:30:00',NULL,'CRM','I',1,'2023-07-01 08:30:00','2024-01-20 09:30:00'),
    (88,'CON-000000000000000075','junwei.sim@lionwealthasia.sg','WORK','Y','Y','2020-01-25 10:00:00','2020-01-20 09:00:00',NULL,'ONBOARDING','I',1,'2020-01-20 09:00:00','2022-03-25 14:00:00'),
    (89,'CON-000000000000000061','wltan78@gmail.com','PERSONAL','N','Y','2019-08-20 09:00:00','2019-08-15 09:00:00',NULL,'CRM','I',1,'2019-08-15 09:00:00','2022-09-12 09:00:00'),
    (90,'CON-000000000000000064','huiwen.o@gmail.com','PERSONAL','N','N',NULL,'2023-05-01 09:30:00',NULL,'CRM','I',1,'2023-05-01 09:30:00','2024-01-20 09:30:00'),
    -- CH contacts: work + personal emails
    (91,'CON-000000000000000076','lukas.brunner@alpinewm.ch','WORK','Y','Y','2018-10-05 10:00:00','2018-10-01 09:00:00',NULL,'CRM','I',1,'2018-10-01 09:00:00','2022-01-18 10:00:00'),
    (92,'CON-000000000000000077','anna.keller@zurichfp.ch','WORK','Y','Y','2021-03-20 09:00:00','2021-03-15 10:30:00',NULL,'ONBOARDING','I',1,'2021-03-15 10:30:00','2023-06-28 14:30:00'),
    (93,'CON-000000000000000078','marco.berger@alpinewm.ch','WORK','Y','Y','2019-06-05 10:00:00','2019-06-01 08:00:00',NULL,'KYC_SYSTEM','I',1,'2019-06-01 08:00:00','2022-01-18 10:00:00'),
    (94,'CON-000000000000000079','sophie.moser@helvetiainvest.ch','WORK','Y','Y','2023-01-05 11:00:00','2023-01-01 09:30:00',NULL,'CRM','I',1,'2023-01-01 09:30:00','2024-08-05 11:00:00'),
    (95,'CON-000000000000000080','reto.steiner@zurichfp.ch','WORK','Y','Y','2018-03-15 09:00:00','2018-03-10 10:00:00',NULL,'ONBOARDING','I',1,'2018-03-10 10:00:00','2023-06-28 14:30:00'),
    (96,'CON-000000000000000081','elena.favre@helvetiainvest.ch','WORK','Y','N',NULL,'2021-08-01 11:00:00',NULL,'CRM','I',1,'2021-08-01 11:00:00','2024-08-05 11:00:00'),
    (97,'CON-000000000000000082','pierre.dubois@alpinewm.ch','WORK','Y','Y','2019-09-20 10:00:00','2019-09-15 08:30:00',NULL,'KYC_SYSTEM','I',1,'2019-09-15 08:30:00','2022-01-18 10:00:00'),
    (98,'CON-000000000000000076','l.brunner@bluewin.ch','PERSONAL','N','Y','2018-10-05 10:00:00','2018-10-01 09:00:00',NULL,'CRM','I',1,'2018-10-01 09:00:00','2022-01-18 10:00:00'),
    (99,'CON-000000000000000079','s.moser@protonmail.com','PERSONAL','N','N',NULL,'2023-01-01 09:30:00',NULL,'CRM','I',1,'2023-01-01 09:30:00','2024-08-05 11:00:00'),
    -- HK contacts: work + personal emails
    (100,'CON-000000000000000083','wingkei.chan@dragongatecap.hk','WORK','Y','Y','2019-05-05 10:00:00','2019-05-01 09:00:00',NULL,'CRM','I',1,'2019-05-01 09:00:00','2022-02-14 09:30:00'),
    (101,'CON-000000000000000084','meiyan.leung@emeraldbay.hk','WORK','Y','Y','2020-11-20 09:00:00','2020-11-15 10:30:00',NULL,'ONBOARDING','I',1,'2020-11-15 10:30:00','2024-12-01 10:00:00'),
    (102,'CON-000000000000000085','kalok.lau@dragongatecap.hk','WORK','Y','Y','2018-08-25 10:00:00','2018-08-20 08:00:00',NULL,'KYC_SYSTEM','I',1,'2018-08-20 08:00:00','2022-02-14 09:30:00'),
    (103,'CON-000000000000000086','hoiman.cheung@emeraldbay.hk','WORK','Y','Y','2022-04-05 11:00:00','2022-04-01 09:30:00',NULL,'CRM','I',1,'2022-04-01 09:30:00','2024-12-01 10:00:00'),
    (104,'CON-000000000000000087','siuwai.tsang@dragongatecap.hk','WORK','Y','Y','2019-09-15 09:00:00','2019-09-10 10:00:00',NULL,'ONBOARDING','I',1,'2019-09-10 10:00:00','2022-02-14 09:30:00'),
    (105,'CON-000000000000000088','yukling.kwok@emeraldbay.hk','WORK','Y','N',NULL,'2020-02-15 11:00:00',NULL,'CRM','I',1,'2020-02-15 11:00:00','2024-12-01 10:00:00'),
    (106,'CON-000000000000000089','pakho.fung@dragongatecap.hk','WORK','Y','Y','2018-12-05 10:00:00','2018-12-01 08:30:00',NULL,'KYC_SYSTEM','I',1,'2018-12-01 08:30:00','2022-02-14 09:30:00'),
    (107,'CON-000000000000000090','szeman.ip@emeraldbay.hk','WORK','Y','Y','2023-08-05 09:00:00','2023-08-01 09:00:00',NULL,'CRM','I',1,'2023-08-01 09:00:00','2024-12-01 10:00:00'),
    (108,'CON-000000000000000083','wkchan76@gmail.com','PERSONAL','N','Y','2019-05-05 10:00:00','2019-05-01 09:00:00',NULL,'CRM','I',1,'2019-05-01 09:00:00','2022-02-14 09:30:00'),
    (109,'CON-000000000000000086','hm.cheung@gmail.com','PERSONAL','N','N',NULL,'2022-04-01 09:30:00',NULL,'CRM','I',1,'2022-04-01 09:30:00','2024-12-01 10:00:00'),
    -- KY/BVI/multi contacts: work emails
    (110,'CON-000000000000000091','nicholas.cavendish@caymansvl.ky','WORK','Y','Y','2021-06-20 10:00:00','2021-06-15 09:00:00',NULL,'CRM','I',1,'2021-06-15 09:00:00','2023-10-08 10:00:00'),
    (111,'CON-000000000000000092','helena.thornberry@offshoreis.ky','WORK','Y','Y','2019-12-05 09:00:00','2019-12-01 10:30:00',NULL,'ONBOARDING','I',1,'2019-12-01 10:30:00','2024-05-20 16:00:00'),
    (112,'CON-000000000000000093','marcus.blackwell@caribbeanif.ky','WORK','Y','Y','2020-09-05 10:00:00','2020-09-01 08:00:00',NULL,'KYC_SYSTEM','I',1,'2020-09-01 08:00:00','2022-06-14 11:00:00'),
    (113,'CON-000000000000000094','catherine.lloyd@globalgateway.vg','WORK','Y','N',NULL,'2018-01-10 09:30:00',NULL,'CRM','I',1,'2018-01-10 09:30:00','2024-11-01 08:00:00'),
    (114,'CON-000000000000000095','philip.ashcroft@tridentpacific.vg','WORK','Y','Y','2017-07-25 09:00:00','2017-07-20 10:00:00',NULL,'ONBOARDING','I',1,'2017-07-20 10:00:00','2024-06-10 09:00:00'),
    (115,'CON-000000000000000096','hans.gruber@orionholdings.de','WORK','Y','Y','2019-07-05 10:00:00','2019-07-01 09:00:00',NULL,'KYC_SYSTEM','I',1,'2019-07-01 09:00:00','2022-07-18 09:00:00'),
    (116,'CON-000000000000000097','yuki.tanaka@asiapacificcommodities.sg','WORK','Y','Y','2021-02-20 09:00:00','2021-02-15 10:30:00',NULL,'CRM','I',1,'2021-02-15 10:30:00','2023-12-01 11:30:00'),
    (117,'CON-000000000000000098','priya.sharma@temasekenterprise.sg','WORK','Y','N',NULL,'2020-05-10 08:00:00',NULL,'ONBOARDING','I',1,'2020-05-10 08:00:00','2024-07-15 10:00:00'),
    (118,'CON-000000000000000099','francois.leroy@zurichfp.ch','WORK','Y','Y','2018-11-05 10:00:00','2018-11-01 09:30:00',NULL,'KYC_SYSTEM','I',1,'2018-11-01 09:30:00','2023-06-28 14:30:00'),
    (119,'CON-000000000000000100','ingrid.svensson@sterlingtrade.co.uk','WORK','Y','Y','2022-03-05 09:00:00','2022-03-01 10:00:00',NULL,'CRM','I',1,'2022-03-01 10:00:00','2024-09-01 08:00:00'),
    -- Extra personal emails to reach ~150
    (120,'CON-000000000000000006','j.walsh78@gmail.com','PERSONAL','N','Y','2020-08-20 09:00:00','2020-08-15 10:00:00',NULL,'CRM','I',1,'2020-08-15 10:00:00','2023-09-22 13:15:00'),
    (121,'CON-000000000000000008','phernandez85@outlook.com','PERSONAL','N','N',NULL,'2022-02-01 09:00:00',NULL,'CRM','I',1,'2022-02-01 09:00:00','2024-03-18 09:00:00'),
    (122,'CON-000000000000000012','l.nakamura@gmail.com','PERSONAL','N','Y','2023-01-20 11:00:00','2023-01-15 09:30:00',NULL,'CRM','I',1,'2023-01-15 09:30:00','2024-06-30 10:00:00'),
    (123,'CON-000000000000000018','ecooper81@gmail.com','PERSONAL','N','N',NULL,'2020-06-01 08:00:00',NULL,'CRM','I',1,'2020-06-01 08:00:00','2023-01-08 12:00:00'),
    (124,'CON-000000000000000024','aturner92@gmail.com','PERSONAL','N','Y','2023-03-05 11:00:00','2023-03-01 10:00:00',NULL,'CRM','I',1,'2023-03-01 10:00:00','2024-08-05 11:00:00'),
    (125,'CON-000000000000000028','sbell89@yahoo.com','PERSONAL','N','N',NULL,'2022-06-15 10:00:00',NULL,'CRM','I',1,'2022-06-15 10:00:00','2024-01-10 16:00:00'),
    (126,'CON-000000000000000032','c.pemberton@gmail.com','PERSONAL','N','Y','2020-03-20 09:00:00','2020-03-15 10:30:00',NULL,'ONBOARDING','I',1,'2020-03-15 10:30:00','2023-08-05 11:00:00'),
    (127,'CON-000000000000000037','h.blackwood@btinternet.com','PERSONAL','N','N',NULL,'2019-04-01 08:30:00',NULL,'KYC_SYSTEM','I',1,'2019-04-01 08:30:00','2023-11-14 11:00:00'),
    (128,'CON-000000000000000042','e.worthington@gmail.com','PERSONAL','N','Y','2023-01-20 09:00:00','2023-01-15 10:00:00',NULL,'CRM','I',1,'2023-01-15 10:00:00','2024-05-15 10:30:00'),
    (129,'CON-000000000000000048','o.hadley@outlook.com','PERSONAL','N','N',NULL,'2023-06-01 09:30:00',NULL,'CRM','I',1,'2023-06-01 09:30:00','2024-05-15 10:30:00'),
    (130,'CON-000000000000000052','k.bauer@gmx.de','PERSONAL','N','Y','2020-10-20 09:00:00','2020-10-15 10:30:00',NULL,'ONBOARDING','I',1,'2020-10-15 10:30:00','2023-05-22 14:00:00'),
    (131,'CON-000000000000000054','c.weber@web.de','PERSONAL','N','N',NULL,'2022-07-01 09:30:00',NULL,'CRM','I',1,'2022-07-01 09:30:00','2024-02-05 10:30:00'),
    (132,'CON-000000000000000058','p.braun@gmx.de','PERSONAL','N','Y','2021-01-20 09:00:00','2021-01-15 09:00:00',NULL,'CRM','I',1,'2021-01-15 09:00:00','2023-05-22 14:00:00'),
    (133,'CON-000000000000000062','ml.lim@gmail.com','PERSONAL','N','N',NULL,'2021-11-01 10:30:00',NULL,'ONBOARDING','I',1,'2021-11-01 10:30:00','2023-12-01 11:30:00'),
    (134,'CON-000000000000000066','st.goh@gmail.com','PERSONAL','N','Y','2019-12-15 10:00:00','2019-12-10 11:00:00',NULL,'CRM','I',1,'2019-12-10 11:00:00','2022-09-12 09:00:00'),
    (135,'CON-000000000000000068','yx.teo@gmail.com','PERSONAL','N','N',NULL,'2021-06-01 09:00:00',NULL,'CRM','I',1,'2021-06-01 09:00:00','2023-12-01 11:30:00'),
    (136,'CON-000000000000000070','xinyi.h@gmail.com','PERSONAL','N','Y','2023-02-05 10:00:00','2023-02-01 08:00:00',NULL,'CRM','I',1,'2023-02-01 08:00:00','2024-01-20 09:30:00'),
    (137,'CON-000000000000000072','lh.chan@gmail.com','PERSONAL','N','N',NULL,'2020-09-01 10:00:00',NULL,'CRM','I',1,'2020-09-01 10:00:00','2024-07-15 10:00:00'),
    (138,'CON-000000000000000077','a.keller@bluewin.ch','PERSONAL','N','Y','2021-03-20 09:00:00','2021-03-15 10:30:00',NULL,'ONBOARDING','I',1,'2021-03-15 10:30:00','2023-06-28 14:30:00'),
    (139,'CON-000000000000000080','r.steiner@gmx.ch','PERSONAL','N','N',NULL,'2018-03-10 10:00:00',NULL,'ONBOARDING','I',1,'2018-03-10 10:00:00','2023-06-28 14:30:00'),
    (140,'CON-000000000000000084','my.leung@gmail.com','PERSONAL','N','Y','2020-11-20 09:00:00','2020-11-15 10:30:00',NULL,'ONBOARDING','I',1,'2020-11-15 10:30:00','2024-12-01 10:00:00'),
    (141,'CON-000000000000000087','sw.tsang@gmail.com','PERSONAL','N','N',NULL,'2019-09-10 10:00:00',NULL,'ONBOARDING','I',1,'2019-09-10 10:00:00','2022-02-14 09:30:00'),
    (142,'CON-000000000000000089','ph.fung@gmail.com','PERSONAL','N','Y','2018-12-05 10:00:00','2018-12-01 08:30:00',NULL,'KYC_SYSTEM','I',1,'2018-12-01 08:30:00','2022-02-14 09:30:00'),
    (143,'CON-000000000000000091','n.cavendish@outlook.com','PERSONAL','N','N',NULL,'2021-06-15 09:00:00',NULL,'CRM','I',1,'2021-06-15 09:00:00','2023-10-08 10:00:00'),
    (144,'CON-000000000000000093','m.blackwell@gmail.com','PERSONAL','N','Y','2020-09-05 10:00:00','2020-09-01 08:00:00',NULL,'KYC_SYSTEM','I',1,'2020-09-01 08:00:00','2022-06-14 11:00:00'),
    (145,'CON-000000000000000095','p.ashcroft@outlook.com','PERSONAL','N','N',NULL,'2017-07-20 10:00:00',NULL,'ONBOARDING','I',1,'2017-07-20 10:00:00','2024-06-10 09:00:00'),
    (146,'CON-000000000000000096','h.gruber@gmx.de','PERSONAL','N','Y','2019-07-05 10:00:00','2019-07-01 09:00:00',NULL,'KYC_SYSTEM','I',1,'2019-07-01 09:00:00','2022-07-18 09:00:00'),
    (147,'CON-000000000000000097','y.tanaka@gmail.com','PERSONAL','N','N',NULL,'2021-02-15 10:30:00',NULL,'CRM','I',1,'2021-02-15 10:30:00','2023-12-01 11:30:00'),
    (148,'CON-000000000000000099','f.leroy@protonmail.com','PERSONAL','N','Y','2018-11-05 10:00:00','2018-11-01 09:30:00',NULL,'KYC_SYSTEM','I',1,'2018-11-01 09:30:00','2023-06-28 14:30:00'),
    (149,'CON-000000000000000100','i.svensson@outlook.com','PERSONAL','N','N',NULL,'2022-03-01 10:00:00',NULL,'CRM','I',1,'2022-03-01 10:00:00','2024-09-01 08:00:00'),
    -- One OTHER type email
    (150,'CON-000000000000000001','jrichardson@alumni.harvard.edu','OTHER','N','Y','2020-02-01 09:00:00','2020-01-15 09:00:00',NULL,'MANUAL','I',1,'2020-01-15 09:00:00','2023-06-15 10:00:00');

-- ============================================================================
-- 2.8 CONTACT_RELATIONSHIP_CURRENT — 80 contact-to-contact relationships
--     (modelling corporate roles: DIRECTOR, SHAREHOLDER, UBO, etc.)
-- ============================================================================
-- NOTE: CONTACT_RELATIONSHIP_CURRENT links contacts to other contacts via
-- RELATED_CONTACT_UUID. We use RELATIONSHIP_ROLE_CD to encode the role
-- (e.g., DIRECTOR, UBO) and store the PARTY_KEY context in SOURCE_SYSTEM_CD
-- field as 'CRM:PTY-XXXXXX' for downstream joins.

INSERT INTO GENERIC_DB.CONTACT_HUB.CONTACT_RELATIONSHIP_CURRENT
    (RELATIONSHIP_ID, CONTACT_SURROGATE_UUID, RELATED_CONTACT_UUID,
     RELATIONSHIP_TYPE_CD, RELATIONSHIP_ROLE_CD, PRIMARY_FLAG,
     EFFECTIVE_FROM_TS, EFFECTIVE_TO_TS, SOURCE_SYSTEM_CD,
     EVENT_FLAG, VERSION_ID, CREATED_TS, LAST_UPDATE_TS, ACTIVE_FLAG)
VALUES
    -- Meridian Capital Partners (PTY-000001): Directors, UBO, Officers
    ('REL-00001','CON-000000000000000001',NULL,'CORPORATE','DIRECTOR','Y','2018-03-12 00:00:00',NULL,'CRM:PTY-000001','I',1,'2020-01-15 09:00:00','2023-06-15 10:00:00','Y'),
    ('REL-00002','CON-000000000000000002',NULL,'CORPORATE','COMPLIANCE_OFFICER','N','2019-06-20 00:00:00',NULL,'CRM:PTY-000001','I',1,'2019-06-20 10:00:00','2023-01-10 14:00:00','Y'),
    ('REL-00003','CON-000000000000000025',NULL,'CORPORATE','SHAREHOLDER','N','2020-02-10 00:00:00',NULL,'CRM:PTY-000001','I',1,'2020-02-10 11:30:00','2023-06-15 10:00:00','Y'),
    ('REL-00004','CON-000000000000000001',NULL,'CORPORATE','UBO','Y','2018-03-12 00:00:00',NULL,'CRM:PTY-000001','I',1,'2020-01-15 09:00:00','2023-06-15 10:00:00','Y'),
    -- BlueStar Ventures (PTY-000002)
    ('REL-00005','CON-000000000000000003',NULL,'CORPORATE','DIRECTOR','Y','2016-07-01 00:00:00',NULL,'CRM:PTY-000002','I',1,'2018-03-01 08:00:00','2022-11-20 14:30:00','Y'),
    ('REL-00006','CON-000000000000000026',NULL,'CORPORATE','AUTHORIZED_SIGNATORY','N','2018-09-15 00:00:00',NULL,'CRM:PTY-000002','I',1,'2018-09-15 08:00:00','2022-11-20 14:30:00','Y'),
    ('REL-00007','CON-000000000000000003',NULL,'CORPORATE','UBO','Y','2016-07-01 00:00:00',NULL,'CRM:PTY-000002','I',1,'2018-03-01 08:00:00','2022-11-20 14:30:00','Y'),
    -- Horizon Wealth (PTY-000003)
    ('REL-00008','CON-000000000000000006',NULL,'CORPORATE','DIRECTOR','Y','2019-01-15 00:00:00',NULL,'CRM:PTY-000003','I',1,'2020-08-15 10:00:00','2023-09-22 13:15:00','Y'),
    ('REL-00009','CON-000000000000000008',NULL,'CORPORATE','EMPLOYEE','N','2022-02-01 00:00:00',NULL,'CRM:PTY-000003','I',1,'2022-02-01 09:00:00','2024-03-18 09:00:00','Y'),
    -- Summit Capital (PTY-000004)
    ('REL-00010','CON-000000000000000004',NULL,'CORPORATE','DIRECTOR','Y','2020-05-20 00:00:00',NULL,'CRM:PTY-000004','I',1,'2021-05-10 11:00:00','2024-01-10 16:00:00','Y'),
    ('REL-00011','CON-000000000000000010',NULL,'CORPORATE','AUTHORIZED_SIGNATORY','N','2020-04-20 00:00:00',NULL,'CRM:PTY-000004','I',1,'2020-04-20 11:00:00','2023-02-28 11:00:00','Y'),
    ('REL-00012','CON-000000000000000027',NULL,'CORPORATE','SHAREHOLDER','N','2019-05-01 00:00:00',NULL,'CRM:PTY-000004','I',1,'2019-05-01 09:30:00','2023-02-28 11:00:00','Y'),
    -- Liberty Financial (PTY-000005)
    ('REL-00013','CON-000000000000000001',NULL,'CORPORATE','DIRECTOR','N','2017-09-01 00:00:00',NULL,'CRM:PTY-000005','I',1,'2020-01-15 09:00:00','2024-01-10 16:00:00','Y'),
    ('REL-00014','CON-000000000000000028',NULL,'CORPORATE','EMPLOYEE','N','2022-06-15 00:00:00',NULL,'CRM:PTY-000005','I',1,'2022-06-15 10:00:00','2024-01-10 16:00:00','Y'),
    -- Crosspoint Management (PTY-000006)
    ('REL-00015','CON-000000000000000007',NULL,'CORPORATE','DIRECTOR','Y','2015-11-10 00:00:00',NULL,'CRM:PTY-000006','I',1,'2019-01-20 08:30:00','2022-05-14 08:30:00','Y'),
    ('REL-00016','CON-000000000000000009',NULL,'CORPORATE','COMPLIANCE_OFFICER','N','2018-07-10 00:00:00',NULL,'CRM:PTY-000006','I',1,'2018-07-10 10:30:00','2021-12-01 10:45:00','Y'),
    -- Atlantic Partners (PTY-000007)
    ('REL-00017','CON-000000000000000006',NULL,'CORPORATE','DIRECTOR','N','2021-02-28 00:00:00',NULL,'CRM:PTY-000007','I',1,'2020-08-15 10:00:00','2023-09-22 13:15:00','Y'),
    -- Nordic Investment (PTY-000008)
    ('REL-00018','CON-000000000000000005',NULL,'CORPORATE','DIRECTOR','Y','2019-06-15 00:00:00',NULL,'CRM:PTY-000008','I',1,'2017-09-01 09:00:00','2023-04-05 11:30:00','Y'),
    ('REL-00019','CON-000000000000000009',NULL,'CORPORATE','EMPLOYEE','N','2018-07-10 00:00:00',NULL,'CRM:PTY-000008','I',1,'2018-07-10 10:30:00','2021-12-01 10:45:00','Y'),
    -- Riverstone Capital (PTY-000009)
    ('REL-00020','CON-000000000000000008',NULL,'CORPORATE','DIRECTOR','Y','2022-01-05 00:00:00',NULL,'CRM:PTY-000009','I',1,'2022-02-01 09:00:00','2024-03-18 09:00:00','Y'),
    ('REL-00021','CON-000000000000000020',NULL,'CORPORATE','AUTHORIZED_SIGNATORY','N','2022-01-05 00:00:00',NULL,'CRM:PTY-000009','I',1,'2022-01-05 09:30:00','2024-03-18 09:00:00','Y'),
    -- Phoenix Global (PTY-000010)
    ('REL-00022','CON-000000000000000023',NULL,'CORPORATE','DIRECTOR','Y','2016-04-20 00:00:00',NULL,'CRM:PTY-000010','I',1,'2019-08-20 09:00:00','2020-07-25 14:00:00','N'),
    ('REL-00023','CON-000000000000000013',NULL,'CORPORATE','UBO','Y','2016-04-20 00:00:00',NULL,'CRM:PTY-000010','I',1,'2017-05-01 10:00:00','2021-03-12 08:00:00','Y'),
    -- Falcon Holdings (PTY-000011)
    ('REL-00024','CON-000000000000000005',NULL,'CORPORATE','DIRECTOR','N','2020-08-01 00:00:00',NULL,'CRM:PTY-000011','I',1,'2017-09-01 09:00:00','2023-04-05 11:30:00','Y'),
    ('REL-00025','CON-000000000000000022',NULL,'CORPORATE','EMPLOYEE','N','2021-04-15 00:00:00',NULL,'CRM:PTY-000011','I',1,'2021-04-15 08:30:00','2023-04-05 11:30:00','Y'),
    -- Westport Capital (PTY-000012)
    ('REL-00026','CON-000000000000000015',NULL,'CORPORATE','DIRECTOR','Y','2018-12-10 00:00:00',NULL,'CRM:PTY-000012','I',1,'2018-12-01 08:30:00','2022-08-17 15:00:00','Y'),
    -- Emerald Solutions (PTY-000013)
    ('REL-00027','CON-000000000000000012',NULL,'CORPORATE','DIRECTOR','Y','2023-03-01 00:00:00',NULL,'CRM:PTY-000013','I',1,'2023-01-15 09:30:00','2024-06-30 10:00:00','Y'),
    ('REL-00028','CON-000000000000000024',NULL,'CORPORATE','EMPLOYEE','N','2023-03-01 00:00:00',NULL,'CRM:PTY-000013','I',1,'2023-03-01 10:00:00','2024-08-05 11:00:00','Y'),
    -- Granite Mountain (PTY-000014)
    ('REL-00029','CON-000000000000000013',NULL,'CORPORATE','DIRECTOR','Y','2017-05-15 00:00:00',NULL,'CRM:PTY-000014','I',1,'2017-05-01 10:00:00','2021-03-12 08:00:00','Y'),
    -- Cypress Venture Fund (PTY-000015, suspended)
    ('REL-00030','CON-000000000000000014',NULL,'CORPORATE','DIRECTOR','Y','2016-01-20 00:00:00',NULL,'CRM:PTY-000015','I',1,'2020-09-10 11:00:00','2024-08-20 09:00:00','Y'),
    -- Trigon Strategic (PTY-000016)
    ('REL-00031','CON-000000000000000018',NULL,'CORPORATE','DIRECTOR','Y','2021-07-01 00:00:00',NULL,'CRM:PTY-000016','I',1,'2020-06-01 08:00:00','2023-01-08 12:00:00','Y'),
    ('REL-00032','CON-000000000000000016',NULL,'CORPORATE','COMPLIANCE_OFFICER','N','2021-07-20 00:00:00',NULL,'CRM:PTY-000016','I',1,'2021-07-20 09:00:00','2024-02-14 16:00:00','Y'),
    -- Apex Funding (PTY-000017)
    ('REL-00033','CON-000000000000000011',NULL,'CORPORATE','DIRECTOR','Y','2019-10-10 00:00:00',NULL,'CRM:PTY-000017','I',1,'2019-11-05 08:00:00','2022-10-03 14:30:00','Y'),
    ('REL-00034','CON-000000000000000017',NULL,'CORPORATE','AUTHORIZED_SIGNATORY','N','2019-03-15 00:00:00',NULL,'CRM:PTY-000017','I',1,'2019-03-15 10:30:00','2023-07-19 10:30:00','Y'),
    -- Ironvale Securities (PTY-000018, closed)
    ('REL-00035','CON-000000000000000019',NULL,'CORPORATE','DIRECTOR','Y','2018-06-01 00:00:00','2024-01-31 00:00:00','CRM:PTY-000018','I',1,'2018-04-10 11:00:00','2024-02-14 16:00:00','N'),
    -- Northwind Capital (PTY-000019)
    ('REL-00036','CON-000000000000000017',NULL,'CORPORATE','DIRECTOR','N','2022-04-15 00:00:00',NULL,'CRM:PTY-000019','I',1,'2019-03-15 10:30:00','2023-07-19 10:30:00','Y'),
    -- Silverline Investments (PTY-000020)
    ('REL-00037','CON-000000000000000021',NULL,'CORPORATE','DIRECTOR','Y','2017-02-28 00:00:00',NULL,'CRM:PTY-000020','I',1,'2017-02-28 10:00:00','2021-11-30 09:00:00','Y'),
    -- Kensington Advisory (PTY-000021)
    ('REL-00038','CON-000000000000000031',NULL,'CORPORATE','DIRECTOR','Y','2016-09-15 00:00:00',NULL,'CRM:PTY-000021','I',1,'2019-09-01 09:00:00','2022-04-10 09:00:00','Y'),
    ('REL-00039','CON-000000000000000045',NULL,'CORPORATE','AUTHORIZED_SIGNATORY','N','2019-06-15 00:00:00',NULL,'CRM:PTY-000021','I',1,'2019-06-15 09:00:00','2022-04-10 09:00:00','Y'),
    -- Oceanic Freight (PTY-000022)
    ('REL-00040','CON-000000000000000032',NULL,'CORPORATE','DIRECTOR','Y','2019-03-01 00:00:00',NULL,'CRM:PTY-000022','I',1,'2020-03-15 10:30:00','2023-08-05 11:00:00','Y'),
    ('REL-00041','CON-000000000000000041',NULL,'CORPORATE','SHAREHOLDER','N','2020-05-10 00:00:00',NULL,'CRM:PTY-000022','I',1,'2020-05-10 09:30:00','2023-08-05 11:00:00','Y'),
    ('REL-00042','CON-000000000000000050',NULL,'CORPORATE','EMPLOYEE','N','2020-11-15 00:00:00',NULL,'CRM:PTY-000022','I',1,'2020-11-15 11:00:00','2023-08-05 11:00:00','Y'),
    -- Britannia Trust (PTY-000023)
    ('REL-00043','CON-000000000000000033',NULL,'CORPORATE','DIRECTOR','Y','2015-12-10 00:00:00',NULL,'CRM:PTY-000023','I',1,'2018-01-10 08:00:00','2021-06-20 14:00:00','Y'),
    ('REL-00044','CON-000000000000000049',NULL,'CORPORATE','UBO','N','2018-05-01 00:00:00',NULL,'CRM:PTY-000023','I',1,'2018-05-01 10:00:00','2021-06-20 14:00:00','Y'),
    -- Lockwood Management (PTY-000024)
    ('REL-00045','CON-000000000000000034',NULL,'CORPORATE','DIRECTOR','Y','2022-06-01 00:00:00',NULL,'CRM:PTY-000024','I',1,'2022-06-01 09:30:00','2024-05-15 10:30:00','Y'),
    ('REL-00046','CON-000000000000000042',NULL,'CORPORATE','EMPLOYEE','N','2023-01-15 00:00:00',NULL,'CRM:PTY-000024','I',1,'2023-01-15 10:00:00','2024-05-15 10:30:00','Y'),
    ('REL-00047','CON-000000000000000048',NULL,'CORPORATE','EMPLOYEE','N','2023-06-01 00:00:00',NULL,'CRM:PTY-000024','I',1,'2023-06-01 09:30:00','2024-05-15 10:30:00','Y'),
    -- Sterling Trade (PTY-000025, suspended)
    ('REL-00048','CON-000000000000000035',NULL,'CORPORATE','DIRECTOR','Y','2018-08-20 00:00:00',NULL,'CRM:PTY-000025','I',1,'2018-08-20 10:00:00','2024-09-01 08:00:00','Y'),
    ('REL-00049','CON-000000000000000040',NULL,'CORPORATE','COMPLIANCE_OFFICER','N','2022-09-01 00:00:00',NULL,'CRM:PTY-000025','I',1,'2022-09-01 08:00:00','2024-09-01 08:00:00','Y'),
    ('REL-00050','CON-000000000000000046',NULL,'CORPORATE','AUTHORIZED_SIGNATORY','N','2022-01-10 00:00:00',NULL,'CRM:PTY-000025','I',1,'2022-01-10 10:30:00','2024-09-01 08:00:00','Y'),
    ('REL-00051','CON-000000000000000100',NULL,'CORPORATE','EMPLOYEE','N','2022-03-01 00:00:00',NULL,'CRM:PTY-000025','I',1,'2022-03-01 10:00:00','2024-09-01 08:00:00','Y'),
    -- Royal Exchange (PTY-000026)
    ('REL-00052','CON-000000000000000036',NULL,'CORPORATE','DIRECTOR','Y','2020-01-15 00:00:00',NULL,'CRM:PTY-000026','I',1,'2020-01-15 11:00:00','2022-12-11 13:00:00','Y'),
    -- Emerald Coast (PTY-000027)
    ('REL-00053','CON-000000000000000035',NULL,'CORPORATE','DIRECTOR','N','2021-04-01 00:00:00',NULL,'CRM:PTY-000027','I',1,'2018-08-20 10:00:00','2023-03-28 15:30:00','Y'),
    ('REL-00054','CON-000000000000000044',NULL,'CORPORATE','EMPLOYEE','N','2021-04-01 00:00:00',NULL,'CRM:PTY-000027','I',1,'2021-04-01 08:30:00','2023-03-28 15:30:00','Y'),
    -- Newcastle Commodities (PTY-000028, closed)
    ('REL-00055','CON-000000000000000038',NULL,'CORPORATE','DIRECTOR','Y','2017-11-05 00:00:00','2024-03-15 00:00:00','CRM:PTY-000028','I',1,'2021-09-01 09:00:00','2024-04-10 09:00:00','N'),
    ('REL-00056','CON-000000000000000043',NULL,'CORPORATE','SHAREHOLDER','N','2018-12-10 00:00:00','2024-03-15 00:00:00','CRM:PTY-000028','I',1,'2018-12-10 11:00:00','2024-04-10 09:00:00','N'),
    -- Horizon Risk Partners (PTY-000029)
    ('REL-00057','CON-000000000000000037',NULL,'CORPORATE','DIRECTOR','Y','2022-09-01 00:00:00',NULL,'CRM:PTY-000029','I',1,'2019-04-01 08:30:00','2023-11-14 11:00:00','Y'),
    -- Commonwealth Wealth (PTY-000030)
    ('REL-00058','CON-000000000000000039',NULL,'CORPORATE','DIRECTOR','Y','2016-05-20 00:00:00',NULL,'CRM:PTY-000030','I',1,'2017-11-05 10:30:00','2021-09-07 10:00:00','Y'),
    -- Orion Holdings (PTY-000031)
    ('REL-00059','CON-000000000000000051',NULL,'CORPORATE','DIRECTOR','Y','2017-04-01 00:00:00',NULL,'CRM:PTY-000031','I',1,'2019-04-01 09:00:00','2022-07-18 09:00:00','Y'),
    ('REL-00060','CON-000000000000000057',NULL,'CORPORATE','COMPLIANCE_OFFICER','N','2017-08-01 00:00:00',NULL,'CRM:PTY-000031','I',1,'2017-08-01 08:30:00','2022-07-18 09:00:00','Y'),
    ('REL-00061','CON-000000000000000096',NULL,'CORPORATE','UBO','N','2019-07-01 00:00:00',NULL,'CRM:PTY-000031','I',1,'2019-07-01 09:00:00','2022-07-18 09:00:00','Y'),
    -- Rhein-Finanz (PTY-000032)
    ('REL-00062','CON-000000000000000052',NULL,'CORPORATE','DIRECTOR','Y','2020-10-15 00:00:00',NULL,'CRM:PTY-000032','I',1,'2020-10-15 10:30:00','2023-05-22 14:00:00','Y'),
    ('REL-00063','CON-000000000000000058',NULL,'CORPORATE','EMPLOYEE','N','2021-01-15 00:00:00',NULL,'CRM:PTY-000032','I',1,'2021-01-15 09:00:00','2023-05-22 14:00:00','Y'),
    -- Berliner Grundstueck (PTY-000033)
    ('REL-00064','CON-000000000000000054',NULL,'CORPORATE','DIRECTOR','Y','2022-07-01 00:00:00',NULL,'CRM:PTY-000033','I',1,'2022-07-01 09:30:00','2024-02-05 10:30:00','Y'),
    ('REL-00065','CON-000000000000000060',NULL,'CORPORATE','EMPLOYEE','N','2022-04-01 00:00:00',NULL,'CRM:PTY-000033','I',1,'2022-04-01 08:00:00','2024-02-05 10:30:00','Y'),
    -- Mittelstand Werke (PTY-000034, suspended)
    ('REL-00066','CON-000000000000000055',NULL,'CORPORATE','DIRECTOR','Y','2019-02-10 00:00:00',NULL,'CRM:PTY-000034','I',1,'2019-02-10 10:00:00','2024-10-01 08:00:00','Y'),
    ('REL-00067','CON-000000000000000059',NULL,'CORPORATE','AUTHORIZED_SIGNATORY','N','2018-09-10 00:00:00',NULL,'CRM:PTY-000034','I',1,'2018-09-10 10:30:00','2024-10-01 08:00:00','Y'),
    -- Hanseatische Finanz (PTY-000035)
    ('REL-00068','CON-000000000000000053',NULL,'CORPORATE','DIRECTOR','Y','2018-05-01 00:00:00',NULL,'CRM:PTY-000035','I',1,'2018-05-01 08:00:00','2021-10-30 13:00:00','Y'),
    -- Pacific Rim Trading (PTY-000036)
    ('REL-00069','CON-000000000000000061',NULL,'CORPORATE','DIRECTOR','Y','2019-08-15 00:00:00',NULL,'CRM:PTY-000036','I',1,'2019-08-15 09:00:00','2022-09-12 09:00:00','Y'),
    ('REL-00070','CON-000000000000000063',NULL,'CORPORATE','SHAREHOLDER','N','2018-09-01 00:00:00',NULL,'CRM:PTY-000036','I',1,'2018-09-01 08:00:00','2022-03-25 14:00:00','Y'),
    ('REL-00071','CON-000000000000000071',NULL,'CORPORATE','COMPLIANCE_OFFICER','N','2018-06-15 00:00:00',NULL,'CRM:PTY-000036','I',1,'2018-06-15 09:30:00','2022-09-12 09:00:00','Y'),
    -- Asia Pacific Commodities (PTY-000037)
    ('REL-00072','CON-000000000000000062',NULL,'CORPORATE','DIRECTOR','Y','2021-11-01 00:00:00',NULL,'CRM:PTY-000037','I',1,'2021-11-01 10:30:00','2023-12-01 11:30:00','Y'),
    ('REL-00073','CON-000000000000000097',NULL,'CORPORATE','EMPLOYEE','N','2021-02-15 00:00:00',NULL,'CRM:PTY-000037','I',1,'2021-02-15 10:30:00','2023-12-01 11:30:00','Y'),
    -- Temasek Enterprise (PTY-000038, suspended)
    ('REL-00074','CON-000000000000000065',NULL,'CORPORATE','DIRECTOR','Y','2020-03-20 00:00:00',NULL,'CRM:PTY-000038','I',1,'2020-03-20 10:00:00','2024-07-15 10:00:00','Y'),
    ('REL-00075','CON-000000000000000072',NULL,'CORPORATE','EMPLOYEE','N','2020-09-01 00:00:00',NULL,'CRM:PTY-000038','I',1,'2020-09-01 10:00:00','2024-07-15 10:00:00','Y'),
    -- Alpine Wealth (PTY-000046)
    ('REL-00076','CON-000000000000000076',NULL,'CORPORATE','DIRECTOR','Y','2016-10-01 00:00:00',NULL,'CRM:PTY-000046','I',1,'2018-10-01 09:00:00','2022-01-18 10:00:00','Y'),
    ('REL-00077','CON-000000000000000078',NULL,'CORPORATE','AUTHORIZED_SIGNATORY','N','2019-06-01 00:00:00',NULL,'CRM:PTY-000046','I',1,'2019-06-01 08:00:00','2022-01-18 10:00:00','Y'),
    ('REL-00078','CON-000000000000000082',NULL,'CORPORATE','COMPLIANCE_OFFICER','N','2019-09-15 00:00:00',NULL,'CRM:PTY-000046','I',1,'2019-09-15 08:30:00','2022-01-18 10:00:00','Y'),
    -- Dragon Gate Capital (PTY-000049)
    ('REL-00079','CON-000000000000000083',NULL,'CORPORATE','DIRECTOR','Y','2019-05-01 00:00:00',NULL,'CRM:PTY-000049','I',1,'2019-05-01 09:00:00','2022-02-14 09:30:00','Y'),
    ('REL-00080','CON-000000000000000085',NULL,'CORPORATE','UBO','N','2018-08-20 00:00:00',NULL,'CRM:PTY-000049','I',1,'2018-08-20 08:00:00','2022-02-14 09:30:00','Y');

-- ============================================================================
-- 2.9 VERIFICATION
-- ============================================================================

SELECT 'PARTY_MASTER_CURRENT' AS TABLE_NAME, COUNT(*) AS ROW_COUNT FROM GENERIC_DB.PARTY_MART.PARTY_MASTER_CURRENT
UNION ALL
SELECT 'PARTY_PROFILE_CURRENT', COUNT(*) FROM GENERIC_DB.PARTY_MART.PARTY_PROFILE_CURRENT
UNION ALL
SELECT 'PARTY_LOCATION_CURRENT', COUNT(*) FROM GENERIC_DB.PARTY_MART.PARTY_LOCATION_CURRENT
UNION ALL
SELECT 'PARTY_HIERARCHY_CURRENT', COUNT(*) FROM GENERIC_DB.PARTY_MART.PARTY_HIERARCHY_CURRENT
UNION ALL
SELECT 'CONTACT_RECORD_CURRENT', COUNT(*) FROM GENERIC_DB.CONTACT_HUB.CONTACT_RECORD_CURRENT
UNION ALL
SELECT 'CONTACT_LOCATION_CURRENT', COUNT(*) FROM GENERIC_DB.CONTACT_HUB.CONTACT_LOCATION_CURRENT
UNION ALL
SELECT 'CONTACT_EMAIL_CURRENT', COUNT(*) FROM GENERIC_DB.CONTACT_HUB.CONTACT_EMAIL_CURRENT
UNION ALL
SELECT 'CONTACT_RELATIONSHIP_CURRENT', COUNT(*) FROM GENERIC_DB.CONTACT_HUB.CONTACT_RELATIONSHIP_CURRENT
ORDER BY TABLE_NAME;

SELECT 'Seed data loaded! Run 03_compliance_tables.sql next.' AS STATUS;
