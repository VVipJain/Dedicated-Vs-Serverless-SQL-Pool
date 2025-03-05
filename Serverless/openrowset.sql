---------------------------
--CREATE CREDENTIAL
---------------------------
CREATE DATABASE SCOPED CREDENTIAL vipulcred
WITH
    IDENTITY = 'Managed Identity'

---------------------------
--EXT DATA SOURCE
---------------------------
CREATE EXTERNAL DATA SOURCE raw_ext_src
WITH(
    LOCATION = 'https://vipulsynapsestorage.dfs.core.windows.net/raw',
    CREDENTIAL = vipulcred
)

---------------------------
--EXT FILE FORMAT
---------------------------
    CREATE EXTERNAL FILE FORMAT csvformat
    WITH
    (
        FORMAT_TYPE = DELIMITEDTEXT,
        FORMAT_OPTIONS(
            FIELD_TERMINATOR = '',
            STRING_DELIMITER = ','
        )
    )

--------------------------
--OPEN ROWSET
--------------------------
SELECT 
    *
FROM
OPENROWSET(
    BULK 'revenue',
    DATA_SOURCE = 'raw_ext_src',
    FORMAT = 'CSV',
    PARSER_VERSION = '2.0',
    HEADER_ROW = TRUE
) AS query1

------------------------
--PARQUET FORMAT
--------------------------
CREATE EXTERNAL FILE FORMAT parquet_format
WITH(
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
)




