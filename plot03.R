
#download data
fileurl<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile = "Power_consumption.zip", method = 'curl')
unzip("Power_consumption.zip")

data<-read.table("household_power_consumption.txt", header=TRUE,sep=";")

names(data)

#subset data for 2/1/2007 and 2/2/2007 only
mydata <- subset[data$Date %in% c("1/2/2007","2/2/2007")]

summary(mydata)

gap <- as.numeric(mydata$Global_active_power)

day <- strptime(paste(mydata$Date, mydata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#plot everyday submetering

subm1<- as.numeric(mydata$Sub_metering_1)
subm2<- as.numeric(mydata$Sub_metering_2)
subm3<- as.numeric(mydata$Sub_metering_3)


#define graph
png("plot03.png", width = 480, height = 480)

plot(day, subm1, type="l", ylab="Energy Submetering", xlab="")
lines(day, subm2, type="l", col="red")
lines(day, subm3, type="l", col="blue")
legend("topright", c("subm1", "subm2", "subm3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

