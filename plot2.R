#
# source setup routine
#
if (!exists("dfpcd")) source("setupdata.R")

#
# set dev to png file
#
png(filename="plot2.png", width=480, height=480)

#
# Build Global Active Power by Day Line plot
#
plot(dfpcd$DateTime, dfpcd$GlobalActivePower, type="l", xlab="", ylab="Global Active Power(kilowatts)")

#
# turn off png dev
#
dev.off()
