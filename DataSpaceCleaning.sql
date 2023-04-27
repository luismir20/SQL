DECLARE @TableName NVARCHAR(128) = 'dbo.MyTable';
DECLARE @SchemaName NVARCHAR(128) = 'YourDatabaseName';
DECLARE @ColumnName NVARCHAR(128);
DECLARE @DataType NVARCHAR(50);
DECLARE @Sql NVARCHAR(MAX);

DECLARE column_cursor CURSOR FOR
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = @SchemaName
AND TABLE_NAME = @TableName
AND DATA_TYPE IN ('char', 'nchar', 'varchar', 'nvarchar', 'text', 'ntext');

OPEN column_cursor;

FETCH NEXT FROM column_cursor
INTO @ColumnName, @DataType;

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @Sql = 'UPDATE ' + @TableName + ' SET ' + QUOTENAME(@ColumnName) + ' = LTRIM(RTRIM(REPLACE(REPLACE(' + QUOTENAME(@ColumnName) + ', CHAR(9), '' ''), CHAR(32) + CHAR(32), CHAR(32))));';
    EXEC sp_executesql @Sql;

    FETCH NEXT FROM column_cursor
    INTO @ColumnName, @DataType;
END

CLOSE column_cursor;
DEALLOCATE column_cursor;
