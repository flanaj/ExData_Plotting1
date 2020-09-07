#
# source setup routine
#
if (!exists("dfpcd")) source("setupdata.R")

#
# set dev to png file
#
png(filename="plot1.png", width=480, height=480)

#
# Build Global Active Power Histogram 
#
hist(dfpcd$GlobalActivePower, main="Global Active Power", xlab="Global Active Power(kilowatts)", col="Red")

#
# turn off png dev
#
dev.off()
