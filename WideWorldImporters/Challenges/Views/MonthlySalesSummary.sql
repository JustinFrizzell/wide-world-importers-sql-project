CREATE VIEW Challenges.MonthlySalesSummary
AS
SELECT
    FORMAT(Orders.OrderDate, 'yyyy-MM') AS YearMonth
    , Cities.CityName
    , SUM(OrderLines.Quantity * OrderLines.UnitPrice) AS TotalSalesValue
    , COUNT(DISTINCT Orders.OrderID) AS NumberOfOrders
FROM Sales.Orders
INNER JOIN Sales.OrderLines ON Orders.OrderID = OrderLines.OrderID
LEFT JOIN Sales.Customers ON Orders.CustomerID = Customers.CustomerID
LEFT JOIN Application.Cities ON Customers.DeliveryCityID = Cities.CityID
GROUP BY
    FORMAT(Orders.OrderDate, 'yyyy-MM')
    , CityName

GO
