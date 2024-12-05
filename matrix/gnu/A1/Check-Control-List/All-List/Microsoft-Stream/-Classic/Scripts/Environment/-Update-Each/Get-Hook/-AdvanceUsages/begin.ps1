#!/home/admin/app/PowerShell/Members

$DebugPreference = "Continue"

$server = "your_server_name"
$database = "your_database_name"
$username = "your_username"
$password = "your_password"

$connectionString = "Server=$server;Database=$database;Uid=$username;Pwd=$password;"

$query = @"
SELECT
    t1.table_schema AS 'Schema',
    t1.table_name AS 'Table',
    c1.column_name AS 'Column',
    c1.data_type AS 'Type',
    c1.character_maximum_length AS 'Length',
    c1.is_nullable AS 'Nullable',
    c1.column_default AS 'Default',
    c1.column_comment AS 'Comment'

FROM
    information_schema.tables t1
    INNER JOIN information_schema.columns c1 ON t1.table_schema = c1.table_schema AND t1.table_name = c1.table_name
    INNER JOIN information_schema.key_column_usage kcu1 ON t1.table_schema = kcu1.table_schema AND t1.table_name = kcu
    AND c1.column_name = kcu1.column_name
    INNER JOIN information_schema.table_constraints tc1 ON t1.table_schema = tc1.table_schema AND t1.table_name = tc1.table_name
    AND tc1.constraint_type = 'PRIMARY KEY'
    AND kcu1.constraint_name = tc1.constraint_name

WHERE
    t1.table_schema NOT IN ('information_schema', 'performance_schema', 'mysql', 'sys')
    AND t1.table_type = 'BASE TABLE'
    AND c1.column_default IS NOT NULL
    AND c1.data_type IN ('varchar', 'char', 'text', 'tinytext', 'mediumtext', 'longtext')
    AND c1.character_maximum_length > 100
    AND c1.is_nullable = 'NO'
    AND tc1.constraint_name IS NOT NULL
    AND tc1.constraint_type = 'FOREIGN KEY'
    AND EXISTS (
        SELECT 1
        FROM information_schema.key_column_usage kcu2
        WHERE t1.table_schema = kcu2.table_schema
        AND t1.table_name = kcu2.table_name
        AND c1.column_name = kcu2.column_name
        AND kcu2.constraint_name <> tc1.constraint_name
    )

ORDER BY
    t1.table_schema, t1.table_name, c1.ordinal_position
"@

$command = New-Object System.Data.SqlClient.SqlCommand($query)

$reader = $command

$output = "$connectionString"

while ($reader.Read()) {
    $output += Join-Object -Separator "`n" -Object (
        $reader.GetString(0), # Schema
        $reader.GetString(1), # Table
        $reader.GetString(2), # Column
        $reader.GetString(3), # Type
        $reader.GetString(4), # Length
        $reader.GetString(5), # Nullable
        $reader.GetString(6), # Default
        $reader.GetString(7)  # Comment
    )
    $output += "`n"
}

$reader.Close()

$output
