buStmt="BACKUP DATABASE pets TO DISK = '/var/opt/mssql/backups/pets_incr_2.DIF' WITH DIFFERENTIAL;"

sqlcmd -C -S "localhost,1433" -U "sa" -P "qweQWE123" -Q "$buStmt"
