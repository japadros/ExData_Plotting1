# Reading the data source
ds.all<-read.csv2('household_power_consumption.txt',stringsAsFactors=F)
ds<-ds.all[ds.all$Date %in% c('1/2/2007','2/2/2007'),]

# Turn the read text variable into a numeric one
if(class(ds$Global_active_power)=='character') {
  ds$Global_active_power<-as.numeric(ds$Global_active_power)
}

# Producing png plot
png('plot1.png',height=480,width=480)
hist(ds$Global_active_power,xlab='Global Active Power (Kilowatts)',col='darkred',main='Global Active Power')
dev.off()
