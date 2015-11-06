plot3 <- function(dir) {
  
  Table0 <- read.table("household_power_consumption.txt",header=FALSE,sep=";",skip = 60000,nrows = 10000) 
  ##Approximate date range
  colnames(Table0) <- colnames(read.table("household_power_consumption.txt",header=TRUE,sep=";",nrows = 1)) 
  ##Sets column names
  Table <- Table0[(Table0$Date=="1/2/2007")|(Table0$Date=="2/2/2007"),]       ##selects desired rows
  
  ##Sets factor variables as numeric
  Table$Sub_metering_1 <- as.numeric(as.character(Table$Sub_metering_1))
  Table$Sub_metering_2 <- as.numeric(as.character(Table$Sub_metering_2))
  Table$Row <- 1:nrow(Table)
  
  ##creates png
  png(file = "plot3.png")
  plot(Table$Row, Table$Sub_metering_1, type = "l", ylim = c(0,38), xaxt="n'",xlab = "", 
          ylab = "Energy sub metering" )
  axis(1, at=c(0,1440,2880), labels = c("Thurs", "Fri", "Sat"))
  lines(Table$Sub_metering_2, col = "red")
  lines(Table$Sub_metering_3, col = "blue")
  legend("topright", lty=1, col= c("black","red","blue"), 
         legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  dev.off()
  
}