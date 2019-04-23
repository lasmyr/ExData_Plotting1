#Open png, 480px square size
png("plot1.png", width = 480, height = 480)

#Plotting Global Active Power into a histogram
hist(as.numeric(data$Global_active_power), 
     main="Global Active Power", 
     xlab="Global Active Power (in kilowatts)",
     border="black", 
     col="dark red")

#closing file
dev.off()
