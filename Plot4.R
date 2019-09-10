## Downloading and unzipping the file
if (!file.exists("household_power_consumption.txt")){
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "file1.zip")
        unzip(zipfile = "file1.zip")
}
dat <- read.csv2("household_power_consumption.txt", stringsAsFactors = F)
dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")
dat_sub <- dat[dat$Date == as.Date("2007-02-01") | dat$Date == as.Date("2007-02-02"), ]
dat_sub$Day <- weekdays(dat_sub$Date) 
rm(dat)

png("plot4.png",width = 480, height = 480)

# create the split canvas
par(mfrow = c(2,2))

## Plot 1 code
first_fri <- which(dat_sub$Day =="Friday")[1]
plot(dat_sub$Global_active_power, 
     type = "l", 
     xaxt = "n", 
     xlab = "Day",
     ylab = "Global Active Power (kilowatts)")
axis(1, at = c(0, first_fri, dim(dat_sub)[[1]]), labels = c("Thu", "Fri", "Sat"))

## Plot 2 code
first_fri <- which(dat_sub$Day =="Friday")[1]
plot(dat_sub$Voltage, 
     type = "l", 
     xaxt = "n", 
     xlab = "Day",
     ylab = "Voltage (Volts)")
axis(1, at = c(0, first_fri, dim(dat_sub)[[1]]), labels = c("Thu", "Fri", "Sat"))

## Plot 3 code
first_fri <- which(dat_sub$Day =="Friday")[1]
dat_sub[7:9] <- sapply(dat_sub[,7:9], as.numeric)

## dynamic limits for y axis
lims <- c(min(sapply(dat_sub[,7:9], min)),
          max(sapply(dat_sub[,7:9], max)))
## plot of first variable
plot(dat_sub$Sub_metering_1, 
     type = "l", 
     xaxt = "n", 
     xlab = "Day",
     ylim =  c(lims[1], lims[2] + (lims[2] /10)),
     ylab = "Energy Sub Metering")
## adding second variable
lines(dat_sub$Sub_metering_2, 
      type = "l", col = 2
)
## adding third variable
lines(dat_sub$Sub_metering_3, 
      type = "l", col = 4
)
## adding legend
legend(1500, lims[2] + (lims[2] /10), 
       legend = names(dat_sub[,7:9]), lty = 1, col = c(1,2,4),
       bty = "n")
## adding axis legend
axis(1, at = c(0, first_fri, dim(dat_sub)[[1]]), labels = c("Thu", "Fri", "Sat"))

## Plot 4 code
first_fri <- which(dat_sub$Day =="Friday")[1]
plot(dat_sub$Global_reactive_power, 
     type = "l", 
     xaxt = "n", 
     xlab = "Day",
     ylab = "Global Reactive Power (kilowatts)")
axis(1, at = c(0, first_fri , dim(dat_sub)[[1]]), labels = c("Thu", "Fri", "Sat"))

dev.off()
