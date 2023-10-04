-- Column descriptions
SELECT 
    OBJECT_NAME(ep.major_id) AS ObjectName
    , c.name AS ColumnName
    , ep.name AS PropertyName
    , ep.value AS PropertyValue
FROM 
    sys.extended_properties AS ep
INNER JOIN 
    sys.columns AS c
    ON ep.major_id = c.object_id AND ep.minor_id = c.column_id
WHERE 
    ep.name = 'Description'
ORDER BY ObjectName
