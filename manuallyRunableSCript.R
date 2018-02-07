setwd("C:\\Users\\Judit\\Documents\\mitochondriacopulation\\Results\\noevol_initfarmingrate05_ppl_05")

configData <- read.delim("parametersCopulate.cfg", FALSE, "/")

maxTimeStep <- configData[2, "V1"]
populationSize <- configData[4, "V1"]

data1 <- read.delim("data_mitochondria18.c_noevol_initfarmingrate05_ppl_05_0.dat", FALSE, " ")
data2 <- read.delim("data_mitochondria18.c_noevol_initfarmingrate05_ppl_05_1.dat", FALSE, " ")
data3 <- read.delim("data_mitochondria18.c_noevol_initfarmingrate05_ppl_05_2.dat", FALSE, " ")
data4 <- read.delim("data_mitochondria18.c_noevol_initfarmingrate05_ppl_05_3.dat", FALSE, " ")
data5 <- read.delim("data_mitochondria18.c_noevol_initfarmingrate05_ppl_05_4.dat", FALSE, " ")

dataCopulate1 <- read.delim("data_mitochondria_Copulate.c_noevol_initfarmingrate05_ppl_05_4.dat", FALSE, " ")
dataCopulate2 <- read.delim("data_mitochondria_Copulate.c_noevol_initfarmingrate05_ppl_05_3.dat", FALSE, " ")
dataCopulate3 <- read.delim("data_mitochondria_Copulate.c_noevol_initfarmingrate05_ppl_05_2.dat", FALSE, " ")
dataCopulate4 <- read.delim("data_mitochondria_Copulate.c_noevol_initfarmingrate05_ppl_05_1.dat", FALSE, " ")
dataCopulate5 <- read.delim("data_mitochondria_Copulate.c_noevol_initfarmingrate05_ppl_05_0.dat", FALSE, " ")

colnames(data1) <- c("t", "a", "pS - cP", "cP",
         "split", "growA", "growB", "farmA", "pay", "benefit", "hSum",
         "mean(size)", "sd(size)", "mean(farm)", "sd(farm)",
         "meanf(harvest)", "sdf(harvest)", "meanf(farming)", "sdf(farming)", "meanf(cost)", "sdf(cost)")
colnames(data2) <- c("t", "a", "pS - cP", "cP",
         "split", "growA", "growB", "farmA", "pay", "benefit", "hSum",
         "mean(size)", "sd(size)", "mean(farm)", "sd(farm)",
         "meanf(harvest)", "sdf(harvest)", "meanf(farming)", "sdf(farming)", "meanf(cost)", "sdf(cost)")
colnames(data3) <- c("t", "a", "pS - cP", "cP",
         "split", "growA", "growB", "farmA", "pay", "benefit", "hSum",
         "mean(size)", "sd(size)", "mean(farm)", "sd(farm)",
         "meanf(harvest)", "sdf(harvest)", "meanf(farming)", "sdf(farming)", "meanf(cost)", "sdf(cost)")
colnames(data4) <- c("t", "a", "pS - cP", "cP",
         "split", "growA", "growB", "farmA", "pay", "benefit", "hSum",
         "mean(size)", "sd(size)", "mean(farm)", "sd(farm)",
         "meanf(harvest)", "sdf(harvest)", "meanf(farming)", "sdf(farming)", "meanf(cost)", "sdf(cost)")
colnames(data5) <- c("t", "a", "pS - cP", "cP",
         "split", "growA", "growB", "farmA", "pay", "benefit", "hSum",
         "mean(size)", "sd(size)", "mean(farm)", "sd(farm)",
         "meanf(harvest)", "sdf(harvest)", "meanf(farming)", "sdf(farming)", "meanf(cost)", "sdf(cost)")

colnames(dataCopulate1) <- c("t", "a", "pS - cP - cT", "cP", "cT",
         "split", "growA", "growB", "farmA", "pay", "benefit", "hSum",
         "mean(size)", "sd(size)", "mean(farm)", "sd(farm)",
         "meanf(harvest)", "sdf(harvest)", "meanf(farming)", "sdf(farming)", "meanf(cost)", "sdf(cost)")
colnames(dataCopulate2) <- c("t", "a", "pS - cP - cT", "cP", "cT",
         "split", "growA", "growB", "farmA", "pay", "benefit", "hSum",
         "mean(size)", "sd(size)", "mean(farm)", "sd(farm)",
         "meanf(harvest)", "sdf(harvest)", "meanf(farming)", "sdf(farming)", "meanf(cost)", "sdf(cost)")
colnames(dataCopulate3) <- c("t", "a", "pS - cP - cT", "cP", "cT",
         "split", "growA", "growB", "farmA", "pay", "benefit", "hSum",
         "mean(size)", "sd(size)", "mean(farm)", "sd(farm)",
         "meanf(harvest)", "sdf(harvest)", "meanf(farming)", "sdf(farming)", "meanf(cost)", "sdf(cost)")
