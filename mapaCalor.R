#Funcion de mapa de calor

set.seed(143)

dataFrame <- data.frame(x = x, y = y)

dataMatrix <- as.matrix(dataFrame)[sample(1:12),]

heatmap(dataMatrix)