par (mfcol =c(2,2),mar=c(4,4,2,1))
par (bg="white")
#first plot: plot2
data<-read.csv("household_power_consumption.txt", sep=";")
days<-subset(data, Date=="1/2/2007" | Date=="2/2/2007")
GAP<-as.numeric(as.character(days$Global_active_power))
plot(GAP, pch=NA_integer_, ylab="Global Active Power (kilowatts)", xaxt="n", xlab="")
lines(GAP)
labeldays=c("Thu", "Fri", "Sat")
axis(1, at=c(1,1440,2880), labeldays)
#second plot: plot3
SM1<-as.numeric(as.character(days$Sub_metering_1))
SM2<-as.numeric(as.character(days$Sub_metering_2))
SM3<-as.numeric(as.character(days$Sub_metering_3))
plot(SM1, pch=NA_integer_, ylab="Energy Sub Metering", xaxt="n", xlab="")
lines(SM1, col="black")
lines(SM2, col="red")
lines(SM3, col="blue")
labeldays=c("Thu", "Fri", "Sat")
axis(1, at=c(1,1440,2880), labeldays)
legend("topright", bty="n", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#third plot: new first
Volt<-as.numeric(as.character(days$Voltage))
plot(Volt, pch=NA_integer_, ylab="Voltage", xaxt="n", xlab="datetime")
lines(Volt, col="black")
axis(1, at=c(1,1440,2880), labeldays)

#fourth plot: new second
GRP<-as.numeric(as.character(days$Global_reactive_power))
plot(GRP, pch=NA_integer_, ylab="Global reactive power", xaxt="n", xlab="datetime")
lines(GRP, col="black")
axis(1, at=c(1,1440,2880), labeldays)

#copy to file
dev.copy(png,"Plot4.png")
dev.off()
