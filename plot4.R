## Data subset is read in using read.csv.sql with sqldf package with the following:
## data <- read.csv.sql("household_power_consumption.txt", header=TRUE, sep=";",
##                     sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")
## The data object is then dumped into data.object file to save it for another session using the following:
## dump("data","data.object")
source("data.object")
## Convert Date and Time columns into a string list stored in datetime object
datetime<-strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

png(file="plot4.png")

## setup plot area to have 4 charts
par(mfrow=c(2,2))

## chart at (1,1)
plot(datetime,data$Global_active_power,type="l",xlab="",ylab="Global Active Power")

## chart at (1,2)
plot(datetime,data$Voltage,type="l",xlab="datetime",ylab="Voltage")

## chart at (2,1)
plot(datetime,data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
## Add line for sub_metering_2
lines(datetime,data$Sub_metering_2,col="red")
## Add line for sub_metering_3
lines(datetime,data$Sub_metering_3,col="blue")

## Add legend at topright corner with labels, color matching the labels, line width of 1 and no borders
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1,col=c("black","red","blue"),bty="n")

## chart at (2,2)
plot(datetime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

## Close the png output file
dev.off()

## Perform cleanup of temporary objects created
rm(datetime)