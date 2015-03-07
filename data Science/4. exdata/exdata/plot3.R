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
houseCon$Global_active_power <- as.numeric(houseCon$Global_active_power)

#My computer is in Spanish so I need to change to English in order to get date labels match the language
Sys.setlocale("LC_TIME", "English")

#Export to png and ploting

ejeY <- c(0, 30)


png("plot3.png", height = 480, width = 480)
with(houseCon, plot( DateTime, Sub_metering_1, type = "l", col= "black", xlab = "", ylab = "Energy Sub Metering") )
par(new=T)
with(houseCon, plot( DateTime, Sub_metering_2, type = "l", col= "red",  xlab = "", ylab = "", axes= F, ylim=ejeY  ) )
par(new=T)
with(houseCon, plot( DateTime, Sub_metering_3, type = "l", col= "blue", xlab = "", ylab = "", axes= F, ylim=ejeY  ) )


legend("topright", lty=1, col= c("black", "red", "blue"), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
