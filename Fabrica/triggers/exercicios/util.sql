-- Consulta que exibe todos os triggers
SELECT t.name AS TriggerName
FROM sys.triggers t
INNER JOIN sys.tables tab ON t.parent_id = tab.object_id;



-- Exclue todos os triggers no banco de dados
DECLARE @TriggerName NVARCHAR(128);
DECLARE @SQL NVARCHAR(MAX);

DECLARE TriggerCursor CURSOR FOR
SELECT t.name AS TriggerName
FROM sys.triggers t
INNER JOIN sys.tables tab ON t.parent_id = tab.object_id;

OPEN TriggerCursor;
FETCH NEXT FROM TriggerCursor INTO @TriggerName;

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @SQL = 'DROP TRIGGER ' + QUOTENAME(@TriggerName);
    EXEC sp_executesql @SQL;

    FETCH NEXT FROM TriggerCursor INTO @TriggerName;
END;

CLOSE TriggerCursor;
DEALLOCATE TriggerCursor;