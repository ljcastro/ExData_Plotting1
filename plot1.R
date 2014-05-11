
#Reading the data and processing NA values
epc <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",
                  stringsAsFactors=FALSE,skip=66637,nrows=2880,
                  col.names=c("Date","Time","Global_active_power","Global_reactive_power",
                              "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",
                              "Sub_metering_3"))
epc <- na.omit(epc)
str(epc)

#Converting columns to date format
epc$DateTime <- strptime(paste(epc$Date, epc$Time), format="%d/%m/%Y %H:%M:%S")
epc$Date <- as.Date(epc$Date,format="%d/%m/%Y")

#plot1
#Show the plot on screen

hist(epc$Global_active_power,col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency")

#Create a PNG file with the plot
png("plot1.png",width=480,height=480)
hist(epc$Global_active_power,col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency")

#Close the device
dev.off()
