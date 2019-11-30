CREATE DATABASE test;
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

INSERT into Purchase (custName, shipDate, orderedDate) VALUES ('Sarah
Smith', '2016-05-12', '2016-05-10');

rollback;

INSERT into Purchase (custName, shipDate, orderedDate) VALUES ('Sarah
Smith', '2016-05-12', '2016-05-10');

INSERT INTO PurchasedItem (purchaseID, itemNo, productName, orderedqty,
quotedPrice) VALUES ((SELECT LAST_INSERT_ID()), 1, 'Cricket bat', 2, 80.50);

SELECT * FROM Purchase;
SELECT * FROM PurchasedItem;

commit;