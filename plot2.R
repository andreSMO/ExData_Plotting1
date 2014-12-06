#Script to generate a plot with "global active power versus date"
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

##Plot with global active power vs date in png file
x<- subElData$DateTime
y <- subElData$Global_active_power
png(filename="plot2.png",width=480,height=480)
plot(x,y,ylab="Global Active Power(kilowatts)",xlab="",type="l")
dev.off()
#Clear the workspace
rm(list=ls())