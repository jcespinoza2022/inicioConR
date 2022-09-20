# instalar el packages kernlab si no esta instalado
library(kernlab)
data(spam)
set.seed(3435)
trainIndicator<- rbinom(4601, size = 1, prob = 0.5)
table(trainIndicator)
trainSpam<- spam[trainIndicator == 1,]
testSpam<- spam[trainIndicator == 0,]
names(trainSpam)
head(trainSpam)
table(trainSpam$type)
library(ggplot2)
plot(trainSpam$capitalAve ~ trainSpam$type)
plot(log10(trainSpam$capitalAve+1)  ~ trainSpam$type)
plot(log10(trainSpam[,1:4]+1))
hCluster<- hclust(dist(t(trainSpam[, 1:57])))
plot(hCluster)
hClusterUpdated <- hclust(dist(t(log10(trainSpam[, 1:55]+1))))
plot(hClusterUpdated)
# Modelo Estadistico Basico
trainSpam$numType <- as.numeric(trainSpam$type)-1
costFunction <- function(x, y) sum(x !=(y > 0.5))
cError<- rep(NA, 55)
library(boot)
for(i in 1:55){
        lmFormula<- reformulate(names(trainSpam)[i], response = "numType")
        glmFit<- glm(lmFormula, family = "binomial", data = trainSpam)
        cError[i]<- cv.glm(trainSpam, glmFit, costFunction, 2)$delta[2]
}
names(trainSpam)[which.min(cError)]
#Use the best model from the group

predictionModel <-  glm(numType ~ charDollar, family = "binomial", data = trainSpam)

# Get predictions on the test set

predictionTest <- predict(predictionModel, testSpam)

predictedSpam <- rep("nonspam", dim(testSpam)[1])

#Classify as 'spam' for those  with prob > 0.5

predictedSpam[predictionModel$fitted > 0.5]= "spam"

#Classification table 
table(predictedSpam, testSpam$type)

(61+458)/(1346+458+61+449)


