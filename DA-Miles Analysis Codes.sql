USE [DA-Miles];
GO

-- 1. Customer Analysis


-- Top 5 customers by spending
SELECT TOP 5 c.Name, SUM(i.Total) AS TotalSpent
FROM Customer c
JOIN Invoice i ON c.CustomerID = i.CustomerID
GROUP BY c.Name
ORDER BY TotalSpent DESC;

-- Average customer spending
SELECT AVG(i.Total) AS AverageSpending
FROM Invoice i;

-- Frequency of customer visits
SELECT c.Name, COUNT(i.InvoiceID) AS VisitCount
FROM Customer c
JOIN Invoice i ON c.CustomerID = i.CustomerID
GROUP BY c.Name
ORDER BY VisitCount DESC;


-- 2.Vehicle Analysis

-- Average mileage of vehicles serviced
SELECT AVG(v.Mileage) AS AverageMileage
FROM Vehicle v;

-- Most common vehicle makes and models
SELECT v.Make, v.Model, COUNT(v.VehicleID) AS Frequency
FROM Vehicle v
GROUP BY v.Make, v.Model
ORDER BY Frequency DESC;

-- Distribution of vehicle ages
SELECT (2024 - v.Year) AS VehicleAge, COUNT(v.VehicleID) AS Frequency
FROM Vehicle v
GROUP BY (2024 - v.Year)
ORDER BY (2024 - v.Year);


-- 3. Job Performance Analysis

-- Most common job types
SELECT j.Description, COUNT(j.JobID) AS Frequency
FROM Job j
GROUP BY j.Description
ORDER BY Frequency DESC;

-- Total revenue from each job type
SELECT j.Description, SUM(j.Amount) AS TotalRevenue
FROM Job j
GROUP BY j.Description
ORDER BY TotalRevenue DESC;

-- Jobs with highest and lowest average costs

-- CTE to calculate average costs for each job description
WITH JobAverageCosts AS (
    SELECT j.Description, AVG(j.Amount) AS AverageCost
    FROM job j
    GROUP BY j.Description
)

-- Select the highest average cost
SELECT Description, AverageCost
FROM (
    SELECT TOP 1 Description, AverageCost
    FROM JobAverageCosts
    ORDER BY AverageCost DESC
) AS Highest

UNION ALL

-- Select the lowest average cost
SELECT Description, AverageCost
FROM (
    SELECT TOP 1 Description, AverageCost
    FROM JobAverageCosts
    ORDER BY AverageCost ASC
) AS Lowest;


-- 4. Parts Usage Analysis

-- Top 5 most frequently used parts
SELECT TOP 5 p.PartName, SUM(p.Quantity) AS TotalUsage
FROM Parts p
GROUP BY p.PartName
ORDER BY TotalUsage DESC;

-- Average cost of parts used in repairs
SELECT AVG(p.UnitPrice) AS AveragePartCost
FROM Parts p;

-- Total revenue from parts sales
SELECT SUM(p.Amount) AS TotalPartsRevenue
FROM Parts p;


-- 5. Financial Analysis

-- Total revenue from labor and parts each month
SELECT FORMAT(i.InvoiceDate, 'yyyy-MM') AS Month, 
       SUM(i.TotalLabour) AS TotalLabourRevenue,
       SUM(i.TotalParts) AS TotalPartsRevenue,
       SUM(i.Total) AS TotalRevenue
FROM Invoice i
GROUP BY FORMAT(i.InvoiceDate, 'yyyy-MM')
ORDER BY Month;

-- Overall profitability

-- Calculating the Profit
DECLARE @AverageBaseSalary DECIMAL(10,2) = 28.54;

-- Sum up the total revenue
SELECT SUM(Subtotal) AS TotalRevenue FROM invoice;

-- Sum up the cost of goods sold (COGS) from parts
SELECT SUM(Amount) AS COGS FROM parts;

-- Sum up the labor costs
SELECT SUM(Hours * @AverageBaseSalary) AS TotalLaborCost FROM job;

-- Calculate the Profit
SELECT 
    (SELECT SUM(Subtotal) FROM invoice) - 
    ((SELECT SUM(Amount) FROM parts) + (SELECT SUM(Hours * @AverageBaseSalary) FROM job)) 
    AS Profit;

-- Impact of sales tax on total revenue
SELECT SUM(i.SalesTax) AS TotalSalesTax, 
       SUM(i.Total) AS TotalRevenue, 
       SUM(i.SalesTax) / SUM(i.Total) * 100 AS SalesTaxImpactPercentage
FROM Invoice i;

