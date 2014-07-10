data <- read.csv("household_power_consumption.txt", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), sep=";", na.strings = "?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

data$DateTime <- data$DateTime <- strptime(paste(as.character(data$Date), data$Time), "%Y-%m-%d %H:%M:%S")

png("plot3.png", width = 480, height = 480, bg = "transparent")
plot(data$DateTime, data$Sub_metering_1, col="black", type="l", xlab="", ylab="Energy submetering")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1,1))
dev.off()