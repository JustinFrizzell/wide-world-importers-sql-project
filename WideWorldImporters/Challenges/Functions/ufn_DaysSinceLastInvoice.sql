CREATE FUNCTION dbo.ufn_DaysSinceLastInvoice (@InvoiceID INT)
RETURNS TABLE
AS
RETURN 
(
    SELECT
        CurrentInvoice.InvoiceID AS CurrentInvoiceID
        , CurrentInvoice.CustomerID
        , PreviousInvoice.InvoiceDate AS PreviousInvoiceDate
        , CurrentInvoice.InvoiceDate AS CurrentInvoiceDate
        , DATEDIFF(DAY, PreviousInvoice.InvoiceDate, CurrentInvoice.InvoiceDate) AS DaysSinceLastInvoice
    FROM
        Sales.Invoices AS CurrentInvoice
    LEFT JOIN
        Sales.Invoices
            AS PreviousInvoice
        ON CurrentInvoice.CustomerID = PreviousInvoice.CustomerID
            AND CurrentInvoice.InvoiceDate > PreviousInvoice.InvoiceDate
    WHERE
        CurrentInvoice.InvoiceID = @InvoiceID
        AND (
            PreviousInvoice.InvoiceDate IS NULL
            OR PreviousInvoice.InvoiceDate
            = (
                SELECT MAX(InvoiceDate)
                FROM Sales.Invoices
                WHERE CustomerID = CurrentInvoice.CustomerID
                    AND InvoiceDate < CurrentInvoice.InvoiceDate
            )
        )
);
