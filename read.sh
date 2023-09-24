readStmt="SELECT id FROM pets;"

sqlcmd -C -S "localhost,1433" -U "sa" -d "pets" -P "qweQWE123" -Q "$readStmt"

