rawdata <-  read.csv("Exploratory Graph/household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)
powerdata <- rawdata[rawdata[,1]=="1/2/2007" | rawdata[,1]=="2/2/2007",]

plot1 <- as.numeric(powerdata[,"Global_active_power"])
png(filename = "Rplot1.png", width = 480, height = 480, units = "px")
hist(plot1, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")
dev.off()
