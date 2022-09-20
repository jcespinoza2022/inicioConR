# Uncomment to install tidyverse if running locally
# install.packages("tidyverse")
install.packages("tidyverse")
# Load tidyverse
library(tidyverse)
# url where the data is located
url <- "https://dax-cdn.cdn.appdomain.cloud/dax-airline/1.0.1/lax_to_jfk.tar.gz"
# download the file
download.file(url, destfile = "lax_to_jfk.tar.gz")
# untar the file so we can get the csv only
untar("lax_to_jfk.tar.gz", tar = "internal")
# read_csv only 
sub_airline <- read_csv("lax_to_jfk/lax_to_jfk.csv",
                        col_types = cols(
                                'DivDistance' = col_number(),
                                'DivArrDelay' = col_number()
                        ))
# show the first n = 3 rows
head(sub_airline, 3)
# show the first 6 rows
head(sub_airline)
# show the last 6 rows
tail(sub_airline)
# Write your code below and press Shift+Enter to execute 
tail(sub_airline, 10)
dim(sub_airline)
colnames(sub_airline)
write_csv(sub_airline, "lax_to_jfk.csv")
sapply(sub_airline, typeof) 


summarize(group_by(filter(sub_airline, Month == 1), Reporting_Airline), avg_carrier_delay = mean(CarrierDelay, na.rm = TRUE))

sub_airline %>% 
        filter(Month == 1) %>%
        group_by(Reporting_Airline) %>%
        summarize(avg_carrier_delay = mean(CarrierDelay, na.rm = TRUE))

# group_by / summarize workflow example
sub_airline %>%
        group_by(Reporting_Airline) %>%
        summarize(avg_carrier_delay = mean(CarrierDelay, na.rm = TRUE)) # use mean value


# group_by / summarize workflow example
sub_airline %>%
        group_by(Reporting_Airline) %>%
        summarize(avg_carrier_delay = mean(CarrierDelay, na.rm = TRUE)) # use mean value


# group_by / summarise workflow example
sub_airline %>%
        group_by(Reporting_Airline) %>%
        summarize(sd_carrier_delay = sd(CarrierDelay, na.rm = TRUE)) # use standard deviation


#glimpse()


# look at the info of airline dataset
glimpse(sub_airline)





