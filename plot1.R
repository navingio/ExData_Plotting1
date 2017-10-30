
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

# create histogram on screen device
hist(MyData$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")

# create histogram on png file device : plot1.png 
png(file = "plot1.png", width = 480 , height = 480)
with(MyData, hist(Global_active_power, xlab = "Global Active Power (kilowatts)",    ylab = "Frequency", main = "Global Active Power", col = "red"))
dev.off()






