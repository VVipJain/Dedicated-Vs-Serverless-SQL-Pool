---------------------
--VIEWS
---------------------
CREATE VIEW revenue_view
AS(
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
)

SELECT * FROM revenue_view