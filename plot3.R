## Third plot for Exploratory Data Analysis Week1 Project
# Read text file
library(dplyr)
library(lubridate)
# Load data for test sets
setwd("C:/Data/R/Exploratory Data Analysis Week1")
headplot <- read.csv("household_power_consumption.txt", sep = ";", dec = ".")
headplot$Date <- as.Date(headplot$Date, format = "%d/%m/%Y") ## %H:%M:%S
dateplot <- subset(headplot, Date == "2007-02-01" | Date == "2007-02-02")
dateplot$Global_active_power <- as.numeric(as.character(dateplot$Global_active_power))
dateplot$Sub_metering_1 <- as.numeric(as.character(dateplot$Sub_metering_1))
dateplot$Sub_metering_2 <- as.numeric(as.character(dateplot$Sub_metering_2))
dateplot$datetime <- paste(dateplot$Date, dateplot$Time)
dateplot$datetime <- ymd_hms(dateplot$datetime)
##summary(dateplot$Global_active_power)
png(filename = "plot3.png", width = 480, height = 480, units = "px")
with(dateplot,plot(datetime,Sub_metering_1,type = "l", ylab = "Energy sub metering", xlab = "" ))
with(dateplot,lines(datetime,Sub_metering_2,type = "l", col = "red" ))
with(dateplot,lines(datetime,Sub_metering_3,type = "l", col = "blue" ))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty=c(1,1))
dev.off()