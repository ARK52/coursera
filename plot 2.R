library(data.table)
library(hms)
library(lubridate)
png("plot 2.png", width = 480, height = 480)


#loading data
df=data.frame(fread("household_power_consumption.txt"))
df1=subset(df,df$Date=="1/2/2007")
df2=subset(df,df$Date=="2/2/2007")
data=rbind(df1,df2)
summary(data)


#class conversion
data$Date=as.Date(data$Date,format = "%d/%m/%Y")
date_time=with(data, ymd(data$Date)+hms(data$Time))
data=cbind(data,date_time)


#plot
plot(strptime(data$date_time,format= "%Y-%m-%d %H:%M:%S"),data$Global_active_power,type = "l",
     xlab = " ",ylab = "Global Active Power (kilowatts)")
dev.off()
