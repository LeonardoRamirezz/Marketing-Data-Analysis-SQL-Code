--Get information about sales
--CTE to join FactInernetSalesReason and DimSalesReason
WITH SalesReasons_CTE AS (
    SELECT 
        fir.SalesOrderNumber,
        dsr.SalesReasonReasonType
    FROM dbo.FactInternetSalesReason AS fir
    LEFT JOIN dbo.DimSalesReason AS dsr 
        ON fir.SalesReasonKey = dsr.SalesReasonKey
)
SELECT --Query to gather all columns
    fis.ProductKey,
    fis.OrderDateKey,
    fis.CustomerKey,
    fis.SalesOrderNumber,
    fis.SalesAmount,
    fis.UnitPrice,
    sr.SalesReasonReasonType
FROM dbo.FactInternetSales AS fis
LEFT JOIN SalesReasons_CTE AS sr
    ON fis.SalesOrderNumber = sr.SalesOrderNumber
WHERE
	(LEFT (OrderDateKey, 4) >= YEAR(GETDATE()) - 2) --Bring rows only behind from the last 2 years
	AND
	(LEFT (OrderDateKey, 4) < 2025) --This DB is fictional so we need to filter incoherent values
ORDER BY fis.OrderDateKey ASC; --Order from oldest to newest
