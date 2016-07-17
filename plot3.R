#Load data (only records for the 2 days)

rawdata <-  read.csv("Exploratory Graph/household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)
powerdata <- rawdata[rawdata[,1]=="1/2/2007" | rawdata[,1]=="2/2/2007",]

#Prepare subset of data required for the plot
x <- strptime(paste(powerdata[,"Date"],powerdata[,"Time"]), format="%d/%m/%Y %H:%M:%S")
y1 <- as.numeric(powerdata[,"Sub_metering_1"])
y2 <- as.numeric(powerdata[,"Sub_metering_2"])
y3 <- as.numeric(powerdata[,"Sub_metering_3"])



#Open png and plot
png(filename = "Rplot3.png", width = 480, height = 480, units = "px")

plot(x,y1, type="l", xlab="", ylab = "Energy sub metering")
lines(x,y2, type="l", col="red")
lines(x,y3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1),  col=c(par("col"),"red","blue"))

dev.off()