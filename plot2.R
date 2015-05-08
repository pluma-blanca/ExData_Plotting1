dataset <- read.table("data/household_power_consumption.txt", header=TRUE, sep=";")
head(dataset)
dates <- as.Date(dataset$Date, "%d/%m/%Y")
dataset$Date  <- dates
mydays <- dataset[dataset$Date >= "2007-02-01" & dataset$Date <= "2007-02-02", ]
mydays <-  transform(mydays, hourly=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png", width=480, height=480)
plot(mydays$hourly, as.numeric(as.character(mydays$Global_active_power)), type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()

