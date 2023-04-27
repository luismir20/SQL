IF OBJECT_ID(N'[schema].[table_name]', N'U') IS NOT NULL
BEGIN
    TRUNCATE TABLE [schema].[table_name]
END
