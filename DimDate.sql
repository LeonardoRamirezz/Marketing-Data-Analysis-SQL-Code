-- Select Important Columns DimDate table
SELECT 
  [DateKey], 
  [FullDateAlternateKey] AS Date, 
  [WeekNumberOfYear] AS WeekNum,
  [EnglishDayNameOfWeek] AS Day,
  [EnglishMonthName] AS Month, 
  Left([EnglishMonthName], 3) AS MonthShort, -- Useful for visualization later
  [MonthNumberOfYear] AS MonthNo, 
  [CalendarQuarter] AS Quarter, 
  [CalendarYear] AS Year
FROM 
  dbo.DimDate
WHERE 
  CalendarYear >= 2023 AND CalendarYear <2025;--Analyze 2 years back to budget this year and filter incoherent columns
