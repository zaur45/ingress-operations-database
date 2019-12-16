/*
--------------------------------------------------------------------------------------
SQLCMD:
-- :r .\myfile.sql

-- :setvar TableName MyTable
    SELECT * FROM [$(TableName)]
--------------------------------------------------------------------------------------
*/
:r .\script.load_refs_fixtures.sql

-- load test data for dev
:r .\script.test_002_add_portals_list.sql
