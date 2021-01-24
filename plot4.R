Sys.setlocale("LC_ALL","English")

data <- read.table('household_power_consumption.txt', sep = ';', header=T, na.strings = '?')
data <- subset(data,Date %in% c('1/2/2007','2/2/2007'))

data$DateTime <- strptime(paste(data$Date,data$Time),format='%d/%m/%Y %H:%M:%S')

par(mfrow=c(2,2))

plot(data$DateTime,data$Global_active_power, ylab='Global Active Power',xlab = '',type = 'n')
lines(data$DateTime, data$Global_active_power, col='black')

plot(data$DateTime,data$Voltage, ylab='Voltage',xlab = 'datetime',type = 'n')
lines(data$DateTime, data$Voltage, col='black')

plot(data$DateTime,data$Sub_metering_1, ylab='Energy sub meetering',xlab = '',type = 'n')
lines(data$DateTime,data$Sub_metering_1, col='black')
lines(data$DateTime,data$Sub_metering_2, col='red')
lines(data$DateTime,data$Sub_metering_3, col='blue')
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lty=1, cex=0.6, text.width = 50000)

plot(data$DateTime,data$Global_reactive_power, ylab='Global_reactive_power',xlab = 'datetime',type = 'n')
lines(data$DateTime, data$Global_reactive_power, col='black')

dev.copy(device = png, filename = "plot4.png", width = 480, height = 480, units = "px")
dev.off()


