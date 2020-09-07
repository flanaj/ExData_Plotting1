#
# source setup routine
#
if (!exists("dfpcd")) source("setupdata.R")

#
# set dev to png file
#
png(filename="plot4.png", width=480, height=480)

#
# Build 4 plots square
#
par(mfcol=c(2,2))

plot(dfpcd$DateTime, dfpcd$GlobalActivePower, type="l", xlab="datetime", ylab="Global Active Power")

plot(dfpcd$DateTime, dfpcd$SubMetering1, type="n", xlab="dattime", ylab="Energy sub metering")
points(dfpcd$DateTime, dfpcd$SubMetering1, type="l", col="black")
points(dfpcd$DateTime, dfpcd$SubMetering2, type="l", col="red")
points(dfpcd$DateTime, dfpcd$SubMetering3, type="l", col="blue")

plot(dfpcd$DateTime, dfpcd$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(dfpcd$DateTime, dfpcd$GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

#
# turn off png dev
#
dev.off()
