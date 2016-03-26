# Code Book for the Coursera Getting and Cleaning Data Course Final Project Assignment

## Study
UCI Machine Learning Repository – Human Activity Recognition Using Smartphones

##Abstract 
Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.
Sources: Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
1 - Smartlab - Non-Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy. 
2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living
Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
activityrecognition '@' smartlab.ws

##Design
The experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. The smartphone’s embedded accelerometer and gyroscope captured a 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments were video-recorded to label the data manually. The obtained dataset was randomly partitioned into two sets, with 70% of the volunteers selected for generating the training data and 30% the test data. 

##Pre-processing of Sensor Signals
The sensor signals (accelerometer and gyroscope 3-axial raw time domain signals tAcc-XYZ and tGyro-XYZ) were captured at a constant rate of 50 Hz. They were then pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated into body and gravity acceleration signals. Subsequently, the body linear acceleration and gyroscope angular velocity were derived in time to obtain Jerk signals and then the magnitude of these three-dimensional signals were calculated using the Euclidean norm.  A Fast Fourier Transform (FFT) was applied to some of these signals producing frequency domain signals. The gravitational force was assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. The resulting time and frequency domain signals, from each sample window, were used to estimate variables of the feature vector for each pattern listed below. (Note: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions). This results in 561 feature vector variables being generated for each window. 

## Raw Data Used to Complete Assignment
Download Location: [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]

Raw data files that were used to complete the assignment:

**activity_labels.txt** - maps the class labels with their activity names

**features.txt** - the complete list of variable names of each feature vector/measurement (561x1) 

**test/subject_test.txt** - each row identifies the subject in the test set who performed the activity for each window sample. 

**test/X_test.txt** - the 561-feature vector with time and frequency domain variables for the test set data

**test/y_test.txt** - the activity labels for the test set data

**train/subject_train.txt** - each row identifies the subject in the training set who performed the activity for each window sample.

**train/X_train.txt** - the 561-feature vector with time and frequency domain variables for the training set data

**train/y_train** - the activity labels for the training set data


## Assumptions - **PEER REVIEWERS PLEASE READ THIS**
1. The tidy dataset, **"accelerometer_averages_dataset.txt"**, containing the **averages** of the 66 mean and standard deviation feature variables/measurements, grouped by Activity and Subject, was submitted.  The following "Variables in Tidy Dataset" lists information for the variables in this dataset.
2. The names of these variables/columns were unchanged from the names specified in the feature.txt file, with the addition of the word "Average" 
added to the end of the name. The reason the names were not changed to be even more descriptive is because this would have resulted in the variable names being very long and unfriendly to read. I tried different names and they were too long. So I left the variable names "as is" and added "Average" to their names in the tidy dataset.


## Variables in Tidy Dataset: accelerometer_averages_dataset.txt

--------------------------------------------------------------------------------

**1. Variable Name:** Activity

**Type:**          factor

**Value:**         1-6

**Description:**   Activity performed while wearing a smartphone. 

**Comments:**      1 – WALKING
                   2 – WALKING_UPSTAIRS
                   3 – WALKING_DOWNSTAIRS
                   4 – SITTING
                   5 – STANDING
                   6 - LAYING

--------------------------------------------------------------------------------


**2. Variable Name:** Subject

**Type:**          int

**Value:**         1-30

**Description:**   The subject who performed the activity for each window sample.

**Comments:**      Volunteers within the age bracket of 19-48 years.

--------------------------------------------------------------------------------

**3.5 Variable Names:** 1) tBodyAcc-mean()-X Average, 2) tBodyAcc-mean()-Y Average, 3) tBodyAcc-mean()-Z Average

**Type:** num              

**Value:** normalized and bounded within [-1,1]       

**Description:** Average of Time Domain Body Acceleration mean values in X, Y, Z directions 

**Comments:**      

--------------------------------------------------------------------------------

