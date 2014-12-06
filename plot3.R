#Script to generate a plot about energy submettering
#
#The pre-requisites are:
#1-The file "household_power_consumption.txt" is available in the workking directory 
#2-The packages "lubridate" and "dplyr" are installed.
#
#A white background is used to improve readability 
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

##Plot three energy submetering in png
###submetering 1 is displayed in black
###submetering 2 is displayed in red
###submetering 3 is displayed i blue

###Collect the submetering data
x <- subElData$DateTime
y1 <- subElData$Sub_metering_1
y2 <- subElData$Sub_metering_2
y3 <- subElData$Sub_metering_3
###Plot
png(filename="plot3.png",width=480,height=480)
plot(x,y1,ylab="Energy sub metering",xlab="",type="l")
lines(x,y2,col="red" )
lines(x,y3,col="blue")
legend("topright", legend=c("Submetering_1","Submetering_2","Submetering_3"),col=c("black","red","blue"),lty=1)
dev.off()
#Clear the work space
rm(list=ls())