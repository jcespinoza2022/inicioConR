#This first line will likely take a few seconds. Be patient!

NEI <- readRDS("D:\\Data\\pm25\\exdata_data_NEI_data\\summarySCC_PM25.rds")

SCC <- readRDS("D:\\Data\\pm25\\exdata_data_NEI_data\\Source_Classification_Code.rds")

dim(NEI)

dim(SCC)

head(NEI)

head(SCC)

names(NEI)

x0 <- NEI$Emissions

class(x0)

##¿Han disminuido las emisiones totales de PM2.5 en los Estados Unidos de 1999 a 2008? 
Utilizando el  sistema de representación gráfica base  , haga una representación gráfica 
que muestre la  emisión total de  PM2.5 de todas las fuentes para cada uno de los años 
1999, 2002, 2005 y 2008.
#
X_1999 <- unique(subset(NEI, year == 1999, c(Emissions, year)))

head(X_1999)

X_2002 <- unique(subset(NEI, year == 2002, c(Emissions, year)))

head(X_2002)

X_2005 <- unique(subset(NEI, year == 2005, c(Emissions, year)))

head(X_2005)

X_2008 <- unique(subset(NEI, year == 2008, c(Emissions, year)))

head(X_2008)

boxplot(X_1999$Emissions, X_2002$Emissions, X_2005$Emissions, X_2008$Emissions)

boxplot(log10(X_1999$Emissions), log10(X_2002$Emissions), log10(X_2005$Emissions), log10(X_2008$Emissions))

png(filename,"trama1.png")

boxplot(log10(X_1999$Emissions), log10(X_2002$Emissions), log10(X_2005$Emissions), log10(X_2008$Emissions))

dev.off()


