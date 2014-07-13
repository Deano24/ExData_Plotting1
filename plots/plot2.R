#Reading in the data
data = read.table("household_power_consumption.txt", sep=";",header=TRUE, row.names=NULL,na.strings="?")
#Formatting the data field
data$Date <- as.Date( as.character(data$Date), "%d/%m/%Y")
#Subsetting the data
subsetdata <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
#Removing all NA from data frame
na.omit(subsetdata)

#Plotting time and date against power
plot( strptime(paste(subsetdata$Date, subsetdata$Time, sep=":"),format='%Y-%m-%d:%H:%M:%S'),
subsetdata$Global_active_power, type="l",ylab="Global Active Power (killowatts)",xlab="")

#Copying image displayed on screen to png file
dev.copy(png,file="plot2.png")
#Closing device
dev.off()
