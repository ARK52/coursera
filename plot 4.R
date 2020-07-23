library(data.table)
library(hms)
library(lubridate)
png("plot 4.png", width = 480, height = 480)


#loading data
df=data.frame(fread("household_power_consumption.txt"))
df1=subset(df,df$Date=="1/2/2007")
df2=subset(df,df$Date=="2/2/2007")
data=rbind(df1,df2)

#class conversion
summary(data)
data$Date=as.Date(data$Date,format = "%d/%m/%Y")
date_time=with(data, ymd(data$Date)+hms(data$Time))
data=cbind(data,date_time)

#plots
par(mfrow=c(2,2))
plot(strptime(data$date_time,format= "%Y-%m-%d %H:%M:%S"),data$Global_active_power,type = "l",
     xlab = " ",ylab = "Global Active Power (kilowatts)")


plot(strptime(data$date_time,format= "%Y-%m-%d %H:%M:%S"),data$Voltage,type = "l",xlab = "datetime",
     ylab = "Voltage")


plot(data$Sub_metering_1 ~ data$date_time, type="l", ylab = "Energy sub metering", xlab = " ")

lines(data$Sub_metering_2 ~ data$date_time, type = "l", col = "red")

lines(data$Sub_metering_3 ~ data$date_time, type = "l", col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5,cex = 0.7,bty = "n", col=c("black", "red", "blue"))




plot(strptime(data$date_time,format= "%Y-%m-%d %H:%M:%S"),data$Global_reactive_power,type = "l",ylab = "Global_Reactive_Power",
     xlab = "datetime")
dev.off()
