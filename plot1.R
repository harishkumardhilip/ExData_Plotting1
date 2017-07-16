## Getting full dataset
power_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
power_data$Date <- as.Date(power_data$Date, format="%d/%m/%Y")

## Subsetting the data
req_data <- subset(power_data, (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Creating the Histogram
hist(req_data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="orangered2")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
