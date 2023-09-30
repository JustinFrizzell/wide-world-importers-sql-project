CREATE
OR

ALTER PROCEDURE Tests.Test_Website_Customers_Exists
AS
BEGIN
    -- Assert that the object exists in the database
    EXEC TSQLt.AssertObjectExists 'Website.Customers'
END;
GO
