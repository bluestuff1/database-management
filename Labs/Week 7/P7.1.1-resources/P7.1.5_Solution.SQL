USE SalesOrdersExample;


CREATE VIEW CustOrderItems AS
SELECT c.CustFirstName, c.CustLastName, o.OrderNumber, o.OrderDate, o.ShipDate, od.QuantityOrdered * od.QuotedPrice as ItemTotal 
FROM Customers c 
JOIN Orders o
ON c.CustomerID = o.CustomerID
JOIN Order_Details od
ON o.OrderNumber = od.OrderNumber;

SELECT CustFirstName,CustLastName,OrderNumber,OrderDate,ShipDate, SUM(ItemTotal) as OrderTotal
FROM CustOrderItems
GROUP BY OrderNumber;
