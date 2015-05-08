dataset <- read.table("data/household_power_consumption.txt", header=TRUE, sep=";")
head(dataset)
dates <- as.Date(dataset$Date, "%d/%m/%Y")
dataset$Date  <- dates
mydays <- dataset[dataset$Date >= "2007-02-01" & dataset$Date <= "2007-02-02", ]
mydays <-  transform(mydays, hourly=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

png(filename = "plot3.png", width=480, height=480)
plot(mydays$hourly, mydays$Sub_metering_1, type="l",
     xlab="",
     ylab="Energy sub metering")
lines(mydays$hourly, mydays$Sub_metering_2, col="red")
lines(mydays$hourly, mydays$Sub_metering_3, col="blue")
legend("topright", col=c("black","red","blue"), 
       c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")) 

dev.off()