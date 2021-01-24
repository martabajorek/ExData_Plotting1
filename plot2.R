Sys.setlocale("LC_ALL","English")

data <- read.table('household_power_consumption.txt', sep = ';', header=T, na.strings = '?')
data <- subset(data,Date %in% c('1/2/2007','2/2/2007'))

data$DateTime <- strptime(paste(data$Date,data$Time),format='%d/%m/%Y %H:%M:%S')


plot(data$DateTime,data$Global_active_power, ylab='Global Active Power (kilowatts)',xlab = '',type = 'n')
lines(data$DateTime, data$Global_active_power, col='black')

dev.copy(device = png, filename = "plot2.png", width = 480, height = 480, units = "px")
dev.off()


