

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


#subseting the plotting variable
gap <- as.numeric(houseCon$Global_active_power)

#Export to png file
png("plot1.png", height = 480, width = 480)
hist(gap, main = "Global Active Power", col ="red", xlab ="Global Active Power (kilowatts)")
dev.off()

