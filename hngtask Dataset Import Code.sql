-- Enable show advanced options
EXEC sp_configure 'show advanced options', 1;
RECONFIGURE;

-- Enable Ad Hoc Distributed Queries
EXEC sp_configure 'Ad Hoc Distributed Queries', 1;
RECONFIGURE;
GO

-- Use the hngtaskfive Database
USE hngtask;
GO

-- Import customer sheet
INSERT INTO customer (Name, Address, Phone)
SELECT Name, Address, Phone
FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0',
                'Excel 12.0;Database=C:\Users\user222\Downloads\customer.xlsx;HDR=YES;',
                'SELECT * FROM [customer$]');

-- Import vehicle sheet
INSERT INTO vehicle (Make, Model, Year, Color, VIN, RegNumber, Mileage, OwnerName, CustomerID)
SELECT Make, Model, Year, Color, VIN, RegNumber, Mileage, OwnerName, CustomerID
FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0',
                'Excel 12.0;Database=C:\Users\user222\Downloads\vehicle.xlsx;HDR=YES;',
                'SELECT * FROM [vehicle$]');

-- Import invoice sheet
INSERT INTO invoice (InvoiceID, InvoiceDate, Subtotal, SalesTaxRate, SalesTax, TotalLabour, TotalParts, Total, CustomerID, VehicleID)
SELECT InvoiceID, InvoiceDate, Subtotal, SalesTaxRate, SalesTax, TotalLabour, TotalParts, Total, CustomerID, VehicleID
FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0',
                'Excel 12.0;Database=C:\Users\user222\Downloads\invoice.xlsx;HDR=YES;',
                'SELECT * FROM [invoice$]');

-- Import job sheet
INSERT INTO job (JobID, VehicleID, Description, Hours, Rate, Amount, InvoiceID)
SELECT JobID, VehicleID, Description, Hours, Rate, Amount, InvoiceID
FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0',
                'Excel 12.0;Database=C:\Users\user222\Downloads\job.xlsx;HDR=YES;',
                'SELECT * FROM [job$]');

-- Import parts sheet
INSERT INTO parts (PartID, JobID, PartNumber, PartName, Quantity, UnitPrice, Amount, InvoiceID)
SELECT PartID, JobID, PartNumber, PartName, Quantity, UnitPrice, Amount, InvoiceID
FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0',
                'Excel 12.0;Database=C:\Users\user222\Downloads\parts.xlsx;HDR=YES;',
                'SELECT * FROM [parts$]');