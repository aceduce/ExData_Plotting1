rm(list = ls())
#set working directory
setwd("Place holder")
getwd()
if(!file.exists("data")) {
  dir.create("data")
}


#download and unzip, file handling

fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile="./data/rawdata.zip")
fileloc<-paste(getwd(),"/data/rawdata.zip",sep="")

s<-unzip(fileloc,list=F,exdir = getwd(), overwrite = T)
fileraw<-paste(getwd(),"household_power_consumption.txt",sep = "/")
dt<-read.table(fileraw, sep=';',header=T,na.strings = "?")
dt$Date<-as.Date(dt$Date, format="%d/%m/%Y")
dt<-subset(dt, Date>= "2007-02-01" & Date<= "2007-02-02")

#plot 3
dt$datetime <- strptime(paste(dt$Date, dt$Time), "%Y-%m-%d %H:%M:%S")
dt$datetime <- as.POSIXct(dt$datetime)

attach(data)
plot(Sub_metering_1 ~ datetime, type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(Sub_metering_2 ~ datetime, col = "Red")
lines(Sub_metering_3 ~ datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
detach(data)