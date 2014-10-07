library("dplyr")
library("lubridate")

#reading file
data.frame = read.csv("household_power_consumption.txt", sep=";", na.strings= "?")

#processing data
data = tbl_df(data.frame)
data = filter(data, Date == '1/2/2007' | Date == '2/2/2007')
data = mutate(data, datetime = dmy_hms(paste(data$Date, data$Time, sep = " ")))

#creating plot2
png(file = "plot2.png", bg = "white", width = 480, height = 480)
plot(data$datetime, data$Global_active_power, ylab = "Global Active Power (kilowatts)", main = "", type = "l")
dev.off()
