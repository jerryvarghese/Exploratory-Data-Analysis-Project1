#reading data
data <-read.table("household_power_consumption.txt",header=T,sep=";",na.strings ="?") 
#getting r to recognise the format
data$Date=as.Date(data$Date,format="%d/%m/%y") 
#Subseting the Data
data<-subset(data,subset=(Date>="2007-02-01"& Date<= "2007-02-02"))
#converting the date and time to get the datetime set
data$datetime<-strptime(paste(data$Date,data$Time),"%Y-%m-%d %H:%M:%S")
#Plot 1 :the global active power plot
hist(data$Global_active_power, main="Global Active Power",
     xlab="Global Active Power(kilowatts)",ylab="Frequency",col="Red")
###Saving the plot on a device with speicified with
dev.copy(png,file="plot1.png",height=480,width=480)
dev.off()
