# Data Science - Getting and Cleaning Data Course Project
Data Science Getting and Cleaning Data Course project is to demonstrate the ability to collect, work with, and clean a data set.

## Project Description
The goal is to prepare tidy data that can be used for later analysis. Required submission includes: 1) a tidy data set as described below, 2) a link to a Github repository with the script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that was performed to clean up the data called CodeBook.md. A README.md file should also be included in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Here are the data for the project:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The project should have one R script called run_analysis.R that does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Good luck!

## Solution Contents
### run_analysis.R
#### Assumptions
The assumption is that the Samsung data has been downloaded and unzipped to the working directory where the location of the run_analysis.R file resides.  
#### Description
The run_analysis.R script is the control logic to ingest the data collected from the accelerometers of the Samsung Galaxy S smartphone and process the data into a tidy dataset that represents the average of each mean and standard deviation variables for each measurement. The logic is as follows:

* Verifies the "UCI HAR Dataset" directory exists in the working directory
* Creates "output" directory if it does not exist
* Loads the reference datasets (activity_labels and features)
* Loads the training and testing datasets (subject, Y and X files) with column names assigned to the X_ based on features reference dataset
* Merges the training and testing datasets into a combined dataset
* Extracts the relevant mean and standard measurements
* Encodes the activity column in the merged dataset as a factor
* Creates a tidy dataset that represents the average of each mean and standard deviation variables
* Saves the tidy dataset to a sub-directory 'output' of the working directory as tidy_data.csv

#### Running the script
* source the script into your R environment. `source('run_analysis.R')`
* execute the script. `run_analysis()`
