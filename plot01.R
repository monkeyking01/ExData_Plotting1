
#download file
fileurl<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile = "Power_consumption.zip", method = 'curl')
unzip("Power_consumption.zip")

data<-read.table("household_power_consumption.txt", header=TRUE,sep=";")

#create subset file
names(data)
mydata <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

summary(mydata)

gap <- as.numeric(mydata$Global_active_power)

#define graph
png("plot01.png", width = 480, height = 480)

hist(gap, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")