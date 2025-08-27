WITH FKPaths AS (
    SELECT 
        OBJECT_NAME(fkc.parent_object_id) AS FromTable,
        OBJECT_NAME(fkc.referenced_object_id) AS ToTable,
        CAST(OBJECT_NAME(fkc.parent_object_id) AS VARCHAR(MAX)) AS Path,
        1 AS Depth
    FROM sys.foreign_key_columns fkc

    UNION ALL

    SELECT 
        fkp.FromTable,
        fk.ToTable,
        CAST(fkp.Path + ' -> ' + fk.ToTable AS VARCHAR(MAX)),
        fkp.Depth + 1
    FROM FKPaths fkp
    JOIN (
        SELECT 
            OBJECT_NAME(fkc.parent_object_id) AS FromTable,
            OBJECT_NAME(fkc.referenced_object_id) AS ToTable
        FROM sys.foreign_key_columns fkc
    ) fk ON fkp.ToTable = fk.FromTable
    WHERE fkp.Path NOT LIKE '%' + fk.ToTable + '%'
)
SELECT * FROM FKPaths
WHERE ToTable = FromTable -- Cycle if destination equals source
