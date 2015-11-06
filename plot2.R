plot2 <- function(dir) {
  
  Table0 <- read.table("household_power_consumption.txt",header=FALSE,sep=";",skip = 60000,nrows = 10000) 
                                                                             ##Approximate date range
  colnames(Table0) <- colnames(read.table("household_power_consumption.txt",header=TRUE,sep=";",nrows = 1)) 
                                                                             ##Sets column names
  Table <- Table0[(Table0$Date=="1/2/2007")|(Table0$Date=="2/2/2007"),]       ##selects desired rows
  
  ##Sets factor variables as numeric
  Table$Global_active_power <- as.numeric(as.character(Table$Global_active_power))
  Table$Row <- 1:nrow(Table)
  
  ##creates png
  png(file = "plot2.png")
  plot(Table$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)" ,xaxt="n")
  axis(1, at=c(0,1440,2880), labels = c("Thurs", "Fri", "Sat"))
  dev.off()
  
}