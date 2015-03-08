setwd(readClipboard())

datatable <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?",
    col.names = c("Date", "Time", "GlobalActivePower",
                    "GlobalReactivePower", "Voltage", "GlobalIntensity",
                    "Submetering1", "Submetering2", "Submetering3"),
    colClasses = c( "character", "character", "numeric",
       "numeric", "numeric", "numeric", "numeric",
       "numeric", "numeric"))

filterdata <- with(subset(datatable, Date == "1/2/2007" | Date == "2/2/2007"),
                   data.frame(Date, Time,
                              GlobalActivePower, GlobalReactivePower, Voltage,
                              GlobalIntensity, Submetering1, Submetering2, Submetering3))

png(filename = "plot1.png", width = 480, height=480)
hist(filterdata$GlobalActivePower, col = "red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()