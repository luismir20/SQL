DECLARE @SchemaName NVARCHAR(128) = 'YourSchemaName';
DECLARE @TableName NVARCHAR(128) = 'YourTableName';

CREATE TABLE #NullCounts (
    ColumnName NVARCHAR(128),
    NullCount INT
);

DECLARE @ColumnName NVARCHAR(128);
DECLARE @SqlCmd NVARCHAR(MAX);

DECLARE ColumnCursor CURSOR FOR
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = @SchemaName AND TABLE_NAME = @TableName;

OPEN ColumnCursor;

FETCH NEXT FROM ColumnCursor INTO @ColumnName;

WHILE @@FETCH_STATUS = 0
BEGIN
    
    SET @SqlCmd = 'INSERT INTO #NullCounts (ColumnName, NullCount)
                   SELECT ''' + @ColumnName + ''' AS ColumnName, COUNT(*) AS NullCount
                   FROM ' + QUOTENAME(@SchemaName) + '.' + QUOTENAME(@TableName) + '
                   WHERE ' + QUOTENAME(@ColumnName) + ' IS NULL;';

    EXEC sp_executesql @SqlCmd;

    FETCH NEXT FROM ColumnCursor INTO @ColumnName;
END

CLOSE ColumnCursor;
DEALLOCATE ColumnCursor;

SELECT ColumnName, NullCount
FROM #NullCounts
ORDER BY ColumnName;

DROP TABLE #NullCounts;
