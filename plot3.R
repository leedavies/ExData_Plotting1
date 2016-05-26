## Script plot3.R
## Reads the household_power_consumption.txt file from the /data directory
## Creates a png file called plot3.png that contains 
## a plot of the 3 sub metering variable for 1st Feb 2007 and 2nd Feb 2007

# read in the data
data <- read.csv("./data/household_power_consumption.txt", sep= ";", header = TRUE, na.strings = "?")

# get the data for the two dates in Feb
febdata <- data[data$Date %in% c('1/2/2007', '2/2/2007'), ]

# concatinate the date and time and convert from character date representation
febdata$DateTime <- paste(febdata$Date, febdata$Time)
febdata$DateTime <- strptime(febdata$DateTime, "%d/%m/%Y %H:%M:%S")

# set the png file (although 480 appears to be the default going to set them anyway)
png("plot3.png", width = 480, height = 480)

# plot the data
with(febdata, plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(febdata, points(DateTime, Sub_metering_2, type = "l", col = "red"))
with(febdata, points(DateTime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty = 1, col = c("black","red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#close the device
dev.off()