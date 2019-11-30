USE SalesOrdersExample;

SELECT COUNT(*) as Customers, CustState 
FROM Customers
GROUP BY CustState;