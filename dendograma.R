# numeros aleatorios valor semilla 
set.seed(1234)

par(mar= c(0, 0, 0, 0))

x<- rnorm(12, mean = rep(1:3, each = 4), sd = 0.2)

y<- rnorm(12, mean = rep(c(1, 2, 1), each = 4), sd = 0.2)

plot(x, y , col= "blue", pch= 19, cex = 2)

text(x + 0.05, y + 0.05,labels= as.character(1:12))

dataFrame <- data.frame(x = x, y = y)

distxy<- dist(dataFrame)

hClustering<- hclust(distxy)

myplclust(hClustering, lab.col = rep(1:3, each = 4))


#funcion para generar un dendrograms
myplclust<- function(hclust, lab = hclust$labels, lab.col= rep(1, length(hclist$labels)), 
                   hang = 0.1, ...){
        ##
        ##
        ##
        ##
        ##
        y<- rep(hclust$height, 2)
        x<- as.numeric(hclust$merge)
        y<- y[with(x<0)]
        x<- x[with(x<0)]
        x<- abs(x)
        y<- y[orden(x)]
        x<- x[orden(x)]
        plot(hclust, labels= FALSE, hang = hang, ...)
        text(x= x, y= y[hclust$order]- (max(hclust$heigh)*hang), labels= lab[hclust$order],
             col= lab.col[hclust$order], str= 90, adj= c(1, 0.5), xpd= NA, ...)
}