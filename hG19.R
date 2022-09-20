# instalar el paquete RMySQL
install.packages("RMySQL")
#instalamos la libreria de RMySQL
library(RMySQL)
#conectamos la base de datos asignamos el user y el host
hg19Db<- dbConnect(RMySQL::MySQL(),user = "genome",db="hg19", host = "genome-mysql.soe.ucsc.edu")
allTable<- dbListTables(hg19Db)
length(allTable)
allTable[1:5]
dbListFields(hg19Db,"affyU133Plus2")
dbGetQuery(hg19Db,"select count(*) from affyU133Plus2")
affyData<- dbReadTable(hg19Db, "affyU133Plus2")
head(affyData)
query<- dbSendQuery(hg19Db, "select * from affyU133Plus2 where misMatches between 1 and 3")
