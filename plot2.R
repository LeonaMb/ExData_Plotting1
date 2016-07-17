#Load data (only records for the 2 days)

rawdata <-  read.csv("Exploratory Graph/household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)
powerdata <- rawdata[rawdata[,1]=="1/2/2007" | rawdata[,1]=="2/2/2007",]

#Prepare subset of data required for the plot
x <- strptime(paste(powerdata[,"Date"],powerdata[,"Time"]), format="%d/%m/%Y %H:%M:%S")
y <- as.numeric(powerdata[,"Global_active_power"])

#Open png and plot
png(filename = "Rplot2.png", width = 480, height = 480, units = "px")
plot(x,y, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()