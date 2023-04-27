IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Sales].[Customers]') AND type in (N'U'))
BEGIN
    CREATE TABLE [Sales].[Customers](
        [CustomerID] INT NOT NULL,
        [FirstName] VARCHAR(50) NOT NULL,
        [LastName] VARCHAR(50) NOT NULL
    )
END
