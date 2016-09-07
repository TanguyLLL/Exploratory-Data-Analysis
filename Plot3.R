# 1) checks if the file exists (for portability); If not, downloads it. Then make changes to the date and build graph

url<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
file<- "exdata%2Fdata%2Fhousehold_power_consumption.zip"

if(!file.exists(file)) { download(url, file, mode = "wb"); 
        unzip(filename)
}


dataN <- read.csv("household_power_consumption.txt", sep=";")
dataN <- dataN[dataN$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(dataN$Date, dataN$Time), "%d/%m/%Y %H:%M:%S") 


png("plot3.png", width=480, height=480)


plot(datetime, dataN$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(datetime, dataN$Sub_metering_2, col= "orange", type = "l")
lines(datetime, dataN$Sub_metering_3, col= "blue", type = "l")
legend(x="topright", names(dataN[,c(7,8,9)]), lty = 1, col = c("black", "orange", "blue"))

dev.off()

