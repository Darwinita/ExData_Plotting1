#Set the working directory in your computer
setwd("/Users/lorenzo/Documents/Johns\ Hopkins\ University\ Data\ Science/Exploratory_Data_Analysis/Assessment1/ExData_Plotting1")

fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
datafilename<-"Course_project.zip"
#Check if the file containing the data is already in your working directory. Otherwise, download it and unzip
if (!file.exists(datafilename)) { 
  download.file(fileURL, destfile = datafilename, method = "curl")
  unzip("Course_project.zip")
}

filename<-"household_power_consumption.txt"

#Read data from file (Using skip and nrows to extract only data from 2007-02-01 and 2007-02-02)
raw_data<-read.table(filename, sep = ";", header = T, na.strings = "?", comment.char="", skip = 66636, nrows = 2880,  as.is=T, stringsAsFactors=F, colClasses = , col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")) #,  na.strings = "?", strip.white = T, fill = T, blank.lines.skip = T
raw_data$datetime <- paste(raw_data$Date,raw_data$Time, sep = ' ') 
raw_data$datetime<-strptime(raw_data$datetime, "%d/%m/%Y %H:%M:%S")

#Plotting
png(file = "plot1.png")
hist(raw_data$Global_active_power, col = "red", ylim=c(0, 1200), xlab="Global Active Power (kilowatts)",main = "Global Active Power",)
dev.off()