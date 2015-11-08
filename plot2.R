## checking the working directory
if (!getwd() == "C:/Users/gauta/Documents/R/data")   
  setwd("C:/Users/gauta/Documents/R/data")
getwd()

## reading data - replacing nulls
DT <- read.table("household_power_consumption.txt", 
                 header = TRUE, sep = ';', na.strings = "?")

## creating the a new column --timestamp
DT$Timestamp <- strptime(paste(DT$Date,DT$Time), 
                         format="%d/%m/%Y %H:%M:%S")

## subsetting the data
DT <- subset(DT,as.Date(DT$Timestamp) >= "2007-02-01" & 
               as.Date(DT$Timestamp) < "2007-02-03")

## openning the output grpahics file
png (file = "plot2.png", height = 480, width = 480, bg = "white" )
plot(DT$Timestamp, DT$Global_active_power,
     ylab = "Global Active Power (Kilowatts)", type ="l")
##closing the graph output
dev.off()
