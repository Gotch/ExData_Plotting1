plot1 <- function(dir) {
  Table0 <- read.table("household_power_consumption.txt",header=FALSE,sep=";",skip = 60000,nrows = 10000) 
                                                                              ##Approximate date range
  colnames(Table0) <- colnames(read.table("household_power_consumption.txt",header=TRUE,sep=";",nrows = 1)) 
                                                                              ##Sets column names
  Table <- Table0[(Table0$Date=="1/2/2007")|(Table0$Date=="2/2/2007"),]       ##selects desired rows
  
  ##Sets factor variables as numeric
  Table$Global_active_power <- as.numeric(as.character(Table$Global_active_power))
  
  ##Creates png
  png(file = "plot1.png")
  hist(Table$Global_active_power, col = "red", breaks = 12, main = "Global Active Power", 
       xlab = "Global Active Power (kilowatts) ")
  dev.off()
  
}