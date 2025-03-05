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

CREATE EXTERNAL DATA SOURCE raw_ext_src_abfss
WITH(
    LOCATION = 'abfss://raw@vipulsynapsestorage.dfs.core.windows.net',
    CREDENTIAL = vipulcred
)
------------------------
--PARQUET FORMAT
--------------------------
CREATE EXTERNAL FILE FORMAT parquet_format
WITH(
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
)