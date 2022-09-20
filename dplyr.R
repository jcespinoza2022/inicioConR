#cargamos la libreria para trabajar en un marco de datos 
library(dplyr)
options(width = 105)
#usamos informacion de una base metereologica 
chicago <- readRDS("chicago.rds")
#vemos las dimemciones 
dim(chicago)
#Las variables del data.frame
str(chicago)
#los nombres de las variables 
names(chicago)
#en el marco se puede utilizar los nombres y no los 
#indices para las consultas 
head(select(chicago, city:dptp))
#consulta sin las columnas 
head(select(chicago, -(city:dptp)))
#funcion filtro 
chic.f<- filter(chicago, pm25tmean2 > 30)
#mostramos las 10 primeras columnas 
head(chic.f, 10)
# funcion arreglo 
chic.f<- arrange(chicago, date)
head(chic.f)
#funcion renombrar
chic.f<- rename(chicago, pm25= pm25tmean2, rocio= dptp)
head(chic.f)
#funcion mutar crea o transforma una variable 
chic.f<- mutate(chic.f, p99 = pm25-mean(pm2.5, na.rm=TRUE))
#una variable nueva al data.frame y usamos un factor pa indicar 
#si esta caliente o frio
chicago<- mutate(chicago, tempcat = factor(1*(tmpd>80),labels = c( "cold", "hot")))
hotcold<- group_by(chicago, tempcat)
summarize(hotcold, pm25tmean2= mean(pm25tmean2), o3=max(o3tmean2), no2=median(no2tmean2))
summarize(hotcold, pm25tmean2= mean(pm25tmean2, na.rm = TRUE), o3=max(o3tmean2), no2=median(no2tmean2))
chicago<- mutate(chicago, year = as.POSIXlt(date)$year+1900)
summarize(year, pm25tmean2= mean(pm25tmean2, na.rm = TRUE), o3=max(o3tmean2), no2=median(no2tmean2))
chicago %>% mutate(month = as.POSIXlt(date)$mon+1) %>% group_by(month) %>% summarize(year, pm25tmean2= mean(pm25tmean2, na.rm = TRUE), o3=max(o3tmean2), no2=median(no2tmean2))
