library(ggplot2)
qplot(mpg, wt, data = mtcars)

ggplot(mtcars, aes(x = mpg, y = wt)) + geom_point(shape = 1)

mtcars$cyl_factor <- factor(mtcars$cyl)

ggplot(mtcars, aes(x = mpg, y = wt, shape = cyl_factor)) + geom_point()

ggplot(mtcars, aes(x = mpg, y = wt)) + geom_point(color = "blue")

ggplot(mtcars, aes(x = mpg, y = wt, color = cyl)) + geom_point()

ggplot(mtcars, aes(x = mpg, y = wt, color = cyl_factor)) + geom_point()

ggplot(mtcars,aes(x = mpg, y = wt, color = cyl_factor)) + 
        geom_point() + 
        xlab("Miles per Gallon ") + 
        ylab("Weight") +
        labs(colour = "Cylinders") + 
        ggtitle("Comparing mileage and weight by number of cylinders in cars")

mtcars$gear_factor <- factor(mtcars$gear) 
ggplot(mtcars, aes(x = hp, y = qsec, color = gear_factor)) +
        geom_point() + 
        labs(x = "Gross horsepower", y = "1/4 mile time", 
             color = "Forward gears", 
             title = "Gross horsepower vs 1/4 mile time by number of forward gears") 

?EuStockMarkets

head(EuStockMarkets)

head(time(EuStockMarkets))

EuStockDF <- as.data.frame(EuStockMarkets)
EuStockDF$Date <- as.numeric(time(EuStockMarkets))

head(EuStockDF)

ggplot(EuStockDF, aes(x = Date, y = DAX)) + geom_line()

ggplot(EuStockDF, aes(x = Date, y = DAX)) + 
        geom_line(size = 1.5, color = "light blue")

# Example solution using CAC
ggplot(EuStockDF, aes(x = Date, y = CAC)) +
        geom_line(color = "red")

ggplot(EuStockDF, aes(x = Date)) +
        geom_line(aes(y = DAX), color = "light blue") +
        geom_line(aes(y = SMI), color = "red") + 
        geom_line(aes(y = CAC), color = "purple") + 
        geom_line(aes(y = FTSE), color = "green")

library(tidyverse)
library(broom)

tidy_stocks <- tidy(EuStockMarkets) %>% 
        rename(Date = index, Stock_Index = series, Price = value) 

head(tidy_stocks)

ggplot(tidy_stocks, aes(x = Date, y = Price, color = Stock_Index)) +
        geom_line()

ggplot(Orange, aes(x = age, y = circumference, color = Tree)) +
        geom_line()

install.packages("plotly")
library(plotly)

p <- ggplot(mtcars, aes(y = mpg)) + geom_boxplot()
ggplotly(p)

ggplot(mtcars, aes(x = cyl_factor, y = mpg)) + geom_boxplot()

ggplot(mtcars, aes(x = gear_factor, y = hp)) + geom_boxplot()


