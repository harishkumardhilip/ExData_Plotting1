## Getting full dataset
power_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
power_data$Date <- as.Date(power_data$Date, format="%d/%m/%Y")

## Subsetting the data
req_data <- subset(power_data, (Date >= "2007-02-01" & Date <= "2007-02-02"))

#converting the time to readable format by R by prefixing date
datetime <- paste(as.Date(req_data$Date), req_data$Time)
req_data$Datetime <- as.POSIXct(datetime)

#Setting the frame to 2 x 2 matrix for plot
par(mfrow=c(2,2), mar=c(4,4,4,1))

## Creating the Plot
plot(with(req_data,Global_active_power~Datetime), type="l",ylab="Global Active Power (kilowatts)", xlab="")
plot(with(req_data,Voltage~Datetime), type="l",ylab="Voltage", xlab="datetime")
plot(with(req_data,Sub_metering_1~Datetime), type="l",ylab="Energy sub metering", xlab="")
lines(with(req_data,Sub_metering_2~Datetime),col='Red')
lines(with(req_data,Sub_metering_3~Datetime),col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", y.intersp=.3,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(with(req_data,Global_reactive_power~Datetime), type="l",ylab="Global_reactive_power",xlab="datetime")

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()