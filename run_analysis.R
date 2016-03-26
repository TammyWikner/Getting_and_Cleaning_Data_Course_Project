run_analysis <- function(){
	
	############################################################################
	# The run_analysis.R script was written for the final project assignment 
	# for the Coursera course: Getting and Cleaning Data  
	# 
	# The data linked to from the course website represent data collected from 
	# a "wearable smartphone" experiment carried out on 30 volunteers/subjects. 
	# Each volunteer performed six activities while wearing a Samsung Galaxy 
	# Smartphone on their waist. The accelerometer data, collected 
	# from the smartphone, and data associated with the experiement was 
	# randomly partitioned into two sets referred to as "test" and "training" 
	# sets. 
	#
	# A full description of the experiement is available at the site where the 
	# data was obtained:
	# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
	#
	# The data for the project: 
	# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
	#
	# Assignment:
	# Create one R script called run_analysis.R that does the following.
	# 1. Merges the training and the test sets to create one data set.
	# 2. Extracts only the measurements on the mean and standard deviation for 
	#    each measurement.
	# 3. Extracts only the measurements on the mean and standard deviation for 
	#    each measurement.
	# 4. Appropriately labels the data set with descriptive variable names.
	# 5. From the data set in step 4, creates a second, independent tidy data 
	#    set with the average of each variable for each activity and each subject.
	#
	# Raw data files used to complete the assignment:
	# activity_labels.txt - maps the class labels with their activity names
	# features.txt - the complete list of variable names of each feature 
	#            vector/measurement (561x1) 
	# test/subject_test.txt - each row identifies the subject in the test set 
	#           who performed the activity for each window sample. 
	# test/X_test.txt - the 561-feature vector with time and frequency domain 
	#           variables for the test set data
	# test/y_test.txt - the activity labels for the test set data
	# train/subject_train.txt** - each row identifies the subject in the 
	#           training set who performed the activity for each window sample.
	# train/X_train.txt - the 561-feature vector with time and frequency domain 
	#           variables for the training set data
	# train/y_train - the activity labels for the training set data
	# 
	# To Run this program:
	# 1. Download the above mentioned ".zip" file to your working directory.
    # 2. In your working directory, unzip this downloaded file. This will create 
	#    the following directories/folders and files:
	#     - directory:"UCI HAR Dataset.txt"
	#        within the "UCI HAR Dataset.txt" directory: 
	#        - files: "activity_labels.txt", "features_info.txt", 
	#                 "features.txt", and "README.txt"
	#        - directory: "test" 
	#          with the "test" directory:
	#             - directory: "Inertial Signals" 
	#             - files: "subject_test.txt", "X_test.txt", "y_test.txt" 
	#        - directory: "train" 
	#          with the "train" directory:
	#             - directory: "Inertial Signals" 
	#             - files: "subject_train.txt", "X_train.txt", "y_train.txt" 
	# 3. Copy run_analysis.R to your working directory.
	# 4. Open R or RStudio and set your working directory (the directory where 
	#    the file, “UCI HAR Dataset.zip” was written to previously.)
	#     At R prompt> setwd(“*your_working_directory*”)
	# 5. At the R prompt> source("run_analysis.R")
	# 6. At the R prompt> run_analysis()
	#
	# Output: This program creates the tidy dataset, "accelerometer_averages_dataset.txt",  
	# in the working directory that you downloaded the ".zip" file to. 
	# This tidy dataset includes the averages ofthe mean and standard 
	# deviation feature vector variable columns grouped by activity and then 
	# by subject as specified in "Assignment 5." above. 
	############################################################################
	
	# The "reshape2" package is required in order to use the melt() and 
	# dpack() functions.
	install.packages("reshape2")
	library(reshape2)

	# Get the identification numbers for the subjects/volunteers that were in 
	# the "test" and "training" sets, respectively. These are needed to 
	# create the test_accelerometer_dataset and training_accelerometer_dataset later.
	test_subjects<-read.table("UCI HAR Dataset/test/subject_test.txt")
	training_subjects<-read.table("UCI HAR Dataset/train/subject_train.txt")
	names(test_subjects) <- ("Subject")
	names(training_subjects) <- ("Subject")
	
	# Get the mapping of the activity labels (1-6) to their activity name: 
	# WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING. 
	activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors=FALSE)
	
	# Traverse activity_labels, using the test/training label as 
	# an index, in order to retrieve the activity name associated with the label. 
	test_activity_nums <- read.table("UCI HAR Dataset/test/y_test.txt",stringsAsFactors=FALSE)
	test_activity <- character(0)
	for (i in 1:length(test_activity_nums$V1)){
		test_activity[i] <- activity_labels$V2[test_activity_nums$V1[i]]
	}
	training_activity_nums <- read.table("UCI HAR Dataset/train/y_train.txt",stringsAsFactors=FALSE)
	training_activity <- character(0)
	for (i in 1:length(training_activity_nums$V1)){
		training_activity[i] <- activity_labels$V2[training_activity_nums$V1[i]]
	}
	
	# Get the feature vector variables which are the accelerometer measurements. 
	test_features <- read.table("UCI HAR Dataset/test/X_test.txt")
	training_features <- read.table("UCI HAR Dataset/train/X_train.txt")
	
	# Use the features listed in the features.txt file as the column  
	# names of the test and training features.
	features_names <- read.table("UCI HAR Dataset/features.txt")
	colnames(test_features) <- features_names$V2
	colnames(training_features) <- features_names$V2

	# Create the test and training accelerator data sets
	test_accelerometer_dataset <- cbind(test_subjects, Activity=test_activity, test_features, stringsAsFactors=FALSE)
	training_accelerometer_dataset <- cbind(training_subjects, Activity=training_activity, training_features, stringsAsFactors=FALSE)
	
	# Assignment:
	# 1. Merges the training and the test sets to create one data set.
	merged_accelerometer_dataset <- rbind(test_accelerometer_dataset, training_accelerometer_dataset)
	#write.table(merged_accelerometer_dataset,"./merged_accelerometer_dataset.txt", row.names=FALSE)
	
	# Extract the feature vector variables (measurements) columns which have 
	# "Mean()", "mean()", "Std()" or "std()" in the column name. 
	# Combine the "Subject" and "Activity" columns from the 
	# merged_accelerator_dataset with these mean and std columns.
	# Assignment:
	# 2. Extracts only the measurements on the mean and standard deviation for 
	#    each measurement.
	mean_and_std_column_matches <- grepl("([Mm]ean\\(\\)|[Ss]td\\(\\))", colnames(merged_accelerometer_dataset))
	mean_and_std_columns <- merged_accelerometer_dataset[,mean_and_std_column_matches]
	mean_and_std_measurements_dataset <- cbind(Subject=merged_accelerometer_dataset[,1], 
											   Activity=merged_accelerometer_dataset[,2], mean_and_std_columns)
	#write.table(mean_and_std_measurements_dataset,"./mean_and_std_measurements_dataset.txt", row.names=FALSE)
	
	# In order to create a second, independent tidy data set with the average 
	# of each feature variable for each activity and each subject the 
	# melt() and dcast() functions are used to reshape 
	# the mean_and_std_measurements_dataset.
	
	# The melt() function is used to nest the "Activity" and "Subject" columns 
	# and reshape the data such that the mean() function can be applied 
	# appropriately in dcast().  The "Activity" and "Subject" columns are fixed  
	# and the feature vector variables columns are "melted". "melted" means that 
	# 1) a new column "variable" will contain all the feature vector variables 
	#    column names and 
	# 2) a new column "value" to the right of "variable" will contain the 
	#    feature vector variable values.  
	#
	# Molten data (molten_data) has the following header row:
	# Activity    Subject     variable    value
	#
	molten_accelerometer_data <- melt(mean_and_std_measurements_dataset, id.vars=c("Activity", "Subject"), variable.factor=FALSE)

	# The molten_accelerometer_data is "casted" (dcast()):
	# For each unique "Activity"/"Subject" row, the function mean() is 
	# applied to the "value" column values corresponding to each 
	# of the feature vector variables in the "variable" column. 
	#
	# The 'casted' data (accelerometer_averages_dataset) is written to a text 
	# file. It has the following header row where all the feature variable 
	# columns names appear to the right of Subject. Since there are so many 
	# feature variable column names, ColumnNameFeatureVariable#1 through run
	# ColumnNameFeatureVariable#n is shown to indicate them.
	#
	# header row:
	# Activity  Subject  ColumnNameFeatureVariable#1  ....  ColumnNameFeatureVariable#n 
	# 

	# Assignment:
	# 5. From the data set in step 4, creates a second, independent tidy data 
	#    set with the average of each variable for each activity and each subject.
	
	accelerometer_averages_dataset <- dcast(molten_accelerometer_data, Activity+Subject ~ variable, fun=mean)
	#append "Average" to mean and std column names
	names(accelerometer_averages_dataset)[3:length(names(accelerometer_averages_dataset))] <- 
		paste(names(mean_and_std_measurements_dataset)[3:length(names(accelerometer_averages_dataset))], "Average", sep=" ")
	write.table(accelerometer_averages_dataset,"./accelerometer_averages_dataset.txt", sep=" ", row.names=FALSE)
}