colnames(dataCopulate4) <- c("t", "a", "pS - cP - cT", "cP", "cT",
         "split", "growA", "growB", "farmA", "pay", "benefit", "hSum",
         "mean(size)", "sd(size)", "mean(farm)", "sd(farm)",
         "meanf(harvest)", "sdf(harvest)", "meanf(farming)", "sdf(farming)", "meanf(cost)", "sdf(cost)")
colnames(dataCopulate5) <- c("t", "a", "pS - cP - cT", "cP", "cT",
         "split", "growA", "growB", "farmA", "pay", "benefit", "hSum",
         "mean(size)", "sd(size)", "mean(farm)", "sd(farm)",
         "meanf(harvest)", "sdf(harvest)", "meanf(farming)", "sdf(farming)", "meanf(cost)", "sdf(cost)")

ps_cpvector1 <- data1[, "pS - cP"]
cpvector1 <- data1[, "cP"]
avector1 <- data1[, "a"]
ps_cpvector2 <- data1[, "pS - cP"]
cpvector2 <- data1[, "cP"]
avector2 <- data1[, "a"]
ps_cpvector3 <- data1[, "pS - cP"]
cpvector3 <- data1[, "cP"]
avector3 <- data1[, "a"]
ps_cpvector4 <- data1[, "pS - cP"]
cpvector4 <- data1[, "cP"]
avector4 <- data1[, "a"]
ps_cpvector5 <- data1[, "pS - cP"]
cpvector5 <- data1[, "cP"]
avector5 <- data1[, "a"]

mean_avector <- rowMeans(cbind(avector1, avector2, avector3, avector4, avector5))
mean_ps_cpvector <- rowMeans(cbind(ps_cpvector1, ps_cpvector2, ps_cpvector3, ps_cpvector4, ps_cpvector5))
mean_cpvector <- rowMeans(cbind(cpvector1, cpvector2, cpvector3, cpvector4, cpvector5))

ps_cpvector1c <- dataCopulate1[, "pS - cP - cT"]
cpvector1c <- dataCopulate1[, "cP"]
ctvector1c <- dataCopulate1[, "cT"]
avector1c <- dataCopulate1[, "a"]
ps_cpvector2c <- dataCopulate2[, "pS - cP - cT"]
cpvector2c <- dataCopulate2[, "cP"]
ctvector2c <- dataCopulate2[, "cT"]
avector2c <- dataCopulate2[, "a"]
ps_cpvector3c <- dataCopulate3[, "pS - cP - cT"]
cpvector3c <- dataCopulate3[, "cP"]
ctvector3c <- dataCopulate3[, "cT"]
avector3c <- dataCopulate3[, "a"]
ps_cpvector4c <- dataCopulate4[, "pS - cP - cT"]
cpvector4c <- dataCopulate4[, "cP"]
ctvector4c <- dataCopulate4[, "cT"]
avector4c <- dataCopulate4[, "a"]
ps_cpvector5c <- dataCopulate5[, "pS - cP - cT"]
cpvector5c <- dataCopulate5[, "cP"]
ctvector5c <- dataCopulate5[, "cT"]
avector5c <- dataCopulate5[, "a"]

mean_avectorc <- rowMeans(cbind(avector1c, avector2c, avector3c, avector4c, avector5c))
mean_ps_cpvectorc <- rowMeans(cbind(ps_cpvector1c, ps_cpvector2c, ps_cpvector3c, ps_cpvector4c, ps_cpvector5c))
mean_cpvectorc <- rowMeans(cbind(cpvector1c, cpvector2c, cpvector3c, cpvector4c, cpvector5c))
mean_ctvectorc <- rowMeans(cbind(ctvector1c, ctvector2c, ctvector3c, ctvector4c, ctvector5c))


timevector <- data1[, "t"]

# Give the chart file a name.
png(file = "line_chart__mean_noevol_initfarmingrate05_ppl_05.jpg", width = 2000, height = 1000)

# Combining the two graphs to the same page
par(mfrow = c(2, 1))

# Plot the bar chart.
plot(timevector, mean_ps_cpvectorc, type = "o", col = "red",
     xlim = c(0, maxTimeStep), ylim = c(0, populationSize),
     xlab = "Time", ylab = "Farming (red) and nonFarming (blue)",
     main = "Farming and nonfarming - copulation")

lines(timevector, mean_cpvectorc, type = "o", col = "blue")

lines(timevector, mean_ctvectorc, type = "o", col = "yellow")

lines(timevector, mean_avectorc, type = "o", col = "black")

# Plot the bar chart.
plot(timevector, mean_ps_cpvector, type = "o", col = "red",
     xlim = c(0, maxTimeStep), ylim = c(0, populationSize),
     xlab = "Time", ylab = "Farming (red) and nonFarming (blue)",
     main = "Farming and nonfarming - no copulation")

lines(timevector, mean_cpvector, type = "o", col = "blue")

lines(timevector, mean_avector, type = "o", col = "black")

# Save the file.
dev.off()
