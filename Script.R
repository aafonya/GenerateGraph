setwd("C:\\Users\\Judit\\Documents\\Mitochondria")
data <- read.delim("data.dat", FALSE, " ")
datarichperlength04 <- read.delim("datarichperlength04.dat", FALSE, " ")
colnames(data) <- c("t", "a", "pS - cP", "cP", "split", "growA", "growB",
                    "farmA", "pay", "benefit", "hSum", "mean(size)", "sd(size)",
                    "mean(farm)", "sd(farm)", "meanf(harvest)", "sdf(harvest)",
                    "meanf(farming)", "sdf(farming)", "meanf(cost)")
colnames(datarichperlength04) <- c("t", "a", "pS - cP", "cP", "split", "growA", "growB",
                    "farmA", "pay", "benefit", "hSum", "mean(size)", "sd(size)",
                    "mean(farm)", "sd(farm)", "meanf(harvest)", "sdf(harvest)",
                    "meanf(farming)", "sdf(farming)", "meanf(cost)")
#print(data)
#print(datarichperlength04)

ps_cpvector1 <- data[, "pS - cP"]
cpvector1 <- data[, "cP"]
ps_cpvector2 <- datarichperlength04[, "pS - cP"]
cpvector2 <- datarichperlength04[, "cP"]

print(ps_cpvector1)
print(cpvector1)
print(ps_cpvector2)
print(cpvector2)

# Give the chart file a name.
png(file = "line_chart_probe.jpg")

# Plot the bar chart.
plot(ps_cpvector1, type = "o", col = "red", ylim = c(0, 10),
   main = "Rain fall chart")

lines(cpvector1, type = "o", col = "blue")

# Save the file.
dev.off()
setwd("C:\\Users\\Judit\\Documents\\Mitochondria")
data <- read.delim("data.dat", FALSE, " ")
datarichperlength04 <- read.delim("datarichperlength04.dat", FALSE, " ")
colnames(data) <- c("t", "a", "pS - cP", "cP", "split", "growA", "growB",
                    "farmA", "pay", "benefit", "hSum", "mean(size)", "sd(size)",
                    "mean(farm)", "sd(farm)", "meanf(harvest)", "sdf(harvest)",
                    "meanf(farming)", "sdf(farming)", "meanf(cost)")
colnames(datarichperlength04) <- c("t", "a", "pS - cP", "cP", "split", "growA", "growB",
                    "farmA", "pay", "benefit", "hSum", "mean(size)", "sd(size)",
                    "mean(farm)", "sd(farm)", "meanf(harvest)", "sdf(harvest)",
                    "meanf(farming)", "sdf(farming)", "meanf(cost)")
#print(data)
#print(datarichperlength04)

ps_cpvector1 <- data[, "pS - cP"]
cpvector1 <- data[, "cP"]
ps_cpvector2 <- datarichperlength04[, "pS - cP"]
cpvector2 <- datarichperlength04[, "cP"]

print(ps_cpvector1)
print(cpvector1)
print(ps_cpvector2)
print(cpvector2)

# Give the chart file a name.
png(file = "line_chart_probe.jpg")

# Plot the bar chart.
plot(ps_cpvector1, type = "o", col = "red", ylim = c(0, 10),
   main = "Rain fall chart")

lines(cpvector1, type = "o", col = "blue")

# Save the file.
dev.off()