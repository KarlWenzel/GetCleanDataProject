## Code Book: Getting and Cleaning Data

***Welcome peer reviewer!***  This is my attempt to succinctly fulfill the following requirement:

>.. 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md

###1. Using This Project

Please view the local [README](https://github.com/KarlWenzel/GetCleanDataProject/blob/master/README.md) file for instructions on how to obtain the necessary data, and to use the code in this project.

###2. The Variables

The original data source provider already supplied a good description of the variables used.  However, an edited version of this information is provided locally in this git repository, and may be found here: [my_features_info.txt](https://github.com/KarlWenzel/GetCleanDataProject/blob/master/my_features_info.txt)

TidyDataSet1.txt has two additional fields as well:

1. activity: This is a character string that is one of the following
  * WALKING
  * WALKING_UPSTAIRS
  * WALKING_DOWNSTAIRS
  * SITTING
  * STANDING
  * LAYING
2. subject: This is a number code that represents a unique test subject, from whom the data row was obtained.

### 3. The Data

The data created as output from this project may be found in the following two files: 
[TidyDataSet1.txt](https://github.com/KarlWenzel/GetCleanDataProject/blob/master/TidyDataSet1.txt) and 
[TidyDataSet2.txt](https://github.com/KarlWenzel/GetCleanDataProject/blob/master/TidyDataSet2.txt).
These files are provided in the local git repository as well.

TidyDataSet1.txt combines data from the original study's test and training data sets into a single data set, however it only extracts the data pertaining to means and standard deviations.  Each row of data also has an activity category and a number code that identifies the test subject from whom the data row was obtained from.

TidyDataSet2.txt is the average of each variable for each activity and each subject from TidyDataSet1.txt.  Each row is a distinct paring of activity and subject, and is labelled appropriately.

### 4. Any Transformations

The data transformations that occur are as follows:

1. X_test.txt and X_training.txt data sets are combined into a single data set.
2. Only data fields containing the substrings "mean(" or "std(" are extracted.
3. The data field names are renamed in a format acceptable to the R language ('-' replaced with '_', and "()" is removed)
4. y_test.txt and y_training.txt data is used to determine the activity code for each row in the X_test and X_training data, and is used along with the activity_labels.txt file to determine a human readable value for each respective activity.  This data is stored as a new column in the new data set.
5. The respective subject_train.txt files for the X_test and X_training data was used to determine which subject code should be applied to each row in the new data set, and is stored as a new column.
6. The new data set is saved as TidyDataSet1.txt at this time.  The new data set is then further processed such that the mean is calculated for each activity/subject pair.  This new data set is then saved as TidyDataSet2.txt.

