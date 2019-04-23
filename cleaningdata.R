#Prepare workspace
setwd("~/WORK")
library(lubridate)
library(dplyr)
library(sqldf)
library(hms)

#read table
data<-read.table("household_power_consumption.txt", head=TRUE, sep=";", stringsAsFactors = FALSE)
  
#arrange by date
data$Date<-as.Date(data$Date, format = "%d/%m/%Y")
data<-arrange(data, data$Date)

#Subset to necessary dates only
data<-subset(data, data$Date >= as.Date("2007-02-01"))
data<-subset(data, data$Date <= as.Date("2007-02-02"))

#replace "?" to NA values
data$Global_active_power<-gsub("?",NA, data$Global_active_power, fixed= TRUE)
data$Global_reactive_power<-gsub("?",NA, data$Global_reactive_power, fixed= TRUE)
data$Voltage<-gsub("?", NA, data$Voltage, fixed= TRUE)
data$Global_intensity<-gsub("?", NA, data$Global_intensity, fixed= TRUE)
data$Sub_metering_1<-gsub("?", NA, data$Sub_metering_1, fixed= TRUE)
data$Sub_metering_2<-gsub("?", NA, data$Sub_metering_2, fixed= TRUE)
data$Sub_metering_3<-gsub("?", NA, data$Sub_metering_3, fixed= TRUE)

#create datetime column, convert to date and time class
data$DateTime<-paste(data$Date, data$Time)
colnames(data)
data<-select(data, c("DateTime", "Date", "Time", 
                     "Global_active_power","Global_reactive_power", "Voltage",
                     "Global_intensity","Sub_metering_1","Sub_metering_2",
                     "Sub_metering_3"))
data$DateTime<-strptime(data$DateTime, "%Y-%m-%d %H:%M:%S")


#check if clean
head(data)
tail(data)
View(data)
