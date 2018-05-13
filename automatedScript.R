#read file names from command line
fileNames = commandArgs(trailingOnly = TRUE)

#set working directory
directoryPath <- paste("C:\\Users\\Judit\\Documents\\parasiteModelVSProject\\parasitemodelvsproject\\mithocondrium-vs2013\\mitochondria\\bin\\results\\", fileNames[1], sep = "")
setwd(directoryPath)

#read config data
configData <- read.delim("parameters.cfg", FALSE, "/")

maxTimeStep <- configData[2, "V1"]
populationSize <- configData[4, "V1"]

#read header
headers = read.table(fileNames[2], skip = 1, header = F, nrows = 1, as.is = T)

#read the dat files -> dataframes
#create list of dataframes
if ((length(fileNames) %% 2) == 1) {
    dataFramesList <- lapply(fileNames[2:((length(fileNames) / 2) + 0.5)], function(x) read.table(x, skip = 2, header = F))
    names(dataFramesList) <- paste("data", 1:length(dataFramesList), sep = "")
    list2env(dataFramesList, envir = .GlobalEnv)

    dataFramesCopList <- lapply(fileNames[((length(fileNames) / 2) + 1.5):length(fileNames)], function(x) read.table(x, skip = 2, header = F))
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

#naming each column in each dataframe - using the header
dataFramesList <- lapply(dataFramesList, setNames, headers)
list2env(dataFramesList, .GlobalEnv)

dataFramesCopList <- lapply(dataFramesCopList, setNames, headers)
list2env(dataFramesCopList, .GlobalEnv)



#Create list of vectors - one vector for each data for the same runnig 
#all 'a' data           -> list of 'a' vectors
#        run of model 0 -> dataframe
#           column 10   -> vector

#nosex

#cDigest values
listOfDigestVectors_FromData <- lapply(dataFramesList, function(x) x[, "cDigest"])
list2env(listOfDigestVectors_FromData, envir = .GlobalEnv)
mean_cDigestvector <- rowMeans(sapply(listOfDigestVectors_FromData, function(x) x))

#cNoDigest values
listOfNoDigestVectors_FromData <- lapply(dataFramesList, function(x) x[, "cNoDigest"])
list2env(listOfNoDigestVectors_FromData, envir = .GlobalEnv)
mean_cNoDigestvector <- rowMeans(sapply(listOfNoDigestVectors_FromData, function(x) x))

#a values
listOfA_Vectors_FromData <- lapply(dataFramesList, function(x) x[, "a"])
list2env(listOfA_Vectors_FromData, envir = .GlobalEnv)
mean_avector <- rowMeans(sapply(listOfA_Vectors_FromData, function(x) x))

#interval0 values
listOfInterval0Vectors_FromData <- lapply(dataFramesList, function(x) x[, "interval0"])
list2env(listOfInterval0Vectors_FromData, envir = .GlobalEnv)
mean_interval0vector <- rowMeans(sapply(listOfInterval0Vectors_FromData, function(x) x))

#interval1 values
listOfInterval1Vectors_FromData <- lapply(dataFramesList, function(x) x[, "interval1"])
list2env(listOfInterval1Vectors_FromData, envir = .GlobalEnv)
mean_interval1vector <- rowMeans(sapply(listOfInterval1Vectors_FromData, function(x) x))

#interval2 values
listOfInterval2Vectors_FromData <- lapply(dataFramesList, function(x) x[, "interval2"])
list2env(listOfInterval2Vectors_FromData, envir = .GlobalEnv)
mean_interval2vector <- rowMeans(sapply(listOfInterval2Vectors_FromData, function(x) x))

#interval3 values
listOfInterval3Vectors_FromData <- lapply(dataFramesList, function(x) x[, "interval3"])
list2env(listOfInterval3Vectors_FromData, envir = .GlobalEnv)
mean_interval3vector <- rowMeans(sapply(listOfInterval3Vectors_FromData, function(x) x))

#sex

#cNoDigest values
listOfcNoDigestVectors_FromCopData <- lapply(dataFramesCopList, function(x) x[, "cNoDigest"])
list2env(listOfcNoDigestVectors_FromCopData, envir = .GlobalEnv)
mean_cNoDigestvectorcop <- rowMeans(sapply(listOfcNoDigestVectors_FromCopData, function(x) x))

#cDigest values
listOfcDigestVectors_FromCopData <- lapply(dataFramesCopList, function(x) x[, "cDigest"])
list2env(listOfcDigestVectors_FromCopData, envir = .GlobalEnv)
mean_cDigestvectorcop <- rowMeans(sapply(listOfcDigestVectors_FromCopData, function(x) x))

#meanSusc values
listOfmeanSuscVectors_FromCopData <- lapply(dataFramesCopList, function(x) x[, "meanSusc"])
list2env(listOfmeanSuscVectors_FromCopData, envir = .GlobalEnv)
mean_meanSuscvectorcop <- rowMeans(sapply(listOfmeanSuscVectors_FromCopData, function(x) x))

#a values
listOfA_Vectors_FromCopData <- lapply(dataFramesCopList, function(x) x[, "a"])
list2env(listOfA_Vectors_FromCopData, envir = .GlobalEnv)
mean_avectorcop <- rowMeans(sapply(listOfA_Vectors_FromCopData, function(x) x))

#interval0 values
listOfInterval0Vectors_FromDataCop <- lapply(dataFramesCopList, function(x) x[, "interval0"])
list2env(listOfInterval0Vectors_FromDataCop, envir = .GlobalEnv)
mean_interval0vectorcop <- rowMeans(sapply(listOfInterval0Vectors_FromDataCop, function(x) x))

#interval1 values
listOfInterval1Vectors_FromDataCop <- lapply(dataFramesCopList, function(x) x[, "interval1"])
list2env(listOfInterval1Vectors_FromDataCop, envir = .GlobalEnv)
mean_interval1vectorcop <- rowMeans(sapply(listOfInterval1Vectors_FromDataCop, function(x) x))

#interval2 values
listOfInterval2Vectors_FromDataCop <- lapply(dataFramesCopList, function(x) x[, "interval2"])
list2env(listOfInterval2Vectors_FromDataCop, envir = .GlobalEnv)
mean_interval2vectorcop <- rowMeans(sapply(listOfInterval2Vectors_FromDataCop, function(x) x))

#interval3 values
listOfInterval3Vectors_FromDataCop <- lapply(dataFramesCopList, function(x) x[, "interval3"])
list2env(listOfInterval3Vectors_FromData, envir = .GlobalEnv)
mean_interval3vectorcop <- rowMeans(sapply(listOfInterval3Vectors_FromData, function(x) x))

timevector <- dataFramesList[[1]][, "t"]

# Give the chart file a name.
#" line_chart__mean_noevol_initfarmingrate05_ppl_05.jpg "
png(file = paste("line_chart__Digestion_", fileNames[1], ".jpg"), width = 2000, height = 1000)

# Combining the two graphs to the same page
par(mfrow = c(2, 1))

# Plot the bar chart.
plot(timevector, mean_cDigestvectorcop, type = "o", col = "red",
     xlim = c(0, maxTimeStep), ylim = c(0, populationSize),
     xlab = "Time", ylab = "Digestion (red) and NoDigestion (blue)",
     main = "Digestion and NoDigestion - copulation")

lines(timevector, mean_cNoDigestvectorcop, type = "o", col = "blue")
lines(timevector, mean_meanSuscvectorcop, type = "o", col = "green")
lines(timevector, mean_avectorcop, type = "o", col = "black")

# Plot the bar chart.
plot(timevector, mean_cDigestvector, type = "o", col = "red",
     xlim = c(0, maxTimeStep), ylim = c(0, populationSize),
     xlab = "Time", ylab = "Digest (red) and NoDigest (blue)",
     main = "Digest and NoDigest - no copulation")

lines(timevector, mean_cNoDigestvector, type = "o", col = "blue")
lines(timevector, mean_avector, type = "o", col = "black")

# Save the file.
dev.off()

# Give the chart file a name.
#" line_chart__mean_noevol_initfarmingrate05_ppl_05.jpg "
png(file = paste("line_chart__parasites_", fileNames[1], ".jpg"), width = 2000, height = 1000)

# Combining the two graphs to the same page
par(mfrow = c(2, 1))

# Plot the bar chart.
plot(timevector, mean_interval0vector, type = "o", col = "red",
     xlim = c(0, maxTimeStep), ylim = c(0, populationSize),
     xlab = "Time", ylab = "Parasite number in the host cells",
     main = "Parasite number distribution - copulation")

lines(timevector, mean_interval1vector, type = "o", col = "blue")
lines(timevector, mean_interval2vector, type = "o", col = "green")
lines(timevector, mean_interval3vector, type = "o", col = "black")

# Plot the bar chart.
plot(timevector, mean_interval0vectorcop, type = "o", col = "red",
     xlim = c(0, maxTimeStep), ylim = c(0, populationSize),
     xlab = "Time", ylab = "Parasite number in the host cells",
     main = "Parasite number distribution - no copulation")

lines(timevector, mean_interval1vectorcop, type = "o", col = "blue")
lines(timevector, mean_interval2vectorcop, type = "o", col = "green")
lines(timevector, mean_interval3vectorcop, type = "o", col = "black")

# Save the file.
dev.off()


#print(dataFramesCopList[[1]][1, ])
#print(length(dataFramesList[[1]]))

#lapply(names(dataFramesList), function(x) print(x))
#lapply(names(dataFramesCopList), function(x) print(x))

#print(paste("ListLength: ", length(listOfPS_CPVectors_FromData)))
#print(length(listOfPS_CPVectors_FromData[1]))
#print(listOfPS_CPVectors_FromData)
#print(listOfPS_CPVectors_FromData[[1]][1:3, 3])

#print(dataFramesList[[1]][1 : 2, 3])
#print(names(dataFramesCopList[[1]]))

#results <- vector("list", 10)

#for (i in length(headers) - 25)
#{
#    listOfSusc1Vectors_FromData <- lapply(dataFramesList, function(x) x[, paste("interval", i)])
#   #list2env(listOfSusc1Vectors_FromData, envir = .GlobalEnv)
#   mean_susc1vector <- rowMeans(sapply(listOfSusc1Vectors_FromData, function(x) x))
#}