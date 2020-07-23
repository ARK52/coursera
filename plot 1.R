library(data.table)
png("plot 1.png", width = 480, height = 480)


#loading data
df=data.frame(fread("household_power_consumption.txt"))
df1=subset(df,df$Date=="1/2/2007")
df2=subset(df,df$Date=="2/2/2007")
data=rbind(df1,df2)
summary(data)

#class conversion
data$Global_active_power=as.numeric(data$Global_active_power)

#plot
with(data,hist(Global_active_power,col = "red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)"))
