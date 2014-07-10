data <- read.csv("household_power_consumption.txt", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), sep=";", na.strings = "?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

png("plot1.png", width = 480, height = 480, bg = "transparent")
hist(data$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatt)")
axis(1, at=c(0, 2, 4, 6))
axis(2, at=c(0, 200, 400, 600, 800, 1000, 1200))
dev.off()