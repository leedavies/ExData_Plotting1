## Script plot2.R
## Reads the household_power_consumption.txt file from the /data directory
## Creates a png file called plot2.png that contains 
## a plot of the Global_active_power variable for 1st Feb 2007 and 2nd Feb 2007

# read in the data
data <- read.csv("./data/household_power_consumption.txt", sep= ";", header = TRUE, na.strings = "?")

# get the data for the two dates in Feb
febdata <- data[data$Date %in% c('1/2/2007', '2/2/2007'), ]

# concatinate the date and time and convert from character date representation
febdata$DateTime <- paste(febdata$Date, febdata$Time)
febdata$DateTime <- strptime(febdata$DateTime, "%d/%m/%Y %H:%M:%S")

# set the png file (although 480 appears to be the default going to set them anyway)
png("plot2.png", width = 480, height = 480)

# plot the data
with(febdata, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

#close the device
dev.off()