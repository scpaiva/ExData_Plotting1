#Reading data
data <- read.table("household_power_consumption.txt", sep=";", header = TRUE, dec=".")

#Converting the column Date as date
data$Date <- as.Date(data$Date,"%d/%m/%Y")

#Subset the data to period from "2007-02-01" to "2007-02-02"
data1 <- data[which((data$Date >= "2007-02-01") & (data$Date <= "2007-02-02")),]

#Converting the columns Sub_metering_ as numeric
data1$Sub_metering_1 <- as.numeric(as.matrix(data1$Sub_metering_1))
data1$Sub_metering_2 <- as.numeric(as.matrix(data1$Sub_metering_2))
data1$Sub_metering_3 <- as.numeric(as.matrix(data1$Sub_metering_3))

#Creating the dataframe with columns datetime and Sub_metering_
DateTime <- as.POSIXct(paste(data1$Date, data1$Time), format="%Y-%m-%d %H:%M")
newDate1 <-data.frame(DateTime, data1$Sub_metering_1, data1$Sub_metering_2, data1$Sub_metering_3)
colnames(newDate1) <- c("DateTime", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

Sys.setlocale("LC_TIME", "English")

#Creating the plot
png(filename = "plot3.png",width = 480, height = 480)

plot(newDate1$DateTime, newDate1$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(newDate1$DateTime, newDate1$Sub_metering_2, type = "l", col = "red")
lines(newDate1$DateTime, newDate1$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend=names(newDate1[,2:4]),
       col=c("black", "red", "blue"), lty=1, cex=0.8)

dev.off()
