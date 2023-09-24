buLog="BACKUP LOG pets TO DISK = '/var/opt/mssql/backups/pets.trn' WITH NORECOVERY;"

sqlcmd -C -S "localhost,1433" -U "sa" -P "qweQWE123" -Q "$buLog"

xdelta3 -d -s backups/pets_full_2_reverse_delta.bak backups/delta_file_full_1_full_2 backups/reverse_delted.bak

restoreStmt="USE master; RESTORE DATABASE pets FROM DISK = '/var/opt/mssql/backups/reverse_delted.bak' WITH NORECOVERY"

sqlcmd -C -S "localhost,1433" -U "sa" -P "qweQWE123" -Q "$restoreStmt"


