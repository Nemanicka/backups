createStmt="IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='pets' AND xtype='U') BEGIN CREATE TABLE pets ( id INT PRIMARY KEY IDENTITY(1,1), kind NVARCHAR(255) NOT NULL, color NVARCHAR(255), gender NVARCHAR(10), size NVARCHAR(20), age INT, preferences NVARCHAR(MAX) ); END;"

sqlcmd -C -S "localhost,1433" -U "sa" -d "pets" -P "qweQWE123" -Q "$createStmt"

insertStmt="INSERT INTO pets (kind, color, gender, size, age, preferences) VALUES ('Dog', 'Brown', 'Male', 'Medium', 3, 'Likes to play fetch.'), ('Cat', 'Gray', 'Female', 'Small', 2, 'Enjoys napping in the sun.'), ('Fish', 'Gold', 'None', 'Small', 1, NULL), ('Bird', 'Multicolored', 'Male', 'Small', 4, 'Sings in the morning.');"

for i in $(seq 1 1000);
do
    sqlcmd -C -S "localhost,1433" -U "sa" -d "pets" -P "qweQWE123" -Q "$insertStmt"
done

