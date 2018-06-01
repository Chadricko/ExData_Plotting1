setwd("C:/Users/R/Desktop/JH Certificate Program/Course_4")
list.files()
myDF <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", as.is=TRUE)
myDF <- mutate(myDF, Time = as.POSIXct(paste(myDF$Date, myDF$Time), format="%d/%m/%Y %H:%M:%S"))
myDF$Global_active_power <- as.numeric(myDF$Global_active_power)
mySub <- myDF[myDF$Time > "2007/01/31 23:59:59" & myDF$Time < "2007/02/03 00:00:00",]
par(mar = c(5,4,3,0))


plot(mySub$Sub_metering_1~mySub$Time, type = 'l', ylab = "Energy sub metering", xlab="")
lines(mySub$Sub_metering_2~mySub$Time, type = 'l', col = "red")
lines(mySub$Sub_metering_3~mySub$Time, type = 'l', col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
png(filename = "Plot3.png", width = 480, height = 480, units = "px", pointsize = 12) 
plot(mySub$Sub_metering_1~mySub$Time, type = 'l')
lines(mySub$Sub_metering_2~mySub$Time, type = 'l', col = "red")
lines(mySub$Sub_metering_3~mySub$Time, type = 'l', col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
dev.off()
