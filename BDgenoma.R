# instalar el paquete RMySQL
install.packages("RMySQL")
#instalamos la libreria de RMySQL
library(RMySQL)
#conectamos la base de datos asignamos el user y el host
ucscDb<- dbConnect(RMySQL::MySQL(),user = "genome", host = "genome-mysql.soe.ucsc.edu" )
# Asignamos  la base de datos usando show databases que no es comando de r 
# es comando de mysql
result<- dbGetQuery(ucscDb, "show databases;")
#desconectamos la base de datos 
dbDisconnect(ucscDb)
