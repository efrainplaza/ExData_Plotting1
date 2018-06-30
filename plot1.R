## First plot for Exploratory Data Analysis Week1 Project
# Read text file
library(dplyr)
library(lubridate)
# Load data for test sets
setwd("C:/Data/R/Exploratory Data Analysis Week1")
headplot <- read.csv("household_power_consumption.txt", sep = ";", dec = ".")
##headplot$Date <- dmy(as.character(headplot$Date))
headplot$Date <- as.Date(headplot$Date, format = "%d/%m/%Y") ## %H:%M:%S
dateplot <- subset(headplot, Date == "2007-02-01" | Date == "2007-02-02")
dateplot$Global_active_power <- as.numeric(as.character(dateplot$Global_active_power))
##summary(dateplot$Global_active_power)
##Create final Histogram and save as PNG file with a width of 480 pixels and a height of 480 pixels
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(dateplot$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowats)", breaks = 13)
dev.off()


