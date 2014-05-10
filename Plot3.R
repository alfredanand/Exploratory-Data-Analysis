#Load data
data=read.csv("./household_power_consumption.txt", sep=";", na.string="?")

#Subset
data2=data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"), ]

#Correct format
data2$dateTime <- as.POSIXct(strptime(paste(data2$Date,data2$Time), "%d/%m/%Y %T"))

#Plot 3
png(filename = "Plot3.png", width = 480, height = 480)
plot(data2$dateTime,data2$Sub_metering_1,type="l",xlab="",ylab="Global Active Power (kilowatts)",col="black")
lines(data2$dateTime,data2$Sub_metering_2,type="l",col="red")
lines(data2$dateTime,data2$Sub_metering_3,type="l",col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)
dev.off()