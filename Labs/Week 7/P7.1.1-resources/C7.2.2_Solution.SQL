USE SalesOrdersExample;

CREATE VIEW EmployeeSalesPerProduct AS
SELECT e.EmployeeID, e.EmpFirstName, e.EmpLastName, p.ProductName, YEAR(o.OrderDate) as Year, od.QuantityOrdered * od.QuotedPrice as ItemTotal
FROM Employees e
JOIN Orders o
ON e.EmployeeID=o.EmployeeID
JOIN Order_Details od
ON o.OrderNumber= od.OrderNumber
JOIN Products p
ON od.ProductNumber = p.ProductNumber;

SELECT EmpFirstName,EmpLastName,ProductName, Year, SUM(ItemTotal) as TotalValue
FROM EmployeeSalesPerProduct
GROUP BY Year, EmployeeID, ProductName
ORDER BY Year, TotalValue DESC;