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

png(filename = "plot3.png", width = 480, height=480)

plot(filterdata$Time, filterdata$Submetering1, type="n", xlab="", ylab="Energy sub metering")
points(filterdata$Time, filterdata$Submetering1, type="l", col="black")
points(filterdata$Time, filterdata$Submetering2, type="l", col="red")
points(filterdata$Time, filterdata$Submetering3, type="l", col="blue")
legend("topright", col=c("black", "red", "blue"), lty=c(1,1,1), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
