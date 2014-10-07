# setwd("~/Documents/github_repositories/exploratory_data_analysis")
library(lubridate)
data <- read.table('household_power_consumption.txt', header = TRUE, na.strings = '?', sep = ';')

## clean data for downstream analysis
names(data) <- tolower(names(data))
data$all_time <- paste(data$date, data$time, sep = ' ')
data$time_2 <- dmy_hms(data$all_time)
data$date <- dmy(data$date)
new.data <- data[data$date == ymd(20070201) | data$date == ymd(20070202),]

## look for NA values in new.data
sapply(new.data, FUN = function(x) {sum(is.na(x))}) ## there are 0 NA values in new.data

## create plots
png('plot4.png', height = 480, width = 480)

par(mfrow = c(2,2)) ## create 2 x 2 graph grid

## plot 1
plot(new.data$time_2, new.data$global_active_power, type = 'l', xlab = '', ylab = 'Global Active Power (kilowatts)')

## plot 2
plot(new.data$time_2, new.data$voltage, type = 'l', xlab = 'datetime', ylab = 'Voltage')

## plot 3
plot(new.data$time_2, new.data$sub_metering_1, type = 'l', xlab = '', ylab = 'Energy sub metering')
lines(new.data$time_2, new.data$sub_metering_2, col = 'red')
lines(new.data$time_2, new.data$sub_metering_3, col = 'blue')
legend('topright', c('sub_metering_1','sub_metering_2','sub_metering_3'), lty = 1, col = c('black', 'red', 'blue'), bty = 'n')

## plot 4
plot(new.data$time_2, new.data$global_reactive_power, type = 'l', xlab = 'datetime', ylab = 'Global_reactive_power')

dev.off()

