#Load data (only records for the 2 days)

rawdata <-  read.csv("Exploratory Graph/household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)
powerdata <- rawdata[rawdata[,1]=="1/2/2007" | rawdata[,1]=="2/2/2007",]


#Prepare subset of data required for the plot
x <- strptime(paste(powerdata[,"Date"],powerdata[,"Time"]), format="%d/%m/%Y %H:%M:%S")

y <- as.numeric(powerdata[,"Global_active_power"])
z1 <- as.numeric(powerdata[,"Sub_metering_1"])
z2 <- as.numeric(powerdata[,"Sub_metering_2"])
z3 <- as.numeric(powerdata[,"Sub_metering_3"])
v <- as.numeric(powerdata[,"Voltage"])
w <- as.numeric(powerdata[,"Global_reactive_power"])


#Open png and plot
png(filename = "Rplot4.png", width = 480, height = 480, units = "px")

#Change parameters to display 4 plots (2 by 2) and margins for better display
par(mfrow=c(2,2), mar=c(4, 4, 1, 1))

#plots (in this order top left, top right, bottom left, bottom right) 

plot(x,y, type="l", xlab="", ylab="Global Active Power")

plot(x,v, type="l", xlab="datetime", ylab="Voltage")

plot(x,z1, type="l", xlab="", ylab = "Energy sub metering")
lines(x,z2, type="l", col="red")
lines(x,z3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1),  col=c(par("col"),"red","blue"), bty="n")

plot(x,w, type="h", xlab="datetime", ylab="Global_reactive_power")

dev.off()