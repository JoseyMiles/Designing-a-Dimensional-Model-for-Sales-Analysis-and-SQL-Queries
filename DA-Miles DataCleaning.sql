USE [DA-Miles];
GO

-- Update Subtotal for InvoiceID 12345
UPDATE Invoice
SET Subtotal = 1594.87
WHERE InvoiceID = 12345;


-- Update values for InvoiceID 12346
UPDATE Invoice
SET Subtotal = 525.00,
    SalesTax = 68.25,
    TotalLabour = 325.00,
    TotalParts = 200.00,
    Total = 593.25
WHERE InvoiceID = 12346;


-- Update values for InvoiceID 12347
UPDATE Invoice
SET Subtotal = 350.00,
    SalesTax = 45.50,
    TotalLabour = 200.00,
    TotalParts = 150.00,
    Total = 395.50
WHERE InvoiceID = 12347;


-- Update values for InvoiceID 12348
UPDATE Invoice
SET Subtotal = 450.00,
    SalesTax = 58.50,
    TotalLabour = 325.00,
    TotalParts = 125.00,
    Total = 508.50
WHERE InvoiceID = 12348;


-- Update values for InvoiceID 12349
UPDATE Invoice
SET Subtotal = 580.00,
    SalesTax = 75.40,
    TotalLabour = 440.00,
    TotalParts = 140.00,
    Total = 655.40
WHERE InvoiceID = 12349;