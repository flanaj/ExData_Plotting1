library(dplyr)

#
# download data
#
fname <- "exdata_data_household_power_consumption.zip"
if (!file.exists(fname))
{
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(url, fname, method="curl")
}

#
# extract data
#
extractedfname <- "household_power_consumption.txt"
if (!file.exists(extractedfname))
{
  unzip(fname)
}

#
# read data from 2/1/2007 and 2/2/2007
#
colNames <- c("Date", "Time", "GlobalActivePower",  "GlobalReactivePower", "Voltage",  "GlobalIntensity", "SubMetering1", "SubMetering2", "SubMetering3")
dfpcd <- data.frame(matrix(vector(), 0, 9, dimnames=list(c(), colNames)), stringsAsFactors=FALSE)
con <- file(extractedfname, "r")
line <- readLines(con, n=1)
while (length(line) > 0)
{
  if (grepl("^(1/2/2007|2/2/2007)", line))
  {
    record <- strsplit(line, ";")[[1]]
    names(record) <- colNames
    dfpcd <- rbind(dfpcd, record)
  }
  line <- readLines(con, n=1)
}
close(con)
names(dfpcd) <- colNames

#
# data conversion
#
dfpcd <- mutate(dfpcd, DateTime=strptime(paste(Date,Time), format="%d/%m/%Y %H:%M:%S"), .after=Time)
dfpcd <- mutate(dfpcd, GlobalActivePower=as.double(GlobalActivePower))
dfpcd <- mutate(dfpcd, GlobalActivePower=as.double(GlobalActivePower))
dfpcd <- mutate(dfpcd, GlobalReactivePower=as.double(GlobalReactivePower))
dfpcd <- mutate(dfpcd, Voltage=as.double(Voltage))
dfpcd <- mutate(dfpcd, GlobalIntensity=as.double(GlobalIntensity))
dfpcd <- mutate(dfpcd, SubMetering1=as.double(SubMetering1))
dfpcd <- mutate(dfpcd, SubMetering2=as.double(SubMetering2))
dfpcd <- mutate(dfpcd, SubMetering3=as.double(SubMetering3))
dfpcd <- select(dfpcd, -c(Date, Time))