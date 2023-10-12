-- Requirement: usp_PurgeCustomerData

-- We need a stored procedure that: Deletes personal data of the customer from relevant tables.

-- Technical Requirements:
-- Create a stored procedure named usp_PurgeCustomerData which:
-- Takes a parameter named @CustomerID.
-- Deletes or anonymizes data for the given customer across the database.

-- Solution: WideWorldImporters\Challenges\StoredProcedures\usp_PurgeCustomerData.sql

EXEC Challenges.usp_PurgeCustomerData @CustomerID = 1;
