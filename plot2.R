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
png('plot2.png',height=480,width=480)
plot(ds$Date,ds$Global_active_power,type='l',xlab='',ylab='Global Active Power (Kilowatts)',main='')
dev.off()
