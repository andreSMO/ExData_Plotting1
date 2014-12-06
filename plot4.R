#Script to generate a plot with 4 subplots
#
#The pre-requisites are:
#1-The file "household_power_consumption.txt" is available in the workking directory 
#2-The packages "lubridate" and "dplyr" are installed.
#
##read the file
filName <- "household_power_consumption.txt"
classInfo <- c("character"   ,   "character" ,rep("numeric",1,7))
elData <- read.table(filName,sep=";",header=TRUE,colClasses = classInfo,na.strings="?")

library(dplyr)
library(lubridate)
##Generate a DateTime column that combines the date and time objects for each observation
elData <- mutate(elData,DateTime=dmy_hms(paste(Date,Time))) 
##Generate a subset data.frame with the required dates.
##The DateTime objects are used as subsetting criteria
subElData <- subset(elData, DateTime >= ymd_hms("2007-02-01 00:00:00") & DateTime <= ymd_hms("2007-02-02 23:59:59"))
##remove the large file
rm("elData")

##Plot a combination of four subplots in png
png(filename="plot4.png",width=480,height=480) #open the display device
par(mfrow=c(2,2))                              #display 2X2 plots by rows

#####subplot1 draw global active power vs date
xTime<- subElData$DateTime
y11 <- subElData$Global_active_power
plot(xTime,y11,ylab="Global Active Power",xlab="",type="l")

#####subplot2 voltage vs date
y21 <- subElData$Voltage
plot(xTime,y21,ylab="Voltage",xlab="datetime",type="l")

#####subplot3 energy submetering by date
y31 <- subElData$Sub_metering_1
y32 <- subElData$Sub_metering_2
y33 <- subElData$Sub_metering_3
plot(xTime,y31,ylab="Energy sub metering",xlab="",type="l")
lines(xTime,y32,col="red" )
lines(xTime,y33,col="blue")
legend("topright", legend=c("Submetering_1","Submetering_2","Submetering_3"),col=c("black","red","blue"),lty=1,bty="n")

#####subplot4 Global reactive power by date
y41 <- subElData$Global_reactive_power
plot(xTime,y41,ylab = "Global_reactive_power",xlab="datetime",type="l")
###close the device
dev.off()
##clear the work space
rm(list=ls())