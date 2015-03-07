
#File in working directory
houseCon <- read.table("household_power_consumption.txt", sep=";" , header=T, na.strings ="?", colClasses = "character" )

#Callig dplyr package for subseting and manage DB
library(dplyr)

#Converting "Date" to Date Class
houseCon$Date <- as.Date(houseCon$Date, "%d/%m/%Y")

#subseting by given Dates
date1 <- as.Date("01/02/2007", "%d/%m/%Y")
date2<- as.Date("02/02/2007", "%d/%m/%Y")

houseCon <- filter(houseCon, Date == date1 | Date == date2)

time <- strptime(houseCon$Time, format = "%H:%M:%S")

Date <- paste(houseCon$Date, houseCon$Time)

houseCon <- mutate(houseCon, DateTime = paste(houseCon$Date, houseCon$Time))

houseCon$DateTime <- strptime(houseCon2$DateTime, "%Y-%m-%d %H:%M:%S")

#converting to class numeric the plotting variable
for(i in 3:9){
        houseCon[,i] <- as.numeric(houseCon[,i])        
}

Sys.setlocale("LC_TIME", "English")


png("plot4.png", height = 480, width = 480)

par(mfcol=c(2,2), mar=c(5,4,4,2), cex=0.8)

#Grafico 1
with(houseCon, plot( DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power" ))
#Grafico 2
plot( houseCon$DateTime,houseCon$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering")
lines( houseCon$DateTime,houseCon$Sub_metering_2, type = "l", col= "red") 
lines( houseCon$DateTime,houseCon$Sub_metering_3, type = "l", col= "blue")
legend("topright", bty="n", lty=1, col= c("black", "red", "blue"), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#Grafico 3
with(houseCon, plot( DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage" ))
#Grafico 4
with(houseCon, plot( DateTime, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power" ))

dev.off()



