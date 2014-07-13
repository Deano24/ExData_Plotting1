#Reading in the data
data = read.table("household_power_consumption.txt", sep=";",header=TRUE, row.names=NULL,na.strings="?")
#Formatting the data field
data$Date <- as.Date( as.character(data$Date), "%d/%m/%Y")
#Subsetting the data
subsetdata <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
#Removing all NA from data frame
na.omit(subsetdata)

#Create initial blank canvase
plot( strptime(paste(subsetdata$Date, subsetdata$Time, sep=":"),format='%Y-%m-%d:%H:%M:%S'),
subsetdata$Sub_metering_1,ylab="Energy sub metering",xlab="", type="n")
#Place first line on canvase
lines(strptime(paste(subsetdata$Date, subsetdata$Time, sep=":"),format='%Y-%m-%d:%H:%M:%S'),
subsetdata$Sub_metering_1, type="l")
#Place second line on canvase
lines(strptime(paste(subsetdata$Date, subsetdata$Time, sep=":"),format='%Y-%m-%d:%H:%M:%S'),
subsetdata$Sub_metering_2, type="l", col="red")
#Place third line on canvas
lines(strptime(paste(subsetdata$Date, subsetdata$Time, sep=":"),format='%Y-%m-%d:%H:%M:%S'),
subsetdata$Sub_metering_3, type="l", col="blue")
#Create legend
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
pch=c("_","_","_"),col=c("black","blue","red"))

#Copying image displayed on screen to png file
dev.copy(png,file="plot3.png")
#Closing device
dev.off()
