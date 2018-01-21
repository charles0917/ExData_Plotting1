data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data$dateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data <- data[data$dateTime >= as.POSIXlt('2007-02-01 0:00:00') & data$dateTime < as.POSIXlt('2007-02-03 00:00:00'),]

png(file = "plot4.png", width = 480, height = 480) 
par(mfrow=c(2,2))

plot(data$dateTime, data$Global_active_power, type = "l", ylab = "Global Active Power(kilowatts)", xlab = "")

plot(data$dateTime, data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

plot(data$dateTime, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(data$dateTime, data$Sub_metering_2, type = "l", col = "red")
lines(data$dateTime, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", "(x,y)", legend=c("Sub_metering_1", "Sub_metering_1", "Sub_metering_3"),
       col=c("black", "red", "blue"), lwd = 1,  bty = "n")

plot(data$dateTime, data$Global_reactive_power, type = "l")

dev.off()