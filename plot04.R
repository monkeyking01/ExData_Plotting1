

#download data
fileurl<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile = "Power_consumption.zip", method = 'curl')
unzip("Power_consumption.zip")

data<-read.table("household_power_consumption.txt", header=TRUE,sep=";")

names(data)

#subset data
mydata<-subset(data, Date %between% c("2007-02-01", "2007-02-02"))


gap <- as.numeric(mydata$Global_active_power)

day <- strptime(paste(mydata$Date, mydata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

subm1<- as.numeric(mydata$Sub_metering_1)
subm2<- as.numeric(mydata$Sub_metering_2)
subm3<- as.numeric(mydata$Sub_metering_3)

par(mfrow = c(2, 2)) 

# First plot
plot(day, gap, type="l", xlab="", ylab="Global Active Power", cex=0.2)
# Second plot
vol<-as.numeric(mydata$Voltage)
plot(day, vol, type="l", xlab="datetime", ylab="Voltage")
# Third plot
plot(day, subm1, type="l", ylab="Energy Submetering", xlab="")
lines(day, subm2, type="l", col="red")
lines(day, subm3, type="l", col="blue")
legend("topright", c("Subm1", "Subm2", "Subm3"), lty=, col=c("black", "red", "blue"), bty="o", cex=0.1)
# Fourth plot
grp<-as.numeric(mydata$Global_reactive_power)
plot(day, grp, type="l", xlab="datetime", ylab="Global_reactive_power", cex=0.2)
