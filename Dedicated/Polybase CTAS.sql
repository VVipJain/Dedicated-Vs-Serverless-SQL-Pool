CREATE EXTERNAL TABLE parquet_table
(
    Dealer_ID VARCHAR(4000),
    Model_ID VARCHAR(4000),
    Branch_ID VARCHAR(4000),
    Date_ID VARCHAR(4000),
    Units_Sold BIGINT,
    Revenue BIGINT
)
WITH
(
    LOCATION = '/revenue_cetas',
    DATA_SOURCE = raw_ext_src_abfss,
    FILE_FORMAT = parquet_format
)

CREATE TABLE poly_table
WITH
(
    DISTRIBUTION = ROUND_ROBIN
)
AS
SELECT * FROM parquet_table

SELECT * FROM poly_table