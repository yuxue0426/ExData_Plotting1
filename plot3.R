Sys.setlocale("LC_TIME", "English")
data<-read.table("household_power_consumption.txt", stringsAsFactors = F,sep = ";", h=T)
datetime<-paste(data$Date,data$Time)
changeddate<-as.POSIXct(strptime(datetime,"%d/%m/%Y %H:%M:%S"))
data<-cbind(changeddate,data[,-(1:2)])
dat<-subset(data,changeddate >= as.POSIXct("2007-02-01 00:00:00 PST") & changeddate < as.POSIXct("2007-02-02 23:59:59 PST") )
dat$Sub_metering_1<-as.numeric(as.character(dat$Sub_metering_1))
dat$Sub_metering_2<-as.numeric(as.character(dat$Sub_metering_2))
dat$Sub_metering_3<-as.numeric(as.character(dat$Sub_metering_3))
png(file="plot3.png",width=480,height=480)
plot(dat$Sub_metering_1 ~ dat$changeddate,type="n",xlab="",ylab="Energy sub metering")
lines(dat$Sub_metering_1 ~ dat$changeddate,xlab="",ylab="Energy sub metering")
lines(dat$Sub_metering_2 ~ dat$changeddate,xlab="",ylab="Energy sub metering",col="red")
lines(dat$Sub_metering_3 ~ dat$changeddate,xlab="",ylab="Energy sub metering",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()



