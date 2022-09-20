library(RJDBC);

#Enter the values for you database connection
dsn_driver <- "com.ibm.db2.jcc.DB2Driver"
dsn_database <- "bludb"            # e.g. "bludb"
dsn_hostname = "6667d8e9-9d4d-4ccb-ba32-21da3bb5aafc.c1ogj3sd0tgtu0lqde00.databases.appdomain.cloud"   # e.g. replace <yourhostname> with your hostname
dsn_port <-  "30376"                # e.g. "3273" 
dsn_protocol <- "TCPIP"            # i.e. "TCPIP"
dsn_uid <- "gqg40240"              # e.g. replace <username> with your userid
dsn_pwd <- "cywYWsqdQIpzuZIf"            # e.g. replace <password> with your password

jcc <- JDBC("com.ibm.db2.jcc.DB2Driver", "/home/jupyterlab/.rlang/db2jcc-db2jcc4.jar");
jdbc_path <- paste("jdbc:db2://",  dsn_hostname, ":", dsn_port, "/", dsn_database, sep="");

conn = dbConnect(jcc, jdbc_path, user=dsn_uid, password=dsn_pwd,sslConnection='true')

query = "SELECT * FROM SYSIBM.SYSSCHEMATA";
rs = dbSendQuery(conn, query);
df = fetch(rs, -1);

head(df)

dbDisconnect(conn)

