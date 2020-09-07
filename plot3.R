#
# source setup routine
#
if (!exists("dfpcd")) source("setupdata.R")

#
# set dev to png file
#
png(filename="plot3.png", width=480, height=480)

#
# Build Energy sub metering by Day Line plot
#
plot(dfpcd$DateTime, dfpcd$SubMetering1, type="n", xlab="", ylab="Energy sub metering")
points(dfpcd$DateTime, dfpcd$SubMetering1, type="l", col="black")
points(dfpcd$DateTime, dfpcd$SubMetering2, type="l", col="red")
points(dfpcd$DateTime, dfpcd$SubMetering3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)

#
# turn off png dev
#
dev.off()
