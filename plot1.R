## Data subset is read in using read.csv.sql with sqldf package with the following:
## data <- read.csv.sql("household_power_consumption.txt", header=TRUE, sep=";",
##                     sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")
## The data object is then dumped into data.object file to save it for another session using the following:
## dump("data","data.object")
source("data.object")

## Plot a histogram with red bars and labels matching project answer
hist(data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")