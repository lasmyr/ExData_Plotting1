#set plot grid
par(mfrow=c(2,2))

#line plot Global Active Power
plot(data$DateTime, as.numeric(data$Global_active_power), type = "l", lty = 1,
     xlab = "days",
     ylab = "Global Active Power (kilowatts)")

#line plot voltage per time
plot(data$DateTime, as.numeric(data$Voltage), type = "l", lty = 1,
     xlab = "days",
     ylab = "Voltage")


#line plot submeters 1,2,3
plot(data$DateTime, as.numeric(data$Sub_metering_1), type = "l", lty = 1,
     xlab = "days",
     ylab = "Energy Sub Metering",
     col ="blue")
points(data$DateTime, as.numeric(data$Sub_metering_2),
       col ="red", type="l")
points(data$DateTime, as.numeric(data$Sub_metering_3),
       col ="green", type="l")
legend("topright", 
       legend = c("Submeter 1", "Submeter 2", "Submeter 3"), 
       pch = 20,
       col = c("red", "blue", "green"), 
       inset = c(0.05,0.05))

#line plot Global reactive power
plot(data$DateTime, as.numeric(data$Global_reactive_power), type = "l", lty = 1,
     xlab = "days",
     ylab = "Global Reactive Power (kilowatts)")

#write png
dev.print(device=png, filename="plot4.png", width=480, height=480)
