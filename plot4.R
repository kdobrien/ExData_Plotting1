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


# Create a png file with size 480x480
png(filename = "plot4.png", width = 480, height = 480)

# Set up a 2 x 2 grid for the plots
par(mfrow=c(2,2))
# Shrink the axis labels by a small amount for more proportional size
par(cex.lab = .9)

########
# Plot 1
plot(timedate,data2$Global_active_power,xlab = "",ylab="Global Active Power",type="l")

########
# Plot 2
plot(timedate,data2$Voltage,xlab = "datetime",ylab="Voltage",type="l")

########
# Plot 3
# Use the timedate values to get the X axis range
xrange = range(timedate)
# Use the Sub_metering_1 data to ge the Y range since it has the widest dynamic range
yrange = range(data2$Sub_metering_1,na.rm = TRUE)

# Now get the X data for the 3 plots.  We will need to filter out na values for each set of edata
non_na_1 <- !is.na(data2$Sub_metering_1)
non_na_2 <- !is.na(data2$Sub_metering_2)
non_na_3 <- !is.na(data2$Sub_metering_3)

# Plot a copy for visual confirmation when running this program
plot(xrange,yrange,xlab = "",ylab="Energy sub metering",type="n")
lines(timedate[non_na_1],data2$Sub_metering_1[non_na_1],type="l",col="black")
lines(timedate[non_na_2],data2$Sub_metering_2[non_na_2],type="l",col="red")
lines(timedate[non_na_3],data2$Sub_metering_3[non_na_3],type="l",col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=1, bty="n", cex = .9)

########
# Plot 4
plot(timedate,data2$Global_reactive_power,xlab = "datetime",ylab="Global_reactive_power",type="l")

# Close the graphics device to finish the file
dev.off()