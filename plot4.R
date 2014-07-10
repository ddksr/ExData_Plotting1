data <- read.csv("household_power_consumption.txt", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), sep=";", na.strings = "?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

data$DateTime <- data$DateTime <- strptime(paste(as.character(data$Date), data$Time), "%Y-%m-%d %H:%M:%S")

png("plot4.png", width = 480, height = 480, bg = "transparent")
par(mfrow = c(2, 2))
with(data, {
  plot(DateTime, Global_active_power, ylab="Global Active Power", xlab="", type="l")
  plot(DateTime, Voltage, ylab="Voltage", xlab="", type="l")
  plot(DateTime, Sub_metering_1, col="black", type="l", xlab="", ylab="Energy submetering")
  lines(DateTime, Sub_metering_2, col="red")
  lines(DateTime, Sub_metering_3, col="blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1,1))
  plot(DateTime, Global_reactive_power, col="black", type="l", xlab="", ylab="Global_reactive_power")
})
dev.off()