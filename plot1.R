data <- read.table("household_power_consumption.txt", sep= ";", header=TRUE, colClasses="character", na.strings="?")

data[,"Date"] <- as.Date(data[,"Date"], format="%d/%m/%Y")

filterdata<- subset(data, Date=="2007-02-01" | Date=="2007-02-02")

names(filterdata)

png("plot1.png", width = 480, height = 480)

hist(as.numeric(filterdata$Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()