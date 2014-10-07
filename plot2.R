# setwd("~/Documents/github_repositories/exploratory_data_analysis")
library(lubridate)
data <- read.table('household_power_consumption.txt', header = TRUE, na.strings = '?', sep = ';')
names(data) <- tolower(names(data))
data$all_time <- paste(data$date, data$time, sep = ' ')
data$time_2 <- dmy_hms(data$all_time)

data$date <- dmy(data$date)
new.data <- data[data$date == ymd(20070201) | data$date == ymd(20070202),]

## look for NA values in new.data
sapply(new.data, FUN = function(x) {sum(is.na(x))}) ## there are 0 NA values in new.data

plot(new.data$time_2, new.data$global_active_power, type = 'l', xlab = '', ylab = 'Global Active Power (kilowatts)')

## output to png
dev.copy(png, file = 'plot2.png')
dev.off()

