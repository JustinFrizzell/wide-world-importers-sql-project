-- Requirement: ufn_DaysSinceLastInvoice

-- Our sales team often wants to understand the purchasing patterns of our customers. Specifically, they're interested in knowing, for a given invoice, 
-- how many days had passed since the last invoice for that same customer. This would help us identify customers with consistent purchasing frequencies 
-- as well as those whose purchasing has deviated from their usual patterns.

-- Function Objective:
-- Create a tabular function that, when provided an invoice ID, returns the number of days since the last invoice for that same customer.

-- Function Specifications:

-- Function Name: ufn_DaysSinceLastInvoice

-- Input Parameter: InvoiceID (integer)

-- Output Columns:
-- CurrentInvoiceID: The provided InvoiceID.
-- CustomerID: The ID of the customer associated with the provided InvoiceID.
-- PreviousInvoiceDate: The date of the last invoice for that customer before the provided InvoiceID.
-- CurrentInvoiceDate: The date of the provided InvoiceID.
-- DaysSinceLastInvoice: The difference in days between CurrentInvoiceDate and PreviousInvoiceDate.
-- Logic:

-- For a given InvoiceID, retrieve the customer associated with it.
-- Find the date of the last invoice for that customer that occurred before the provided InvoiceID.
-- Calculate the difference in days between the provided InvoiceID's date and the last invoice's date.
-- The function should handle scenarios where there is no previous invoice for the customer (i.e., it's their first purchase). In such cases, the PreviousInvoiceDate 
-- should be NULL, and DaysSinceLastInvoice should also be NULL.

-- Solution: WideWorldImporters\Challenges\Functions\ufn_DaysSinceLastInvoice.sql

SELECT 
    i.InvoiceID
    , i.CustomerID
    , l.PreviousInvoiceDate
    , l.CurrentInvoiceDate
    , l.DaysSinceLastInvoice
FROM 
    Sales.Invoices AS i
CROSS APPLY 
    dbo.ufn_DaysSinceLastInvoice(i.InvoiceID) AS l
WHERE 
    i.CustomerID = 847;
