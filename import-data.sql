USE dolibarr;

LOAD DATA INFILE '/docker-entrypoint-initdb.d/data.csv'
INTO TABLE llx_societe
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(type, nom, adresse, zip, town, pays, phone, email);
