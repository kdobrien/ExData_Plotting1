# plot1.R - create histogram of Global Active Power

# Read the data into a data frame
data <- read.csv("household_power_consumption.txt", 
                        header=TRUE, 
                        sep = ";", 
                        na.strings = "?",
                        stringsAsFactors = FALSE, 
                        colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

# Select only data from 1 Feb 2007 and 2 Feb 2007
data2 <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007',]

# Create a png file with size 480x480
png(filename = "plot1.png", width = 480, height = 480)
# Create the png file 
hist(data2$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()

# Plot a copy for confirmation when running this program
hist(data2$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
