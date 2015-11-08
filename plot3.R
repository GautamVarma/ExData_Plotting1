## checking the working directory
if (!getwd() == "C:/Users/gauta/Documents/R/data")   
  setwd("C:/Users/gauta/Documents/R/data")
getwd()

## reading data - replacing nulls
DT <- read.table("household_power_consumption.txt", 
                 header = TRUE , sep = ';', na.strings = "?")

## creating the a new column --timestamp
DT$Timestamp <- strptime(paste(DT$Date,DT$Time), format="%d/%m/%Y %H:%M:%S")

## subsetting the data
DT <- subset(DT,as.Date(DT$Timestamp) >= "2007-02-01" 
             & as.Date(DT$Timestamp) < "2007-02-03")
## openning the output grpahics file

png (file = "plot3.png", height=480, width=480, bg="white" )

##to create a line plot
plot(DT$Timestamp, DT$Sub_metering_1 , xlab = "",ylab = "Energy Sub Metering", type ="l")

##add more line to the above plot
lines(DT$Timestamp, DT$Sub_metering_2, col ="red")
lines(DT$Timestamp, DT$Sub_metering_3, col ="blue")

## to add custom legend to the above graph
legend("topright", col =c("black","red","blue") ,  lwd = 1,
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
##closing graph output
dev.off()
