--Table Lock Checks

SELECT *
FROM sys.dm_tran_locks
WHERE resource_database_id = DB_ID('your_database_name') 
AND resource_type = 'OBJECT'
AND resource_associated_entity_id = OBJECT_ID('your_table_name');

--

EXEC sp_who2;


--

EXEC sp_who2
    @filter = 'dbname = your_database_name AND (blocked != 0 OR loginame LIKE ''%your_table_name%'')';
