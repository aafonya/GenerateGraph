#read file names from command line
fileNames = commandArgs(trailingOnly = TRUE)

#set working directory
directoryPath <- paste("C:\\Users\\Judit\\Documents\\mitochondriacopulation\\Results\\", fileNames[1], sep = "")
setwd(directoryPath)

#read config data
configData <- read.delim("parametersCopulate.cfg", FALSE, "/")

maxTimeStep <- configData[2, "V1"]
populationSize <- configData[4, "V1"]

#read the dat files -> dataframes
#create list of dataframes
if ((length(fileNames) %% 2) == 1) {
    dataFramesList <- lapply(fileNames[2: ((length(fileNames) / 2) - 0.5)], function(x) read.delim(x, FALSE, " "))
    names(dataFramesList) <- paste("data", 1:length(dataFramesList), sep = "")
    list2env(dataFramesList, envir = .GlobalEnv)

    dataFramesCopList <- lapply(fileNames[((length(fileNames) / 2) + 0.5) : length(fileNames)], function(x) read.delim(x, FALSE, " "))
    names(dataFramesCopList) <- paste("dataFramesCop", 1:(length(dataFramesCopList)), sep = "")
    list2env(dataFramesCopList, envir = .GlobalEnv)
} else {
    dataFramesList <- lapply(fileNames[2:(length(fileNames) / 2)], function(x) read.delim(x, FALSE, " "))
    names(dataFramesList) <- paste("data", 1:length(dataFramesList), sep = "")
    list2env(dataFramesList, envir = .GlobalEnv)

    dataFramesCopList <- lapply(fileNames[((length(fileNames) / 2) + 1):length(fileNames)], function(x) read.delim(x, FALSE, " "))
    names(dataFramesCopList) <- paste("dataCop", 1:(length(dataFramesCopList)), sep = "")
    list2env(dataFramesCopList, envir = .GlobalEnv)
}

#columnnames for dataframes
columnNamesData <- c("t", "a", "pS - cP", "cP",
         "split", "growA", "growB", "farmA", "pay", "benefit", "hSum",
         "mean(size)", "sd(size)", "mean(farm)", "sd(farm)",
         "meanf(harvest)", "sdf(harvest)", "meanf(farming)", "sdf(farming)", "meanf(cost)", "sdf(cost)")

columnNamesDataCop <- c("t", "a", "pS - cP - cT", "cP", "cT",
         "split", "growA", "growB", "farmA", "pay", "benefit", "hSum",
         "mean(size)", "sd(size)", "mean(farm)", "sd(farm)",
         "meanf(harvest)", "sdf(harvest)", "meanf(farming)", "sdf(farming)", "meanf(cost)", "sdf(cost)")

#naming each column in each dataframe
dataFramesList <- lapply(dataFramesList, setNames, columnNamesData)
list2env(dataFramesList, .GlobalEnv)

dataFramesCopList <- lapply(dataFramesCopList, setNames, columnNamesDataCop)
list2env(dataFramesCopList, .GlobalEnv)

#print(dataFramesList[[1]][1 : 2, 3])
print(names(dataFramesCopList[[1]]))

listOfPS_CPVectors_FromData <- lapply(dataFramesList, function(x) x[, "pS - cP"])
listOfCP_Vectors_FromData <- lapply(dataFramesList, function(x) x[, "cP"])
listOfA_Vectors_FromData <- lapply(dataFramesList, function(x) x[, "a"])
list2env(listOfPS_CPVectors_FromData, envir = .GlobalEnv)
list2env(listOfCP_Vectors_FromData, envir = .GlobalEnv)
list2env(listOfA_Vectors_FromData, envir = .GlobalEnv)

listOfPS_CPVectors_FromCopData <- lapply(dataFramesCopList, function(x) x[, "pS - cP - cT"])
listOfCP_Vectors_FromCopData <- lapply(dataFramesCopList, function(x) x[, "cP"])
listOfCT_Vectors_FromCopData <- lapply(dataFramesCopList, function(x) x[, "cT"])
listOfA_Vectors_FromCopData <- lapply(dataFramesCopList, function(x) x[, "a"])
list2env(listOfPS_CPVectors_FromCopData, envir = .GlobalEnv)
list2env(listOfCP_Vectors_FromCopData, envir = .GlobalEnv)
list2env(listOfCT_Vectors_FromCopData, envir = .GlobalEnv)
list2env(listOfA_Vectors_FromCopData, envir = .GlobalEnv)

mean_ps_cpvector <- rowMeans(sapply(listOfPS_CPVectors_FromData, function(x) x))
mean_cpvector <- rowMeans(sapply(listOfCP_Vectors_FromData, function(x) x))
mean_avector <- rowMeans(sapply(listOfA_Vectors_FromData, function(x) x))

mean_ps_cpvectorcop <- rowMeans(sapply(listOfPS_CPVectors_FromCopData, function(x) x))
mean_cpvectorcop <- rowMeans(sapply(listOfCP_Vectors_FromCopData, function(x) x))
#mean_ctvectorcop <- rowMeans(sapply(listOfCT_Vectors_FromCopData, function(x) x))
mean_avectorcop <- rowMeans(sapply(listOfA_Vectors_FromCopData, function(x) x))

timevector <- dataFramesList[[1]][, "t"]

# Give the chart file a name.
#" line_chart__mean_noevol_initfarmingrate05_ppl_05.jpg "
png(file = paste("line_chart__mean_", fileNames[1], ".jpg"), width = 2000, height = 1000)

# Combining the two graphs to the same page
par(mfrow = c(2, 1))

# Plot the bar chart.
plot(timevector, mean_ps_cpvectorcop, type = "o", col = "red",
     xlim = c(0, maxTimeStep), ylim = c(0, populationSize),
     xlab = "Time", ylab = "Farming (red) and nonFarming (blue)",
     main = "Farming and nonfarming - copulation")

lines(timevector, mean_cpvectorcop, type = "o", col = "blue")
lines(timevector, mean_ctvectorcop, type = "o", col = "yellow")
lines(timevector, mean_avectorcop, type = "o", col = "black")

# Plot the bar chart.
plot(timevector, mean_ps_cpvector, type = "o", col = "red",
     xlim = c(0, maxTimeStep), ylim = c(0, populationSize),
     xlab = "Time", ylab = "Farming (red) and nonFarming (blue)",
     main = "Farming and nonfarming - no copulation")

lines(timevector, mean_cpvector, type = "o", col = "blue")
lines(timevector, mean_avector, type = "o", col = "black")

# Save the file.
dev.off()

#print(length(listOfA_Vectors_FromData))
#print(length(dataFramesList))
#print(length(dataFramesCopList))

#lapply(names(dataFramesList), function(x) print(x))
#lapply(names(dataFramesCopList), function(x) print(x))

#print(dataList)
#print(dataCopList)

#print(fileNames)