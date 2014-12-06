README for the Course Project 1
===============================

##Purpose 

The purpose of this project is to generate four plots that show different aspects of the electric power consumption in one household.
The data is available in the following site: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
Please, see the pre-requisite section about the required file.

##Structure of this repository

This repository has the same basic structure as the master repository. There is a **figure** directory that contains the (original) example plots. 

##Deliverables

Files with plots and files with R scripts in the **root** directory are provided.

###Plots

There are four files in the **root** directory that store my plots. The files are named as: 

* plot1.png that contains a histogram that plots the "Global active power"

* plot2.png that contains a xy-plot of the "Global Active Power versus date".

* plot3.png that contains a xy-plot with three graphs that show "energy sub-metering(1-3) in different colors versus date".

* plot4.png that contains 4 xy-plots. Plot 1 shows the "global Active Power" versus date. Plot 2 shows the voltage versus date. Plot 3 shows the energy sub-metering(1-4) versus date. Plot 4 shows the global reactive power versus date.

###R scripts

There are four R-scripts named plot1.R, plot2.R, plot3.R, plot4.R in the **root** directory.  Each script generates a corresponding png plot. 

####Basic pre-requisites to run the R-scripts

****

The following are the pre-requisites to run the scripts:

1. The R packages **lubridate** and **dplyr** must be installed. They are available from CRAN via install.packages() command.

2. The file **household_power_consumption.txt** must be in the same working directory where the corresponding script will be running. The scripts read this file into R as a data frame as the starting point for the processing.  

3. The memory requirements must be fulfilled. The whole (unzipped) data is first read into memory before sub-setting. 

****

Note: 
There is an optional script called downLoad.R in the **root** directory. It downloads and unzips the data. The expanded file is stored in the the working directory.
    