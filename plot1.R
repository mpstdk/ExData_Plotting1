## Getting Data Set to be used for this assignment (power Consumption) 
full_data <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?",nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
## Formatting as date 
full_data$Date <- as.Date(full_data$Date, format="%d/%m/%Y")

## getting subset of data within full data set between two dates
data <- subset(full_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(full_data)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Generating Plot, Plot 1
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving plot to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()