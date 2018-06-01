library(dplyr)
myDF <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", as.is=TRUE)
myDF <- mutate(myDF, Time = as.POSIXct(paste(myDF$Date, myDF$Time), format="%d/%m/%Y %H:%M:%S"))
myDF$Global_active_power <- as.numeric(myDF$Global_active_power)
mySub <- myDF[myDF$Time > "2007/01/31 23:59:59" & myDF$Time < "2007/02/03 00:00:00",]
par(mar = c(5,4,3,0))


plot(mySub$Global_active_power~mySub$Time, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "" )
png(filename = "Plot2.png", width = 480, height = 480, units = "px", pointsize = 12)
plot(mySub$Global_active_power~mySub$Time, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "" )
dev.off()