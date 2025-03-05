----------------------
--COPY INTO
----------------------
CREATE TABLE copy_into_table(
    Dealer_ID VARCHAR(4000),
    Model_ID VARCHAR(4000),
    Branch_ID VARCHAR(4000),
    Date_ID VARCHAR(4000),
    Units_Sold BIGINT,
    Revenue BIGINT
)
WITH
(
    DISTRIBUTION = ROUND_ROBIN
)

------------------------
--LOADING DATA
------------------------
COPY INTO copy_into_table
(
    Dealer_ID 1,
    Model_ID 2,
    Branch_ID 3,
    Date_ID 4,
    Units_Sold 5,
    Revenue 6
)
FROM 'https://vipulsynapsestorage.dfs.core.windows.net/raw/revenue_cetas/'
WITH(
    FILE_TYPE = 'PARQUET',
    CREDENTIAL = (IDENTITY='Managed Identity')
)

SELECT * FROM copy_into_table