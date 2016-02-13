# Project Code Book
Description of the variables, the data, and any transformations or work performed to clean up the resulting data.

## Original Dataset (UCI HAR Dataset)
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

### Version
Human Activity Recognition Using Smartphones Dataset  
Version 1.0

### Credit
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.  
Smartlab - Non Linear Complex Systems Laboratory  
DITEN - Universit‡ degli Studi di Genova.  
Via Opera Pia 11A, I-16145, Genoa, Italy.  
activityrecognition@smartlab.ws  
www.smartlab.ws  

### Description
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

## Resultant Tidy Dataset (output/tidy_data.txt)
### Summary
A summary dataset that represents the average of each mean and standard deviation variables for each measurement in the original dataset represented by:  

* 81 variables
* 180 observations

### Transformations

* Merged the original training and testing datasets into a single combined dataset  
* Subset the data keeping only the subject identifier variable, activity identifier variable, mean variables and standard deviation variables  
* Encoded the activity variable in the merged dataset as a factor based on the activity_labels
* Aggregated the mean for each mean and standard deviation variables for groups of the subject identifier variable and activity identifier variable  
* Appended `_avg` to each mean and standard deviation variable name

### Variables

* __Variable__ : subject  
__Variable Type__ : int  
__Comments__ : subject identifier
* __Variable__ : activity  
__Variable Type__ : factor  
__Allowable Values__ : WALKING, WALKING_ UPSTAIRS, WALKING_ DOWNSTAIRS, SITTING, STANDING, LAYING  
__Comments__ : type of activity
* __Variable__ : tBodyAcc.std.X_avg  
__Variable Type__ : dbl  
* __Variable__ : tBodyAcc.std.Y_avg  
__Variable Type__ : dbl
* __Variable__ : tBodyAcc.std.Z_avg  
__Variable Type__ : dbl
* __Variable__ : tGravityAcc.std.X_avg  
__Variable Type__ : dbl
* __Variable__ : tGravityAcc.std.Y_avg  
__Variable Type__ : dbl
* __Variable__ : tGravityAcc.std.Z_avg  
__Variable Type__ : dbl
* __Variable__ : tBodyAccJerk.std.X_avg  
__Variable Type__ : dbl
* __Variable__ : tBodyAccJerk.std.Y_avg  
__Variable Type__ : dbl
* __Variable__ : tBodyAccJerk.std.Z_avg  
__Variable Type__ : dbl
* __Variable__ : tBodyGyro.std.X_avg  
__Variable Type__ : dbl
* __Variable__ : tBodyGyro.std.Y_avg  
__Variable Type__ : dbl
* __Variable__ : tBodyGyro.std.Z_avg  
__Variable Type__ : dbl
* __Variable__ : tBodyGyroJerk.std.X_avg  
__Variable Type__ : dbl
* __Variable__ : tBodyGyroJerk.std.Y_avg  
__Variable Type__ : dbl
* __Variable__ : tBodyGyroJerk.std.Z_avg  
__Variable Type__ : dbl
* __Variable__ : tBodyAccMag.std_avg  
__Variable Type__ : dbl
* __Variable__ : tGravityAccMag.std_avg  
__Variable Type__ : dbl
* __Variable__ : tBodyAccJerkMag.std_avg  
__Variable Type__ : dbl
* __Variable__ : tBodyGyroMag.std_avg  
__Variable Type__ : dbl
* __Variable__ : tBodyGyroJerkMag.std_avg  
__Variable Type__ : dbl
* __Variable__ : fBodyAcc.std.X_avg  
__Variable Type__ : dbl
* __Variable__ : fBodyAcc.std.Y_avg  
__Variable Type__ : dbl
* __Variable__ : fBodyAcc.std.Z_avg  
__Variable Type__ : dbl
* __Variable__ : fBodyAccJerk.std.X_avg  
__Variable Type__ : dbl
* __Variable__ : fBodyAccJerk.std.Y_avg  
__Variable Type__ : dbl
* __Variable__ : fBodyAccJerk.std.Z_avg  
__Variable Type__ : dbl
* __Variable__ : fBodyGyro.std.X_avg  
__Variable Type__ : dbl
* __Variable__ : fBodyGyro.std.Y_avg  
__Variable Type__ : dbl
* __Variable__ : fBodyGyro.std.Z_avg  
__Variable Type__ : dbl
* __Variable__ : fBodyAccMag.std_avg  
__Variable Type__ : dbl
* __Variable__ : fBodyBodyAccJerkMag.std_avg  
__Variable Type__ : dbl
* __Variable__ : fBodyBodyGyroMag.std_avg  
__Variable Type__ : dbl
* __Variable__ : fBodyBodyGyroJerkMag.std_avg  
__Variable Type__ : dbl
* __Variable__ : tBodyAcc.mean.X_avg  
__Variable Type__ : dbl
* __Variable__ : tBodyAcc.mean.Y_avg  
__Variable Type__ : dbl
* __Variable__ : tBodyAcc.mean.Z_avg  
__Variable Type__ : dbl
* __Variable__ : tGravityAcc.mean.X_avg  
__Variable Type__ : dbl
* __Variable__ : tGravityAcc.mean.Y_avg  
__Variable Type__ : dbl
* __Variable__ : tGravityAcc.mean.Z_avg  
__Variable Type__ : dbl
* __Variable__ : tBodyAccJerk.mean.X_avg  
__Variable Type__ : dbl
* __Variable__ : tBodyAccJerk.mean.Y_avg  
__Variable Type__ : dbl
* __Variable__ : tBodyAccJerk.mean.Z_avg  
__Variable Type__ : dbl
* __Variable__ : tBodyGyro.mean.X_avg  
__Variable Type__ : dbl
* __Variable__ : tBodyGyro.mean.Y_avg  
__Variable Type__ : dbl
* __Variable__ : tBodyGyro.mean.Z_avg  
__Variable Type__ : dbl
* __Variable__ : tBodyGyroJerk.mean.X_avg  
__Variable Type__ : dbl
* __Variable__ : tBodyGyroJerk.mean.Y_avg  
__Variable Type__ : dbl
* __Variable__ : tBodyGyroJerk.mean.Z_avg  
__Variable Type__ : dbl
* __Variable__ : tBodyAccMag.mean_avg  
__Variable Type__ : dbl
* __Variable__ : tGravityAccMag.mean_avg  
__Variable Type__ : dbl
* __Variable__ : tBodyAccJerkMag.mean_avg  
__Variable Type__ : dbl
* __Variable__ : tBodyGyroMag.mean_avg  
__Variable Type__ : dbl
* __Variable__ : tBodyGyroJerkMag.mean_avg  
__Variable Type__ : dbl
* __Variable__ : fBodyAcc.mean.X_avg  
__Variable Type__ : dbl
* __Variable__ : fBodyAcc.mean.Y_avg  
__Variable Type__ : dbl
* __Variable__ : fBodyAcc.mean.Z_avg  
__Variable Type__ : dbl
* __Variable__ : fBodyAcc.meanFreq.X_avg  
__Variable Type__ : dbl
* __Variable__ : fBodyAcc.meanFreq.Y_avg  
__Variable Type__ : dbl
* __Variable__ : fBodyAcc.meanFreq.Z_avg  
__Variable Type__ : dbl
* __Variable__ : fBodyAccJerk.mean.X_avg  
__Variable Type__ : dbl
* __Variable__ : fBodyAccJerk.mean.Y_avg  
__Variable Type__ : dbl
* __Variable__ : fBodyAccJerk.mean.Z_avg  
__Variable Type__ : dbl
* __Variable__ : fBodyAccJerk.meanFreq.X_avg  
__Variable Type__ : dbl
* __Variable__ : fBodyAccJerk.meanFreq.Y_avg  
__Variable Type__ : dbl
* __Variable__ : fBodyAccJerk.meanFreq.Z_avg  
__Variable Type__ : dbl
* __Variable__ : fBodyGyro.mean.X_avg  
__Variable Type__ : dbl
* __Variable__ : fBodyGyro.mean.Y_avg  
__Variable Type__ : dbl
* __Variable__ : fBodyGyro.mean.Z_avg  
__Variable Type__ : dbl
* __Variable__ : fBodyGyro.meanFreq.X_avg  
__Variable Type__ : dbl
* __Variable__ : fBodyGyro.meanFreq.Y_avg  
__Variable Type__ : dbl
* __Variable__ : fBodyGyro.meanFreq.Z_avg  
__Variable Type__ : dbl
* __Variable__ : fBodyAccMag.mean_avg  
__Variable Type__ : dbl
* __Variable__ : fBodyAccMag.meanFreq_avg  
__Variable Type__ : dbl
* __Variable__ : fBodyBodyAccJerkMag.mean_avg  
__Variable Type__ : dbl
* __Variable__ : fBodyBodyAccJerkMag.meanFreq_avg  
__Variable Type__ : dbl
* __Variable__ : fBodyBodyGyroMag.mean_avg  
__Variable Type__ : dbl
* __Variable__ : fBodyBodyGyroMag.meanFreq_avg  
__Variable Type__ : dbl
* __Variable__ : fBodyBodyGyroJerkMag.mean_avg  
__Variable Type__ : dbl
* __Variable__ : fBodyBodyGyroJerkMag.meanFreq_avg  
__Variable Type__ : dbl
