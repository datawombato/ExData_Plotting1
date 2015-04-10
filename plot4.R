# get the data 
energydata <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = c("?"))
energydata$datetime <- as.POSIXct( paste(energydata$Date,energydata$Time), format = "%d/%m/%Y %H:%M:%S")
energydata$Date = as.Date(energydata$Date, "%d/%m/%Y")
df <- energydata[ energydata$Date >= as.Date("2007-02-01")  
                  & energydata$Date <= as.Date("2007-02-02"), ]

png(file = "plot4.png")  
## Open PNG device; create 'plot4.png' in my working directory
## Create plot and send to a file (no plot appears on screen)
par(mfrow = c(2,2))

#plot 2
with(df,
     plot(datetime,Global_active_power,type = "l", xlab="", 
          ylab = "Global Active Power (kilowatts)" )
)


#voltage plot
with(df,
     plot(datetime,Voltage,type = "l", xlab="datetime",   
          ylab = "Voltage" )
)

#plot 3
with(df,
{
  plot(datetime,Sub_metering_1, type="l", col = "black", 
       ylab="Energy sub metering", xlab = "")
  lines(datetime,Sub_metering_2, type="l", col = "red")
  lines(datetime,Sub_metering_3, type="l", col = "blue")
  legend("topright", lwd = 1, col = c("black","red","blue"),
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
}
)

#global reactive power plot
with(df,
     plot(datetime,Global_reactive_power,type = "l", xlab="datetime",   
          ylab = "Global_reactive_power" )
)



dev.off()  
## Close the PNG file device
## Now you can view the file 'plot4.png' on your computer