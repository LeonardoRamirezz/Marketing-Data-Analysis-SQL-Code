--Select columns from DimProduc join with DimProductSubcategory and DimProductCategory
SELECT
	dp.ProductKey,
	dp.ProductAlternateKey AS ItemCode,
	dp.ModelName AS ProductModelName,
	dp.EnglishProductName AS ProductName,
	dpc.EnglishProductCategoryName AS Category, --From DimProductCategory
	dps.EnglishProductSubcategoryName AS Subcategory --From DimProductSubcategory
FROM dbo.DimProduct AS dp
LEFT JOIN dbo.DimProductSubcategory AS dps
	ON dps.ProductSubcategoryKey = dp.ProductSubcategoryKey
LEFT JOIN dbo.DimProductCategory AS dpc
	ON dpc.ProductCategoryKey = dps.ProductCategoryKey;
