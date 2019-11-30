USE SalesOrdersExample;

SELECT CustFirstName, CustLastName 
FROM Customers c
WHERE NOT EXISTS(
	SELECT * 
	FROM Orders o 
	WHERE c.CustomerID = o.CustomerID
	);
