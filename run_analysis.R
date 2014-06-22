library(data.table)

outputTidyData1 = "./TidyDataSet1.txt"
outputTidyData2 = "./TidyDataSet2.txt"

testXPath = "./UCI HAR Dataset/test/X_test.txt"
testYPath = "./UCI HAR Dataset/test/y_test.txt"
testSubjectPath = "./UCI HAR Dataset/test/subject_test.txt"

trainXPath = "./UCI HAR Dataset/train/X_train.txt"
trainYPath = "./UCI HAR Dataset/train/y_train.txt"
trainSubjectPath = "./UCI HAR Dataset/train/subject_train.txt"

featuresPath = "./UCI HAR Dataset/features.txt"
activitiesLabelsPath = "./UCI HAR Dataset/activity_labels.txt"
MAX_ROWS = -1

run_analysis <- function()
{
  # 1. Merges the training and the test sets to create one data set.
  data <- get_consolidated_data()
  
  # 2. Extracts only the measurements on the mean and standard deviation for each measurement.
  features <- get_mean_and_std_features()
  data <- data[ , features$colIndex ]
  
  # 3. Uses descriptive activity names to name the activities in the data set
  data["activity"] <- get_consolidated_activities()
  data["subject"] <- get_consolidated_subjects()
  
  # 4. Appropriately labels the data set with descriptive variable names.   
  max_mean_std_col <- nrow(features)
  colnames(data)[1:max_mean_std_col] <- features$propertyName
  
  write.table(data, outputTidyData1)
  
  # 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
  split_data <- split(
    data, 
    list(data$activity, data$subject), 
    drop=T
  )
  
  data2 <- t(sapply(
    split_data, 
    function(x) colMeans( x[1:max_mean_std_col] )
  ))

  write.table(data2, outputTidyData2)
  data2
}

get_consolidated_data <- function()
{
  rbind(
    read.table(testXPath, nrows=MAX_ROWS),  
    read.table(trainXPath, nrows=MAX_ROWS)
  )
}

get_mean_and_std_features <- function()
{
  # look the names of all of the features, and return only the names that contain "mean(" or "std("
  f <- read.table(featuresPath)
  f <- f[ grepl( 'mean[(]|std[(]', f[,2] ), ]
  
  # clean up the property names a little bit to make them R-friendly, plus add some colNames
  colnames(f) <- c("colIndex", "propertyName")
  f[,2] <- gsub('-', '_', f[,2])
  f[,2] <- gsub('[(][)]', '', f[,2])
  f
}

get_consolidated_activities <- function()
{
  # activities is an array of number codes for each respective test/training data row  
  activities <- rbind(
    read.table(testYPath, nrows=MAX_ROWS),
    read.table(trainYPath, nrows=MAX_ROWS)
  )
  
  # rather than return an array of codes, we lookup the label value for each code and send those instead
  activityLabels <- read.table(activitiesLabelsPath)
  activityLabels[ activities[[1]] ,2 ]
}

get_consolidated_subjects <- function()
{
  rbind(
    read.table(testSubjectPath, nrows=MAX_ROWS),
    read.table(trainSubjectPath, nrows=MAX_ROWS)
  )
}

