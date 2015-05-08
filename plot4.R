dataset <- read.table("data/household_power_consumption.txt", header=TRUE, sep=";")
head(dataset)
dates <- as.Date(dataset$Date, "%d/%m/%Y")
dataset$Date  <- dates
mydays <- dataset[dataset$Date >= "2007-02-01" & dataset$Date <= "2007-02-02", ]
mydays <-  transform(mydays, hourly=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

png(filename = "plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(mydays$hourly, as.numeric(as.character(mydays$Global_active_power)), type="l",
     xlab="",
     ylab="Global Active Power")
plot(mydays$hourly, as.numeric(as.character(mydays$Voltage)), type="l",
     xlab="datetime",
     ylab="Voltage")
plot(mydays$hourly, mydays$Sub_metering_1, type="l",
     xlab="",
     ylab="Energy sub metering")
lines(mydays$hourly, mydays$Sub_metering_2, col="red")
lines(mydays$hourly, mydays$Sub_metering_3, col="blue")
legend("topright", bty="n", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "), lty=c(1,1)) 
plot(mydays$hourly, as.numeric(as.character(mydays$Global_reactive_power)), type="l",
     xlab="datetime",
     ylab="Global_reactive_power")

dev.off()