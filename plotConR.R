# count of each number of cylinder

count <- table(mtcars$cyl)  
barplot(count)

library(ggplot2)

qplot(data = mtcars, x = cyl, geom = "bar")

ggplot(mtcars, aes(x = hp, y = mpg, color = factor(cyl), shape = factor(cyl))) +
        geom_point(size=2) + 
        labs(x = "Gross horsepower", 
             y = "Miles/gallon", 
             color = "Cylinders", 
             shape = "Cylinders", 
             title = "Mileage by horsepower and number of cylinders",
             subtitle = "Data source: 1974 Motor Trend US magazine") +
        theme_dark() +
        scale_color_brewer(palette = "Set2")
mtcars
?mtcars


head(mtcars)

tail(mtcars)

summary(mtcars)


mean(mtcars$cyl)

library(ggplot2)

qplot(mtcars$cyl, geom = "bar")

?qplot

qplot(mtcars$cyl, geom = "bar", fill = I("blue"), colour = I("red"))

qplot(mtcars$cyl, geom = "bar", fill = I("steelblue"))

qplot(mtcars$cyl, geom = "bar", fill = I("blue"), 
      xlab = "Cylinders", ylab = "Number of Vehicles")

qplot(mtcars$cyl, geom = "bar", fill = I("blue"), 
      xlab = "Cylinders", ylab = "Number of Vehicles", main = "Cylinders in mtcars")

qplot(mtcars$carb, geom = "bar", fill = I("blue"), 
      xlab = "Carb", ylab = "Number of Vehicles", main = "Carb in mtcars")

qplot(mtcars$hp, geom = "histogram")


qplot(mtcars$hp, geom="histogram", binwidth = 25)



qplot(mtcars$hp, geom="histogram", binwidth = 25, colour = I("black"))


qplot(mtcars$hp, geom="histogram", 
      binwidth = 25, colour = I("black"), xlim = c(80,200))

qplot(mtcars$hp, geom="histogram", binwidth = 25, 
      colour = I("black"), xlab = "Horsepower", ylab= "Number of Cars")

qplot(mtcars$hp, geom="histogram", binwidth = 25, colour = I("black"), 
      xlab = "Horsepower", ylab= "Number of Cars", alpha = I(0))

qplot(mtcars$hp, geom="histogram", binwidth = 25, colour = I("black"), 
      xlab = "Horsepower", ylab= "Number of Cars", alpha = I(0),
      main = "Histogram")

qplot(mtcars$qsec, geom="histogram", binwidth = 1, xlab = "1/4 mile time", 
      ylab= "Number of Cars", main = "Histogram")

# Load Tidyverse library
library(tidyverse)

# Convert cyl to factor
mtcars <- mtcars %>% 
        mutate(cyl_factor = as.factor(cyl))

# Plot grouped bar chart
ggplot(data = mtcars, 
       aes(x = cyl_factor, 
           fill = cyl_factor)) + 
        geom_bar(position = "dodge")

ggplot(data = mtcars, 
       aes(x = " ", 
           fill = cyl_factor)) + 
        geom_bar(position = "stack")

ggplot(data = mtcars, 
       aes(x = " ", fill = cyl_factor)) + 
        geom_bar(position = "stack") +
        coord_polar(theta = "y")

ggplot(data = mtcars, 
       aes(x = " ", fill = cyl_factor)) + 
        geom_bar(position = "stack") +
        coord_polar(theta = "y") + 
        theme_minimal()


ggplot(data = mtcars, 
       aes(x = " ", fill = cyl_factor)) + 
        geom_bar(position = "stack") +
        coord_polar(theta = "y") + 
        scale_fill_brewer(palette  = "Dark2")

# Convert carb to factor
mtcars <- mtcars %>% 
        mutate(carb_factor = as.factor(carb))

# Create pie chart
ggplot(data = mtcars, 
       aes(x = " ", fill = carb_factor)) + 
        geom_bar(position = "stack") +
        coord_polar(theta = "y")
