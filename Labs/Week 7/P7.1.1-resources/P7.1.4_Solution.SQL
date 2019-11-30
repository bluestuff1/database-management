USE SalesOrdersExample;

SELECT CustFirstName, CustLastName, OrderDate
FROM Customers c, Orders o
WHERE o.CustomerID=c.CustomerID
ORDER BY CustLastName, CustFirstName, OrderDate DESC;

SELECT CustFirstName, CustLastName, OrderDate
FROM Customers c JOIN Orders o 
ON c.CustomerID = o.CustomerID
ORDER BY CustLastName, CustFirstName, OrderDate DESC;

SELECT CustFirstName, CustLastName, OrderDate
FROM Customers c 
LEFT JOIN Orders o 
ON c.CustomerID = o.CustomerID
WHERE o.OrderNumber is NULL
ORDER BY CustLastName, CustFirstName, OrderDate DESC;
 
SELECT CustFirstName, CustLastName, OrderDate
FROM Customers c JOIN Orders o 
ON o.CustomerID = c.CustomerID
WHERE o.OrderNumber = 
	(
	SELECT MAX(OrderNumber) 
	FROM Orders
	WHERE CustomerID = c.CustomerID
	)
ORDER BY CustLastName, CustFirstName, OrderDate DESC;