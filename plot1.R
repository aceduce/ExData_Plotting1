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
dt$Time<-strptime(dt$Time,"%H:%M:%S")
#dt$datetime <- strptime(paste(dt$Date, data$Time), "%Y-%m-%d %H:%M:%S")
data<-subset(dt, Date>= "2007-02-01" & Date<= "2007-02-02")

#plot 1
attach(dt)
#subset to get only btw 2007-02-01 and 2007-02-02

hist(data$Global_active_power, col="RED",main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

# Save file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
detach(dt)

