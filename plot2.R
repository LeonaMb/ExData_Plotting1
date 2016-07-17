rawdata <-  read.csv("Exploratory Graph/household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)
powerdata <- rawdata[rawdata[,1]=="1/2/2007" | rawdata[,1]=="2/2/2007",]

x <- strptime(paste(powerdata[,"Date"],powerdata[,"Time"]), format="%d/%m/%Y %H:%M:%S")
y <- as.numeric(powerdata[,"Global_active_power"])


png(filename = "Rplot2.png", width = 480, height = 480, units = "px")
plot(x,y, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()