SELECT 
    fk.name AS FK_Name,
    OBJECT_NAME(fk.parent_object_id) AS FK_Table,
    c1.name AS FK_Column,
    OBJECT_NAME(fk.referenced_object_id) AS PK_Table,
    c2.name AS PK_Column
FROM 
    sys.foreign_keys fk
INNER JOIN 
    sys.foreign_key_columns fkc ON fk.object_id = fkc.constraint_object_id
INNER JOIN 
    sys.columns c1 ON fkc.parent_object_id = c1.object_id AND fkc.parent_column_id = c1.column_id
INNER JOIN 
    sys.columns c2 ON fkc.referenced_object_id = c2.object_id AND fkc.referenced_column_id = c2.column_id
WHERE 
    OBJECT_NAME(fk.parent_object_id) IN ('Employees', 'Projects', 'EmployeeProjects', 'Departments', 'Salaries')
ORDER BY 
    FK_Table;
