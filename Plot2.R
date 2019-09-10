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

## Plot 2 code
png("plot2.png",width = 480, height = 480)

first_fri <- which(dat_sub$Day =="Friday")[1]
all(dat_sub$Day[1:1440] == "Thursday") & all(dat_sub$Day[1441:2880] == "Friday")
plot(dat_sub$Global_active_power, 
     type = "l", 
     xaxt = "n", 
     xlab = "Day",
     ylab = "Global Active Power (kilowatts)")
axis(1, at = c(0, first_fri, dim(dat_sub)[[1]]), labels = c("Thu", "Fri", "Sat"))

dev.off()
