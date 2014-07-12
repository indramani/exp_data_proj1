# I have found out using grep that data for 01/02/2007 starts on row 66637
# and there are 1440 rows for each day. So I am skipping first 66637 lines
# and reading 2880 lines after that.

# reading 1 line so that I can save header  here
 header<-read.table("household_power_consumption.txt",header=TRUE,nrows=1,sep=";")

# reading subset of data for relevant portion
 data<-read.table("household_power_consumption.txt",header=FALSE,na.string="?",sep=";",skip=66637,nrows=2880)

# setting column names to read data
 names(data)<-names(header)

# opening plot1.R
 png(filename="plot1.png")

# plotting given histogram on png device
 hist(data$Global_active_power,main="Gloabal Active Power",xlab="Global Active Power (kilowatts)",col="red")

# copying final image using png device to file plot1.png
# dev.copy(png,file="plot1.png")

# closing device handle
 dev.off() 
