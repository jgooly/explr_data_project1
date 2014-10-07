# setwd("~/Documents/github_repositories/exploratory_data_analysis")
library(lubridate)

data <- read.table('household_power_consumption.txt', header = TRUE, na.strings = '?', sep = ';')
names(data) <- tolower(names(data))
data$date <- dmy(data$date)
new.data <- data[data$date == ymd(20070201) | data$date == ymd(20070202),]

## look for NA values in new.data
sapply(new.data, FUN = function(x) {sum(is.na(x))}) ## there are 0 NA values in new.data

plot1 <- hist(new.data$global_active_power, main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)', col = 'red')

dev.copy(png, file = 'plot1.png')
dev.off()
