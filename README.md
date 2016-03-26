# Coursera Getting and Cleaning Data Course Final Project Assignment
Peer Assessment

## Purpose
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

## Overview
One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained.

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]

Here are the data for the project:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]

## Assignment
1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement.
3. Use descriptive activity names to name the activities in the data set.
4. Appropriately label the data set with descriptive variable names.
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

# Files in the repo
1. A tidy data set described in #5 above. See:   **“accelerometer_averages_dataset.txt**” 
2. The script that does the assignment steps 1-5 mentioned above. See: **"run_analysis.R"**
3. A codebook that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information. See: **"Code_Book_Accelerometer.md"**
4. The README file that explains the analysis files is clear and understandable. See this **"README.md"**

## Insruction List
1. Download the above mentioned "*.zip* file to your working directory.
2. In your working directory, unzip this downloaded file. This will create the following directories/folders and files:
    * "UCI HAR Dataset.txt" directory, then within that directory: 
        * "activity_labels.txt", "features_info.txt", "features.txt", and "README.txt" files
        * "test" directory then within that directory:
            * "Inertial Signals" directory
            * "subject_test.txt", "X_test.txt", "y_test.txt" files
        * "train" directory then with that directory:
            * "Inertial Signals" directory
                * "subject_train.txt", "X_train.txt", "y_train.txt" files 
3. Copy run_analysis.R to your working directory.
4. Open R or RStudio and set your working directory (the directory where the file, “UCI HAR Dataset.zip” was written to previously.)
    * At R prompt> setwd(“*your_working_directory*”)
5. At the R prompt> source("run_analysis.R")
6. At the R prompt> run_analysis()

## Raw Data
Raw data files that were used to complete the assignment:

**activity_labels.txt** - maps the class labels with their activity names

**features.txt** - the complete list of variable names of each feature vector/measurement (561x1) 

**test/subject_test.txt** - each row identifies the subject in the test set who performed the activity for each window sample. 

**test/X_test.txt** - the 561-feature vector with time and frequency domain variables for the test set data

**test/y_test.txt** - the activity labels for the test set data

**train/subject_train.txt** - each row identifies the subject in the training set who performed the activity for each window sample.

**train/X_train.txt** - the 561-feature vector with time and frequency domain variables for the training set data

**train/y_train** - the activity labels for the training set data


## Output
run_analysis writes the following file to your working directory:
**accelerometer_averages_dataset.txt** file - a tidy dataset containing the averages of the mean and standard deviation measurements.

To view this text file in Excel:

1. Open Excel

2. Select File->Import

3. In the pop-up "Import" window: 

4. For "What type of file do you want to import?", select "Text file" then "Import"

5. In the "Choose a File" window, select the **accelerometer_averages_dataset.txt** file and then "Get Data"

6. In the "Text Import Wizard - Step 1 of 3" select "Delimited ..." then "Next>"

7. In the "Text Import Wizard - Step 2 of 3" select delimiters "Tab" and "Space" then "Next>"

8. In the "Text Import Wizard - Step 3 of 3" select "Finish"

9. In the "Import Data" window in "Existing sheet:" enter "=$A$1" and select "OK"


## Assumptions Made - PEER REVIEWERS PLEASE READ THIS
1. For the assignment, "You should create one R script called run_analysis.R ...", all of my code is in one file,"run_analysis.R" and I did not write other functions.
2. For the assignment, "Extracts only the measurements of the mean and standard deviation ..", I extracted the measurements with the following character strings in their names: "Mean()", "mean()", "Std()", and "std()".
3. For the assignment, "5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.:, I took the extracted "mean and standard deviation" feature variable columns and then calculated the averages of 
these variables, grouped by Activity and then by Subject.

