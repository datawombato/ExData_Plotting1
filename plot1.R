# get the data 
energydata <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = c("?"))
energydata$datetime <- as.POSIXct( paste(energydata$Date,energydata$Time), format = "%d/%m/%Y %H:%M:%S")
energydata$Date = as.Date(energydata$Date, "%d/%m/%Y")
df <- energydata[ energydata$Date >= as.Date("2007-02-01")  
                  & energydata$Date <= as.Date("2007-02-02"), ]

png(file = "plot1.png")  
## Open PNG device; create 'plot1.png' in my working directory
## Create plot and send to a file (no plot appears on screen)
hist(df$Global_active_power, 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power",
     col = "red"
     )
## Annotate plot; still nothing on screen
dev.off()  
## Close the PNG file device
## Now you can view the file 'plot1.png' on your computer