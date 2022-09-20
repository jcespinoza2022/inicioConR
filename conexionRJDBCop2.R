library(RJDBC);

library(curl)

curl_download("https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/datasets/Instructors.db","Instructors.db")

curl_download("https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-RP0103EN-SkillsNetwork/jars/sqlite-jdbc-3.27.2.1.jar","sqlite-jdbc-3.27.2.1.jar")

#Enter the values for you database connection
dsn_driver = "org.sqlite.JDBC"

jcc = JDBC(dsn_driver, "sqlite-jdbc-3.27.2.1.jar");
jdbc_path = paste("jdbc:sqlite:Instructors.db");

conn = dbConnect(jcc, jdbc_path)

query = "SELECT name FROM  sqlite_master"
rs = dbSendQuery(conn, query);
df = fetch(rs, -1);

query = "SELECT * FROM Instructor;"
rs = dbSendQuery(conn, query);
df = fetch(rs, -1);

head(df)

dbDisconnect(conn)

