--------------------------
--EXTERNAL TABLE
------------------------

CREATE EXTERNAL TABLE revenue_external_table(
    Dealer_ID VARCHAR(4000),
    Model_ID VARCHAR(4000),
    Branch_ID VARCHAR(4000),
    Date_ID VARCHAR(4000),
    Units_Sold VARCHAR(4000),
    Revenue VARCHAR(4000)
)
WITH
(
    LOCATION = 'revenue',
    DATA_SOURCE = raw_ext_src,
    FILE_FORMAT = csv_format
)

SELECT * FROM revenue_external_table
FROM 'https://vipulsynapsestorage.dfs.core.windows.net/raw/revenue_cetas/'
