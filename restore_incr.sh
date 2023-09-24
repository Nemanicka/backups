buLog="BACKUP LOG pets TO DISK = '/var/opt/mssql/backups/pets.trn' WITH NORECOVERY;"

sqlcmd -C -S "localhost,1433" -U "sa" -P "qweQWE123" -Q "$buLog"

restoreStmt="USE master; RESTORE DATABASE pets FROM DISK = '/var/opt/mssql/backups/pets_full_1.bak' WITH NORECOVERY"

sqlcmd -C -S "localhost,1433" -U "sa" -P "qweQWE123" -Q "$restoreStmt"

xdelta3 -d -s backups/pets_incr_1.DIF backups/delta_file_diff_1_diff_2 backups/incremented.DIF

diffStmt="USE master; RESTORE DATABASE pets FROM DISK = '/var/opt/mssql/backups/incremented.DIF'"

sqlcmd -C -S "localhost,1433" -U "sa" -P "qweQWE123" -Q "$diffStmt"
