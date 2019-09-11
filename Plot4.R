## Downloading and unzipping the file
if (!file.exists("household_power_consumption.txt")){
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "file1.zip")
        unzip(zipfile = "file1.zip")
}
dat <- read.csv2("household_power_consumption.txt", stringsAsFactors = F)
dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")
dat_sub <- dat[dat$Date == as.Date("2007-02-01") | dat$Date == as.Date("2007-02-02"), ]
dat_sub$Day <- weekdays(dat_sub$Date) 
dat_sub$datetime <- as.POSIXct(paste0(dat_sub$Date, " ", dat_sub$Time), format = "%Y-%m-%d %H:%M:%S")
rm(dat)

png("plot4.png",width = 480, height = 480)

# create the split canvas
par(mfrow = c(2,2))

## Plot 1 code
plot(y = dat_sub$Global_active_power, 
     x = dat_sub$datetime,
     type = "l", 
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

## Plot 2 code
plot(dat_sub$Voltage, 
     x = dat_sub$datetime,
     type = "l", 
     xlab = "datetime",
     ylab = "Voltage (Volts)")

## Plot 3 code

## plot of first variable
plot(dat_sub$Sub_metering_1, 
     x = dat_sub$datetime,
     type = "l", 
     xlab = "",
     ylab = "Energy Sub Metering")
## adding second variable
lines(dat_sub$Sub_metering_2,
      x = dat_sub$datetime, 
      type = "l", col = 2
)
## adding third variable
lines(dat_sub$Sub_metering_3,
      x = dat_sub$datetime, 
      type = "l", col = 4
)
## adding legend
legend("topright", 
       legend = names(dat_sub[,7:9]), lty = 1, col = c(1,2,4),
       bty = "n")

## Plot 4 code
plot(dat_sub$Global_reactive_power, 
     x = dat_sub$datetime,
     type = "l", 
     xlab = "datetime",
     ylab = "Global Reactive Power (kilowatts)")

dev.off()

