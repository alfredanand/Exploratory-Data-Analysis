#Load data
data=read.csv("./household_power_consumption.txt", sep=";", na.string="?")

#Subset
data2=data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"), ]

#Correct format
data2$dateTime <- as.POSIXct(strptime(paste(data2$Date,data2$Time), "%d/%m/%Y %T"))

#Plot 1
png(filename = "Plot1.png", width = 480, height = 480)
hist(data2$Global_active_power,xlab="Global Active Power (kilowatts)", main="Global Active Power",col="red")
dev.off()