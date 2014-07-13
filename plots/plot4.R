setwd('C:/Users/Deano/Desktop/coursera/Exploratory Data Analysis/work/project 1')
#Reading in the data
data = read.table("household_power_consumption.txt", sep=";",header=TRUE, row.names=NULL,na.strings="?")
#Formatting the data field
data$Date <- as.Date( as.character(data$Date), "%d/%m/%Y")
#Subsetting the data
subsetdata <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
#Removing all NA from data frame
na.omit(subsetdata)

#Creating a 2x2 plot field
par(mfrow=c(2,2))
#Changing the margins
par(mar=c(4,4,3,3))

#First Plot
plot( strptime(paste(subsetdata$Date, subsetdata$Time, sep=":"),format='%Y-%m-%d:%H:%M:%S'),
subsetdata$Global_active_power, type="l",ylab="Global Active Power (killowatts)",xlab="")

#Second Plot
plot( strptime(paste(subsetdata$Date, subsetdata$Time, sep=":"),format='%Y-%m-%d:%H:%M:%S'),
subsetdata$Voltage, type="l",ylab="Voltage",xlab="datetime")

#Third Plot
plot( strptime(paste(subsetdata$Date, subsetdata$Time, sep=":"),format='%Y-%m-%d:%H:%M:%S'),
subsetdata$Sub_metering_1,ylab="Energy sub metering",xlab="", type="n")
lines(strptime(paste(subsetdata$Date, subsetdata$Time, sep=":"),format='%Y-%m-%d:%H:%M:%S'),
subsetdata$Sub_metering_1, type="l")
lines(strptime(paste(subsetdata$Date, subsetdata$Time, sep=":"),format='%Y-%m-%d:%H:%M:%S'),
subsetdata$Sub_metering_2, type="l", col="red")
lines(strptime(paste(subsetdata$Date, subsetdata$Time, sep=":"),format='%Y-%m-%d:%H:%M:%S'),
subsetdata$Sub_metering_3, type="l", col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
pch=c("_","_","_"),col=c("black","blue","red"))

#Fourth Plot
plot( strptime(paste(subsetdata$Date, subsetdata$Time, sep=":"),format='%Y-%m-%d:%H:%M:%S'),
subsetdata$Global_reactive_power, type="l",ylab="Global_reactive_power",xlab="datetime")

#Copying image displayed on screen to png file
dev.copy(png,file="plot4.png")
#Closing device
dev.off()
