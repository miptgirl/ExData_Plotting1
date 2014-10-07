library("dplyr")
library("lubridate")

#reading data from file
data.frame = read.csv("household_power_consumption.txt", sep=";", na.strings= "?")

#processing data
data = tbl_df(data.frame)
data = filter(data, Date == '1/2/2007' | Date == '2/2/2007')
data = mutate(data, datetime = dmy_hms(paste(data$Date, data$Time, sep = " ")))

#creating plot 3
png(file = "plot3.png", bg = "white", width = 480, height = 480)
plot(data$datetime, data$Sub_metering_1,main = "", ylab = "Energy sub metering", type = "l", xlab = "")
lines(data$datetime, data$Sub_metering_2, type = "l", col = "red")
lines(data$datetime, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
