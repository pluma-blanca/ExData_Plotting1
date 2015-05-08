dataset <- read.table("data/household_power_consumption.txt", header=TRUE, sep=";")
head(dataset)
dates <- as.Date(dataset$Date, "%d/%m/%Y")
dataset$Date  <- dates
mydays <- dataset[dataset$Date >= "2007-02-01" & dataset$Date <= "2007-02-02", ]
mydays <-  transform(mydays, hourly=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

png(filename = "plot1.png", width=480, height=480)
hist(as.numeric(as.character(mydays$Global_active_power)), breaks=18, main="Global Active Power",
         xlab="Global Active Power (kilowatts)", col="red")
dev.off()
