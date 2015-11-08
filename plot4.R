if (!getwd() == "C:/Users/gauta/Documents/R/data")   setwd("C:/Users/gauta/Documents/R/data")
getwd()

DT <- read.table("household_power_consumption.txt", header = TRUE , sep = ';', na.strings = "?")

DT$Timestamp <- strptime(paste(DT$Date,DT$Time), format="%d/%m/%Y %H:%M:%S")

DT <- subset(DT,as.Date(DT$Timestamp) >= "2007-02-01" & as.Date(DT$Timestamp) < "2007-02-03")

png (file = "plot4.png", height = 480, width = 480, bg = "white" )

par(mfrow = c(2,2) )
with( DT, {
  plot(DT$Timestamp, DT$Global_active_power,xlab  ="", ylab = "Global Active Power", type ="l")
  plot(DT$Timestamp, DT$Voltage,xlab = "datetime", ylab = "", type ="l")
  
  plot(DT$Timestamp, DT$Sub_metering_1 , xlab = "",ylab = "Energy Sub Metering", type ="l")
  lines(DT$Timestamp, DT$Sub_metering_2, col ="red")
  lines(DT$Timestamp, DT$Sub_metering_3, col ="blue")
  legend("topright", col =c("black","red","blue") ,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd = 1)
  
  plot(DT$Timestamp, DT$Global_reactive_power,xlab = "datetime", ylab = "Global Reactive Power", type ="l")
  })

dev.off()
