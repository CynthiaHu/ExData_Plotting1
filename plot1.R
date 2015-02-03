### Exploratory Data Analysis Project 1: Electric Power Consumption Plot1

# read the original data set
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


# plot 1
png(filename="plot1.png", width=480, height=480)   # choose PNG device
par(mar=c(6,4,4,2))
hist(mydata$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power",col="red")
dev.off() ##  close the PNG device!
