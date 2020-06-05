#Reading data
data <- read.table("household_power_consumption.txt", sep=";", header = TRUE, dec=".")

#Converting the column Date as date
data$Date <- as.Date(data$Date,"%d/%m/%Y")

#Subset the data to period from "2007-02-01" to "2007-02-02"
data1 <- data[which((data$Date >= "2007-02-01") & (data$Date <= "2007-02-02")),]

#Converting the column Global_active_power as numeric
data1$Global_active_power <- as.numeric(as.matrix(data1$Global_active_power))

#Creating the dataframe with columns datetime and Global_active_power
DateTime <- as.POSIXct(paste(data1$Date, data1$Time), format="%Y-%m-%d %H:%M")
newDate1 <-data.frame(DateTime, data1$Global_active_power)
colnames(newDate1) <- c("DateTime", "Global_active_power")

Sys.setlocale("LC_TIME", "English")

#Creating the plot
png(filename = "plot2.png",width = 480, height = 480)

plot(newDate1$DateTime, newDate1$Global_active_power,type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()

