data <- read.table("household_power_consumption.txt", sep= ";", header=TRUE, colClasses="character", na.strings="?")

data[,"DateTime"] <- as.POSIXct(paste(data[,"Date"], data[,"Time"]), format="%d/%m/%Y %H:%M:%S")

filterdata<- subset(data, DateTime >= "2007-02-01" & DateTime < "2007-02-03")

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

with(filterdata, {
  plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power", xlab= "")
  
  plot(DateTime, Voltage, type = "l")
  
  plot(DateTime, Sub_metering_1, type = "l", col="black", ylab = "Energy sub metering", xlab = "")
  lines(DateTime, Sub_metering_2, col = "red")
  lines(DateTime, Sub_metering_3, col = "blue")
  legend("topright", col = c("black", "red", "blue"), cex = .5, bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1))
  
  plot(DateTime, Global_reactive_power, type = "l")
})

dev.off()