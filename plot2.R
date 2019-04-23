#Open png, 480px square size
png("plot2.png", width = 480, height = 480)

#line plot
plot(data$DateTime, as.numeric(data$Global_active_power), type = "l", lty = 1,
     xlab = "days",
     ylab = "Global Active Power (kilowatts)")

#close file
dev.off()
