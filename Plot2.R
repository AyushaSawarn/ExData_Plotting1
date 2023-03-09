getwd()
file_name <- "household_power_consumption.txt"
elec_power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?")
elec_power <- elec_power[elec_power$Date %in% c("1/2/2007","2/2/2007"), ]
date_converted <- as.Date(elec_power[, 1], format = "%d/%m/%Y")
time_converted <- strptime(elec_power[, 2], format = "%H:%M:%S")
time_axis <- as.POSIXct(paste(date_converted, elec_power[, 2]))
png("plot2.png", height=480, width=480)
plot(time_axis, elec_power[, 3], xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()