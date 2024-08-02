-- Use the Ayodele Database
USE Ayodele;
GO

-- Create Customer Dimension Table
CREATE TABLE Dim_Customer (
    customer_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(255),
    address VARCHAR(255),
    phone VARCHAR(20)
);
GO

-- Create Vehicle Dimension Table
CREATE TABLE Dim_Vehicle (
    vehicle_id INT IDENTITY(1,1) PRIMARY KEY,
    make VARCHAR(50),
    model VARCHAR(50),
    color VARCHAR(50),
    year INT,
    vin VARCHAR(50),
    reg_number VARCHAR(50),
    mileage INT,
    customer_id INT
);
GO

-- Create Service Dimension Table
CREATE TABLE Dim_Service (
    service_id INT IDENTITY(1,1) PRIMARY KEY,
    service_description VARCHAR(255),
    hours DECIMAL(5,2),
    rate DECIMAL(10,2),
    amount DECIMAL(10,2),
    vehicle_id INT
);
GO

-- Create Part Dimension Table
CREATE TABLE Dim_Part (
    part_id INT IDENTITY(1,1) PRIMARY KEY,
    part_number VARCHAR(50),
    part_name VARCHAR(255),
    qty INT,
    unit_price DECIMAL(10,2),
    amount DECIMAL(10,2)
);
GO

-- Create Location Dimension Table
CREATE TABLE Dim_Location (
    location_id INT IDENTITY(1,1) PRIMARY KEY,
    shop_name VARCHAR(255),
    address VARCHAR(255)
);
GO

--Create Subtotal Dimension Table
CREATE TABLE Dim_Subtotals (
	subtotal_id INT IDENTITY(1,1) PRIMARY KEY,
	customer_id INT,
	Part_subtotal DECIMAL(10,2),
	Service_subtotal DECIMAL(10,2)
);
GO

--Create Date Dimension Table
CREATE TABLE Dim_Date (
	date_id INT IDENTITY(1,1) PRIMARY KEY,
	date_issued DATE,
	due_date DATE
);
GO

-- Create Fact Table for Invoice
CREATE TABLE Fact_Invoice (
    invoice_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT,
    vehicle_id INT,
    service_id INT,
    part_id INT,
    location_id INT,
	subtotal_id INT,
	date_id INT,
    total_service_charge DECIMAL(10,2),
    total_part_charge DECIMAL(10,2),
    sub_total DECIMAL(10,2),
    tax_rate DECIMAL(10,2),
    payable_tax DECIMAL(10,2),
    total_revenue DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Dim_Customer(customer_id),
    FOREIGN KEY (vehicle_id) REFERENCES Dim_Vehicle(vehicle_id),
    FOREIGN KEY (service_id) REFERENCES Dim_Service(service_id),
    FOREIGN KEY (part_id) REFERENCES Dim_Part(part_id),
    FOREIGN KEY (location_id) REFERENCES Dim_Location(location_id),
	FOREIGN KEY (subtotal_id) REFERENCES Dim_Subtotals(subtotal_id),
	FOREIGN KEY (date_id) REFERENCES Dim_Date(date_id)
);
GO
