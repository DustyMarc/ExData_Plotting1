data<-read.csv("household_power_consumption.txt", sep=";")
days<-subset(data, Date=="1/2/2007" | Date=="2/2/2007")
GAP<-as.numeric(as.character(days$Global_active_power))
hist(GAP, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
#save plot
dev.copy(png,"Plot1.png")
dev.off()