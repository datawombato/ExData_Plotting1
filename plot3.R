# get the data 
energydata <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = c("?"))
energydata$datetime <- as.POSIXct( paste(energydata$Date,energydata$Time), format = "%d/%m/%Y %H:%M:%S")
energydata$Date = as.Date(energydata$Date, "%d/%m/%Y")
df <- energydata[ energydata$Date >= as.Date("2007-02-01")  
                  & energydata$Date <= as.Date("2007-02-02"), ]

png(file = "plot3.png")  
## Open PNG device; create 'plot3.png' in my working directory
## Create plot and send to a file (no plot appears on screen)
with(df,
     {
     plot(datetime,Sub_metering_1, type="l", col = "black", 
          ylab="Energy sub metering", xlab = "")
     lines(datetime,Sub_metering_2, type="l", col = "red")
     lines(datetime,Sub_metering_3, type="l", col = "blue")
     }
)
legend("topright", lwd = 1, col = c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
## Annotate plot; still nothing on screen
dev.off()  
## Close the PNG file device
## Now you can view the file 'plot3.png' on your computer