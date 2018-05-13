#read file names from command line
print("r began")
fileNames = commandArgs(trailingOnly = TRUE)
print(fileNames)
print(args)

#set working directory
directoryPath <- paste("C:\\Users\\Judit\\Documents\\parasiteModelVSProject\\parasitemodelvsproject\\mithocondrium-vs2013\\mitochondria\\bin\\results\\", fileNames[1], sep = "")
#directoryPath <- "C:\\Users\\Judit\\Documents\\parasiteModelVSProject\\parasitemodelvsproject\\mithocondrium-vs2013\\mitochondria\\bin\\results\\outdataTrial"
#C:\Users\Judit\Documents\parasiteModelVSProject\parasitemodelvsproject\mithocondrium-vs2013\mitochondria\mitochondria\
setwd(directoryPath)
print(directoryPath)

headers = read.table("outdataTrial0_sex.dat", skip = 1, header = F, nrows = 1, as.is = T)
df = read.table("outdataTrial0_nosex.dat", skip = 2, header = F)
colnames(df) = headers

print(df)
print(df[2, "actualParasites"])

#read config data
#configData <- read.delim("outdataTrial0_sex.dat", FALSE, "/")
#configData <- read.table("outdataTrial0_sex.dat", header = TRUE, sep = " ", skip = 1)

#print(configData)
#print(configData[, actualParasites])



#read the dat files -> dataframes
#create list of dataframes
#if ((length(fileNames) %% 2) == 1) {
 #   print(length(fileNames))
 #  print(length(fileNames) / 2)
  #  dataFramesList <- lapply(fileNames[2:((length(fileNames) / 2) + 0.5)], function(x) read.delim(x, FALSE, " "))
   # print(fileNames[2:((length(fileNames) / 2) + 0.5)])
    #names(dataFramesList) <- paste("data", 1:length(dataFramesList), sep = "")
    #list2env(dataFramesList, envir = .GlobalEnv)

    #dataFramesCopList <- lapply(fileNames[((length(fileNames) / 2) + 1.5):length(fileNames)], function(x) read.delim(x, FALSE, " "))
    #print(fileNames[((length(fileNames) / 2) + 1.5):length(fileNames)])
    #names(dataFramesCopList) <- paste("dataFramesCop", 1:(length(dataFramesCopList)), sep = "")
    #list2env(dataFramesCopList, envir = .GlobalEnv)
#} else {
 #   print(length(fileNames))
  #  dataFramesList <- lapply(fileNames[2:(length(fileNames) / 2)], function(x) read.delim(x, FALSE, " "))
   # names(dataFramesList) <- paste("data", 1:length(dataFramesList), sep = "")
    #list2env(dataFramesList, envir = .GlobalEnv)

    #dataFramesCopList <- lapply(fileNames[((length(fileNames) / 2) + 1):length(fileNames)], function(x) read.delim(x, FALSE, " "))
    #names(dataFramesCopList) <- paste("dataCop", 1:(length(dataFramesCopList)), sep = "")
    #list2env(dataFramesCopList, envir = .GlobalEnv)
#}