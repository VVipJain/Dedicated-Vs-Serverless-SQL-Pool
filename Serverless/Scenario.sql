CREATE EXTERNAL TABLE revenue_2
(
    Dealer_ID VARCHAR(4000),
    Model_ID VARCHAR(4000),
    Branch_ID VARCHAR(4000),
    Date_ID VARCHAR(4000),
    Units_Sold VARCHAR(4000),
    Revenue VARCHAR(4000)
)
WITH
(
    LOCATION = 'revenue_2',
    DATA_SOURCE = raw_ext_src,
    FILE_FORMAT = csv_format
)
