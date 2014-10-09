library("dplyr")
library("lubridate")

#reading data from file
data.frame = read.csv("household_power_consumption.txt", sep=";", na.strings= "?")

#processing data
data = tbl_df(data.frame)
data = filter(data, Date == '1/2/2007' | Date == '2/2/2007')
data = mutate(data, datetime = dmy_hms(paste(data$Date, data$Time, sep = " ")))

#creating plot 4
png(file = "plot4.png", bg = "white", width = 480, height = 480)
par(mfrow = c(2, 2))
plot(data$datetime, data$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")
plot(data$datetime, data$Voltage, xlab = "Datetime", ylab = "Voltage", type = "l")
plot(data$datetime, data$Sub_metering_1,main = "", ylab = "Energy sub metering", type = "l", xlab = "")
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
lines(data$datetime, data$Sub_metering_2, type = "l", col = "red")
lines(data$datetime, data$Sub_metering_3, type = "l", col = "blue")
plot(data$datetime, data$Global_reactive_power, xlab = "Datetime", ylab = "Global_reactive_power", type = "l")
dev.off()