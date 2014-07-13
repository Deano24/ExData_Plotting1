#Reading in the data
data = read.table("household_power_consumption.txt", sep=";",header=TRUE, row.names=NULL,na.strings="?")
#Formatting the data field
data$Date <- as.Date( as.character(data$Date), "%d/%m/%Y")
#Subsetting the data
subsetdata <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
#Removing all NA from data frame
na.omit(subsetdata)

#Plots histogram to screen
hist(subsetdata$Global_active_power,col = "red", main ="Global Active Power",xlab = "Global Active Power (killowatts)", ylab="Frequency",breaks=12)

#Copying image displayed on screen to png file
dev.copy(png,file="plot1.png")
#Closing device
dev.off()