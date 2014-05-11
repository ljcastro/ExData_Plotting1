
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

#plot2
#change locale for English weekdays
Sys.setlocale("LC_TIME","en_US")

#Show the plot on screen
plot(epc$DateTime,epc$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(epc$DateTime,epc$Global_active_power)

#Create a PNG file with the plot
png("plot2.png",width=480,height=480)
plot(epc$DateTime,epc$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(epc$DateTime,epc$Global_active_power)

#Close the device
dev.off()

