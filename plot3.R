data <- read.table("household_power_consumption.txt", sep= ";", header=TRUE, colClasses="character", na.strings="?")

data[,"DateTime"] <- as.POSIXct(paste(data[,"Date"], data[,"Time"]), format="%d/%m/%Y %H:%M:%S")

filterdata<- subset(data, DateTime >= "2007-02-01" & DateTime < "2007-02-03")

png("plot3.png", width = 480, height = 480)

with(filterdata, plot(DateTime, Sub_metering_1, type = "l", col="black", ylab = "Energy sub metering", xlab = ""))
with(filterdata, lines(DateTime, Sub_metering_2, col = "red"))
with(filterdata, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1))

dev.off()