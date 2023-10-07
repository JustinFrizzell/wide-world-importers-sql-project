CREATE VIEW Challenges.TopSellingProductsByCity
AS
WITH RankedCities AS (
    SELECT 
        Cities.CityName AS CityName
        , StockItems.StockItemName AS StockItemName
        , SUM(OrderLines.Quantity) AS TotalSoldQuantity
        , SUM(OrderLines.Quantity * OrderLines.UnitPrice) AS TotalSalesValue
        , RANK() OVER(PARTITION BY Cities.CityName ORDER BY SUM(OrderLines.Quantity * OrderLines.UnitPrice) DESC) AS Rank
    FROM Sales.Orders
    LEFT JOIN Sales.OrderLines
        ON Orders.OrderID = OrderLines.OrderID
    LEFT JOIN Warehouse.StockItems
        ON OrderLines.StockItemID = StockItems.StockItemID
    LEFT JOIN Sales.Customers
        ON Orders.CustomerID = Customers.CustomerID
    LEFT JOIN Application.Cities
        ON Customers.DeliveryCityID = Cities.CityID
    WHERE Orders.OrderDate > DATEADD(MONTH, -6, (SELECT MAX(OrderDate) FROM Sales.Orders))    
    GROUP BY StockItems.StockItemName, Cities.CityName
)

SELECT CityName, StockItemName, TotalSoldQuantity, TotalSalesValue FROM RankedCities WHERE Rank <= 5

GO
