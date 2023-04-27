MERGE INTO TargetTable AS tgt
USING SourceTable AS src
    ON (tgt.ID = src.ID)
WHEN MATCHED THEN
    UPDATE SET
        tgt.FirstName = src.FirstName,
        tgt.LastName = src.LastName,
        tgt.Age = src.Age
WHEN NOT MATCHED BY TARGET THEN
    INSERT (ID, FirstName, LastName, Age)
    VALUES (src.ID, src.FirstName, src.LastName, src.Age)
OUTPUT $action, inserted.*, deleted.*;