**6-8. Variable Names:** 1) tBodyAcc-std()-X Average, 2) tBodyAcc-std()-Y Average, 3) tBodyAcc-std()-Z Average

**Type:** num              

**Value:** normalized and bounded within [-1,1]       

**Description:** Average of Time Domain Body Acceleration standard deviation values in X, Y, Z directions 

**Comments:**      

--------------------------------------------------------------------------------

**9-11. Variable Names:** 1) tGravityAcc-mean()-X Average, 2) tGravityAcc-mean()-Y Average, 3) tGravityAcc-mean()-Z Average

**Type:** num              

**Value:** normalized and bounded within [-1,1]       

**Description:** Average of Time Domain Gravity Acceleration mean values in X, Y, Z directions 

**Comments:**      

--------------------------------------------------------------------------------

**12-15. Variable Names:** 1) tGravityAcc-std()-X Average, 2) tGravityAcc-std()-Y Average, 3) tGravityAcc-std()-Z Average

**Type:** num              

**Value:** normalized and bounded within [-1,1]       

**Description:** Average of Time Domain Gravity Acceleration standard deviation values in X, Y, Z directions 

**Comments:**      

--------------------------------------------------------------------------------

**Variable Names:** 1) tBodyAccJerk-mean()-X Average, 2) tBodyAccJerk-mean()-Y Average, 3) tBodyAccJerk-mean()-Z Average

**Type:** num              

**Value:** normalized and bounded within [-1,1]       

**Description:** Average of Time Domain Body Acceleration Jerk mean values in X, Y, Z directions 

**Comments:**      

--------------------------------------------------------------------------------

**Variable Names:** 1) tBodyAccJerk-std()-X Average, 2) tBodyAccJerk-std()-Y Average, 3) tBodyAccJerk-std()-Z Average

**Type:** num              

**Value:** normalized and bounded within [-1,1]       

**Description:** Average of Time Domain Body Acceleration Jerk standard deviation in X, Y, Z directions 

**Comments:**      

--------------------------------------------------------------------------------

**Variable Names:** 1) tBodyGyro-mean()-X Average, 2) tBodyGyro-mean()-Y Average, 3) tBodyGyro-mean()-Z Average

**Type:** num              

**Value:** normalized and bounded within [-1,1]       

**Description:** Average of Time Domain Body Gyroscope mean values in X, Y, Z directions 

**Comments:**      

--------------------------------------------------------------------------------

**Variable Names:** 1) tBodyGyro-std()-X Average, 2) tBodyGyro-std()-Y Average, 3) tBodyGyro-std()-Z Average

**Type:** num              

**Value:** normalized and bounded within [-1,1]       

**Description:** Average of Time Domain Body Gyroscope standard deviation values in X, Y, Z directions 

**Comments:**      

--------------------------------------------------------------------------------

**Variable Names:** 1) tBodyGyroJerk-mean()-X Average, 2) tBodyGyroJerk-mean()-Y Average, 3) tBodyGyroJerk-mean()-Z Average

**Type:** num              

**Value:** normalized and bounded within [-1,1]       

**Description:** Average of Time Domain Body Gyroscope Jerk mean values in X, Y, Z directions 

**Comments:**      

--------------------------------------------------------------------------------

**Variable Names:** 1) tBodyGyroJerk-std()-X Average, 2) tBodyGyroJerk-std()-Y Average, 3) tBodyGyroJerk-std()-Z Average

**Type:** num              

**Value:** normalized and bounded within [-1,1]       

**Description:** Average of Time Domain Body Gyroscope Jerk standard deviation values in X, Y, Z directions 

**Comments:**      

--------------------------------------------------------------------------------

**Variable Names:** tBodyAccMag-mean()

**Type:** num              

**Value:** normalized and bounded within [-1,1]       

**Description:** Average of Time Domain Body Acceleration Magnitude mean values

**Comments:**      

--------------------------------------------------------------------------------

**Variable Names:** tBodyAccMag-std()

**Type:** num              

