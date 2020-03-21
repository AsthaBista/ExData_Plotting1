## Install the required packages and load them
library(dplyr)
library(data.table)


## Download zip file and read file
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists('household.zip')){
  download.file(url, destfile='household.zip')
  unzip("household.zip",list = TRUE) # unpack the files into subdirectories 
  
}
## The file has 2,075,259 rows and 9 columns, so it needs 149MB
powerConsum<- fread('household_power_consumption.txt',na.strings = '?')

## Convert it to date format and subset from the entire dataframe
powerConsum$Date<-as.Date(powerConsum$Date, format="%d/%m/%Y")     
selectedData<-subset(powerConsum, Date == "2007-02-01" | Date =="2007-02-02")


## Plot 1: 
png("plot1.png", width=480, height=480)
hist(selectedData$Global_active_power,col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",border = "black")
dev.off()
