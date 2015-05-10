plot4 <- function() {
     projectData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors = FALSE) # reading source table, "?" are converted to NA
     pdata <- projectData[projectData$Date %in% c("1/2/2007", "2/2/2007"),] # selection of target data
     pdata <- cbind(pdata, strptime(paste(pdata$Date, pdata$Time), "%d/%m/%Y %H:%M:%S")) # adding column with date and time in R format
     names(pdata)[10] <- "DateTime" # naming it properly
     
     # creating file with plot
     png("plot4.png", width = 480, height = 480)
     par(mfcol = c(2,2), lwd = .5)
     # plot 1
     plot(Global_active_power ~ DateTime, data = pdata, ylab = "Global Active Power", xlab = "",  type = "n")
     lines(Global_active_power ~ DateTime, data = pdata)
     # plot 2
     plot(Sub_metering_1 ~ DateTime ,data = pdata, ylab = "Energy sub metering", xlab = "",  type = "n")
     lines(Sub_metering_1 ~ DateTime, data = pdata, col = "black")
     lines(Sub_metering_2 ~ DateTime, data = pdata, col = "red")
     lines(Sub_metering_3 ~ DateTime, data = pdata, col = "blue")
     legend("topright", lty = 1,  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), bty = "n")
     # plot 3
     plot(Voltage ~ DateTime, data = pdata, xlab = "datetime",  type = "n")
     lines(Voltage ~ DateTime, data = pdata)
     # plot 4
     plot(Global_reactive_power ~ DateTime, data = pdata, xlab = "datetime",  type = "n")
     lines(Global_reactive_power ~ DateTime, data = pdata)
     
     dev.off()
}

