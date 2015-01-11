# plot2.R - create grap of Global Active Power versus time

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

# Use the timedate values to get the X axis range
xrange = range(timedate)
# Use the Sub_metering_1 data to ge the Y range since it has the widest dynamic range
yrange = range(data2$Sub_metering_1,na.rm = TRUE)

# Now get the X data for the 3 plots.  We will need to filter out na values for each set of edata
non_na_1 <- !is.na(data2$Sub_metering_1)
non_na_2 <- !is.na(data2$Sub_metering_2)
non_na_3 <- !is.na(data2$Sub_metering_3)

## Create a png file with size 480x480
png(filename = "plot3.png", width = 480, height = 480)
# Create the png file.  type="l' produces a line graph
plot(xrange,yrange,xlab = "",ylab="Energy sub metering",type="n")
lines(timedate[non_na_1],data2$Sub_metering_1[non_na_1],type="l",col="black")
lines(timedate[non_na_2],data2$Sub_metering_2[non_na_2],type="l",col="red")
lines(timedate[non_na_3],data2$Sub_metering_3[non_na_3],type="l",col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=1)
# Close the graphics device to finish the file
dev.off()


# Plot a copy for visual confirmation when running this program
plot(xrange,yrange,xlab = "",ylab="Energy sub metering",type="n")
lines(timedate[non_na_1],data2$Sub_metering_1[non_na_1],type="l",col="black")
lines(timedate[non_na_2],data2$Sub_metering_2[non_na_2],type="l",col="red")
lines(timedate[non_na_3],data2$Sub_metering_3[non_na_3],type="l",col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=1)