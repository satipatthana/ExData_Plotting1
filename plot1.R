# Reading data for 2/1/2007 and 2/2/2007
download.file("https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip",temp,mode="wb")
unzip(temp,"household_power_consumption.txt")
sdat<-read.table("household_power_consumption.txt",sep=";",skip=66637,nrows=2880)
colnames(sdat)<-unlist(read.table("household_power_consumption.txt",sep=";",nrow=1),use.names=FALSE)


# Plot 1
hist(sdat$Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power",col=2)
dev.copy(png,"plot1.png")
dev.off()