**Value:** normalized and bounded within [-1,1]       

**Description:** Average of Time Domain Body Acceleration Magnitude standard deviation values

**Comments:**      

--------------------------------------------------------------------------------

**Variable Names:** tGravityAccMag-mean()

**Type:** num              

**Value:** normalized and bounded within [-1,1]       

**Description:** Average of Time Domain Gravity Acceleration Magnitude mean values

**Comments:**      

--------------------------------------------------------------------------------

**Variable Names:** tGravityAccMag-std()

**Type:** num              

**Value:** normalized and bounded within [-1,1]       

**Description:** Average of Time Domain Gravity Acceleration Magnitude standard deviation values

**Comments:**      

--------------------------------------------------------------------------------

**Variable Names:** tBodyAccJerk-mean()

**Type:** num              

**Value:** normalized and bounded within [-1,1]       

**Description:** Average of Time Domain Body Acceleration Jerk mean values

**Comments:**      

--------------------------------------------------------------------------------

**Variable Names:** tBodyAccJerk-std()

**Type:** num              

**Value:** normalized and bounded within [-1,1]       

**Description:** Average of Time Domain Body Acceleration Jerk standard deviation values

**Comments:**      

--------------------------------------------------------------------------------

**Variable Names:** tBodyGyroMag-mean()

**Type:** num              

**Value:** normalized and bounded within [-1,1]       

**Description:** Average of Time Domain Body Gyroscope Magnitude mean values

**Comments:**      

--------------------------------------------------------------------------------

**Variable Names:** tBodyGyroMag-std()

**Type:** num              

**Value:** normalized and bounded within [-1,1]       

**Description:** Average of Time Domain Body Gyroscope Magnitude standard deviation values

**Comments:**      

--------------------------------------------------------------------------------

**Variable Names:** tBodyGyroJerkMag-mean()

**Type:** num              

**Value:** normalized and bounded within [-1,1]       

**Description:** Average of Time Domain Body Gyroscope Jerk Magnitude mean values

**Comments:**      

--------------------------------------------------------------------------------

**Variable Names:** tBodyGyroJerkMag-std()

**Type:** num              

**Value:** normalized and bounded within [-1,1]       

**Description:** Average of Time Domain Body Gyroscope Jerk Magnitude standard deviation values

**Comments:**      

--------------------------------------------------------------------------------

**Variable Names:** 1) fBodyAcc-mean()-X Average, 2) fBodyAcc-mean()-Y Average, 3) fBodyAcc-mean()-Z Average

**Type:** num              

**Value:** normalized and bounded within [-1,1]       

**Description:** Average of Frequency Domain Body Acceleration mean values in X, Y, Z directions 

**Comments:**      

--------------------------------------------------------------------------------

**Variable Names:** 1) fBodyAcc-std()-X Average, 2) fBodyAcc-std()-Y Average, 3) fBodyAcc-std()-Z Average

**Type:** num              

**Value:** normalized and bounded within [-1,1]       

**Description:** Average of Frequency Domain Body Acceleration standard deviation values in X, Y, Z directions 

**Comments:**      

--------------------------------------------------------------------------------

**Variable Names:** 1) fBodyAccJerk-mean()-X Average, 2) fBodyAccJerk-mean()-Y Average, 3) fBodyAccJerk-mean()-Z Average

**Type:** num              

**Value:** normalized and bounded within [-1,1]       

**Description:** Average of Frequency Domain Body Acceleration Jerk mean values in X, Y, Z directions 

**Comments:**      

--------------------------------------------------------------------------------

**Variable Names:** 1) fBodyAccJerk-std()-X Average, 2) fBodyAccJerk-std()-Y Average, 3) fBodyAccJerk-std()-Z Average

**Type:** num              

**Value:** normalized and bounded within [-1,1]       

**Description:** Average of Frequency Domain Body Acceleration Jerk standard deviation in X, Y, Z directions 

**Comments:**      

