# I have found out using grep that data for 01/02/2007 starts on row 66637
# and there are 1440 rows for each day. So I am skipping first 66637 lines
# and reading 2880 lines after that.

# reading 1 line so that I can save header  here
 header<-read.table("household_power_consumption.txt",header=TRUE,nrows=1,sep=";")

# reading subset of data for relevant portion
 data<-read.table("household_power_consumption.txt",header=FALSE,na.string="?",sep=";",skip=66637,nrows=2880)

# setting column names to read data
 names(data)<-names(header)

# combining Data and Time information in single field
 x<-paste(data$Date,data$Time)

# converting Date and time to strptime format
 x<-strptime(x,"%d/%m/%Y %H:%M:%S")

# setting 2x2 grid for 4 plots
 par(mfrow = c(2, 2))

# plotting left-top chart for Global Active Power against datetime
 plot(x, data$Global_active_power, type="l", ylab="Global Active Power",xlab="" )

# plotting right-top chart for Voltage against datetime
 plot(x, data$Voltage, type="l", ylab="Voltage",xlab="datetime"  )

# plotting left-bottom plot for 3 Sub_metering values
# plotting Sub_metering_1 against datetime
 plot(x, data$Sub_metering_1, type="l", ylab="Energy sub metering",xlab="" )
# adding line for Sub_metering_2 to plot
 lines(x,data$Sub_metering_2, col="red" )
# adding line for Sub_metering_3 to plot
 lines(x,data$Sub_metering_3, col="blue" )
# adding legend in top right corner without a box
 legend("topright",box.lwd=0,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1))

# plotting right-bottom chart for Global Reactive Power against datetime
 plot(x, data$Global_reactive_power, type="l", ylab="Global Reactive Power",xlab="datetime" )
# copying final image using png device to file plot4.png
 dev.copy(png,file="plot4.png")

# closing device handle
 dev.off()

 



