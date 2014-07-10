# setwd("/Users/Owner/Desktop/Coursera/ExploratoryDataAnalysis/ExData_Plotting1/")

# Load data using read.table
df <- read.table("./data/household_power_consumption.txt", 
                 header=TRUE, 
                 sep=";", 
                 na.strings="?",
                 stringsAsFactors=FALSE)

# Convert and combine Date and Time variables to Time
df$Time <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")

# Select/filter data to selected dates only 
df <- subset(df, Time >= as.POSIXlt("2007-02-01 00:00:00") &
                 Time <= as.POSIXlt("2007-02-02 23:59:59")) 

# Plot the 4 Charts 
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

plot(df$Time, df$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power")

plot(df$Time, df$Voltage, type="l",
     xlab="datetime", ylab="Voltage")

plot(df$Time, df$Sub_metering_1, type="l", col="black",
     xlab="", ylab="Energy sub metering")
lines(df$Time, df$Sub_metering_2, col="red")
lines(df$Time, df$Sub_metering_3, col="blue")
legend("topright",
       col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1,
       box.lwd=0)

plot(df$Time, df$Global_reactive_power, type="n",
     xlab="datetime", ylab="Global_reactive_power")
lines(df$Time, df$Global_reactive_power)

dev.off()
