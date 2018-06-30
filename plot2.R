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
dateplot$datetime <- paste(dateplot$Date, dateplot$Time)
dateplot$datetime <- ymd_hms(dateplot$datetime)
##summary(dateplot$Global_active_power)
png(filename = "plot2.png", width = 480, height = 480, units = "px")
with(dateplot,plot(datetime,Global_active_power, type = "l", ylab = "Global Active Power (kilowats)", xlab = "" ))
##plot(dateplot$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowats)", breaks = 13)
dev.off()