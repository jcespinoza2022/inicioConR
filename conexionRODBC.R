#Load RODBC
library(RODBC);

#Connection information
dsn_driver <- "{IBM DB2 ODBC Driver}"
dsn_database <- "bludb"            # e.g. "bludb"
dsn_hostname <- "6667d8e9-9d4d-4ccb-ba32-21da3bb5aafc.c1ogj3sd0tgtu0lqde00.databases.appdomain.cloud" # e.g "54a2f15b-5c0f-46df-8954-.databases.appdomain.cloud"
dsn_port <- "30376"   # e.g. "32733" 
dsn_protocol <- "TCPIP"            # i.e. "TCPIP"
dsn_uid <- "gqg40240"        # e.g. "zjh17769"
dsn_pwd <- "cywYWsqdQIpzuZIf"      # e.g. "zcwd4+8gbq9bm5k4"  
dsn_security <- "ssl"

#Create a database connection
conn_path <- paste("DRIVER=",dsn_driver,
                   ";DATABASE=",dsn_database,
                   ";HOSTNAME=",dsn_hostname,
                   ";PORT=",dsn_port,
                   ";PROTOCOL=",dsn_protocol,
                   ";UID=",dsn_uid,
                   ";PWD=",dsn_pwd,
                   ";SECURITY=",dsn_security,        
                   sep="")
conn <- odbcDriverConnect(conn_path)
conn

#Connection Attributes
attributes(conn)

#Connection Metadata
conn.info <- odbcGetInfo(conn)

conn.info["DBMS_Name"]
conn.info["DBMS_Ver"] 
conn.info["Driver_ODBC_Ver"]

#Supported Datatypes
sql.info <- sqlTypeInfo(conn)
print(sql.info[c(1,3)], row.names=FALSE)

#List of Tables
tab.frame <- sqlTables(conn, schema="SYSIBM") # e.g. "SYSIBM"
nrow(tab.frame)
tab.frame$TABLE_NAME

tab.name <- "SYSSCHEMATA" # e.g. "SYSSCHEMATA"
col.detail <- sqlColumns(conn, tab.name)
print(col.detail[c(2,3,4,6,7,9,18)], row.names=FALSE)

#Dis-connect
odbcCloseAll()


