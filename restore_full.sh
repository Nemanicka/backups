restoreStmt="USE master; RESTORE DATABASE pets FROM DISK = '/var/opt/mssql/backups/pets_full_1.bak' WITH REPLACE"

# WITH MOVE 'YourDataLogicalName' TO 'C:\Data\YourDatabaseName.mdf', MOVE 'YourLogLogicalName' TO 'C:\Log\YourDatabaseName.ldf', REPLACE; -- Use REPLACE if you want to overwrite an existing database with the same name"

sqlcmd -C -S "localhost,1433" -U "sa" -P "qweQWE123" -Q "$restoreStmt"
