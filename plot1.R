#Reading data
data <- read.table("household_power_consumption.txt", sep=";", header = TRUE, dec=".")

#Converting the column Date as date
data$Date <- as.Date(data$Date,"%d/%m/%Y")

#Subset the data to period from "2007-02-01" to "2007-02-02"
data1 <- data[which((data$Date >= "2007-02-01") & (data$Date <= "2007-02-02")),]

#Converting the column Global_active_power as numeric
data1$Global_active_power <- as.numeric(as.matrix(data1$Global_active_power))

#Creating the plot
png(filename = "plot1.png",width = 480, height = 480)

hist(data1$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",main = "Global Active Power")

dev.off()
