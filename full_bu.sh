buStmt="BACKUP DATABASE pets TO DISK = '/var/opt/mssql/backups/pets_full_3_reverse_delta.bak';"

sqlcmd -C -S "localhost,1433" -U "sa" -P "qweQWE123" -Q "$buStmt"
