#Script to generate a HISTOGRAM about "global active power"
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
##Draw a basic histogram in red for gobal active power using png 
png(filename="plot1.png",width=480,height=480)
hist(subElData$Global_active_power,xlab= "global active power (kilowatts)",col="red",main="Global Active Power")
dev.off()

#clear the work space
rm(list=ls())