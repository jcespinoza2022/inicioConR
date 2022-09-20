library("data.table")

setwd("D://Data//data//ExData_Plotting1")

#Lee los datos del archivo y luego los subconjunta para las fechas especificadas
podt <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)

#Evita que el histograma se imprima en notación científica
podt[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Hacer que una fecha POSIXct pueda ser filtrada y graficada por la hora del día
podt[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

#Fechas de filtrado para 2007-02-01 y 2007-02-02
podt <- podt[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

#Abrimos para imprimir el trama 2
png("trama2.png", width=480, height=480)

## trama 2
plot(x = podt[, dateTime]
     , y = podt[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
