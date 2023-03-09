getwd()
file_name <- "household_power_consumption.txt"
elec_power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?")
elec_power <- elec_power[elec_power$Date %in% c("1/2/2007","2/2/2007"), ]
date_converted <- as.Date(elec_power[, 1], format = "%d/%m/%Y")
time_converted <- strptime(elec_power[, 2], format = "%H:%M:%S")
time_axis <- as.POSIXct(paste(date_converted, elec_power[, 2]))
png("plot3.png", height=480, width=480)
plot(time_axis, elec_power[, 7], xlab = "", ylab = "Energy sub metering", type = "l")
lines(time_axis, elec_power[, 8], col = "red")
lines(time_axis, elec_power[, 9], col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black","red","blue"), lty = 1)
dev.off()