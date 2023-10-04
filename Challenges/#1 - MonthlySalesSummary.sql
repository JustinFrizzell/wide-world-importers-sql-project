-- Requirement: Monthly Sales Summary View

-- Background: We are trying to get a better grasp of our sales performance across different cities. We need a view that can show us the monthly sales data, including total amount and the number of orders.

-- Specifications:

-- Source Tables:
-- Sales.Orders
-- Sales.OrderLines
-- Sales.Customers
-- Application.Cities

-- Data Points:
-- YearMonth: This should be in the format YYYY-MM.
-- CityName: Name of the city where our customer is based.
-- TotalSalesValue: The sum of all sales values (including all line items) for that month and city.
-- NumberOfOrders: The number of unique orders for that month and city.

-- Grouping:
-- The data should be grouped by YearMonth and CityName.

-- Ordering:
-- Results should be ordered by YearMonth in ascending order, then by TotalSalesValue in descending order.

-- Solution: WideWorldImporters\Challenges\Views\MonthlySalesSummary.sql

SELECT * FROM Challenges.MonthlySalesSummary 
ORDER BY YearMonth ASC, TotalSalesValue DESC
