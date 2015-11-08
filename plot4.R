## checking the working directory
if (!getwd() == "C:/Users/gauta/Documents/R/data")   
  setwd("C:/Users/gauta/Documents/R/data")
getwd()

## reading data - replacing nulls
DT <- read.table("household_power_consumption.txt", 
                 header = TRUE , sep = ';', na.strings = "?")

## creating the a new column --timestamp
DT$Timestamp <- strptime(paste(DT$Date,DT$Time), 
                         format="%d/%m/%Y %H:%M:%S")

## subsetting the data
DT <- subset(DT,as.Date(DT$Timestamp) >= "2007-02-01" 
             & as.Date(DT$Timestamp) < "2007-02-03")

## openning the output grpahics file
png (file = "plot4.png", height = 480, width = 480, bg = "white" )

## initializing parameters to format the graph output
par(mfrow = c(2,2) )
with( DT, {
  #plot1
  plot(DT$Timestamp, DT$Global_active_power,
       xlab  ="", ylab ="Global Active Power", type ="l")
  
  #plot2
  plot(DT$Timestamp, DT$Voltage,
       xlab = "datetime", ylab = "", type ="l")
  
  #plot3
  plot(DT$Timestamp, DT$Sub_metering_1 , xlab = "",ylab = "Energy Sub Metering", type ="l")
  lines(DT$Timestamp, DT$Sub_metering_2, col ="red")
  lines(DT$Timestamp, DT$Sub_metering_3, col ="blue")
  legend("topright", col =c("black","red","blue") ,
         legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd = 1)
  
  #plot4
  plot(DT$Timestamp, DT$Global_reactive_power,
       xlab = "datetime", ylab = "Global Reactive Power", type ="l")
  })

##closing graph output
dev.off()
