## Downloading and unzipping the file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "file1.zip")
unzip(zipfile = "file1.zip")
dat <- read.csv2("household_power_consumption.txt", stringsAsFactors = F)
head(dat)
dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")
dat_sub <- dat[dat$Date == as.Date("2007-02-01") | dat$Date == as.Date("2007-02-02"), ]
## Plot 1 Code
hist(as.numeric(dat_sub$Global_active_power), col = 2,
     main = "Global Active Power",
     xlab = "Global Active Power (Kilowatts)")
