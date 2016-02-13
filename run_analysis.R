###############################################################################
# The purpose of run_analysis is to demonstrate the ability to collect, work 
# with, and clean a data set. The goal is to prepare tidy data that can be 
# used for later analysis.
#
# This one R script (run_analysis.R) does the following:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each 
#    measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.
###############################################################################
library(dplyr)

run_analysis <- function() {
    
    path <- "UCI HAR Dataset"
    # validate that the Samsung dataset is in the current working directory
    # in accordance with submission instructions
    if (!file.exists(path)) {
        stop("Can not locate Samsung dataset at './UCI HAR Dataset'. Download the data set from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")
    }
    
    #check to see if output directory exists; if it doesn't create it
    if (!file.exists("output")) {
        message("Output directory does not exist. Creating the directory...")
        dir.create("output")
    }
    
    # load the activities reference data
    df_activities <- load_reference_data("activity_labels", path, c("activityId", "activityName"))
    
    # load the features reference data
    df_features <- load_reference_data("features", path, c("featureId", "featureName"))
    # clean up features names removing ()
    df_features$featureName <- gsub("\\(\\)", "", df_features$featureName)
    
    # load in the training data
    df_train <- load_data("train", path, df_features$featureName)
    
    # load in the training data
    df_test <- load_data("test", path, df_features$featureName)
    
    # 1. Merge the training and the test sets to create one data set.
    message("Merging the training and testing data sets...")
    df_all <- rbind(df_train, df_test)

    # 2. Extract only the measurements on the mean and standard deviation for each measurement.
    message("Extracting the mean and standard deviation for each measurement in the dataset...")
    df_measures <- df_all[,c(1,2, grep("std", colnames(df_all)),grep("mean", colnames(df_all)))]
    
    # 3. Uses descriptive activity names to name the activities in the data set
    # 4. Appropriately labels the data set with descriptive variable names.
    message("Updating each activity to the descriptive name...")
    df_measures$activity <- factor(df_measures$activity, levels=df_activities$activityId, labels=df_activities$activityName)

    # 5. From the data set in step 4, creates a second, independent tidy data set 
    #    with the average of each variable for each activity and each subject.
    message("Creating second tidy data set with mean of each measurement for each activity/subject combination...")
    df_tidy <- aggregate(. ~ subject + activity, data = df_measures, mean)
    # Sort the data by subject id
    df_tidy_tbl <- tbl_df(df_tidy) %>% arrange(subject)
    # Append _avg to all column names except subject & activity
    names(df_tidy_tbl)[-c(1,2)] <- paste(names(df_tidy_tbl)[-c(1,2)], "_avg", sep = "")
    # Save the tidy dataset to disk
    save_output(df_tidy_tbl, "tidy_data")
}

###############################################################################
# function: load_reference_data
# description: loads the target reference data file into a dataframe
# parameters: reference - name of reference file to load
#             pathIn - path (directory) of the samsung data
#             col_names - column names to assign reference dataset
# output: data.frame
###############################################################################
load_reference_data <- function(reference, pathIn = "UCI HAR Dataset", col_names) {
    message(paste("Loading the reference data:", reference))
    df_ref <- read.table(file.path(pathIn, paste(reference, ".txt", sep = "")), col.names = col_names)
    df_ref
}

###############################################################################
# function: load_data
# description: loads the target data files into a single dataframe
# parameters: type - name (train / test) of data to load
#             path_in - path (directory) of the samsung data
#             feature_cols - column names for the features in the type dataset
# output: data.frame
###############################################################################
load_data <- function(type, path_in = "UCI HAR Dataset", feature_cols) {
    message(paste("Loading and building the data set:", type))
    #load in the subject data and set the column name to subject
    df_subject <- read.table(file.path(path_in, type, paste("subject_", type, ".txt", sep = "")), col.names = "subject")
    #load in the activity data and set the column name to activityId
    df_Activity <- read.table(file.path(path_in, type, paste("Y_", type, ".txt", sep = "")), col.names = "activity")
    #load in the type data set
    df_typedata <- read.table(file.path(path_in, type, paste("X_", type, ".txt", sep = "")), col.names = feature_cols)
    df = cbind(df_subject, df_Activity, df_typedata)
    df
}

###############################################################################
# function: save_output
# description: saves a dataset to disk (./output)
# parameters: dataset - dataset to save to disk
#             filename - name of file to save to disk
# output: no return value
###############################################################################
save_output <- function (dataset, filename) {
    message(paste("Saving dataset", filename, "to output directory..."))
    filepath <- file.path("output", paste(filename,".csv", sep=""))
    write.table(dataset, filepath, row.names = FALSE)
}

