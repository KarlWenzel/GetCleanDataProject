## README: Getting and Cleaning Data

***Welcome peer reviewer!***  This is my attempt to succinctly fulfill the following requirement:

>.. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

This project provides an R script that may be used to process data found at the 
[UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
To run the software in this project as intended, you must do the following:

1. Download the UCI data
2. Extract the zipped folder named "UCI HAR Dataset", and place it in your working directory
3. Download the local R script named [run_analysis.R](https://github.com/KarlWenzel/GetCleanDataProject/blob/master/run_analysis.R) and place it in your working directory.
4. Source the run_analysis.R script from your R environment
5. Execute the run_analysis() function

After performing the above instructions, you should have two new files: 
[TidyDataSet1.txt](https://github.com/KarlWenzel/GetCleanDataProject/blob/master/TidyDataSet1.txt) and 
[TidyDataSet2.txt](https://github.com/KarlWenzel/GetCleanDataProject/blob/master/TidyDataSet2.txt).
These files are provided in the local git repository as well.

TidyDataSet1.txt combines data from the original study's test and training data sets into a single data set, however it only extracts the data pertaining to means and standard deviations.  Each row of data also has an activity category and a number code that identifies the test subject from whom the data row was obtained from.

TidyDataSet2.txt is the average of each variable for each activity and each subject from TidyDataSet1.txt.  Each row is a distinct paring of activity and subject, and is labelled appropriately.

Please view the local [Code Book](https://github.com/KarlWenzel/GetCleanDataProject/blob/master/CodeBook.md) to see more information pertaining to the details of the data contain herein.
