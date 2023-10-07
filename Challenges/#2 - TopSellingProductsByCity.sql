-- Requirements: TopSellingProductsByCity

-- Purpose: This view will help our sales and marketing team to understand the top-selling products in each city so that they can tailor their marketing campaigns accordingly.

-- For each city, display the top 5 products based on the total value of sales.
-- The view should only include orders from the last 6 months.
-- The data should be grouped by CityName and StockItemName.
-- The resulting columns should be:
-- CityName
-- StockItemName
-- TotalSoldQuantity (sum of Quantity)
-- TotalSalesValue (sum of the product sale value)
-- Order the results by CityName and then by TotalSalesValue in descending order.

-- Solution: WideWorldImporters\Challenges\Views\TopSellingProductsByCity.sql

SELECT * FROM Challenges.TopSellingProductsByCity
ORDER BY CityName ASC, TotalSalesValue DESC
