### Exploratory Data Analysis Project 1: Electric Power Consumption Plot12
d the original data set; save and unzip the original data set folder in your working directory
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


# plot 2
png(filename="plot2.png", width=480, height=480)   # choose PNG device
plot(mydata$DateTime, mydata$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="") 
dev.off() ##  close the PNG device!
