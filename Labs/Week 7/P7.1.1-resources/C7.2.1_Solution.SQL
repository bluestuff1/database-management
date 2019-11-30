USE SalesOrdersExample;

SELECT * FROM CustOrderItems;
SELECT * FROM Orders;
SELECT * FROM Order_Details;
SELECT * FROM Customers;
SELECT * FROM Employees;

CREATE VIEW EmployeeSalesPerProduct AS
SELECT e.EmployeeID, e.EmpFirstName, e.EmpLastName, p.ProductName, od.QuantityOrdered * od.QuotedPrice as ItemTotal
FROM Employees e
JOIN Orders o
ON e.EmployeeID=o.EmployeeID
JOIN Order_Details od
ON o.OrderNumber= od.OrderNumber
JOIN Products p
ON od.ProductNumber = p.ProductNumber;

SELECT EmpFirstName,EmpLastName,ProductName,SUM(ItemTotal) as TotalSold
FROM EmployeeSalesPerProduct
GROUP BY EmployeeID, ProductName
ORDER BY EmpLastName, ProductName;