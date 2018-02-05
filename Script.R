#!/usr/bin/env Rscript
args = commandArgs(trailingOnly = TRUE)

#setwd("C:\\Users\\Judit\\Documents\\mitochondriacopulation")
setwd(args[1])

configData <- read.delim("parametersCopulate.cfg", FALSE, "/")

maxTimeStep <- configData[2, "V1"]
populationSize <- configData[4, "V1"]

#data <- read.delim("data_1.dat", FALSE, " ")
#dataCopulate <- read.delim("data_noevol_initfarmingrate001_ppl_09_1.dat", FALSE, " ")
data <- read.delim(args[2], FALSE, " ")
dataCopulate <- read.delim(args[3], FALSE, " ")

#print(dataCopulate)

colnames(data) <- c("t", "a", "pS - cP", "cP",
         "split", "growA", "growB", "farmA", "pay", "benefit", "hSum",
         "mean(size)", "sd(size)", "mean(farm)", "sd(farm)",
         "meanf(harvest)", "sdf(harvest)", "meanf(farming)", "sdf(farming)", "meanf(cost)", "sdf(cost)")

colnames(dataCopulate) <- c("t", "a", "pS - cP - cT", "cP", "cT",
         "split", "growA", "growB", "farmA", "pay", "benefit", "hSum",
         "mean(size)", "sd(size)", "mean(farm)", "sd(farm)",
         "meanf(harvest)", "sdf(harvest)", "meanf(farming)", "sdf(farming)", "meanf(cost)", "sdf(cost)")
#print(data)
#print(dataCopulate)

timevector <- data[, "t"]
ps_cpvector1 <- data[, "pS - cP"]
cpvector1 <- data[, "cP"]
avector1 <- data[, "a"]

timevector2 <- dataCopulate[, "t"]
ps_cpvector2 <- dataCopulate[, "pS - cP - cT"]
cpvector2 <- dataCopulate[, "cP"]
ctvector2 <- dataCopulate[, "cT"]
avector2 <- dataCopulate[, "a"]

# Give the chart file a name.
#png(file = "line_charts_noevol_initfarmingrate001_ppl_09_1.jpg", width = 2000, height = 1000)
png(file = args[4], width = 2000, height = 1000)

# Combining the two graphs to the same page
par(mfrow = c(2, 1))

# Plot the bar chart.
plot(timevector2, ps_cpvector2, type = "o", col = "red",
     xlim = c(0, maxTimeStep), ylim = c(0, populationSize),
     xlab = "Time", ylab = "Farming (red) and nonFarming (blue)",
     main = "Farming and nonfarming - copulation")

lines(timevector2, cpvector2, type = "o", col = "blue")

lines(timevector2, ctvector2, type = "o", col = "yellow")

lines(timevector2, avector2, type = "o", col = "black")

# Plot the bar chart.
plot(timevector, ps_cpvector1, type = "o", col = "red",
     xlim = c(0, maxTimeStep), ylim = c(0, populationSize),
     xlab = "Time", ylab = "Farming (red) and nonFarming (blue)",
     main = "Farming and nonfarming - no copulation")

lines(timevector, cpvector1, type = "o", col = "blue")

lines(timevector, avector1, type = "o", col = "black")

# Save the file.
dev.off()
