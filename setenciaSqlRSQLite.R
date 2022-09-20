#Hands-on Lab: Creating and Querying Database Objects from R

#Load RSQLite

##install.packages("RSQLite")
library("RSQLite")

#Create a database connection

conn <- dbConnect(RSQLite::SQLite(),"Querying_DatabaseDB.sqlite")

#Let's create the BOARD table in the database.

df1 <- dbExecute(conn, "CREATE TABLE BOARD (
                            B_ID CHAR(6) NOT NULL, 
                            B_NAME VARCHAR(75) NOT NULL, 
                            TYPE VARCHAR(50) NOT NULL, 
                            LANGUAGE VARCHAR(50), 
                            PRIMARY KEY (B_ID))", 
                 errors=FALSE)

#Now let's create the SCHOOL table with column details as:}

df2 <- dbExecute(conn, "CREATE TABLE SCHOOL (
                  B_ID CHAR(6) NOT NULL, 
                  S_ID CHAR(6) NOT NULL, 
                  S_NAME VARCHAR(100), 
                  LEVEL VARCHAR(70), 
                  ENROLLMENT INTEGER WITH DEFAULT 10,
                  PRIMARY KEY (B_ID, S_ID))", errors=FALSE) 

#Load the data into the database

schooldf <- read.csv('https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-RP0103EN-SkillsNetwork/data/school.csv')
boarddf <- read.csv('https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-RP0103EN-SkillsNetwork/data/board.csv')


head(schooldf)
head(boarddf)

dbWriteTable(conn, "SCHOOL", schooldf, overwrite=TRUE, header = TRUE)

dbWriteTable(conn, "BOARD", boarddf, overwrite=TRUE, header = TRUE)

#Check list of tables in the present database

dbListTables(conn)

#Print details for the tables BOARD and SCHOOL

tables1 = dbListTables(conn)
for (table in tables1){  
        cat ("\nColumn info for table", table, ":\n")
        col.detail <- dbColumnInfo(dbSendQuery(conn,paste( "select * from",table)))
        print(col.detail)
}

dbGetQuery(conn, 'SELECT * FROM BOARD limit 5')

dbGetQuery(conn, 'SELECT * FROM  SCHOOL limit 5')

#Fetch data from the database

boarddb <- dbGetQuery(conn, 'SELECT * FROM BOARD limit 5')
tail(boarddb)

schooldb <- dbGetQuery(conn, 'SELECT * FROM  SCHOOL limit 5')
tail(schooldb)

#Plot the data (using ggplot2)

library(ggplot2);

#Get the elementary school data from the database from both tables in descending sequence

elequery <- paste("select ENROLLMENT 
from SCHOOL s, BOARD b 
where b.B_NAME = 'Toronto DSB' and b.B_ID=s.B_ID 
and s.LEVEL = 'Elementary' 
order by ENROLLMENT desc")

#Create the elementary school dataframe.

eledf <- dbGetQuery(conn, elequery)
dim(eledf)

#Create a density plot of elementary school enrollments.

qplot(ENROLLMENT, data=eledf, geom="density",  main="TDSB School Size - Elementary")

#Create the secondary school enrollments query in descending sequence.

secquery <- paste("select s.ENROLLMENT 
from SCHOOL s, BOARD b 
where b.B_NAME = 'Toronto DSB' and b.B_ID=s.B_ID
and s.LEVEL = 'Secondary' 
order by ENROLLMENT desc")

#Create the dataframe using the data in the database.

secdf <- dbGetQuery(conn, secquery)

#Create a density plot of secondary school enrollments.

qplot(ENROLLMENT, data=secdf, geom="density", main="TDSB School Size - Secondary")

#Query the BOARD database for enrollments.

denquery <- paste("select b.B_NAME, s.S_NAME, LEVEL , ENROLLMENT 
 from BOARD b, SCHOOL s where b.B_ID = s.B_ID and b.B_NAME = 'Toronto DSB'")

#Query the database.

dendf <- dbGetQuery(conn, denquery)

#Create a box plot of enrollements in elementary and secondary schools in Toronto.

dendf$LEVEL <- as.factor(dendf$LEVEL)
boxplot(ENROLLMENT ~ LEVEL, dendf, names =c("Secondary","Elementary"), main="Toronto DSB")


