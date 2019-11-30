USE SalesOrdersExample;

SELECT * FROM Customers;

SELECT CustFirstName,CustLastName,CONCAT('+',CustAreaCode,' ',CustPhoneNumber) CustPhoneNumber FROM Customers;