--------------------------------------------------------------------------------

**Variable Names:** 1) fBodyGyro-mean()-X Average, 2) fBodyGyro-mean()-Y Average, 3) fBodyGyro-mean()-Z Average

**Type:** num              

**Value:** normalized and bounded within [-1,1]       

**Description:** Average of Frequency Domain Body Gyroscope mean values in X, Y, Z directions 

**Comments:**      

--------------------------------------------------------------------------------

**Variable Names:** 1) fBodyGyro-std()-X Average, 2) fBodyGyro-std()-Y Average, 3) fBodyGyro-std()-Z Average

**Type:** num              

**Value:** normalized and bounded within [-1,1]       

**Description:** Average of Frequency Domain Body Gyroscope standard deviation values in X, Y, Z directions 

**Comments:**      

--------------------------------------------------------------------------------

**Variable Names:** fBodyAccMag-mean()

**Type:** num              

**Value:** normalized and bounded within [-1,1]       

**Description:** Average of Frequency Domain Body Acceleration Magnitude mean values

**Comments:**      

--------------------------------------------------------------------------------

**Variable Names:** fBodyAccMag-std()

**Type:** num              

**Value:** normalized and bounded within [-1,1]       

**Description:** Average of Frequency Domain Body Acceleration Magnitude standard deviation values

**Comments:**      

--------------------------------------------------------------------------------

**Variable Names:** fBodyBodyAccJerkMag-mean()

**Type:** num              

**Value:** normalized and bounded within [-1,1]       

**Description:** Average of Frequency Domain Body Acceleration Jerk Magnitude mean values

**Comments:** The "features.txt" file was used to set the variable/column names for the variables. I believe there was an error in this file and the variable name should have been: fBodyAccJerkMag-mean().   

--------------------------------------------------------------------------------

**Variable Names:** fBodyBodyAccJerkMag-std()

**Type:** num              

**Value:** normalized and bounded within [-1,1]       

**Description:** Average of Frequency Domain Body Acceleration Jerk Magnitude standard deviation values

**Comments:** The "features.txt" file was used to set the variable/column names for the variables. I believe there was an error in this file and the variable name should have been: fBodyAccJerkMag-std().       

--------------------------------------------------------------------------------

**Variable Names:** fBodyBodyGyroMag-mean()

**Type:** num              

**Value:** normalized and bounded within [-1,1]       

**Description:** Average of Frequency Domain Body Gyroscope Magnitude mean values

**Comments:** The "features.txt" file was used to set the variable/column names for the variables. I believe there was an error in this file and the variable name should have been: fBodyGyroMag-mean().   

--------------------------------------------------------------------------------

**Variable Names:** fBodyBodyGyroMag-std()

**Type:** num              

**Value:** normalized and bounded within [-1,1]       

**Description:** Average of Frequency Domain Body Gyroscope Magnitude standard deviation values

**Comments:** The "features.txt" file was used to set the variable/column names for the variables. I believe there was an error in this file and the variable name should have been: fBodyGyroMag-std().       

--------------------------------------------------------------------------------

**Variable Names:** fBodyBodyGyroJerkMag-mean()

**Type:** num              

**Value:** normalized and bounded within [-1,1]       

**Description:** Average of Frequency Domain Body Gyroscope Jerk Magnitude mean values

**Comments:** The "features.txt" file was used to set the variable/column names for the variables. I believe there was an error in this file and the variable name should have been: fBodyGyroJerkMag-mean().   

--------------------------------------------------------------------------------

**Variable Names:** fBodyBodyGyroJerkMag-std()

**Type:** num              

**Value:** normalized and bounded within [-1,1]       

**Description:** Average of Frequency Domain Body Gyroscope Jerk Magnitude standard deviation values

**Comments:** The "features.txt" file was used to set the variable/column names for the variables. I believe there was an error in this file and the variable name should have been: fBodyGyroJerkMag-std().       

--------------------------------------------------------------------------------