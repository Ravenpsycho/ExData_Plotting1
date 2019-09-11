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

## Plot 2 code
png("plot2.png",width = 480, height = 480)
plot(y = dat_sub$Global_active_power, 
     x = dat_sub$datetime,
     type = "l", 
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()
