## Script plot1.R
## Reads the household_power_consumption.txt file from the /data directory
## Creates a png file called plot1.png that contains 
## a histogram of the Global_active_power variable for 1st Feb 2007 and 2nd Feb 2007

# read in the data
data <- read.csv("./data/household_power_consumption.txt", sep= ";", header = TRUE, na.strings = "?")

# get the data for the two dates in Feb
febdata <- data[data$Date %in% c('1/2/2007', '2/2/2007'), ]

# set the png file (although 480 appears to be the default going to set them anyway)
png("plot1.png", width = 480, height = 480)

# plot the data into the histogram
with(febdata, hist(Global_active_power, col= "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))

# close the device
dev.off()