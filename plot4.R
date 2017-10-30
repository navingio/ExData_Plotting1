
MyData <- read.csv(file="../household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

# create a column with Posix Date/Time
MyData$DateTime1 <- paste(MyData$Date, MyData$Time)
MyData$DateTime <- strptime(MyData$DateTime1, format="%d/%m/%Y %H:%M:%S")
MyData$Date <- NULL
MyData$Time <- NULL
MyData$DateTime1 <- NULL

# subset data , based on a time range 2007-02-01 - 2007-02-02
date1 <- as.POSIXct("2007-02-01 00:00:00")
date2 <- as.POSIXct("2007-02-02 23:59:59")

MyData <- subset (MyData, MyData$DateTime >= date1 &  MyData$DateTime <= date2)

# 2x2 plots
par(mfrow=c(2,2))

# plot 1
with(MyData, plot(DateTime, Global_active_power, type ="l", ylab = "Global Active Power",    xlab = ""))

# plot 2
with(MyData, plot(DateTime, Voltage, type ="l", xlab = "datetime"))

# plot 3
with(MyData, plot(DateTime, Sub_metering_1, type ="n", ylab = "Eneryg sub metering",    xlab = ""))
with(MyData, points(DateTime, Sub_metering_1, type ="l", col = "black"))
with(MyData, points(DateTime, Sub_metering_2, type ="l", col = "red"))
with(MyData, points(DateTime, Sub_metering_3, type ="l", col = "blue"))
legend("topright", col=c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 1)

# plot 4
with(MyData, plot(DateTime, Global_reactive_power, type ="l", xlab = "datetime"))



# create plot4.png file
png(file = "plot4.png", width = 480 , height = 480)

# 2x2 plots
par(mfrow=c(2,2))

# plot 1
with(MyData, plot(DateTime, Global_active_power, type ="l", ylab = "Global Active Power",    xlab = ""))

# plot 2
with(MyData, plot(DateTime, Voltage, type ="l", xlab = "datetime"))

# plot 3
with(MyData, plot(DateTime, Sub_metering_1, type ="n", ylab = "Eneryg sub metering",    xlab = ""))
with(MyData, points(DateTime, Sub_metering_1, type ="l", col = "black"))
with(MyData, points(DateTime, Sub_metering_2, type ="l", col = "red"))
with(MyData, points(DateTime, Sub_metering_3, type ="l", col = "blue"))
legend("topright", col=c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 1)

# plot 4
with(MyData, plot(DateTime, Global_reactive_power, type ="l", xlab = "datetime"))

dev.off()






