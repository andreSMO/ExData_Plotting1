##Download a zip file from the URL
##Note that the secure path is removed 
urlName <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp <- tempfile()
download.file(urlName,temp)
##Unzip and store in file
filN <- "household_power_consumption.txt"
unzip(temp, filN)
unlink(temp)
