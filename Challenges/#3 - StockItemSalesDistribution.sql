-- Requirements: StockItemSalesDistribution

-- Purpose:
-- This view is aimed at helping our product management and sales team gain insights into the sales distribution of our stock items.
-- It will allow the teams to comprehend which products are frequently sold and which ones lag in sales, thereby assisting in inventory management and marketing strategies.

-- Details:
-- The view should provide a holistic representation of each stock item's position in terms of sales relative to all other stock items in the portfolio.
-- Utilize the CUME_DIST function to calculate the cumulative distribution of sales for each stock item.
-- Consider total sales of each stock item across all time.

-- Resulting Columns:
-- StockItemID: Identifier for each stock item.
-- StockItemName: Descriptive name of the stock item.
-- TotalSales: Sales amount of each stock item.
-- CumulativeDistribution: A calculated measure showing the relative position of each stock item in the cumulative sales distribution.
-- Order:

-- The view should first order the results by TotalSales in descending order, ensuring that items with the highest sales are at the top.
-- Subsequently, within the same sales amount, order by StockItemID or StockItemName to ensure consistency.

-- Solution: WideWorldImporters\Challenges\Views\StockItemSalesDistribution.sql

SELECT * FROM Challenges.StockItemSalesDistribution
ORDER BY TotalSales DESC
