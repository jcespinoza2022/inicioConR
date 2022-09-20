
set.seed(1234)

dataFrame <- data.frame(x = x, y = y)

dataMatrix <- as.matrix(dataFrame)[sample(1:12),]

kmeansObj<- kmeans(dataMatrix, centers = 3)

par(mfrow= c(1, 2), mar= c(2, 4, 0.1, 0.1))

image(t(dataMatrix)[, nrow(dataMatrix):1], yaxt= "n")

image(t(dataMatrix)[, order(kmeansObj$cluster)], yaxt= "n")