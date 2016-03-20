
# Reading data for 2/1/2007 and 2/2/2007
download.file("https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip",temp,mode="wb")
unzip(temp,"household_power_consumption.txt")
sdat<-read.table("household_power_consumption.txt",sep=";",skip=66637,nrows=2880)
colnames(sdat)<-unlist(read.table("household_power_consumption.txt",sep=";",nrow=1),use.names=FALSE)


# Plot 2
sdat2<-mutate(sdat,datetime=paste(Date,Time))
sdat2$datetime<-strptime(sdat2$datetime,format="%d/%m/%Y %H:%M:%S")
with(sdat2,plot(datetime, Global_active_power,"l",xlab="",ylab="Global Active Power (kilowatts)"))
dev.copy(png,"plot2.png")
dev.off()
