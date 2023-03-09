getwd()
file_name <- "household_power_consumption.txt"
elec_power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?")
elec_power <- elec_power[elec_power$Date %in% c("1/2/2007","2/2/2007"), ]
png("plot1.png", height=480, width=480)
hist(elec_power[, 3], col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab="frequency")
dev.off()