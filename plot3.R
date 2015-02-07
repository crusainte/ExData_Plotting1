## Data subset is read in using read.csv.sql with sqldf package with the following:
## data <- read.csv.sql("household_power_consumption.txt", header=TRUE, sep=";",
##                     sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")
## The data object is then dumped into data.object file to save it for another session using the following:
## dump("data","data.object")
source("data.object")
## Convert Date and Time columns into a string list stored in datetime object
datetime<-strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

png(file="plot3.png")
## Plot line chart for sub_metering_1 with datetime as x axis
plot(datetime,data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
## Add line for sub_metering_2
lines(datetime,data$Sub_metering_2,col="red")
## Add line for sub_metering_3
lines(datetime,data$Sub_metering_3,col="blue")

## Add legend at topright corner with labels, color matching the labels and line width of 1 
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1,col=c("black","red","blue"))

## Close the png output file
dev.off()

## Perform cleanup of temporary objects created
rm(datetime)