CodeBook
---------------------------------------------------------------
This document describes the data used by *run_analysis.R* and the definition of variables in *tidyData.txt*.

##Dataset Used

This data is obtained from "Human Activity Recognition Using Smartphones Data Set". The data linked are collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>.

The data set used can be downloaded from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>. 

##Input Data Set

The input data containts the following data files:

- `X_train.txt` contains variable features that are intended for training.
- `y_train.txt` contains the activities corresponding to `X_train.txt`.
- `subject_train.txt` contains information on the subjects from whom data is collected.
- `X_test.txt` contains variable features that are intended for testing.
- `y_test.txt` contains the activities corresponding to `X_test.txt`.
- `subject_test.txt` contains information on the subjects from whom data is collected.
- `activity_labels.txt` contains metadata on the different types of activities.
- `features.txt` contains the name of the features in the data sets.

##Transformations

Following are the transformations that were performed on the input dataset:

- `X_train.txt` is read into `trainX`.
- `y_train.txt` is read into `trainY`.
- `subject_train.txt` is read into `trainSub`.
- `X_test.txt` is read into `testX`.
- `y_test.txt` is read into `testY`.
- `subject_test.txt` is read into `testSub`.
- `features.txt` is read into `features`.
- `activity_labels.txt` is read into `activities`.
- the data in `tidy` is written into `tidyData.txt`.

##Output Data Set

The output data `tidyData.txt` is a a space-delimited value file. The header line contains the names of the variables. It contains the mean and standard deviation values of the data contained in the input files. The header is restructued in an understandable manner. 
