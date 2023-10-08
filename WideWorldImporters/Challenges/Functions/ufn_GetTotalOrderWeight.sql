CREATE FUNCTION Challenges.ufn_GetTotalOrderWeight ( @OrderID INT )
RETURNS DECIMAL (18, 3)
AS
BEGIN
    DECLARE @Weight DECIMAL (18, 3)
    SELECT @Weight = COALESCE(SUM(ol.PickedQuantity * si.TypicalWeightPerUnit),0) FROM Sales.OrderLines AS ol 
    INNER JOIN Warehouse.StockItems AS si 
        ON ol.StockItemID = si.StockItemID
    WHERE ol.OrderID = @OrderID
    RETURN(@Weight)
END

GO
