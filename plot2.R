data <- read.csv("household_power_consumption.txt", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), sep=";", na.strings = "?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

data$DateTime <- data$DateTime <- strptime(paste(as.character(data$Date), data$Time), "%Y-%m-%d %H:%M:%S")

png("plot2.png", width = 480, height = 480, bg = "transparent")
plot(data$DateTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatt)")
dev.off()