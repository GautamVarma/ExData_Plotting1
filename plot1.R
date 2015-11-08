## checking the working directory
if (!getwd() == "C:/Users/gauta/Documents/R/data")
  setwd("C:/Users/gauta/Documents/R/data")
getwd()

## reading data - replacing nulls
DT <- read.table("household_power_consumption.txt", 
                 header = TRUE, sep = ';', na.strings = "?")

## formatting date value to date and subsetting data
DT$Date <- as.Date(DT$Date, format="%d/%m/%Y")
DT <- subset(DT, DT$Date >="2007-02-01" 
             & DT$Date <="2007-02-01")

## openning the output grpahics file
png (file = "plot1.png", height=480, width=480, bg = "white" )

## histogram of global active power
hist(DT$Global_active_power, 
     col = "red", 
     xlab = "Global Active Power (Kilowats)",
     ylab = "Frequency", 
     main = "Global Active Power")

##closing the graph output
dev.off()
