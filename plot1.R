data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data$dateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data <- data[data$dateTime >= as.POSIXlt('2007-02-01 0:00:00') & data$dateTime < as.POSIXlt('2007-02-03 00:00:00'),]
png(file = "plot1.png", width = 480, height = 480)  
hist(data$Global_active_power[data$Global_active_power < 6], breaks = seq(0,6, by = 0.5), xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")
dev.off()

