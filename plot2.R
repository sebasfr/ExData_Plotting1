setwd("~/ExData_Plotting1")

## Reading the file and selecting the needed dates

dF <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
dF$Time <- paste(dF$Date, dF$Time)
dF$Time <- strptime(dF$Time, format = "%d/%m/%Y %H:%M:%S")
dF$Date <- as.Date(dF$Time)
dF <- dF[dF$Date == "2007-02-02" | dF$Date == "2007-02-01", ]

## Generating the plot

with(dF, plot(Time, Global_active_power, type = "l", ylab="Global Active Power (kilowatts)", xlab=""))

## Exporting the plot as required

dev.copy(png, file = "plot2.png", height=480, width = 480)
dev.off()