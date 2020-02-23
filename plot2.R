data <- read.table("household_power_consumption.txt", sep= ";", header=TRUE, colClasses="character", na.strings="?")

data[,"DateTime"] <- as.POSIXct(paste(data[,"Date"], data[,"Time"]), format="%d/%m/%Y %H:%M:%S")

filterdata<- subset(data, DateTime >= "2007-02-01" & DateTime < "2007-02-03")

png("plot2.png", width = 480, height = 480)

with(filterdata, plot(DateTime, as.numeric(Global_active_power), type = "l", ylab = "Global Active Power (kilowatts)", xlab= ""))

dev.off()