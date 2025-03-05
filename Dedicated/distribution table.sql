------------------
--ROUND ROBIN
------------------

CREATE TABLE round_table
(
    id INT,
    name VARCHAR(4000),
    salary INT
)
WITH(
    DISTRIBUTION = ROUND_ROBIN
);

INSERT INTO round_table
VALUES(1,'Vipul',45566);

SELECT * FROM round_table;

------------------
--REPLICATE TABLE
------------------
CREATE SCHEMA gold;

CREATE TABLE gold.dim_product(
    dim_key_prod INT,
    prod_id INT,
    prod_name VARCHAR(4000)
)
WITH(
    DISTRIBUTION = REPLICATE
);

------------------
--HASH TABLE
------------------
CREATE TABLE gold.facttable(
    dim_key_prod INT,
    revenue INT,
    cost INT
)
WITH(
    DISTRIBUTION = HASH(dim_key_prod)
);