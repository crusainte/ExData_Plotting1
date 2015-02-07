## Data subset is read in using read.csv.sql with sqldf package with the following:
## data <- read.csv.sql("household_power_consumption.txt", header=TRUE, sep=";",
##                     sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")
## The data object is then dumped into data.object file to save it for another session using the following:
## dump("data","data.object")
source("data.object")
## Convert Date and Time columns into a string list stored in datetime object
datetime<-strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

## Plot a line chart with datetime on the x axis and global active power on the y axis and labels matching project answer
plot(datetime,data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

## Perform cleanup of temporary objects created
rm(datetime)