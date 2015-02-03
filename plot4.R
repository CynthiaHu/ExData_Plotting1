### Exploratory Data Analysis Project 1: Electric Power Consumption Plot4

# read the original data set; save and unzip the original data set folder in your working directory
data <- read.table("./exdata-data-household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
# take a look at the data
head(data)
str(data)
summary(data)


# subset the data set, 2880 obs
mydata <- data[(data$Date == "2/2/2007" | data$Date == "1/2/2007"),]
head(mydata)
tail(mydata)

# convert the Date and Time variables to Date/Time classes
mydata$DateTime <-strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M:%S")
str(mydata)
summary(mydata)


# plot 4

png(filename="plot4.png", width=480, height=480)   # choose PNG device
par(mfrow=c(2,2))
plot(mydata$DateTime, mydata$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
plot(mydata$DateTime, mydata$Voltage, type="l", ylab="Voltage", xlab="datetime")
plot(mydata$DateTime,mydata$Sub_metering_1,type="l", ylab="Energy sub metering", xlab="", col="black")
lines(mydata$DateTime,mydata$Sub_metering_2,type="l", col="red")
lines(mydata$DateTime,mydata$Sub_metering_3,type="l", col="blue")
legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1, 1, 1), bty="n")
plot(mydata$DateTime, mydata$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
dev.off() ##  close the PNG device!
