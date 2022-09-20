#Load RSQLIte
install.packages("RSQLite")
library("RSQLite")

#Create a database connection
con <- dbConnect(RSQLite::SQLite(),"TestDB.sqlite")
con

#Connection Attributes
attributes(con)

#Connection Metadata
con.info <- dbGetInfo(con) 
print(con.info["db.version"])
print(con.info["dbname"] )

#Supported Datatypes
dbDataType(RSQLite::SQLite(), 1)
dbDataType(RSQLite::SQLite(), 1L)
dbDataType(RSQLite::SQLite(), "1")
dbDataType(RSQLite::SQLite(), TRUE)
dbDataType(RSQLite::SQLite(), list(raw(1)))

sapply(datasets::quakes, dbDataType, dbObj = RSQLite::SQLite())

#</details>

#List of Tables
dbListTables(con)
dbWriteTable(con, "mtcars", mtcars)
dbListTables(con)

#Columns in a Table
tables1 = dbListTables(con)
for (table in tables1){  
        cat ("\nColumn info for table", table, ":\n")
        col.detail <- dbColumnInfo(dbSendQuery(con,paste( "select * from",table)))
        print(col.detail)
}
#Dis-connect
dbDisconnect(con)


        
        
