## run_analysis This set of functions create a data frame that contains
## the average of each mean or std variable for each activity and each subject
## obtained from data collected from the accelerometers from the Samsung Galaxy 
## S smartphone in an experiment performed by UCI university.

## requirements: getdata-projectfiles-UCI HAR Dataset.zip file must be 
## downloaded and unzipped to the working directory when running the script.
## the zip file can be downloaded from: 
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## All the information is stored in different files so that the script first processes
## all the required files and then summarized the information according to the specifications

## The files included in the zip file that are used in this script are:
## ./UCI HAR Dataset/test/X_test.txt Test data Training data with the features measured in experiment
## ./UCI HAR Dataset/train/X_train.txt Training data with the features measured in experiment
## ./UCI HAR Dataset/features.txt List of the features 
## ./UCI HAR Dataset/test/y_test.txt List of the activities performed in the experiment for the test dataset
## ./UCI HAR Dataset/train/y_train.txt List of the activities performed in the experiment for the train dataset
## ./UCI HAR Dataset/activity_labels.txt List with the labels of each activity performed (STANDING, WALKING, ETC)
## ./UCI HAR Dataset/test/subject_test.txt List of the subjects that performed each activity for the test dataset
## ./UCI HAR Dataset/train/subject_train.txt List of the subjects that performed each activity for the train dataset

## package requirements: dplyr
require(dplyr)

## run_analysis main function that creates the dataframe that contains
## the average of each mean or std variable for each activity and each subject
run_analysis <- function (){
        
        ## reads from the measures and features data files and creates
        ## a data frame with only the std and mean columns and merges the
        ## train and test datasets
        data <- processDataFiles("./UCI HAR Dataset/test/X_test.txt", 
                                        "./UCI HAR Dataset/train/X_train.txt", 
                                        "./UCI HAR Dataset/features.txt")
        
        ## reads from the activities files and creates a data frame
        ## with the train and test data sets combined
        activities <- processActivities("./UCI HAR Dataset/test/y_test.txt", 
                          "./UCI HAR Dataset/train/y_train.txt")
        
        ## reads the activity labels files into a dataframe
        actLabs <- processActivityLabels ("./UCI HAR Dataset/activity_labels.txt")
        
        ## reads from the subjects file for the training and test datasets and creates
        ## one data frame with all the information\
        subjects <- processSubjects("./UCI HAR Dataset/test/subject_test.txt", 
                                 "./UCI HAR Dataset/train/subject_train.txt")
        
        ## Merging the measures data, activities and subjects data frames together
        mergedData <- cbind(data, activities, subjects)
        
        ## Add the activity labels column to the data frame
        mergedData <- merge(mergedData, actLabs) 
        
        ## Remove the ActivitIndex and _ID_ column as they won't be needed anymore
        mergedData$ActivityIndex <- NULL
        
        ## Create a summarize data frame by Subject and Activity calculating
        ## the mean of each of the rest of the variables
        result <- group_by(mergedData, subjectId, ActivityName)
        result <- summarise_each(result, funs(mean))
        
        ## writing the resulting dataframe to a text file
        write.table(result, file="result.txt", row.name=FALSE)
}

## processDataFiles reads from the testFileName, trainFileName data files and creates
## a merged data frame. the featFileName is used to obtain the std and mean columns 
## to subset the data frame and assign the columns names
processDataFiles <- function(testFileName, trainFileName, featFileName) {
        ## Returns one data frame for the test and train data files
        finalData <- combineDataSets(testFileName, trainFileName)
        
        ## read the features file to obtain the std and mean columns
        colsNameInd <- calculateDataColumns(featFileName)
        
        ## subset the data frame
        finalData <- finalData[, colsNameInd$index]
        
        ## assign column names to the data frame
        colnames(finalData) <- colsNameInd$name
        finalData
}

## calculateDataColumns Read from the features file and obtain only the indexes and names
## of the std and mean columns. The column names are cleaned up to remove parenthesis and
## - signs.
calculateDataColumns <- function (featFileName){
        ## create data frame from features file and assign column names
        features <- readDataSet(featFileName)
        colnames(features) <- c("index","name")
        
        ## obtain only the mean and std columns
        std_mean_cols <- features[grepl("*mean\\(\\)*|*std\\(\\)*", features$name),]
        
        ## clean variable names
        std_mean_cols$name <- gsub("\\(\\)", "", std_mean_cols$name)
        std_mean_cols$name <- gsub("\\-", "\\_", std_mean_cols$name)
        
        std_mean_cols
}

## processActivities creates data frame from activity files in the train and test files
## and assign column names. This data frame contains only indexes 
## of the activities
processActivities <- function(testActFileName, trainActFileName) {
        actData <- combineDataSets(testActFileName, trainActFileName)        
        colnames(actData) <- c("ActivityIndex")
                
        actData
}


## processActivityLabels creates data frame from activity label file.
## This data frame contains only 6 rows (one per each activity)
processActivityLabels <- function(actLabsFileName) {
        actLabs <- readDataSet(actLabsFileName)
        colnames(actLabs) <- c("ActivityIndex","ActivityName")
        
        actLabs
}


## processSubjects creates data frame from subjects files in the train and test files
## and assign column names
processSubjects <- function(testFileName, trainFileName) {
        finalData <- combineDataSets(testFileName, trainFileName)
        colnames(finalData) <- c("subjectId")
        finalData
}

## readDataSet reads from the file specified in the fileName parameter
readDataSet <- function (fileName) {
        fileData <- read.table(fileName, sep = "" , header = F, 
                                na.strings ="", stringsAsFactors= F)
        fileData
}

## combineDataSets reads from the files specified in the parameters and
## combines the rows from both files to create one data frame
combineDataSets <- function (fileName1, fileName2) {
        file1Data <- read.table(fileName1, sep = "" , header = F ,  
                               na.strings ="", stringsAsFactors= F)
        
        file2Data <- read.table(fileName2, sep = "" , header = F , 
                                na.strings ="", stringsAsFactors= F)
        
        mergeData <- rbind(file1Data, file2Data)        
}

## execute the main function of the script
run_analysis()
