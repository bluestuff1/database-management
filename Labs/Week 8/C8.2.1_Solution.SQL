CREATE database test; 

USE test;

CREATE TABLE Purchase(
purchaseID int unsigned not null auto_increment,
custName VARCHAR (30) not null,
orderedDate DATE not null,
shipDate DATE,
PRIMARY KEY (purchaseID));
CREATE TABLE PurchasedItem(
purchaseID int unsigned not null,
itemNo int unsigned not null,
productName VARCHAR(30) not null,
orderedQty TINYINT unsigned not null,
quotedPrice DECIMAL(5, 2) not null,
PRIMARY KEY (purchaseID, itemNo),
FOREIGN KEY (purchaseID) REFERENCES Purchase(purchaseID));

SET AUTOCOMMIT = false;

CREATE TABLE Purchase_Backup(
purchaseID int unsigned not null auto_increment,
custName VARCHAR (30) not null,
orderedDate DATE not null,
shipDate DATE,
PRIMARY KEY (purchaseID));

INSERT INTO test.Purchase_Backup SELECT * from test.Purchase;

SELECT * FROM Purchase_Backup;

commit;