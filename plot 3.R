library(data.table)
library(hms)
library(lubridate)
png("plot 3.png", width = 480, height = 480)

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
plot(data$Sub_metering_1 ~ data$date_time, type="l", ylab = "Energy sub metering", xlab = " ")

lines(data$Sub_metering_2 ~ data$date_time, type = "l", col = "red")

lines(data$Sub_metering_3 ~ data$date_time, type = "l", col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
