## Getting full dataset
power_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
power_data$Date <- as.Date(power_data$Date, format="%d/%m/%Y")

## Subsetting the data
req_data <- subset(power_data, (Date >= "2007-02-01" & Date <= "2007-02-02"))

#converting the time to readable format by R by prefixing date
datetime <- paste(as.Date(req_data$Date), req_data$Time)
req_data$Datetime <- as.POSIXct(datetime)

## Creating the Plot
plot(with(req_data,Global_active_power~Datetime), type="l",ylab="Global Active Power (kilowatts)", xlab="")

## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
