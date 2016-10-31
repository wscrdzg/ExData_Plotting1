# load data
house_p_consumption <- read.table("10.30_household_power_consumption.txt",
                                  header = T,sep = ";",na.strings = "?", stringsAsFactors = F)

# clear date and time format
library(lubridate)
house_p_consumption$date_time <- dmy_hms(paste(house_p_consumption$Date, house_p_consumption$Time, sep = " "))


# We will only be using data from the dates 2007-02-01 and 2007-02-02
house_p_consumption1 <- subset(house_p_consumption, 
                               Date == "1/2/2007" | Date == "2/2/2007")

# for plot 1
png("plot1.png") # the default is 480 * 480
hist(house_p_consumption1$Global_active_power, col = "red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

# for plot 2
png("plot2.png") # the default is 480 * 480
with(house_p_consumption1, plot(date_time, Global_active_power, type = "n",
                                xlab = "", ylab = "Global Active Power (kilowatts)"))
with(house_p_consumption1, lines(date_time, Global_active_power))
dev.off()

# for plot 3
png("plot3.png") # the default is 480 * 480
with(house_p_consumption1, plot(date_time, Sub_metering_1, type = "n",
                                xlab = "", ylab = "Energy sub metering"))
with(house_p_consumption1, lines(date_time, Sub_metering_1))
with(house_p_consumption1, lines(date_time, Sub_metering_2, col = "red"))
with(house_p_consumption1, lines(date_time, Sub_metering_3, col = "blue"))
legend("topright", 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black", "red","blue"), lty = 1, cex = 0.7)
dev.off()

# for plot 4
png("plot4.png") # the default is 480 * 480
par(mfrow = c(2,2))

# top_left
with(house_p_consumption1, plot(date_time, Global_active_power, type = "n",
                                xlab = "", ylab = "Global Active Power (kilowatts)"))
with(house_p_consumption1, lines(date_time, Global_active_power))

# top_right
with(house_p_consumption1, plot(date_time, Voltage, type = "n",
                                xlab = "datetime", ylab = "Voltage"))
with(house_p_consumption1, lines(date_time, Voltage))

# buttom_left
with(house_p_consumption1, plot(date_time, Sub_metering_1, type = "n",
                                xlab = "", ylab = "Energy sub metering"))
with(house_p_consumption1, lines(date_time, Sub_metering_1))
with(house_p_consumption1, lines(date_time, Sub_metering_2, col = "red"))
with(house_p_consumption1, lines(date_time, Sub_metering_3, col = "blue"))
legend("topright", 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black", "red","blue"), lty = 1, cex = 0.5, box.col = "white")

# buttom_right
with(house_p_consumption1, plot(date_time, Global_reactive_power, type = "n",
                                xlab = "datetime", ylab = "Global_reactive_power"))
with(house_p_consumption1, lines(date_time, Global_reactive_power))

# close device
dev.off()



