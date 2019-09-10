## Downloading and unzipping the file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "file1.zip")
unzip(zipfile = "file1.zip")
dat <- read.csv2("household_power_consumption.txt", stringsAsFactors = F)
head(dat)
dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")
dat_sub <- dat[dat$Date == as.Date("2007-02-01") | dat$Date == as.Date("2007-02-02"), ]

## Plot 2 code
plot(dat_sub$Global_active_power, type = "l", x_)
