
#download data
fileurl<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile = "Power_consumption.zip", method = 'curl')
unzip("Power_consumption.zip")

data<-read.table("household_power_consumption.txt", header=TRUE,sep=";")

names(data)

#subset data
mydata <- subset[data, Date %in% c("1/2/2007","2/2/2007"),]

summary(mydata)

gap <- as.numeric(mydata$Global_active_power)

day <- strptime(paste(mydata$Date, mydata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#define graph
png("plot2.png", width = 480, height = 480)

plot(day, gap, type="l", xlab="", ylab="Global Active Power (kilowatts)")
