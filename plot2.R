# plot2.R - create graph of Global Active Power versus time

# Read the data into a data frame
data <- read.csv("household_power_consumption.txt", 
                        header=TRUE, 
                        sep = ";", 
                        na.strings = "?",
                        stringsAsFactors = FALSE, 
                        colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

# Select only data from 1 Feb 2007 and 2 Feb 2007
data2 <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007',]

# Combine the date and time using paste and then convert the date-time to a timedate.  This will be used for the X axis
timedate <- strptime(paste(data2$Date,data2$Time),"%d/%m/%Y %H:%M:%S")

# Create a png file with size 480x480
png(filename = "plot2.png", width = 480, height = 480)
# Create the png file.  type="l' produces a line graph
plot(timedate,data2$Global_active_power,xlab = "",ylab="Global Active Power (kilowatts)",type="l")
dev.off()

# Plot a copy for confirmation when running this program
plot(timedate,data2$Global_active_power,xlab = "",ylab="Global Active Power (kilowatts)",type="l")
