# THIS CELL TAKES LONGER TO RUN
# PLEASE RUN THIS LOCALLY, OR IT MAY FREEZE YOUR SKILLS NETWORK LABS KERNEL
# Download 2 million datasheet

# url where the data is located
url <- "https://dax-cdn.cdn.appdomain.cloud/dax-airline/1.0.1/airline_2m.tar.gz"

# download the file
download.file(url, destfile = "airline_2m.tar.gz")

# untar the file so we can get the csv only
untar("airline_2m.tar.gz")

# read_csv only 
airlines <- read_csv("airline_2m.csv",
                     col_types = cols(
                             'DivDistance' = col_number(),
                             'Div1Airport' = col_character(),
                             'Div1AirportID' = col_character(),
                             'Div1AirportSeqID' = col_character(),
                             'Div1WheelsOn' = col_character(),
                             'Div1TotalGTime' = col_number(),
                             'Div1LongestGTime' = col_number(),
                             'DivReachedDest' = col_number(),
                             'DivActualElapsedTime' = col_number(),
                             'DivArrDelay' = col_number(),
                             'Div1WheelsOff'= col_character(),
                             'Div1TailNum' = col_character(),
                             'Div2Airport' = col_character(),
                             'Div2AirportID' = col_character(),
                             'Div2AirportSeqID' = col_character(),
                             'Div2WheelsOn' = col_character(),
                             'Div2TotalGTime' = col_number(),
                             'Div2LongestGTime' = col_number(),
                             'Div2WheelsOff' = col_character(),
                             'Div2TailNum' = col_character()
                     ))
# We are going to be focusing on flights from  LAX to JFK and we will exclude
# flights that got cancelled or diverted
# we are also going to get only useful columns
sub_airline <- airlines %>% 
        filter(Origin == "LAX", Dest == "JFK", 
               Cancelled != 1, Diverted != 1) %>% 
        select(Month, DayOfWeek, FlightDate, 
               Reporting_Airline, Origin, Dest, 
               CRSDepTime, CRSArrTime, DepTime, 
               ArrTime, ArrDelay, ArrDelayMinutes, 
               CarrierDelay, WeatherDelay, NASDelay,
               SecurityDelay, LateAircraftDelay, DepDelay, 
               DepDelayMinutes, DivDistance, DivArrDelay)








