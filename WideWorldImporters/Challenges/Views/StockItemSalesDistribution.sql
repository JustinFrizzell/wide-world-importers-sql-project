CREATE VIEW Challenges.StockItemSalesDistribution
AS
WITH TotalSalesCTE AS (
    SELECT 
        si.StockItemID
        , si.StockItemName
        , COALESCE(SUM(ol.PickedQuantity * ol.UnitPrice), 0) AS TotalSales
    FROM Warehouse.StockItems AS si
    LEFT JOIN Sales.OrderLines AS ol ON si.StockItemID = ol.StockItemID
    GROUP BY si.StockItemID, si.StockItemName
)

SELECT 
    t.StockItemID
    , t.StockItemName
    , t.TotalSales
    , SUM(t.TotalSales) OVER(ORDER BY t.TotalSales ASC) / SUM(t.TotalSales) OVER() AS CumulativeDistribution
FROM TotalSalesCTE AS t

GO
