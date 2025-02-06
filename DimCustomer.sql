--Gather customer data and join with DimGeography
SELECT 
	dc.CustomerKey,
	dc.GeographyKey,
	dg.City AS CustomerCity, --From DimGeography
	dg.EnglishCountryRegionName AS CustomerCountry, --From DimGeography
	dc.firstname + ' ' + dc.LastName AS FullName,
	dc.BirthDate,
	CASE dc.MaritalStatus
		WHEN 'M' THEN 'Married'
		WHEN 'S' THEN 'Single'
		END AS MaritalStatus, --This will make values easier to read in the report
	COALESCE (dc.EmailAddress,dc.Phone) AS Contact,--This will get Phone number if email is not avariable
	CASE dc.Gender 
		WHEN 'M' THEN 'Male'
		WHEN 'F' THEN 'Female'
		END AS Gender,--This will make values easier to read in the report
	YearlyIncome,
	TotalChildren,
	EnglishEducation
FROM dbo.DimCustomer AS dc
LEFT JOIN dbo.DimGeography AS dg
	ON dg.GeographyKey = dc.GeographyKey; --To get customer city and country
