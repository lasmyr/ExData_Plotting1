#line plot first data series
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

#print png file
dev.print(device=png, filename="plot3.png", width=480, height=480)

