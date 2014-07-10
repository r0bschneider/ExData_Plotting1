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

# Plot Histogram for Global Active Power 
png("plot1.png", width=480, height=480)

hist(df$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     col="red")

dev.off()
