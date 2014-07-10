# setwd("/Users/Owner/Desktop/Coursera/ExploratoryDataAnalysis/ExData_Plotting1/")

# Load data
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

# Plot Overlay Line Charts for Energy Sub Meterings 
png("plot3.png", width=480, height=480)

plot(df$Time, df$Sub_metering_1, type="l", col="black",
     xlab="", ylab="Energy sub metering")
lines(df$Time, df$Sub_metering_2, col="red")
lines(df$Time, df$Sub_metering_3, col="blue")


legend("topright",
       col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1)

dev.off()
