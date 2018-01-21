data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data$dateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data <- data[data$dateTime >= as.POSIXlt('2007-02-01 0:00:00') & data$dateTime < as.POSIXlt('2007-02-03 00:00:00'),]
png(file = "plot2.png", width = 480, height = 480) 
plot(data$dateTime, data$Global_active_power, type = "l", ylab = "Global Active Power(kilowatts)", xlab = "")
dev.off()