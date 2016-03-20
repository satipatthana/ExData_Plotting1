# Reading data for 2/1/2007 and 2/2/2007
download.file("https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip",temp,mode="wb")
unzip(temp,"household_power_consumption.txt")
sdat<-read.table("household_power_consumption.txt",sep=";",skip=66637,nrows=2880)
colnames(sdat)<-unlist(read.table("household_power_consumption.txt",sep=";",nrow=1),use.names=FALSE)

# Plot 4

par(mfcol=c(2,2))

sdat2<-mutate(sdat,datetime=paste(Date,Time))
sdat2$datetime<-strptime(sdat2$datetime,format="%d/%m/%Y %H:%M:%S")

with(sdat2,plot(datetime, Global_active_power,"l",xlab="",ylab="Global Active Power (kilowatts)"))

with(sdat2,plot(datetime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",col="black"))
lines(sdat2$datetime,sdat2$Sub_metering_2,col="red")
lines(sdat2$datetime,sdat2$Sub_metering_3,col="blue")
legend("topright",inset=c(0.2,0),lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

with(sdat2,plot(datetime, Voltage,"l"))

with(sdat2,plot(datetime, Global_reactive_power,"l"))

dev.copy(png,"plot4.png")
dev.off()