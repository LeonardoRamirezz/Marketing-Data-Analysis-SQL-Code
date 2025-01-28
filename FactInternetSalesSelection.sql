-- Select Important Columns FactInternetSales table
SELECT 
  [ProductKey], 
  [OrderDateKey], 
  [DueDateKey], 
  [ShipDateKey], 
  [CustomerKey], 
  --,[PromotionKey]
  --,[CurrencyKey]
  --,[SalesTerritoryKey]
  [SalesOrderNumber], 
  --[SalesOrderLineNumber], 
  --,[RevisionNumber]
  --,[OrderQuantity], 
  --,[UnitPrice], 
  --,[ExtendedAmount]
  --,[UnitPriceDiscountPct]
  --,[DiscountAmount] 
  --,[ProductStandardCost]
  --,[TotalProductCost] 
  [SalesAmount] 
  --,[TaxAmt]
  --,[Freight]
  --,[CarrierTrackingNumber] 
  --,[CustomerPONumber] 
  --,[OrderDate] 
  --,[DueDate] 
  --,[ShipDate] 
FROM 
  [AdventureWorksDW2019].[dbo].[FactInternetSales]
WHERE 
  LEFT (OrderDateKey, 4) >= YEAR(GETDATE()) -2 --Bring rows 2years behind to budget this year
  ORDER BY
	OrderDateKey ASC --Order records