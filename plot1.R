# This first part loads 2 libraries (please check you have them installed first). Then, it checks if the zip file is present.
# If not, it will download it and unzip it.

library(dplyr)
library(downloader)

url<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
file<- "exdata%2Fdata%2Fhousehold_power_consumption.zip"

if(!file.exists(file)) { download(url, file, mode = "wb"); 
        unzip(filename)
}
        

# Second phase is to read the data and to select the required rows only.


dataSet<- read.csv("household_power_consumption.txt", sep = ";")
dataSet<- mutate(dataSet, Date = as.Date(Date, format = "%d/%m/%Y"))

d<- filter(dataSet, Date == "2007/02/01")
e<- filter(dataSet, Date == "2007/02/02")
dataSet<- bind_rows(d,e)

# Third phase creates the requested graph in PNG format.

png(filename = "plot1.png", width = 480, height = 480)
hist((as.numeric(dataSet$Global_active_power)/500), col= "chocolate1", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")                 
dev.off()                 