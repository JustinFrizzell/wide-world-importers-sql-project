CREATE PROCEDURE Challenges.usp_PurgeCustomerData
    @CustomerID INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        
        -- Anonymise data in the Orders table
        UPDATE Sales.Orders
        SET
            Comments = NULL
            , DeliveryInstructions = NULL 
        WHERE CustomerID = @CustomerID;

        -- Delete personal data from the Customers table
        DELETE FROM Sales.Customers
        WHERE CustomerID = @CustomerID;

        COMMIT TRANSACTION;
        
    END TRY
    BEGIN CATCH
        -- Rollback if there's an error
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END
