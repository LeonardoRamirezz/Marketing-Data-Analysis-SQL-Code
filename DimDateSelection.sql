-- Select Important Columns DimDate table
SELECT 
  [DateKey], 
  [FullDateAlternateKey] AS Date, 
   --[DayNumberOfWeek], 
  [EnglishDayNameOfWeek] AS Day, 
  [WeekNumberOfYear] AS WeekNum,
  --[SpanishDayNameOfWeek], 
  --[FrenchDayNameOfWeek], 
  --[DayNumberOfMonth], 
  --[DayNumberOfYear], 
  [EnglishMonthName] AS Month, 
  Left([EnglishMonthName], 3) AS MonthShort, -- Useful for visualization later
  --[SpanishMonthName], 
  --[FrenchMonthName], 
  [MonthNumberOfYear] AS MonthNo, 
  [CalendarQuarter] AS Quarter, 
  [CalendarYear] AS Year
  --[CalendarSemester], 
  --[FiscalQuarter], 
  --[FiscalYear], 
  --[FiscalSemester] 
FROM 
	dbo.DimDate
WHERE 
	CalendarYear >= 2023 --Analyze 2 years back to budget this year