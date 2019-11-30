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

DELETE FROM Purchase
WHERE purchaseID = '111';

DELETE FROM PurchasedItem
WHERE purchaseID = '111';

DELETE FROM Purchase
WHERE purchaseID = '111';

SELECT * FROM Purchase;

commit;