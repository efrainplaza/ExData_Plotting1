## Second plot for Exploratory Data Analysis Week1 Project
# Read text file
library(dplyr)
library(lubridate)
# Load data for test sets
setwd("C:/Data/R/Exploratory Data Analysis Week1")
headplot <- read.csv("household_power_consumption.txt", sep = ";", dec = ".")
headplot$Date <- as.Date(headplot$Date, format = "%d/%m/%Y") ## %H:%M:%S
dateplot <- subset(headplot, Date == "2007-02-01" | Date == "2007-02-02")
dateplot$Global_active_power <- as.numeric(as.character(dateplot$Global_active_power))
dateplot$Global_reactive_power <- as.numeric(as.character(dateplot$Global_reactive_power))
dateplot$Sub_metering_1 <- as.numeric(as.character(dateplot$Sub_metering_1))
dateplot$Sub_metering_2 <- as.numeric(as.character(dateplot$Sub_metering_2))
dateplot$Sub_metering_3 <- as.numeric(as.character(dateplot$Sub_metering_3))
dateplot$Voltage <- as.numeric(as.character(dateplot$Voltage))
dateplot$datetime <- paste(dateplot$Date, dateplot$Time)
dateplot$datetime <- ymd_hms(dateplot$datetime)
##summary(dateplot$Global_active_power)
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))
#First panel
with(dateplot,plot(datetime,Global_active_power, type = "l", ylab = "Global Active Power (kilowats)", xlab = "" ))
#Second panel
with(dateplot,plot(datetime,Voltage, type = "l", ylab = "Voltage", xlab = "datetime" ))
#Third panel
with(dateplot,plot(datetime,Sub_metering_1,type = "l", ylab = "Energy sub metering", xlab = "" ))
with(dateplot,lines(datetime,Sub_metering_2,type = "l", col = "red" ))
with(dateplot,lines(datetime,Sub_metering_3,type = "l", col = "blue" ))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty=c(1,1))
#Fourth Panel
with(dateplot,plot(datetime,Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime" ))
dev.off()