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

INSERT INTO PurchasedItem (purchaseID, itemNo, productName, orderedQty, quotedPrice) 
VALUES (111,1, 'Lawn mower', 3, 105.30);

SELECT * FROM PurchasedItem;
SELECT * FROM Purchase;

INSERT INTO Purchase (purchaseID, custName, orderedDate) VALUES ('111', 'Bob
Smith', '2016-05-12');

INSERT INTO PurchasedItem (purchaseID, itemNo, productName, orderedQty, quotedPrice) 
VALUES (111,1, 'Lawn mower', 3, 105.30);
/*The insert fails because there is no parent row. 
First, a row with the purchaseID of 111 has to be added to the Purchase table. */

commit;