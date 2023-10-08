-- Requirement: ufn_GetTotalOrderWeight

-- Purpose:
-- We need a scalar function that, given an OrderID, will return the total weight of all the items in that order.

-- Specifics:
-- The function should be named ufn_GetTotalOrderWeight.
-- The input to the function should be an OrderID.
-- The function should return the total weight as a decimal.
-- The weight of each item can be calculated from the StockItemTransactions table. Each stock item transaction related to an order has a Quantity and is linked to a StockItem which has a TypicalWeightPerUnit.
-- The total weight for the order can be determined by summing up the products of Quantity and TypicalWeightPerUnit for all stock items in that order.

-- Notes:
-- Ensure to handle cases where the OrderID might not be present in the database.
-- Return a value of 0 if there are no items or if the order doesn't exist.

-- Solution: WideWorldImporters\Challenges\Functions\ufn_GetTotalOrderWeight.sql

SELECT TOP 100 OrderID, OrderDate, Challenges.ufn_GetTotalOrderWeight(OrderID) AS TotalOrderWeight FROM Sales.Orders
ORDER BY OrderDate DESC
