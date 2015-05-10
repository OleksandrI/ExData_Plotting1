plot1 <- function() {
     projectData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors = FALSE) # reading source table, "?" are converted to NA
     pdata <- projectData[projectData$Date %in% c("1/2/2007", "2/2/2007"),] # selection of target data
     pdata <- cbind(pdata, strptime(paste(pdata$Date, pdata$Time), "%d/%m/%Y %H:%M:%S")) # adding column with date and time in R format
     names(pdata)[10] <- "DateTime" # naming it properly
     
     # creating file with plot
     png("plot1.png", width = 480, height = 480)
     hist(pdata$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
     dev.off()
}

