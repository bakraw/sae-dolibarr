USE dolibarr;

LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/data.csv'
INTO TABLE llx_societe
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(nom, code_client, address, zip, town, fk_pays, phone, email, client, fournisseur);
