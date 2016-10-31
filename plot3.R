# load data
house_p_consumption <- read.table("10.30_household_power_consumption.txt",
                                  header = T,sep = ";",na.strings = "?", stringsAsFactors = F)

# clear date and time format
library(lubridate)
house_p_consumption$date_time <- dmy_hms(paste(house_p_consumption$Date, house_p_consumption$Time, sep = " "))

# We will only be using data from the dates 2007-02-01 and 2007-02-02
house_p_consumption1 <- subset(house_p_consumption, 
                               Date == "1/2/2007" | Date == "2/2/2007")

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
