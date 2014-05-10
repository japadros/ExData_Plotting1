# Reading the data source
ds.all<-read.csv2('household_power_consumption.txt',stringsAsFactors=F)
ds<-ds.all[ds.all$Date %in% c('1/2/2007','2/2/2007'),]

# Turn the read text variable into a numeric one
if(class(ds$Global_active_power)=='character') {
  ds$Global_active_power<-as.numeric(ds$Global_active_power)
}

# Fix the date variable and obtain its weekday
ds$Date<-strptime(paste(ds$Date,ds$Time),format='%d/%m/%Y %H:%M:%S')
ds$Weekday<-weekdays(ds$Date)

# Producing png plot
png('plot4.png',height=480,width=480)
par(mfrow=c(2,2))

plot(ds$Date,ds$Global_active_power,type='l',xlab='',ylab='Global Active Power',main='')

plot(ds$Date,ds$Voltage,type='l',xlab='datetime',ylab='Voltage',main='')

plot(c(min(ds$Date),max(ds$Date)),c(min(ds$Sub_metering_1),max(ds$Sub_metering_1)),type='n',ylab='Energy sub metering',xlab='')
lines(ds$Date,ds$Sub_metering_1,col='black')
lines(ds$Date,ds$Sub_metering_2,col='red')
lines(ds$Date,ds$Sub_metering_3,col='blue')
legend(bty='n',lty='solid',col=c('black','red','blue'),xjust=1,x=max(ds$Date),y=max(ds$Sub_metering_1),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),cex=0.8)

plot(ds$Date,ds$Global_reactive_power,type='l',xlab='datetime',ylab='Global Reactive Power',main='')

dev.off()
