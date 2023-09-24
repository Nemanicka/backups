buLog="BACKUP LOG pets TO DISK = '/var/opt/mssql/backups/pets.trn' WITH NORECOVERY;"

sqlcmd -C -S "localhost,1433" -U "sa" -P "qweQWE123" -Q "$buLog"

restoreStmt="USE master; RESTORE DATABASE pets FROM DISK = '/var/opt/mssql/backups/pets_full_1.bak' WITH NORECOVERY"

sqlcmd -C -S "localhost,1433" -U "sa" -P "qweQWE123" -Q "$restoreStmt"

diffStmt="USE master; RESTORE DATABASE pets FROM DISK = '/var/opt/mssql/backups/pets_incr_1.DIF'"

sqlcmd -C -S "localhost,1433" -U "sa" -P "qweQWE123" -Q "$diffStmt"
