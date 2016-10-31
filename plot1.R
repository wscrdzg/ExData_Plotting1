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
