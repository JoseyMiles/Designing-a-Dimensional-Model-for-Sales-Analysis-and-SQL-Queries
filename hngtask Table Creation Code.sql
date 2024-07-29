--Use hngtask database
USE hngtask;
GO

-- Create customer table
CREATE TABLE customer (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(255),
    Address NVARCHAR(255),
    Phone NVARCHAR(50)
);
GO

-- Create vehicle table
CREATE TABLE vehicle (
    VehicleID INT IDENTITY(1,1) PRIMARY KEY,
    Make NVARCHAR(50),
    Model NVARCHAR(50),
    Year INT,
    Color NVARCHAR(50),
    VIN NVARCHAR(50),
    RegNumber NVARCHAR(50),
    Mileage INT,
	OwnerName NVARCHAR(255),
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES customer(CustomerID)
);
GO

-- Create invoice table
CREATE TABLE invoice (
    InvoiceID INT PRIMARY KEY,
    InvoiceDate DATE,
    Subtotal FLOAT,
    SalesTaxRate FLOAT,
    SalesTax FLOAT,
    TotalLabour FLOAT,
    TotalParts FLOAT,
    Total FLOAT,
    CustomerID INT,
    VehicleID INT,
    FOREIGN KEY (CustomerID) REFERENCES customer(CustomerID),
    FOREIGN KEY (VehicleID) REFERENCES vehicle(VehicleID)
);
GO

-- Create job table
CREATE TABLE job (
    JobID INT PRIMARY KEY,
    VehicleID INT,
    Description NVARCHAR(255),
    Hours FLOAT,
    Rate FLOAT,
    Amount FLOAT,
    InvoiceID INT,
    FOREIGN KEY (VehicleID) REFERENCES vehicle(VehicleID),
    FOREIGN KEY (InvoiceID) REFERENCES invoice(InvoiceID)
);
GO

-- Create parts table
CREATE TABLE parts (
    PartID INT PRIMARY KEY,
    JobID INT,
    PartNumber NVARCHAR(50),
    PartName NVARCHAR(255),
    Quantity INT,
    UnitPrice FLOAT,
    Amount FLOAT,
    InvoiceID INT,
    FOREIGN KEY (JobID) REFERENCES job(JobID),
    FOREIGN KEY (InvoiceID) REFERENCES invoice(InvoiceID)
);
GO
